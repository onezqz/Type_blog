package service;

import domain.*;

import java.util.List;


public interface AdminService {
    // 登录
    boolean login(User user);

    // 发表文章
    void insertArticle(Content content, String[] category, String tags);

    // 更新文章
    void updateContentByCid(Content content, String[] category, String tags);

    // 删除文章
    void deleteContent(String cid);

    // 删除页面根据cid
    void deletePage(String cid);

    // 更新文章 / 页面 的状态
    void updateContentStatus(String status, String cid);

    // 获得文章列表
    PageBean<Content> getArticleList(int currentPage, int currentCount);

    // 发表页面
    void insertPage(Content content);

    // 根据cid获得page
    Content getPageByCid(String cid);

    // 获得页面列表
    List <Content> getPageList();

    // 更新page通过cid
    void updatePageByCid(Content content);

    // 根据cid过的content
    Content getContentByCid(String cid);

    // 添加分类
    void insertMeta(Meta meta);

    // 删除分类
    void deleteCategory(String mid);

    // 删除标签
    void deleteTag(String mid);

    // 通过mid更新Meta
    void updateMetaInfoByMid(Meta meta);

    // 通过mid获得meta
    Meta getMetaByMid(String mid);

    // 获得meta列表
    List <Meta> getMetaList(String type);

    // 查看所有的评论列表
    PageBean <Comment> getALlCommentList(int currentPage, int currentCount);

    // 回复评论
    void commentReply(Comment comment);

    // 根据coid 获得评论
    Comment editJson(String coid);

    // 通过coid 修改评论的状态
    void editCommentStatus(Comment comment);

    // 通过coid删除评论
    void commentDelete(String coid,String cid);

    // 根据cid获得评论列表
    PageBean <Comment> getCommentListByCid(String cid, int currentPage, int currentCount);

    // 获得文章数量
    int countArticle();

    // 页面数
    int countPage();
    // 分类数

    int countCategory();
    // 标签数

    int countTag();
    // 评论数

    int countComment();
    //获得前10条最新的文章

    List <Content> getArticleListByOrder();
    // 获得前3天页面

    List <Content> getPageListByOrder();
    // 获得最近评论

    List <Comment> getCommentListByOrder();

    // 更新评论
    void updateComment(Comment comment);
    // 获得博客配置对象
    BlogConfigPojo getBlogConfig();
    // 更新博客设置
    int setBlog(BlogConfigPojo blogConfigPojo);
    // 获得用户信息
    User getUser();
    // 更新用户信息
    int setUser(User user);
}
