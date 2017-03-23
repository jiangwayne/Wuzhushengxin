package wayne.wuzhushengxin.server.controller;

import freemarker.template.Configuration;
import freemarker.template.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfig;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by jiangwulin on 2017/3/11.
 */
public class BaseController {
    private static Map<String, Boolean> pageMap = new HashMap<>();
    @Autowired
    protected FreeMarkerConfig freeMarkerConfig;

    //生成静态化html
    protected void createStaticHtml(String templateName, HttpServletRequest request, String filePath, Map dataMap){
        try {
            String path = request.getSession().getServletContext().getRealPath("/");
            File file = new File(path + filePath);
            if(!file.getParentFile().exists()){
                file.getParentFile().mkdirs();
            }
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

}
