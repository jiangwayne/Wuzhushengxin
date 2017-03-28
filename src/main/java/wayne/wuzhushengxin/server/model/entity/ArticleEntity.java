package wayne.wuzhushengxin.server.model.entity;

import java.time.LocalDate;
import java.util.Date;

/**
 * Created by jw on 2017/3/15.
 */
public class ArticleEntity {
    private Integer id;
    private String title;
    private String brief;
    private String keywords;
    private Integer views;
    private Integer comments;
    private Integer categoryId;
    private LocalDate gmtCreate;
    private LocalDate gmtModify;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public Integer getViews() {
        return views;
    }

    public void setViews(Integer views) {
        this.views = views;
    }

    public Integer getComments() {
        return comments;
    }

    public void setComments(Integer comments) {
        this.comments = comments;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public LocalDate getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(LocalDate gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public LocalDate getGmtModify() {
        return gmtModify;
    }

    public void setGmtModify(LocalDate gmtModify) {
        this.gmtModify = gmtModify;
    }
}
