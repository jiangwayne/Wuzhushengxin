package wayne.wuzhushengxin.server.controller;

import freemarker.template.Configuration;
import freemarker.template.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfig;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by jiangwulin on 2017/3/11.
 */
public class BaseController {
    @Autowired
    protected FreeMarkerConfig freeMarkerConfig;

    //生成静态化html
    protected void createStaticHtml(String templateName, String filePath){
        try {
            Configuration config = freeMarkerConfig.getConfiguration();
            Template template = config.getTemplate(templateName, "utf-8");
            File file = new File(filePath);
            Writer out = new OutputStreamWriter(new FileOutputStream(file), "UTF-8");
            //生成文件（这里是我们是生成html）
            template.process(null, out);
        } catch (Exception ex){

        }
    }

}
