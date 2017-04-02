package wayne.wuzhushengxin.server.model.bizmodel;

import wayne.wuzhushengxin.server.model.entity.CommentEntity;

import java.time.LocalDateTime;

/**
 * Created by jiangwulin on 2017/3/27.
 */
public class BizComment {
    private int id;
    private String name;
    private String content;
    private Integer articleId;
    private LocalDateTime gmtCreate;

    public BizComment(CommentEntity entity){
        this.id = entity.getId();
        this.name = entity.getName();
        this.content = entity.getContent();
        this.articleId = entity.getArticleId();
        this.gmtCreate = entity.getGmtCreate();
    }

    public Integer getArticleId() {
        return articleId;
    }

    public LocalDateTime getGmtCreate() {
        return gmtCreate;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getContent() { return content;}
}
