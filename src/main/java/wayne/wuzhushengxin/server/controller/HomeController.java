package wayne.wuzhushengxin.server.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by jiangwulin on 2017/3/11.
 */
@RestController
@RequestMapping(value="/")
public class HomeController extends BaseController {
    private static final Logger log = LoggerFactory.getLogger(HomeController.class);


    @RequestMapping(value = "home",method = {RequestMethod.GET})
    public ModelAndView homePage(){
        ModelAndView mv = new ModelAndView("home.ftl");
        return mv;
    }
}
