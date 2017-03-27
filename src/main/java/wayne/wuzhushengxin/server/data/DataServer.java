package wayne.wuzhushengxin.server.data;

import org.springframework.web.context.ContextLoader;

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
    private static boolean initFlag = false;
    private static Dao dao;
    private Date lastChanged;
    private Date beforeUpgradeTime;

    private DataServer() {
        if(dao == null){
            dao = ContextLoader.getCurrentWebApplicationContext().getBean(Dao.class);
        }

        if(false) {
            try {
                String configFile = URLDecoder.decode(this.getClass().getClassLoader().getResource("config.properties").getPath(),"UTF-8");
                Properties pro = new Properties();
                FileInputStream in = new FileInputStream(configFile);
                pro.load(in);
                in.close();

            } catch (Exception ex){

            }
        }
        //region 初始化数据集合





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
            if (!initFlag) {
                Calendar calendar = Calendar.getInstance();
                calendar.set(2016, Calendar.JANUARY, 1);
                Date initTime = calendar.getTime();
                //根据当前db时间加载两个Server实例
                for (DataServer server : Servers) {
                    server.load(initTime);
                }
                //新开线程 维护实例加载增量数据更新
                new Thread(() -> {
                    while (true) {
                        try {
                            Thread.sleep(1000 * 60 * 5);
                            DataServer.getReloadInstance().reload();
                            DataServer.changeServer();
                        } catch (Exception ex) {
                        }
                    }
                }).start();
            }
            initFlag = true;
        }
        catch(Exception ex){

        }
    }

    private void load(Date currentTime) {
        if(beforeUpgradeTime == null){
            beforeUpgradeTime = dao.getCurrentDbTime();
        }


        lastChanged = beforeUpgradeTime;
    }

    private void reload() {
        beforeUpgradeTime = dao.getCurrentDbTime();
        unload(lastChanged);
        load(lastChanged);
    }

    private void unload(Date currentTime) {

    }
}
