package wayne.wuzhushengxin.server.controller;

import freemarker.template.Configuration;
import freemarker.template.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfig;
import wayne.wuzhushengxin.server.model.entity.LogEntity;
import wayne.wuzhushengxin.server.service.LogQueue;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by jiangwulin on 2017/3/11.
 */
public class BaseController {
    private static Map<String, Boolean> pageMap = new HashMap<>();
    @Autowired
    protected FreeMarkerConfig freeMarkerConfig;

    //生成静态化html
    protected void createStaticHtml(String templateName, HttpServletRequest request, String filePath, Map dataMap){
        createStaticHtml(templateName,request,filePath,dataMap,true);
    }

    //生成静态化html
    //reCreate : 是否需要马上刷新
    protected void createStaticHtml(String templateName, HttpServletRequest request, String filePath, Map dataMap,boolean reCreate){
        try {
            String path = request.getSession().getServletContext().getRealPath("/");
            File file = new File(path + filePath);
            System.out.println(path);
            //文件存在且不需要马上刷新
            if(file.exists() && !reCreate){
                return;
            }
            if(!file.getParentFile().exists()){
                file.getParentFile().mkdirs();
            }

            //文件的最后更新时间与内容的最后更新时间比较,是否需要重新生成静态html
//            if(pageMap.containsKey(filePath) && file.exists()){
//                return;
//            }
            Configuration config = freeMarkerConfig.getConfiguration();
            Template template = config.getTemplate(templateName, "utf-8");
            Writer out = new OutputStreamWriter(new FileOutputStream(file), "UTF-8");
            //生成文件（这里是我们是生成html）
            template.process(dataMap, out);
            pageMap.put(filePath, true);
        } catch (Exception ex){
            System.out.println(ex);
        }
    }

    private static String generateUid(){
        return UUID.randomUUID().toString().replace("-","");
    }

    private static String getUid(HttpServletRequest request){
        if(request.getCookies() == null){
            return "";
        }
        for (Cookie cookie : request.getCookies()){
            if(cookie.getName().equals("uid")){
                return cookie.getValue();
            }
        }
        return "";
    }

    private static String getIp(HttpServletRequest request) {
        String ipAddress = request.getHeader("X-Forwarded-For");
        if(ipAddress == null || ipAddress.equals("") || ipAddress.toLowerCase().contains("unknown")) {
            ipAddress = request.getRemoteAddr();
            if(ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")) {
                InetAddress ipAddressArray = null;

                try {
                    ipAddressArray = InetAddress.getLocalHost();
                } catch (UnknownHostException ex) {
                    ex.printStackTrace();
                }

                if(ipAddressArray != null) {
                    ipAddress = ipAddressArray.getHostAddress();
                }
            }
        }

        if(ipAddress != null && ipAddress.indexOf(",") > -1) {
            String[] arr = ipAddress.trim().split(",");

            for(int i = 0; i < arr.length; ++i) {
                if(arr[i] != null && !arr[i].equals("")) {
                    ipAddress = arr[i];
                    break;
                }
            }
        }

        if(ipAddress != null) {
            ipAddress = ipAddress.trim();
        } else {
            ipAddress = "";
        }

        return ipAddress;
    }

    protected void saveLog(HttpServletRequest request, HttpServletResponse response, String pageId){
        LogEntity logEntity = new LogEntity();
        String uid = getUid(request);
        if(uid.equals("")){
            uid = generateUid();
            response.addCookie(new Cookie("uid",uid));
        }
        logEntity.setUid(uid);
        logEntity.setIp(getIp(request));
        logEntity.setPageId(pageId);
        try {
            LogQueue.getQueue().put(logEntity);
        } catch (Exception ex){

        }
    }
}
