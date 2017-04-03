package wayne.wuzhushengxin.server.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.ContextLoader;
import wayne.wuzhushengxin.server.data.DataServer;
import wayne.wuzhushengxin.server.service.ArticleService;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Created by Wayne.Jiang on 2015/12/22.
 */

/**
 * 全局监听器 初始化时加载相关数据
 */
@WebListener
public class GlobalListener implements ServletContextListener, HttpSessionListener {
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        System.out.println("context initializing");
        //初始化server
        DataServer.init();
        System.out.println("done. DataServer.init();");

//        // point日志线程
//        logPointFileWriteThread = ContextLoader.getCurrentWebApplicationContext().getBean(LogPointFileWriteThread.class);
//        System.out.println("done. logPointFileWriteThread = ContextLoader.getCurrentWebApplicationContext().getBean(logPointFileWriteThread.class); ");
//        Thread logPointThread = new Thread(logPointFileWriteThread);
//        System.out.println("done. Thread logPointThread = new Thread(LogPointFileWriteThread); ");
//        logPointThread.start();
//        System.out.println("done. logPointThread.start(); ");
//
//        // oldserver api广告日志线程
//        oldFileWriteThread = ContextLoader.getCurrentWebApplicationContext().getBean(FileWriteThread.class);
//        Thread oldlogThread = new Thread(oldFileWriteThread);
//        oldlogThread.start();
//        System.out.println("done. oldlogThread.start(); ");
//
//
//        // dsp广告日志线程
//        dspFileWriteThread = ContextLoader.getCurrentWebApplicationContext().getBean(DspFileWriteThread.class);
//        Thread dspLogThread = new Thread(dspFileWriteThread);
//        dspLogThread.start();
//        System.out.println("done. dspLogThread.start(); ");
//
//        //js埋点日志
//        jsPointThread = ContextLoader.getCurrentWebApplicationContext().getBean(JsPointThread.class);
//        Thread jsThread = new Thread(jsPointThread);
//        jsThread.start();
//        System.out.println("done. jsPointThread.start(); ");
//
//        //redis write线程
//        redisWriteThread = ContextLoader.getCurrentWebApplicationContext().getBean(RedisWriteThread.class);
//        Thread redisThread = new Thread(redisWriteThread);
//        redisThread.start();
//        System.out.println("done. redisThread.start(); ");
//
////        JedisResource js = ContextLoader.getCurrentWebApplicationContext().getBean(JedisResource.class);
////        for(int i = 0; i <1; i++){
////            RedisWriteThread redisWriteThread = new RedisWriteThread(i);
////            redisWriteThread.setJedisResource(js);
////            Thread redisThread = new Thread(redisWriteThread);
////            redisThread.start();
////            System.out.println("done. redisThread.start(); ---" + i);
////        }
//
//        //异常处理线程(包含邮件发送)
//        exceptionHandlerThread = ContextLoader.getCurrentWebApplicationContext().getBean(ExceptionHandler.class);
//        Thread exceptionThread = new Thread(exceptionHandlerThread);
//        exceptionThread.start();
//        System.out.println("done. exceptionThread.start(); ");

        //主要处理平均投放
        //BalanceServer.init();
    }

    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        ArticleService articleService = ContextLoader.getCurrentWebApplicationContext().getBean(ArticleService.class);
        articleService.updateArticleViews();
    }

    public void sessionCreated(HttpSessionEvent httpSessionEvent) {

    }

    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {

    }
}
