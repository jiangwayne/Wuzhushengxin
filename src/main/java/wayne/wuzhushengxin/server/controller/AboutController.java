package wayne.wuzhushengxin.server.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by jw on 2017/3/15.
 */
@RestController
@RequestMapping(value="/")
public class AboutController extends BaseController {
    @RequestMapping(value = "about.html",method = {RequestMethod.GET})
    public ModelAndView homePage(){
        ModelAndView mv = new ModelAndView("about.ftl");
        return mv;
    }
}
