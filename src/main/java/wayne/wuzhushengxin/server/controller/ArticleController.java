package wayne.wuzhushengxin.server.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import wayne.wuzhushengxin.server.model.entity.ArticleEntity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

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
        ArticleEntity entity = new ArticleEntity();
        Map<String, Object> dataMap = new HashMap<>();
        String url = "";
        if (articleoId.equals("11001")) {
            dataMap.put("page","math");
            url = "articles/mathematics/mathematicalAnalysis/math11001";
            entity.setTitle("实数及其性质");
            entity.setGmtCreate(LocalDate.of(2017, 3, 25));
            entity.setComments(0);
            entity.setUrl(url);
        }
        if(articleoId.equals("61001")){
            dataMap.put("page","conte");
            url = "articles/conte/conte61001";
            entity.setTitle("人间的实相(佛说譬喻经)");
            entity.setGmtCreate(LocalDate.of(2017, 3, 25));
            entity.setComments(0);
            entity.setUrl(url);
        }
        String htmlPath = "/static/html/" + url + ".html";
        dataMap.put("article",entity);
        createStaticHtml("article.ftl", request, htmlPath, dataMap);
        response.sendRedirect(htmlPath);
    }

}
