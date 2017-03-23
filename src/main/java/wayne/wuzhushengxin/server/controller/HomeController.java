package wayne.wuzhushengxin.server.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by jiangwulin on 2017/3/11.
 */
@RestController
@RequestMapping(value="/")
public class HomeController extends BaseController {
    private static final Logger log = LoggerFactory.getLogger(HomeController.class);

    //网站主页
    @RequestMapping(value = "home",method = RequestMethod.GET)
    public void homePage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String htmlPath = "static/html/home.html";
        Map<String, String> dataMap = new HashMap<>();
        dataMap.put("page","home");
        createStaticHtml("home.ftl", request, htmlPath, dataMap);
        response.sendRedirect(htmlPath);
    }

    //数学主页
    @RequestMapping(value = "math",method = RequestMethod.GET)
    public void mathHomePage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String htmlPath = "static/html/articles/mathematics/home.html";
        Map<String, String> dataMap = new HashMap<>();
        dataMap.put("page","math");
        createStaticHtml("home.ftl", request, htmlPath, dataMap);
        response.sendRedirect(htmlPath);
    }

    //数学分析主页
    @RequestMapping(value = "mathAnalysis",method = RequestMethod.GET)
    public void mathAnalysisHomePage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String htmlPath = "static/html/articles/mathematics/mathematicsAnalysis/home.html";
        Map<String, String> dataMap = new HashMap<>();
        dataMap.put("page","mathAnalysis");
        createStaticHtml("home.ftl", request, htmlPath, dataMap);
        response.sendRedirect(htmlPath);
    }
}
