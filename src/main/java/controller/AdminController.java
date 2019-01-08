package controller;

import domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.AdminService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    // admin/home  显示控制台  //ajax
    // 包括 文章，页面，分类，标签，评论条数  最近文章，最近页面，最近评论
    @RequestMapping("/admin/index")
    @ResponseBody
    public ModelAndView home(HttpServletRequest request) {

        ModelAndView mav = new ModelAndView();
        // 获得文章数量
        int articleCount = adminService.countArticle();
        mav.addObject("articleCount", articleCount);
        // 页面数
        int pageCount = adminService.countPage();
        mav.addObject("pageCount", pageCount);
        // 分类数
        int categoryCount = adminService.countCategory();
        mav.addObject("categoryCount", categoryCount);
        // 标签数
        int tagCount = adminService.countTag();
        mav.addObject("tagCount", tagCount);
        // 评论数
        int commentCount = adminService.countComment();
        mav.addObject("commentCount", commentCount);
        //获得前10条最新的文章
        List <Content> contentList = adminService.getArticleListByOrder();
        mav.addObject("contentList", contentList);
        // 获得前3天页面
        List <Content> pageList = adminService.getPageListByOrder();
        mav.addObject("pageList", pageList);
        // 获得最近评论
        List <Comment> commentList = adminService.getCommentListByOrder();
        mav.addObject("commentList", commentList);

        // 跳转页面
        mav.setViewName("/admin/home.jsp");
        return mav;
    }
    // /admin/article-post-jsp
    @RequestMapping (value = "/admin/article-post-jsp")
    public ModelAndView articleJsp(HttpServletRequest request){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("/admin/article-post.jsp");
        return mav;
    }

    // admin/article/insert  新建文章 ，更新数据
    @RequestMapping(value = "/admin/article/insert")
    public void insertArticle(Content content, String allowComment, String allowPing, String allowFeed,
                              @RequestParam(value = "category[]",required = false) String[] category, String tags,
                              HttpServletRequest request, HttpServletResponse response) {
        //整理数据
        content.setAllowComment(allowComment);
        content.setAllowPing(allowPing);
        content.setAllowFeed(allowFeed);
        // 判断是新建还是更新
        if (content.getCid() != null) {
            // 更新
            content.setModified(new Date());
            adminService.updateContentByCid(content, category, tags);
        } else {
            // 新建
            content.setCommentsNum(0);
            content.setModified(new Date());
            adminService.insertArticle(content, category, tags);
        }
        // 跳转到admin/article/list中
        try {
            response.sendRedirect( request.getContextPath()+"/admin/article/list");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // admin/article/list  展示文章列表
    @RequestMapping(value = "/admin/article/list")
    @ResponseBody
    public ModelAndView articleList(String page,HttpServletRequest request) {
        // 当前页
        int currentPage;
        if(page==null){
            currentPage=1;
        }else{
            currentPage=Integer.valueOf(page);
        }
        // 每页文章数 从数据库中查
        BlogConfigPojo blogConfig = adminService.getBlogConfig();
        int currentCount=blogConfig.getBlogArticleNumEachPage();
        // 获得contentList
        PageBean<Content> pageBean = adminService.getArticleList(currentPage,currentCount);
        ModelAndView mav = new ModelAndView();
        mav.addObject("pageBean", pageBean);
        mav.addObject("blogArticleTimeFormat", blogConfig.getBlogArticleTimeFormat());
        mav.setViewName("/admin/article-list.jsp");
        // 返回contentList
        return mav;
    }

    // 修改文章 admin/article/edit  纯获得数据，不做修改操作
    @RequestMapping(value = "/admin/article/edit")
    public ModelAndView articleEdit(String cid, HttpServletRequest request) {

        Content content = adminService.getContentByCid(cid);
        ArrayList <Meta> metaList = content.getMetaList();
        List <String> category = new ArrayList <>();
        StringBuilder tag = new StringBuilder();
        if(metaList.size()!=0) {
            for (Meta m : metaList) {
                if (m.getType() != null) {
                    if (m.getType().equals("category")) {
                        category.add(m.getName());
                    } else {
                        tag.append(m.getName()).append("  ");
                    }
                }
            }
        }
        String tagStr = tag.toString().trim();

        ModelAndView mav = new ModelAndView();
        mav.addObject("content", content);
        mav.addObject("category", category);
        mav.addObject("tagStr", tagStr);
        mav.setViewName("/admin/article-edit.jsp");

        return mav;
    }

    // 删除文章 admin/article/delete
    @RequestMapping(value = "/admin/article/delete")
    public void deleteArticle(String cid, HttpServletRequest request, HttpServletResponse response) {

        adminService.deleteContent(cid);

        try {
            response.sendRedirect(request.getContextPath()+"/admin/article/list");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 更改文章的状态status
    @RequestMapping(value = "/admin/article/status")
    public void updateArticleStatus(String status, String cid,
                                    HttpServletResponse response, HttpServletRequest request) {
        adminService.updateContentStatus(status, cid);

        try {
            response.sendRedirect(request.getContextPath()+"/admin/article/list");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // /admin/article-post-jsp
    @RequestMapping (value = "/admin/page-post-jsp")
    public ModelAndView pageJsp(HttpServletRequest request){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("/admin/page-post.jsp");
        return mav;
    }

    // admin/page/insert   发布页面  根据数据
    @RequestMapping(value = "/admin/page/insert")
    public void insertPage(Content content,String allowComment, String allowPing, String allowFeed,
                           HttpServletRequest request, HttpServletResponse response) {
        //整理数据
        content.setAllowComment(allowComment);
        content.setAllowPing(allowPing);
        content.setAllowFeed(allowFeed);

        //service
        if (content.getCid() != null) {
            // 更新
            adminService.updatePageByCid(content);

        } else {
            // 新建
            content.setCommentsNum(0);
            adminService.insertPage(content);
        }
        // 跳转到admin/page/list中
        try {
            response.sendRedirect( request.getContextPath()+"/admin/page/list");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // admin/page/list  页面列表
    @RequestMapping(value = "/admin/page/list")
    public ModelAndView pageList(HttpServletRequest request) {
        //获得pageList
        List <Content> pageList = adminService.getPageList();

        ModelAndView mav = new ModelAndView();
        mav.addObject("pageList", pageList);
        mav.setViewName("/admin/page-list.jsp");
        return mav;
    }

    // 修改文章 admin/page/edit
    @RequestMapping(value = "/admin/page/edit")
    public ModelAndView pageEdit(String cid, HttpServletRequest request) {

        Content page = adminService.getPageByCid(cid); // 肯定是page
        ModelAndView mav = new ModelAndView();
        mav.addObject("page", page);
        mav.setViewName("/admin/page-edit.jsp");

        return mav;
    }

    // 删除文章 admin/page/delete
    @RequestMapping(value = "/admin/page/delete")
    public void deletePage(String cid, HttpServletRequest request, HttpServletResponse response) {
        adminService.deletePage(cid);

        try {
            response.sendRedirect( request.getContextPath()+"/admin/page/list");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 更改页面的状态status
    @RequestMapping(value = "/admin/page/status")
    public void updatePageStatus(String status, String cid,
                                 HttpServletResponse response, HttpServletRequest request) {
        adminService.updateContentStatus(status, cid);

        try {
            response.sendRedirect(request.getContextPath()+"/admin/page/list");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // /admin/comment/
    // 评论列表
    @RequestMapping(value = "/admin/comment/list")
    public ModelAndView commentList(String cid,String page, HttpServletRequest request) {
        int currentPage;
        if(page==null){
            currentPage=1;
        }else{
            currentPage=Integer.valueOf(page);
        }
        // 每页评论数
        BlogConfigPojo blogConfig = adminService.getBlogConfig();
        int currentCount=blogConfig.getBlogCommentListNum();
        PageBean<Comment> commentPageBean;
        if (cid == null) {
            // 查看所有的评论列表
            commentPageBean = adminService.getALlCommentList(currentPage,currentCount);
        } else {
            // 根据cid获得评论列表
            commentPageBean = adminService.getCommentListByCid(cid,currentPage,currentCount);
        }

        ModelAndView mav = new ModelAndView();
        mav.addObject("commentPageBean", commentPageBean);
        mav.addObject("blogCommentTimeFormat", blogConfig.getBlogCommentTimeFormat());
        mav.setViewName( "/admin/comment-list.jsp");
        return mav;
    }

    // 回复评论,更新评论
    @RequestMapping (value = "/admin/comment/reply")
    public void commentReply(Comment comment,HttpServletRequest request,HttpServletResponse response){
        comment.setCreated(new Date());
        if(comment.getCoid()==null) {
            // 回复
            // 获得ip地址
            String ip = request.getHeader("x-forwarded-for");
            if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("Proxy-Client-IP");
            }
            if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("WL-Proxy-Client-IP");
            }
            if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getRemoteAddr();
            }
            comment.setIp(ip);
            adminService.commentReply(comment);
        }else{
            // 更新评论
            adminService.updateComment(comment);
        }
        // 返回commentList页面
        try {
            response.sendRedirect(request.getContextPath()+"/admin/comment/list");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    // 评论修改
    @RequestMapping (value = "/admin/comment/editJson")
    @ResponseBody
    public Comment editJson(String coid){
        // 根据coid 获得评论
        return adminService.editJson(coid);
    }

    // 修改评论状态
    @RequestMapping (value = "/admin/comment/status")
    public void editCommentStatus(Comment comment,HttpServletResponse response,HttpServletRequest request){
        // 通过coid 修改评论的状态
        adminService.editCommentStatus(comment);

        // 返回commentList页面
        try {
            response.sendRedirect(request.getContextPath()+"/admin/comment/list");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 删除评论
    @RequestMapping (value = "/admin/comment/delete")
    public void commentDelete(String coid,String cid,HttpServletRequest request,HttpServletResponse response){
        // 通过coid删除评论
        adminService.commentDelete(coid,cid);

        // 返回commentList页面
        try {
            response.sendRedirect(request.getContextPath()+"/admin/comment/list");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    // /admin/category-post-jsp
    @RequestMapping (value = "/admin/category-post-jsp")
    public ModelAndView categoryJsp(HttpServletRequest request){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("/admin/category-post.jsp");
        return mav;
    }
    // admin/category/insert 新建分类，更新数据
    @RequestMapping(value = "/admin/category/insert")
    public void insertCategory(Meta meta, HttpServletRequest request, HttpServletResponse response) {
        // 上传service 层
        if (meta != null && meta.getMid() == null) {
            // 插入新的数据
            adminService.insertMeta(meta);
        } else if (meta != null && meta.getMid() != null) {
            // 更新meta数据
            adminService.updateMetaInfoByMid(meta);
        }
        // 跳转到admin/category/list中
        try {
            response.sendRedirect( request.getContextPath()+"/admin/category/list");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // admin/category/list 分类列表
    @RequestMapping(value = "/admin/category/list")
    public ModelAndView categoryList(HttpServletRequest request) {
        //获得categoryList
        List <Meta> categoryList = adminService.getMetaList("category");

        ModelAndView mav = new ModelAndView();
        mav.addObject("categoryList", categoryList);
        mav.setViewName("/admin/category-list.jsp");
        return mav;
    }

    // admin/category/edit  分类编辑  纯获得数据，不做修改操作
    @RequestMapping(value = "admin/category/edit")
    public ModelAndView categoryEdit(String mid, HttpServletRequest request) {
        // 通过mid获得category
        Meta meta = adminService.getMetaByMid(mid);// 保证mid的type是category

        ModelAndView mav = new ModelAndView();
        mav.addObject("meta", meta);
        mav.setViewName( "/admin/category-edit.jsp");
        return mav;
    }

    // 删除分类
    @RequestMapping(value = "/admin/category/delete")
    public void deleteCategory(String mid, HttpServletRequest request, HttpServletResponse response) {

        adminService.deleteCategory(mid);

        // 跳转到admin/category/list中
        try {
            response.sendRedirect(request.getContextPath()+"/admin/category/list");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // admin/category/json  // ajax 动态获得分类
    @RequestMapping(value = "/admin/category/json")
    @ResponseBody
    public List <Meta> getMetaJson() {
        List <Meta> metaList = adminService.getMetaList("category");
        return metaList;
    }

    // admin/category/insert 新建标签，更新数据
    @RequestMapping(value = "/admin/tag/insert")
    public void insertTag(Meta meta, HttpServletRequest request, HttpServletResponse response) {
        if (meta != null && meta.getMid() == null) {
            // 新的数据插入
            adminService.insertMeta(meta);
        } else if (meta != null && meta.getMid() != null) {
            // 更新meta数据
            adminService.updateMetaInfoByMid(meta);
        }
        // 跳转到admin/tag/list中
        try {
            response.sendRedirect( request.getContextPath()+"/admin/tag/list");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // admin/tag/edit  标签编辑  纯获得数据，不做修改操作
    @RequestMapping(value = "/admin/tag/edit")
    @ResponseBody
    public Meta tagEdit(String mid) {
        // 通过mid获得 Meta
        Meta meta = adminService.getMetaByMid(mid); // 保证mid的type是tag
        return meta;
    }

    // admin/tag/list 标签列表
    @RequestMapping(value = "/admin/tag/list")
    public ModelAndView tagList(HttpServletRequest request) {
        // 获得tagList
        List <Meta> tagList = adminService.getMetaList("tag");

        ModelAndView mav = new ModelAndView();
        mav.addObject("tagList", tagList);
        mav.setViewName( "/admin/tag-list.jsp");
        return mav;
    }

    // admin/tag/delete
    @RequestMapping(value = "/admin/tag/delete")
    public void deleteTag(String mid, HttpServletRequest request, HttpServletResponse response) {

        adminService.deleteTag(mid);

        // 跳转到admin/category/list中
        try {
            response.sendRedirect( request.getContextPath()+"/admin/tag/list");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
