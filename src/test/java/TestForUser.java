import domain.Comment;
import domain.Content;
import domain.PageBean;
import mapper.PageMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import service.PageService;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestForUser {
    @Autowired
    private PageService pageService;
    @Autowired
    private PageMapper pageMapper;

    @Test
    public void getContentListForPageTest(){
        PageBean <Content> pageBean = pageService.getPageBean(1, 10);
        for(Content c:pageBean.getContentList()){
            System.out.println(c);
        }
    }
    @Test
    public void getContentListForPageByMidTest(){
        PageBean <Content> pageBeanByMid = pageService.getPageBeanByMid("16", 1, 10);
        for (Content c:pageBeanByMid.getContentList()){
            System.out.println(c);
        }
    }
    @Test
    public void getPageByCid(){
        Content pageByCid = pageService.getPageByCid("30");
        System.out.println(pageByCid);
    }
    @Test
    public void submitCommentTest(){
        Comment comment = new Comment();
        Date date = new Date();
        comment.setCreated(date);
        comment.setCid(24);
        pageService.submitComment(comment);
    }
    @Test
    public void getCidListTest(){
        List <Integer> cidList = pageService.getCidList();
        for(Integer cid:cidList){
            System.out.println(cid);
        }
    }
    @Test
    public void commentsNumTest(){
        pageMapper.countCommentNum(41);
    }
}
