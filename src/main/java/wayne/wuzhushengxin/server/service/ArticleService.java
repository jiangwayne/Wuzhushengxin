package wayne.wuzhushengxin.server.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import wayne.wuzhushengxin.server.data.Dao;
import wayne.wuzhushengxin.server.data.DataServer;
import wayne.wuzhushengxin.server.model.bizmodel.BizArticle;
import wayne.wuzhushengxin.server.model.bizmodel.BizCategory;

/**
 * Created by jiangwulin on 2017/3/29.
 */
@Service
public class ArticleService {
    @Autowired
    private Dao dao;

    public BizArticle getArticle(int id){
        BizArticle article = null;
        if(DataServer.articleCollection().containsKey(id)){
            article = DataServer.articleCollection().get(id);
            BizCategory category = DataServer.categoryCollection().get(article.getCategoryId());
            article.setPage(category.getPrefix());
            article.setUrl(category.getDirectory() + category.getPrefix() + article.getId());
            article.setViews(DataServer.getArticleViews(id));
        }
        return article;
    }

    public synchronized void incrArticleViews(int id){
        DataServer.addArticleViews(id);
    }

    //public int
}
