package wayne.wuzhushengxin.server.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by jw on 2017/3/15.
 */
@RestController
@RequestMapping(value="/")
public class AboutController extends BaseController {
    @RequestMapping(value = "about",method = {RequestMethod.GET})
    public void aboutPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String htmlPath = "static/html/about.html";
        createStaticHtml("about.ftl", request, htmlPath, null);
        response.sendRedirect(htmlPath);
    }
}
