import domain.*;
import mapper.AdminMapper;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import service.AdminService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration ("classpath:applicationContext.xml")
public class Test {

    @Autowired
    private AdminService adminService;
    @Autowired
    private AdminMapper adminMapper;

    @org.junit.Test
    public void testLogin(){
        User user=new User();
        user.setName("zqz");
        user.setPassword("123");
        boolean login = adminService.login(user);
        System.out.println(login);
    }
    @org.junit.Test
    public void insertArticle(){
        Content content = new Content();
        content.setTitle("测试篇");
        content.setSlug("test");
        content.setType("article");
        String [] category={"A","B"};
        adminService.insertArticle(content,category,"test");
    }

    @org.junit.Test
    public void insertPageTest(){
        Content content = new Content();
        content.setTitle("第一篇页面 001");
        content.setSlug("页面01");
        content.setType("page");
        adminService.insertPage(content);
    }
    @org.junit.Test
    public void insertCategoryTest(){
        Meta meta = new Meta();
        Integer mid = meta.getMid();
        //System.out.println(mid==null);
        meta.setName("人工智能");
        meta.setSlug("AI");
        meta.setType("category");
        adminService.insertMeta(meta);
    }
    @org.junit.Test
    public void getCategoryListTest(){
        List <Meta> categoryList = adminService.getMetaList("category");
        for(Meta m:categoryList){
            System.out.println(m.getMid()+m.getName()+m.getSlug()+m.getType());
        }
    }

    @org.junit.Test
    public void updateContentTest(){
        Content content=new Content();
        Meta meta=new Meta();
        content.setCid(36);
        content.setSlug("testttt");
        content.setTitle("第ttt篇文章");
        adminMapper.updateContentByCid(content);
    }
    @org.junit.Test
    public void deleteContentTest(){
        adminService.deleteContent("31");
    }

    @org.junit.Test
    public void deleteTagTest(){
        adminService.deleteCategory("33");
        adminMapper.deleteRelationShopByMid("33");
    }

    @org.junit.Test
    public void getContentListByOrderTest(){
//        List <Content> contentList = adminService.getArticleListByOrder();
        List <Content> contentList = adminService.getPageListByOrder();
        for (Content c:contentList){
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            System.out.println(c.getCid()+"  "+ c.getTitle()+" "+format.format(c.getCreated()));
            System.out.println("----------");
        }
        List <Comment> commentListByOrder = adminService.getCommentListByOrder();
        for(Comment com:commentListByOrder){
            System.out.println(com.getCoid()+" "+com.getAuthor()+" "+com.getUrl()+com.getText());
        }
    }
    @org.junit.Test
    public void commentTest(){
        // 回复
//        Comment comment = new Comment();
//        comment.setCid(24);
//        adminService.commentReply(comment);
        // 修改
//        Comment editJson = adminService.editJson("2");
//        System.out.println(editJson);
        // 修改状态
//        Comment comment = new Comment();
//        comment.setCoid(2);
//        comment.setStatus("approved");
//        adminService.editCommentStatus(comment);
        // 删除
        adminService.commentDelete("12","12");

    }
    @org.junit.Test
    public void setBlogTest(){
//        BlogConfigPojo blogConfig = adminService.getBlogConfig();
//        System.out.println(blogConfig.getBid());
//        int i = adminService.setBlog(blogConfig);
//        System.out.println(i);
        User user = adminService.getUser();
        System.out.println(user.getUid());
        int i = adminService.setUser(user);
        System.out.println(i);

    }
}
