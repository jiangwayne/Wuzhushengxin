package wayne.wuzhushengxin.server.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by jiangwulin on 2017/3/21.
 */
@RestController
@RequestMapping(value="/")
public class ArticleController extends BaseController {
    //文章
    @RequestMapping(value = "article",method = RequestMethod.GET)
    public void articlePage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String articleoId = request.getParameter("id");
        String categoryId = request.getParameter("category");
        String fileName = "math10001";
        String articleNo = "10001";
        String articlePath = "articles/mathematics/mathematicalAnalysis/math" + articleNo;
        String htmlPath = "/static/html/articles/mathematics/mathematicsAnalysis/math10001.html";
        Map<String, String> dataMap = new HashMap<>();
        dataMap.put("page","math");
        dataMap.put("articlePath", articlePath);
        createStaticHtml("article.ftl", request, htmlPath, dataMap);
        response.sendRedirect(htmlPath);
    }

}
