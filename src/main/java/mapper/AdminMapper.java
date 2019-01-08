package mapper;

import domain.*;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

public interface AdminMapper {
    // 登录
    int login(User user);

    // 插入文章
    int insertArticle(Content content);

    // 通过category查找Meta
    Meta findMetaByCategory(String category);

    // 通过tag获得Meta
    Meta findMetaByTags(String tag);

    //更新meta count+1
    void updateMetaCountByMid(Integer mid);

    // 更新meta count-1
    void updateMetaSubCountByMid(Integer mid);

    // 插入meta
    int insertMetaByType(Meta meta);

    //更新relationship表
    void insertRelationShop(@Param("cid") int cid, @Param("mid") int mid);

    void deleteRelationShop(@Param("cid") int cid, @Param("mid") int mid);

    // 通过mid删除记录
    void deleteRelationShopByMid(String mid);

    // 获得文章列表
    List <Content> getArticleList(@Param("idx") int index, @Param("currentCount") int currentCount);

    // 通过cid更新Content
    void updateContentByCid(Content content);

    // 删除文章  页面
    void deleteContent(String cid);

    // 更新文章 / 页面 的状态
    void updateContentStatus(@Param("status") String status, @Param("cid") String cid);

    // 发表页面
    void insertPage(Content content);

    // 获得pageList
    List <Content> getPageList();

    // 根据cid过的content
    Content getContentByCid(String cid);

    // 根据cid过的page
    Content getPageByCid(String cid);

    // 添加分类
    void insertMeta(Meta meta);

    // 删除分类 标签
    void deleteCategory(String mid);

    // 获得meta列表
    List <Meta> getMetaList(String type);

    //通过mid获得meta
    Meta getMetaByMid(String mid);

    // 根据cid获得meta
    ArrayList <Meta> getMetaByCid(Integer cid);

    // 更新meta信息
    void updateMetaInfoByMid(Meta meta);

    //  查看所有的评论列表
    List <Comment> getAllCommentList(@Param("idx") int index, @Param("currentCount") int currentCount);

    // 根据cid获得评论列表
    List <Comment> getCommentListByCid(@Param("cid") String cid, @Param("idx") int index,
                                       @Param("currentCount") int currentCount);

    // 根据cid删除评论
    void deleteComment(String cid);

    // 获得文章  页面的数量
    int countContent(String type);

    // 获得分类数  标签
    int countMeta(String type);

    // 获得评论数
    int countComment();
    // 通过cid获得评论总数
    int countCommentByCid(String cid);
    // 获得前10条最新的文章 获得前3条页面
    List <Content> getContentListByOrder(@Param("type") String type, @Param("num") int num);

    // 获得最近评论
    List <Comment> getCommentListByOrder(int num);

    // 回复评论
    void commentReply(Comment comment);

    // 根据coid 获得评论
    Comment editJson(String coid);

    // 通过coid 修改评论的状态
    void editCommentStatus(Comment comment);

    // 通过coid删除评论
    void commentDelete(String coid);
    // 根据coid将contents评论数减1
    void subCommentsNum(String cid);
    // 更新评论
    void updateComment(Comment comment);
    // 获得博客配置对象
    BlogConfigPojo getBlogConfig();
    // 更新博客
    int updateBlog(BlogConfigPojo blogConfigPojo);
    // 获得用户信息
    User getUser();
    // 更新用户信息
    int updateUser(User user);
    // 对应的cid评论数加1
    void countCommentNum(Integer cid);
}
