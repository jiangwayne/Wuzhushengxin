package wayne.wuzhushengxin.server.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.jta.UserTransactionAdapter;
import wayne.wuzhushengxin.server.data.Dao;
import wayne.wuzhushengxin.server.data.DataServer;
import wayne.wuzhushengxin.server.model.bizmodel.BizArticle;
import wayne.wuzhushengxin.server.model.bizmodel.BizCategory;
import wayne.wuzhushengxin.server.model.bizmodel.BizComment;
import wayne.wuzhushengxin.server.model.entity.CommentEntity;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.transaction.*;
import javax.naming.*;
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
        article.setViews(getArticleViews(article.getId()));

    }

    private int getArticleViews(int articleId){
        if(DataServer.getArticleViews().containsKey(articleId)){
            return DataServer.getArticleViews().get(articleId);
        }
        return 0;
    }

    public BizArticle getArticle(int id){
        BizArticle article = null;
        if(DataServer.articleCollection().containsKey(id)){
            article = DataServer.articleCollection().get(id);
            setArticle(article);
            int previous = article.getId() - 1;
            int next = article.getId() + 1;
            if(DataServer.articleCollection().containsKey(previous)){
                article.setPrevious(DataServer.articleCollection().get(previous).getTitle());
            }
            if(DataServer.articleCollection().containsKey(next)){
                article.setNext(DataServer.articleCollection().get(next).getTitle());
            }
        }
        return article;
    }

    public synchronized void incrArticleViews(int id){
        DataServer.addArticleViews(id);
    }


    public List<BizComment> getCommentList(int articleId){
        List<BizComment> comments = new ArrayList<>();
        List<CommentEntity> list = dao.getList("basicData.selectArticleComment", articleId);
        for (CommentEntity entity : list) {
            comments.add(new BizComment(entity));
        }
        return comments;
    }

    @Transactional(rollbackFor = Exception.class)
    public void addComment(int articleId, String name, String content) {
        CommentEntity comment = new CommentEntity();
        comment.setArticleId(articleId);
        comment.setName(name);
        comment.setContent(content);
        dao.insert("basicData.insertComment", comment);
        dao.updateArticleComments(articleId);

    }

    @Transactional(rollbackFor = Exception.class)
    public void updateArticleViews() {
        for (Map.Entry<Integer,Integer> entry : DataServer.getArticleViews().entrySet()) {
            dao.updateArticleViews(entry.getKey(), entry.getValue());
        }
    }

    //public int
}
