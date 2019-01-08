package controller;

import domain.BlogConfigPojo;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.AdminService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class SettingController {

    @Autowired
    private AdminService adminService;

    // 博客设置
    // /admin/blog-setting-jsp
    @RequestMapping (value = "/admin/blog-setting-jsp")
    public ModelAndView blogJsp(HttpServletRequest request){
        // 获得现有的值
        BlogConfigPojo blogConfig=adminService.getBlogConfig();

        ModelAndView mav=new ModelAndView();
        mav.addObject("blogConfig",blogConfig);
        mav.setViewName("/admin/setting-blog.jsp");
        return mav;
    }
    // 修改并提交博客设置 异步提交
    @RequestMapping (value = "/admin/blog-setting")
    @ResponseBody
    public Integer blogSetting(BlogConfigPojo blogConfigPojo,HttpServletRequest request){
        int status = adminService.setBlog(blogConfigPojo);
        return status;
    }

    // /admin/user-setting-jsp
    @RequestMapping (value = "/admin/user-setting-jsp")
    public ModelAndView userJsp(HttpServletRequest request){
        // 获得现有的值
        User user=adminService.getUser();

        ModelAndView mav=new ModelAndView();
        mav.addObject("user",user);
        mav.setViewName("/admin/setting-user.jsp");
        return mav;
    }

    // 修改并提交用户设置
    @RequestMapping (value = "/admin/user-setting")
    @ResponseBody
    public Integer userSetting(User user,HttpServletRequest request){
        int flag = adminService.setUser(user);
        return flag;
    }
}
