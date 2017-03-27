package wayne.wuzhushengxin.server.model.bizmodel;

import wayne.wuzhushengxin.server.model.entity.CategoryEntity;

/**
 * Created by jiangwulin on 2017/3/27.
 */
public class BizCategory {
    private int id;
    private String name;
    private String directory;
    private String prefix;

    public BizCategory(CategoryEntity entity){
        this.id = entity.getId();
        this.name = entity.getName();
        this.directory = entity.getDirectory();
        this.prefix = entity.getPrefix();
    }

    public String getDirectory() {
        return directory;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPrefix() {
        return prefix;
    }
}
