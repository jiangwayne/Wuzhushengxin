package wayne.wuzhushengxin.server.model.entity;

/**
 * Created by jiangwulin on 2017/3/27.
 */
public class CategoryEntity {
    private Integer id;
    private String name;
    private String directory;
    private String prefix;

    public String getDirectory() {
        return directory;
    }

    public void setDirectory(String directory) {
        this.directory = directory;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }
}
