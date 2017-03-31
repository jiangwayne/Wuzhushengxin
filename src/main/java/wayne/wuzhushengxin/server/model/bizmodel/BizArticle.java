package wayne.wuzhushengxin.server.model.bizmodel;

import wayne.wuzhushengxin.server.model.entity.ArticleEntity;

import java.time.LocalDate;

/**
 * Created by jiangwulin on 2017/3/27.
 */
public class BizArticle {
    private int id;
    private String title;
    private String brief;
    private String keywords;
    private int views;
    private int comments;
    private int categoryId;
    private LocalDate gmtCreate;
    private LocalDate gmtModify;

    private String page;
    private String url;

    public BizArticle(ArticleEntity entity){
        this.id = entity.getId();
        this.title = entity.getTitle();
        this.brief = entity.getBrief();
        this.keywords = entity.getKeywords();
        this.views = entity.getViews();
        this.comments = entity.getComments();
        this.categoryId = entity.getCategoryId();
        this.gmtCreate = entity.getGmtCreate();
        this.gmtModify = entity.getGmtModify();
    }

    public String getBrief() {
        return brief;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public int getComments() {
        return comments;
    }

    public LocalDate getGmtCreate() {
        return gmtCreate;
    }

    public LocalDate getGmtModify() {
        return gmtModify;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views){ this.views = views; }

    public String getKeywords() {
        return keywords;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
