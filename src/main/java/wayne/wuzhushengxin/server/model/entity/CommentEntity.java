package wayne.wuzhushengxin.server.model.entity;

import java.time.LocalDateTime;

/**
 * Created by jiangwulin on 2017/3/27.
 */
public class CommentEntity {
    private Integer id;
    private String name;
    private String content;
    private Integer articleId;
    private LocalDateTime gmtCreate;

    public Integer getArticleId() {
        return articleId;
    }

    public LocalDateTime getGmtCreate() {
        return gmtCreate;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public void setGmtCreate(LocalDateTime gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }
}
