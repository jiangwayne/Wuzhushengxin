package wayne.wuzhushengxin.server.service;

import wayne.wuzhushengxin.server.model.entity.BaseLog;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingDeque;

/**
 * Created by jiangwulin on 2017/4/29.
 */
public class LogQueue {
    private static final BlockingQueue<BaseLog> queue = new LinkedBlockingDeque();

    public LogQueue() {
    }

    public static BlockingQueue<BaseLog> getQueue() {
        return queue;
    }
}
