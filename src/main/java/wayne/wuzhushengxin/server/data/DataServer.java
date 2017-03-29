package wayne.wuzhushengxin.server.data;

import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.ContextLoader;
import wayne.wuzhushengxin.server.model.bizmodel.BizArticle;
import wayne.wuzhushengxin.server.model.bizmodel.BizCategory;
import wayne.wuzhushengxin.server.model.bizmodel.BizComment;
import wayne.wuzhushengxin.server.model.entity.ArticleEntity;
import wayne.wuzhushengxin.server.model.entity.CategoryEntity;

import java.io.FileInputStream;
import java.net.URLDecoder;
import java.time.LocalDateTime;
import java.util.*;

/**
 * Created by jw on 2017/3/26.
 */
public class DataServer {
    //初始化两个server 一个提供服务 一个load/unload数据
    private static DataServer[] Servers = new DataServer[]{new DataServer(), new DataServer()};
    private static int currentServer = 0;
    private static Dao dao;
    private Date lastChanged;
    private Date beforeUpgradeTime;

    //key:categoryId
    private Map<Integer, BizCategory> catetoryCollection = null;

    //key:articleId
    private Map<Integer, BizArticle> articleCollection = null;

    //key:articleId
    //private Map<Integer, List<BizComment>> commentCollection = null;


    //key:articleId
    private static Map<Integer, Integer> articleViews;

    private DataServer() {
        if(dao == null){
            dao = ContextLoader.getCurrentWebApplicationContext().getBean(Dao.class);
        }
        //region 初始化数据集合
        catetoryCollection = new HashMap<>();
        articleCollection = new HashMap<>();
        //commentCollection = new HashMap<>();
        if(articleViews == null) {
            articleViews = new HashMap<>();
        }
        //endregion
    }

    //Server 工作实例
    private static DataServer getInstance() {
        return Servers[currentServer];
    }

    //Server 维护实例
    private static DataServer getReloadInstance() {
        return Servers[(currentServer + 1) % 2];
    }

    //切换Server工作实例
    private static void changeServer() {
        currentServer = (currentServer + 1) % 2;
    }

    /**
     * Server 入口 初始化
     */
    public static void init() {
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.set(2017, Calendar.JANUARY, 1);
            Date initTime = calendar.getTime();
            //根据当前db时间加载两个Server实例
            for (DataServer server : Servers) {
                server.load(initTime);
            }
            //新开线程 维护实例加载增量数据更新
            new Thread(() -> {
                while (true) {
                    try {
                        Thread.sleep(1000 * 60 * 1);
                        DataServer.getReloadInstance().reload();
                        DataServer.changeServer();
                    } catch (Exception ex) {
                        System.out.println(ex);
                    }
                }
            }).start();
        }
        catch(Exception ex){
            System.out.println(ex);
        }
    }

    private void load(Date currentTime) {
        if(beforeUpgradeTime == null){
            beforeUpgradeTime = dao.getCurrentDbTime();
        }
        loadCategory(currentTime);
        loadArticle(currentTime);
        //loadComment(currentTime);
        lastChanged = beforeUpgradeTime;
    }

    private void reload() {
        beforeUpgradeTime = dao.getCurrentDbTime();
        unload(lastChanged);
        load(lastChanged);
    }

    private void unload(Date currentTime) {
        unloadCategory(currentTime);
        unloadArticle(currentTime);
        //unloadComment(currentTime);
    }

    //region load
    private void loadCategory(Date currentTime){
        List<CategoryEntity> list = dao.getList("basicData.loadCategory", currentTime);
        for (CategoryEntity entity : list){
            if(!catetoryCollection.containsKey(entity.getId())){
                catetoryCollection.put(entity.getId(), new BizCategory(entity));
            }
        }
    }

    private void loadArticle(Date currentTime){
        List<ArticleEntity> list = dao.getList("basicData.loadArticle", currentTime);
        for(ArticleEntity entity : list){
            if(!articleCollection.containsKey(entity.getId())){
                articleCollection.put(entity.getId(), new BizArticle(entity));
            }
            if(!articleViews.containsKey(entity.getId())){
                articleViews.put(entity.getId(), entity.getViews());
            }
        }
    }

//    private void loadComment(Date currentTime){
//
//    }
    //endregion

    //region unload
    private void unloadCategory(Date currentTime){
        List<CategoryEntity> list = dao.getList("basicData.loadCategory", currentTime);
        for (CategoryEntity entity : list){
            catetoryCollection.remove(entity.getId());
        }
    }

    private void unloadArticle(Date currentTime){
        List<ArticleEntity> list = dao.getList("basicData.loadArticle", currentTime);
        for(ArticleEntity entity : list){
            articleCollection.remove(entity.getId());
        }
    }

//    private void unloadComment(Date currentTime){
//
//    }
    //endregion

    //region Getters
    public static Map<Integer, BizCategory> categoryCollection(){
        return getInstance().catetoryCollection;
    }

    public static Map<Integer, BizArticle> articleCollection(){
        return getInstance().articleCollection;
    }
    //endregion
}
