package wayne.wuzhushengxin.server.model.entity;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Created by jiangwulin on 2017/4/29.
 */
public class LogEntity extends BaseLog {
    private static final String logPath = "/logs/wzsx/";

    private String uid;
    private String ip;
    private String pageId; //访问的哪个页面


    public LogEntity() {
        this.action_time = LocalDateTime.now().toString();
    }
    public String getLogPath() {
        return logPath;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(LocalDateTime.parse(this.action_time).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS")));
        stringBuilder.append("|");
        stringBuilder.append(this.uid);
        stringBuilder.append("|");
        stringBuilder.append(this.ip);
        stringBuilder.append("|");
        stringBuilder.append(this.pageId);
        stringBuilder.append("\r\n");
        return stringBuilder.toString();
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public void setPageId(String pageId){
        this.pageId = pageId;
    }
}
