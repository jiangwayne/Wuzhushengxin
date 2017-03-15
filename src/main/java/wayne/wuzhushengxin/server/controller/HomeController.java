package wayne.wuzhushengxin.server.controller;

import freemarker.template.Configuration;
import freemarker.template.Template;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfig;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by jiangwulin on 2017/3/11.
 */
@RestController
@RequestMapping(value="/")
public class HomeController extends BaseController {
    private static final Logger log = LoggerFactory.getLogger(HomeController.class);

    @RequestMapping(value = "home",method = RequestMethod.GET)
    public void homePage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Configuration config = freeMarkerConfig.getConfiguration();
        Template template = config.getTemplate("home.ftl","utf-8");
        System.out.println(request.getContextPath());
        System.out.println(request.getServletContext().getRealPath("/"));
        String path = request.getSession().getServletContext().getRealPath("/");
        System.out.println(path);
        File file = new File(path + "static/html/home.html");
        Map<String, String> rootMap = new HashMap<String, String>();
        Writer out = new OutputStreamWriter(new FileOutputStream(file), "UTF-8");
        //生成文件（这里是我们是生成html）
        template.process(null, out);
        //ModelAndView mv = new ModelAndView("home.ftl");
        response.sendRedirect("/static/html/home.html");
        //return mv;
    }
}
