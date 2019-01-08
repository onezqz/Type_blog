package controller;

import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.AdminService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class AuthenticationController {

    @Autowired
    private AdminService adminService;

    //  跳转到登录界面
    @RequestMapping(value = "/admin")
    public ModelAndView index(HttpServletRequest request) {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("/admin/index.jsp");
        return  mav;
    }

    // 管理员登录  /admin/login
    @RequestMapping(value = "/admin/login")
    public void login(User user, HttpServletRequest request, HttpServletResponse response) {
        //上传service层
        boolean isLogin = adminService.login(user);
        if (isLogin) {
            // 登录成功 跳转到home.jsp
            try {
                HttpSession session = request.getSession();
                session.setAttribute("user",user);
                response.sendRedirect(request.getContextPath()+"/admin/index");
            } catch (IOException e) {
                e.printStackTrace();
            }

        } else {
            // 登录失败
            request.setAttribute("errorInfo", "用户名或密码错误");
            try {
                request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // admin/logout
    @RequestMapping (value = "/admin/logout")
    public void logout(HttpServletRequest request,HttpServletResponse response){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        try {
            response.sendRedirect(request.getContextPath()+"/admin");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
