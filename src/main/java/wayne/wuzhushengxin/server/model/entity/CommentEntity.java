package wayne.wuzhushengxin.server.model.entity;

import java.time.LocalDate;

/**
 * Created by jiangwulin on 2017/3/27.
 */
public class CommentEntity {
    private Integer id;
    private String name;
    private Integer articleId;
    private LocalDate gmtCreate;

    public Integer getArticleId() {
        return articleId;
    }

    public LocalDate getGmtCreate() {
        return gmtCreate;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
