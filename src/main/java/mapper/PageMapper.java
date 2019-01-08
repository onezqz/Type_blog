package mapper;


import domain.BlogConfigPojo;
import domain.Comment;
import domain.Content;
import domain.Meta;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

public interface PageMapper {

    // 获得categoryList
    List <Meta> getCategoryList(String type);

    // 获得pageList
    List <Content> getPageList(String type);

    // 获得文章总数
    int getContentTotal();

    // 或根据cid获得总数
    int getContentTotalByMid(String mid);

    // 获得每页的文章
    List <Content> getContentListForPage(@Param("idx") int idx, @Param("currentCount") int currentCount);

    // 根据时间排序获得cid
    List <Integer> getCidList();

    // 获得每一种分类下的每页文章
    List <Content> getContentListForPageByMid(@Param("mid") String mid, @Param("idx") int index,
                                              @Param("currentCountForCat") int currentCountForCat);

    // 根据cid获得文章的内容，分类，标签，评论
    Content getArticleInfo(String cid);

    // 根据cid获得评论
    ArrayList <Comment> getCommentListByCid(String cid);

    // 根据cid获得页面
    Content getPageByCid(String cid);

    // 提交评论
    void submitComment(Comment comment);

    // 根据cid将评论数加1
    void countCommentNum(Integer cid);

    // 通过cid获得文章
    Content getArticleByCid(String cid);
    // 获得博客的基本配置
    BlogConfigPojo getBlogConfig();
}
