package service;

import domain.*;

import java.util.List;

public interface PageService {
    // 获得每页文章
    PageBean <Content> getPageBean(int currentPage, int currentCount);

    // 根据时间排序获得cid
    List <Integer> getCidList();

    // 通过mid获得文章列表
    PageBean <Content> getPageBeanByMid(String mid, int currentPage, int currentCount);

    // 获得categoryList
    List <Meta> getCategoryList();

    // 获得pageList
    List <Content> getPageList();

    // 根据cid获得文章的内容，分类，标签，评论
    Content getArticleInfo(String cid);

    // 根据mid获得页面
    Content getPageByCid(String cid);

    // 提交评论
    void submitComment(Comment comment);

    // 根据cid获得评论列表
    List <Comment> getCommentListByCid(Integer cid);
    // 获得上一篇文章
    Content getPreArticle(String preCid);
    // 获得下一篇文章
    Content getNextArticle(String nextCid);
    // 获得博客的基本配置
    BlogConfigPojo getBlogConfig();
}
