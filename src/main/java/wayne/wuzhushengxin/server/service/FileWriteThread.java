package wayne.wuzhushengxin.server.service;

import wayne.wuzhushengxin.server.model.entity.BaseLog;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.BlockingQueue;

/**
 * Created by jiangwulin on 2017/4/29.
 */
public class FileWriteThread implements Runnable {
    private int fileFlushSize;
    private String logFilePathMain;

    private BlockingQueue<BaseLog> queue;
    private Map<String, File> fileMap = new HashMap() {
        {
            this.put("/logs/wzsx/", null);
        }
    };
    private Map<String, PrintWriter> printWriterMap = new HashMap() {
        {
            this.put("/logs/wzsx/", null);
        }
    };
    private Map<String, String> previousFileName = new HashMap() {
        {
            this.put("/logs/wzsx/", "");
        }
    };
    public FileWriteThread(){}

    public void run(){
        int flushCount = 0;
        this.queue = LogQueue.getQueue();
        BaseLog log;

        while (true){
            try{
                log = this.queue.take();
                String currFileName = log.getMinute();
                File file = this.fileMap.get(log.getLogPath());
                PrintWriter pw = this.printWriterMap.get(log.getLogPath());

                if(file != null && !currFileName.equals(this.previousFileName.get(log.getLogPath()))) {
                    pw.flush();
                    pw.close();
                    file = null;
                }

                if(file == null){
                    file = this.createFile(currFileName, log.getLogPath());
                    this.fileMap.put(log.getLogPath(), file);
                    pw = this.getPrintWriter(file);
                    this.printWriterMap.put(log.getLogPath(), pw);
                    flushCount = 0;
                }

                pw.write(log.toString());
                ++flushCount;
                if(flushCount >= this.fileFlushSize) {
                    pw.flush();
                    flushCount = 0;
                }

            }catch (Exception ex){
                System.out.println(ex);
            }
        }
    }

    private PrintWriter getPrintWriter(File file) {
        try {
            PrintWriter e = new PrintWriter(new BufferedOutputStream(new FileOutputStream(file, true)));
            return e;
        } catch (Exception ex) {
            System.out.println(ex);
            return null;
        }
    }

    private File createFile(String minuteString, String logPath) {
        this.previousFileName.put(logPath, minuteString);
        File mainPathDir = new File(this.logFilePathMain + logPath);
        if(!mainPathDir.getParentFile().exists()){
            mainPathDir.getParentFile().mkdirs();
        }

        String fileName = this.logFilePathMain + logPath + minuteString + ".log";
        File file = new File(fileName);
        return file;
    }

    public void setFileFlushSize(int fileFlushSize) {
        this.fileFlushSize = fileFlushSize;
    }

    public void setLogFilePathMain(String logFilePathMain) {
        this.logFilePathMain = logFilePathMain;
    }
}
