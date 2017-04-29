package wayne.wuzhushengxin.server.model.entity;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Created by jiangwulin on 2017/4/29.
 */
public abstract class BaseLog {
//    protected static final String LOG_SEPARATOR = "|";
    protected String action_time;

    public BaseLog() {
    }

    public String getMinute() {
        return LocalDateTime.parse(this.action_time).format(DateTimeFormatter.ofPattern("yyyyMMddHHmm"));
    }

//    public int getHour() {
//        return LocalDateTime.parse(this.action_time).getHour();
//    }

    abstract public String getLogPath();
}
