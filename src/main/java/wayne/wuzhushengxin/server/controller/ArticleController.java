package wayne.wuzhushengxin.server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import wayne.wuzhushengxin.server.model.bizmodel.BizArticle;

import wayne.wuzhushengxin.server.service.ArticleService;

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
    @Autowired
    private ArticleService articleService;
    //文章
    @RequestMapping(value = "article",method = RequestMethod.GET)
    public void articlePage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        response.sendRedirect(refreshStaticHtml(request, id));
    }
    //文章刷新静态页
    private String refreshStaticHtml(HttpServletRequest request, int articleId){
        BizArticle article = articleService.getArticle(articleId);
        if(article == null){
            return "/static/html/404.html";
        }
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("page", article.getPage());
        dataMap.put("article", article);
        dataMap.put("commentList",articleService.getCommentList(articleId));
        String htmlPath = "/static/html/" + article.getUrl() + ".html";
        createStaticHtml("article.ftl", request, htmlPath, dataMap);
        return htmlPath;
    }

    //静态页阅读量统计
    @RequestMapping(value = "article/view.htm", method = RequestMethod.GET)
    public void articleView(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        articleService.incrArticleViews(id);
//        if(DataServer.getArticleViews(id)%10==0) {
//            refreshStaticHtml(request, id);
//        }
    }

    @RequestMapping(value = "article/comment", method = RequestMethod.POST)
    public void postComment(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int articleId = Integer.parseInt(request.getParameter("articleId"));
        String name = request.getParameter("nickname");
        if(name == null || name.isEmpty()){
            name = "匿名网友";
        }
        String content = request.getParameter("content");
        if(content == null || content.isEmpty()){
            response.sendRedirect(refreshStaticHtml(request, articleId));
            return;
        }
        if(articleService.getArticle(articleId) != null) {
            articleService.addComment(articleId, name, content);
        }
        response.sendRedirect(refreshStaticHtml(request, articleId));
    }
}
