package wayne.wuzhushengxin.server.model.bizmodel;

import wayne.wuzhushengxin.server.model.entity.ArticleEntity;

import java.time.LocalDateTime;

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
    private LocalDateTime gmtCreate;
    private LocalDateTime gmtModify;

    private String page;
    private String categoryName;
    private String url;
    private String previous;
    private String next;

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

    public LocalDateTime getGmtCreate() {
        return gmtCreate;
    }

    public LocalDateTime getGmtModify() {
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

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getNext() {
        return next;
    }

    public void setNext(String next) {
        this.next = next;
    }

    public String getPrevious() {
        return previous;
    }

    public void setPrevious(String previous) {
        this.previous = previous;
    }
}
