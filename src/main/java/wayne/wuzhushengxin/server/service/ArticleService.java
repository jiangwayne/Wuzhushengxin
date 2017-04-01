package wayne.wuzhushengxin.server.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import wayne.wuzhushengxin.server.data.Dao;
import wayne.wuzhushengxin.server.data.DataServer;
import wayne.wuzhushengxin.server.model.bizmodel.BizArticle;
import wayne.wuzhushengxin.server.model.bizmodel.BizCategory;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by jiangwulin on 2017/3/29.
 */
@Service
public class ArticleService {
    @Autowired
    private Dao dao;

    public List<BizArticle> getArticleList(int categoryId){
        List<BizArticle> articles = new ArrayList<>();
        DataServer.articleCollection().values().stream().filter(article -> (article.getCategoryId() == categoryId || categoryId ==0)).forEach(article -> {
            articles.add(article);
            setArticle(article);
        });
        return articles;
    }

    public List<BizArticle> getArticleList(String prefix){
        List<BizArticle> articles = new ArrayList<>();
        for (BizArticle article : DataServer.articleCollection().values()){
            BizCategory category = DataServer.categoryCollection().get(article.getCategoryId());
            if(category.getPrefix().equals(prefix)){
                articles.add(article);
                setArticle(article);
            }
        }
        return articles;
    }

    private void setArticle(BizArticle article){
        BizCategory category = DataServer.categoryCollection().get(article.getCategoryId());
        article.setCategoryName(category.getName());
        article.setPage(category.getPrefix());
        article.setUrl(category.getDirectory() + category.getPrefix() + article.getId());
        article.setViews(DataServer.getArticleViews(article.getId()));
    }

    public BizArticle getArticle(int id){
        BizArticle article = null;
        if(DataServer.articleCollection().containsKey(id)){
            article = DataServer.articleCollection().get(id);
            setArticle(article);
        }
        return article;
    }

    public synchronized void incrArticleViews(int id){
        DataServer.addArticleViews(id);
    }

    //public int
}
