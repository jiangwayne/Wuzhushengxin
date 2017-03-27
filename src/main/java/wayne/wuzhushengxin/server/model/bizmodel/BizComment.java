package wayne.wuzhushengxin.server.model.bizmodel;

import wayne.wuzhushengxin.server.model.entity.CommentEntity;

import java.time.LocalDate;

/**
 * Created by jiangwulin on 2017/3/27.
 */
public class BizComment {
    private int id;
    private String name;
    private Integer articleId;
    private LocalDate gmtCreate;

    public BizComment(CommentEntity entity){
        this.id = entity.getId();
        this.name = entity.getName();
        this.articleId = entity.getArticleId();
        this.gmtCreate = entity.getGmtCreate();
    }

    public Integer getArticleId() {
        return articleId;
    }

    public LocalDate getGmtCreate() {
        return gmtCreate;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
