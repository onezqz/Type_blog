package service.impl;

import domain.*;
import mapper.PageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import service.PageService;

import java.util.ArrayList;
import java.util.List;

public class PageServiceImpl implements PageService {

    @Autowired
    private PageMapper pageMapper;

    // 获得每页文章
    @Override
    public PageBean <Content> getPageBean(int currentPage, int currentCount) {
        PageBean <Content> pageBean = new PageBean <>();
        // 设置当前页
        pageBean.setCurrentPage(currentPage);
        // 设置当前页的数量
        pageBean.setCurrentCount(currentCount);
        // 设置文章总数
        int totalCount = pageMapper.getContentTotal();
        pageBean.setTotalCount(totalCount);
        // 设置总页数
        int totalPage = (int) Math.ceil(1.0 * totalCount / currentCount);
        pageBean.setTotalPage(totalPage);
        // 获得每页文章在数据库中的起始位置
        int index = (currentPage - 1) * currentCount;
        // 设置文章列表
        List <Content> contentList = pageMapper.getContentListForPage(index, currentCount);

        // 处理文章

        pageBean.setContentList(contentList);
        return pageBean;
    }
    // 根据时间排序获得cid
    @Override
    public List <Integer> getCidList() {
        return pageMapper.getCidList();
    }

    // 通过mid获得文章列表
    @Override
    public PageBean <Content> getPageBeanByMid(String mid, int currentPageForCat, int currentCountForCat) {
        PageBean <Content> pageBean = new PageBean <>();
        // 设置当前页
        pageBean.setCurrentPage(currentPageForCat);
        // 设置当前页的数量
        pageBean.setCurrentCount(currentCountForCat);
        // 设置文章总数
        int totalCountForCat = pageMapper.getContentTotalByMid(mid);
        pageBean.setTotalCount(totalCountForCat);
        // 设置总页数
        int totalPageForCat = (int) Math.ceil(1.0 * totalCountForCat / currentCountForCat);
        pageBean.setTotalPage(totalPageForCat);
        // 获得每页文章在数据库中的起始位置
        int index = (currentPageForCat - 1) * currentCountForCat;
        // 设置文章列表
        List <Content> contentListForCat = pageMapper.getContentListForPageByMid(mid,index, currentCountForCat);

        // 处理文章

        pageBean.setContentList(contentListForCat);
        return pageBean;

    }

    // 获得categoryList
    @Override
    public List <Meta> getCategoryList() {
        String type = "category";
        return pageMapper.getCategoryList(type);
    }

    // 获得pageList
    @Override
    public List <Content> getPageList() {
        String type = "page";
        return pageMapper.getPageList(type);

    }
    // 根据cid获得文章的内容，分类，标签，评论
    @Override
    public Content getArticleInfo(String cid) {
        Content content = pageMapper.getArticleInfo(cid);
        ArrayList<Comment> commentList=pageMapper.getCommentListByCid(cid);
        content.setCommentList(commentList);
        return content;
    }
    // 根据cid获得页面
    @Override
    public Content getPageByCid(String cid) {
        Content content = pageMapper.getPageByCid(cid);
        ArrayList <Comment> commentListByCid = pageMapper.getCommentListByCid(cid);
        content.setCommentList(commentListByCid);
        return content;
    }
    // 提交评论
    @Override
    public void submitComment(Comment comment) {
        pageMapper.submitComment(comment);
        // 对响应的cid加评论数加1
        pageMapper.countCommentNum(comment.getCid());
    }
    // 根据cid获得评论列表
    @Override
    public List <Comment> getCommentListByCid(Integer cid) {
        return pageMapper.getCommentListByCid(String.valueOf(cid));
    }

    @Override
    public Content getPreArticle(String preCid) {
        return pageMapper.getArticleByCid(preCid);
    }

    @Override
    public Content getNextArticle(String nextCid) {
        return pageMapper.getArticleByCid(nextCid);
    }
    // 获得博客的基本配置
    @Override
    public BlogConfigPojo getBlogConfig() {
        return pageMapper.getBlogConfig();
    }
}
