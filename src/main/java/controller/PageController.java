package controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.PageService;
import utils.MyMDParser;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class PageController {

    @Autowired
    private PageService pageService;

    // 获得文章，每页10篇文章, 包括分类，标签，评论
    @RequestMapping (value = "/article/index")
    public ModelAndView index(String page,HttpServletRequest request){
        // 每页文章数
        // 获得博客基本配置
        BlogConfigPojo blogConfig=pageService.getBlogConfig();
        int currentCount=blogConfig.getBlogArticleNumEachPage();
        int currentPage;
        if(page==null){
            currentPage=1;
        }else{
            currentPage=Integer.valueOf(page);
        }
        PageBean<Content> pageBeanList=pageService.getPageBean(currentPage,currentCount);
        // 文本加工 显示主要的内容
        List <Content> contentList = pageBeanList.getContentList();
        List<Content> updateContentList=new ArrayList <>();
        for(Content content:contentList){
            String text = content.getText();
            String newText = text.split("-----more-----")[0];
            String html = MyMDParser.markdown2Html(newText);
            content.setText(html);
            updateContentList.add(content);
        }
        pageBeanList.setContentList(updateContentList);

        // 根据修改时间排序
        List<Integer> cidList=pageService.getCidList();
        HashMap<Integer,Integer[]> cidMap=new HashMap <>();
        if(cidList.size()>=2) {
            cidMap.put(cidList.get(0), new Integer[]{null, cidList.get(1)});
            int len = cidList.size();
            for (int i = 1; i < len - 1; i++) {
                cidMap.put(cidList.get(i), new Integer[]{cidList.get(i - 1), cidList.get(i + 1)});
            }
            cidMap.put(cidList.get(len - 1), new Integer[]{cidList.get(len - 2), null});
        }
        ModelAndView mav = new ModelAndView();
        mav.addObject("pageBeanList",pageBeanList);
        mav.addObject("cidMap",cidMap);
        mav.addObject("blogName",blogConfig.getBlogName());
        mav.setViewName("/user/index.jsp");
        return mav;
    }
    // 根据分类获得文章列表     根据标签获得文章列表
    @RequestMapping (value = "/article/category")
    public ModelAndView getArticleListByMid(Meta meta,String page,HttpServletRequest request){
        // 获得博客基本配置
        BlogConfigPojo blogConfig=pageService.getBlogConfig();
        // 设置每页的文章数
        int currentCount=blogConfig.getBlogArticleNumEachPage();
        int currentPage;
        if(page==null){
            currentPage=1;
        }else{
            currentPage=Integer.valueOf(page);
        }
        String mid=String.valueOf(meta.getMid());
        PageBean<Content> pageBeanByMid=pageService.getPageBeanByMid(mid,currentPage,currentCount);
        // 文本加工 显示主要的内容
        List <Content> contentList = pageBeanByMid.getContentList();
        List<Content> updateContentList=new ArrayList <>();
        for(Content content:contentList){
            String text = content.getText();
            String newText = text.split("-----more-----")[0];
            String html = MyMDParser.markdown2Html(newText);
            content.setText(html);
            updateContentList.add(content);
        }
        pageBeanByMid.setContentList(updateContentList);

        // 根据修改时间排序
        List<Integer> cidList=pageService.getCidList();
        HashMap<Integer,Integer[]> cidMap=new HashMap <>();
        if(cidList.size()>=2) {
            cidMap.put(cidList.get(0), new Integer[]{null, cidList.get(1)});
            int len = cidList.size();
            for (int i = 1; i < len - 1; i++) {
                cidMap.put(cidList.get(i), new Integer[]{cidList.get(i - 1), cidList.get(i + 1)});
            }
            cidMap.put(cidList.get(len - 1), new Integer[]{cidList.get(len - 2), null});
        }
        ModelAndView mav = new ModelAndView();
        mav.addObject("pageBeanByMid",pageBeanByMid);
        mav.addObject("meta",meta);
        mav.addObject("cidMap",cidMap);
        mav.setViewName("/user/meta.jsp");
        return mav;
    }


    // 获得文章详情页
    @RequestMapping (value = "/article/articleInfo")
    public ModelAndView getArticleInfo(String cid,String preCid,String nextCid,HttpServletRequest request){
        // 根据cid获得文章的内容，分类，标签，评论
        Content content=pageService.getArticleInfo(cid);
        // 文本渲染
        String text = content.getText();
        String newText = text.replace("-----more-----", "");
        // markdown 解析
        String html = MyMDParser.markdown2Html(newText);
        content.setText(html);

        // 处理分类
        ArrayList <Meta> metaList = content.getMetaList();
        List<Meta> categoryList=new ArrayList <>();
        List<Meta> tagList=new ArrayList <>();
        int size=0;
        if(metaList!=null){
            for(Meta meta:metaList){
                if("category".equals(meta.getType())){
                    categoryList.add(meta);
                    size++;
                }else{
                    tagList.add(meta);
                }
            }
        }
        // 前一页pre
        Content preContent=null;
        if(preCid!=null){
            preContent =pageService.getPreArticle(preCid);
        }
        // 后一页next
        Content nextContent=null;
        if(nextCid!=null) {
            nextContent = pageService.getNextArticle(nextCid);
        }
        // 根据修改时间排序
        List<Integer> cidList=pageService.getCidList();
        HashMap<Integer,Integer[]> cidMap=new HashMap <>();
        if(cidList.size()>=2) {
            cidMap.put(cidList.get(0), new Integer[]{null, cidList.get(1)});
            int len = cidList.size();
            for (int i = 1; i < len - 1; i++) {
                cidMap.put(cidList.get(i), new Integer[]{cidList.get(i - 1), cidList.get(i + 1)});
            }
            cidMap.put(cidList.get(len - 1), new Integer[]{cidList.get(len - 2), null});
        }
        // 获得博客基本配置
        BlogConfigPojo blogConfig=pageService.getBlogConfig();
        ModelAndView mav = new ModelAndView();
        mav.addObject("content",content);
        mav.addObject("commentList",content.getCommentList());
        mav.addObject("categoryList",categoryList);
        mav.addObject("tagList",tagList);
        mav.addObject("preContent",preContent);
        mav.addObject("nextContent",nextContent);
        mav.addObject("cidMap",cidMap);
        mav.addObject("size",size);
        mav.addObject("blogName",blogConfig.getBlogName());
        mav.setViewName("/user/article.jsp");
        return  mav;
    }

    // 根据页面mid获得页面详情页 及评论
    @RequestMapping (value = "/article/page")
    public ModelAndView getPageInfo(String cid,HttpServletRequest request){
        Content content=pageService.getPageByCid(cid);
        // 文本渲染
        String text = content.getText();
        String newText = text.replace("-----more-----", "");
        // markdown 解析
        String html = MyMDParser.markdown2Html(newText);
        content.setText(html);

        ModelAndView mav = new ModelAndView();
        mav.addObject("content",content);
        mav.addObject("commentList",content.getCommentList());
        mav.setViewName("/user/article.jsp");
        return mav;
    }

    // 提交评论
    @RequestMapping (value = "/article/comment")
    @ResponseBody
    public List<Comment> submitComment(Comment comment,HttpServletRequest request){
        // 补充时间参数
        Date date = new Date();
        comment.setCreated(date);
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
        pageService.submitComment(comment);
        // 根据cid获得评论列表
        List<Comment> commentList=pageService.getCommentListByCid(comment.getCid());
        return commentList;
    }

    // ajax 获得分类JSON
    @RequestMapping (value = "/article/headerInfo")
    @ResponseBody
    public List<Object> getHeaderInfo(){
        // 获得博客基本配置
        BlogConfigPojo blogConfig=pageService.getBlogConfig();
        // 获得 分类metaList
        List <Meta> categoryList=pageService.getCategoryList();
        // 获得pageList

        List<Content> contentList=pageService.getPageList();
        // 封装
        List<Object> list=new ArrayList <>();
        list.add(categoryList);
        list.add(contentList);
        list.add(blogConfig.getBlogName());
        return list;
    }
}
