package service.impl;

import domain.*;
import mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import service.AdminService;

import java.util.ArrayList;
import java.util.List;


public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    // 登录
    public boolean login(User user) {
        int isLogin = adminMapper.login(user);
        return isLogin > 0;
    }

    // 发表文章
    @Override
    @Transactional
    public void insertArticle(Content content, String[] category, String tags) {
        // 上传content到mapper
        adminMapper.insertArticle(content);
        int cid = content.getCid();
        int mid;
        // 通过category获得Meta，让count+1 对于已经存在的meta项，让count+1；没有的meta项count=1；
        if (category != null) {
            for (String c : category) {
                Meta metaCategory = adminMapper.findMetaByCategory(c);
                if (metaCategory == null) {  // 分类一定存在的，就是以防万一
                    //不存在这个meta insert
                    Meta newMeta = new Meta();
                    newMeta.setType("category");
                    newMeta.setName(c);

                    adminMapper.insertMetaByType(newMeta);
                    mid = newMeta.getMid();
                } else {
                    //存在 update
                    adminMapper.updateMetaCountByMid(metaCategory.getMid()); // 更新文章的数量
                    mid = metaCategory.getMid();
                }
                // 更新relationship表
                adminMapper.insertRelationShop(cid, mid);
            }
        }
        if (tags != null && tags.trim() != "") {
            String[] tagArr = tags.split("\\s+");  //匹配多个空格
            for (int i = 0; i < tagArr.length; i++) {
                String tag = tagArr[i].trim();
                Meta metaTag = adminMapper.findMetaByTags(tag);
                if (metaTag == null) {
                    //insert
                    Meta newMeta = new Meta();
                    newMeta.setType("tag");
                    newMeta.setName(tag);

                    adminMapper.insertMetaByType(newMeta);
                    mid = newMeta.getMid();
                } else {
                    //update
                    adminMapper.updateMetaCountByMid(metaTag.getMid());
                    mid = metaTag.getMid();
                }
                // 更新relationship表
                adminMapper.insertRelationShop(cid, mid);
            }
        }
    }

    // 更新文章
    @Override
    public void updateContentByCid(Content content, String[] category, String tags) {
        // 更新content
        adminMapper.updateContentByCid(content);
        // 更新meta
        // 1. 通过cid获得原来的meta
        ArrayList <Meta> metaList = adminMapper.getMetaByCid(content.getCid());
        ArrayList <String> oldCategory = new ArrayList <>();
        ArrayList <String> oldTag = new ArrayList <>();
        if (metaList != null) {
            for (Meta m : metaList) {
                if (m.getType().equals("category") && m.getName() != null) {
                    oldCategory.add(m.getName());
                } else if (m.getName() != null) {
                    oldTag.add(m.getName());
                }
            }
        }
        // 更新分类
        if (category != null) {
            for (String cat : category) {
                if (!oldCategory.contains(cat)) {
                    // meta里面一定是存在cat分类的;
                    Meta metaCategory = adminMapper.findMetaByCategory(cat);
                    adminMapper.updateMetaCountByMid(metaCategory.getMid());
                    // 同时返回mid用于更新relationship
                    adminMapper.insertRelationShop(content.getCid(), metaCategory.getMid());
                } else if (oldCategory.contains(cat)) {
                    oldCategory.remove(cat);
                }
            }
        }
        if (oldCategory.size() != 0) {
            for (String oldCat : oldCategory) {
                // 删除文章的分类，更新relationship，count-1;
                Meta metaCategory = adminMapper.findMetaByCategory(oldCat);
                adminMapper.updateMetaSubCountByMid(metaCategory.getMid());
                // 同时返回mid用于更新relationship
                adminMapper.deleteRelationShop(content.getCid(), metaCategory.getMid());
            }
        }
        // 更新标签
        if (tags!=null&& !tags.equals("")&& !"".equals(tags.trim())) {
            String[] tagArr = tags.split("\\s+");  //匹配多个空格
            for (int i = 0; i < tagArr.length; i++) {
                String tag = tagArr[i].trim();
                Meta metaByTag = adminMapper.findMetaByTags(tag);
                if (metaByTag == null && !oldTag.contains(tag)) {
                    // 新增
                    Meta meta = new Meta();
                    meta.setType("tag");
                    meta.setName(tag);
                    adminMapper.insertMetaByType(meta);

                    // 更新relationship
                    adminMapper.insertRelationShop(content.getCid(), meta.getMid());
                } else if (metaByTag != null && !oldTag.contains(tag)) {
                    // 存在但不包含
                    adminMapper.updateMetaCountByMid(metaByTag.getMid());

                    adminMapper.insertRelationShop(content.getCid(), metaByTag.getMid());
                } else if (oldTag.contains(tag)) {
                    oldTag.remove(tag);
                }
            }
        }
        if (oldTag.size() != 0) {
            for (String oTag : oldTag) {
                // 删除 count-1;
                Meta metaCategory = adminMapper.findMetaByTags(oTag);
                adminMapper.updateMetaSubCountByMid(metaCategory.getMid());
                // 同时返回mid用于更新relationship
                adminMapper.deleteRelationShop(content.getCid(), metaCategory.getMid());
            }
        }
    }

    // 删除文章
    @Transactional
    @Override
    public void deleteContent(String cid) {
        // 获得对应的mid
        Content contentByCid = adminMapper.getContentByCid(cid);
        if (contentByCid != null) {
            ArrayList <Meta> metaList = adminMapper.getMetaByCid(Integer.valueOf(cid));
            // 每个mid的count-1
            for (Meta m : metaList) {
                adminMapper.updateMetaSubCountByMid(m.getMid());
                // 删除relationship表记录
                adminMapper.deleteRelationShop(Integer.valueOf(cid), m.getMid());
            }
        }
        // 删除content表
        adminMapper.deleteContent(cid);
        // 删除评论
        adminMapper.deleteComment(cid);

    }

    // 删除页面根据cid
    @Transactional
    @Override
    public void deletePage(String cid) {
        adminMapper.deleteContent(cid);
        adminMapper.deleteComment(cid);
    }

    // 更新文章 / 页面 的状态
    @Override
    public void updateContentStatus(String status, String cid) {
        adminMapper.updateContentStatus(status, cid);
    }

    // 获得文章列表
    @Override
    public PageBean<Content> getArticleList(int currentPage, int currentCount) {
        PageBean <Content> pageBean = new PageBean <>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setCurrentCount(currentCount);
        // 总数
        int totalCount=adminMapper.countContent("article");
        pageBean.setTotalCount(totalCount);
        // 总页数
        int totalPage=(int)Math.ceil(1.0*totalCount/currentCount);
        pageBean.setTotalPage(totalPage);

        // 每页的起始页
        int index=(currentPage-1)*currentCount;

        List <Content> articleList = adminMapper.getArticleList(index,currentCount);
        for(Content content:articleList){
            // 根据cid获得meta
            ArrayList<Meta> metaList = adminMapper.getMetaByCid(content.getCid());
            content.setMetaList(metaList);
        }
        pageBean.setContentList(articleList);
        return pageBean;
    }

    // 发表页面
    @Override
    public void insertPage(Content content) {
        adminMapper.insertPage(content);
    }

    // 根据cid获得page
    @Override
    public Content getPageByCid(String cid) {
        return adminMapper.getPageByCid(cid);
    }

    // 获得页面列表
    @Override
    public List <Content> getPageList() {
        return adminMapper.getPageList();
    }

    // 更新page通过cid
    @Override
    public void updatePageByCid(Content content) {
        // 不存在meta关联表，直接更新
        adminMapper.updateContentByCid(content);
    }

    // 根据cid过的content
    @Override
    public Content getContentByCid(String cid) {
        Content contentByCid = adminMapper.getContentByCid(cid);
        ArrayList <Meta> metaByCid = adminMapper.getMetaByCid(Integer.valueOf(cid));
        contentByCid.setMetaList(metaByCid);
        return contentByCid;
    }

    // 添加分类,标签
    @Override
    public void insertMeta(Meta meta) {
        meta.setCount(0);
        adminMapper.insertMeta(meta);
    }

    // 删除分类
    @Transactional
    @Override
    public void deleteCategory(String mid) {
        // 删除meta类的该分类
        adminMapper.deleteCategory(mid);

        // 通过mid获得删除relationship中的关系对
        adminMapper.deleteRelationShopByMid(mid);
    }

    // 删除标签
    @Override
    public void deleteTag(String mid) {
        // 删除meta类的该标签
        adminMapper.deleteCategory(mid);

        // 通过mid获得删除relationship中的关系对
        adminMapper.deleteRelationShopByMid(mid);
    }

    // 通过mid更新meta
    @Override
    public void updateMetaInfoByMid(Meta meta) {
        adminMapper.updateMetaInfoByMid(meta);
    }


    // 通过mid获得meta
    @Override
    public Meta getMetaByMid(String mid) {
        return adminMapper.getMetaByMid(mid);
    }

    // 获得meta列表
    @Override
    public List <Meta> getMetaList(String type) {
        return adminMapper.getMetaList(type);
    }


    // 查看所有的评论列表
    @Override
    public PageBean <Comment> getALlCommentList(int currentPage, int currentCount) {
        PageBean <Comment> pageBean = new PageBean <>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setCurrentCount(currentCount);
        // 总数
        int totalCount = adminMapper.countComment();
        pageBean.setTotalCount(totalCount);
        // 总页数
        int totalPage=(int)Math.ceil(1.0*totalCount/currentCount);
        pageBean.setTotalPage(totalPage);
        // 每页的起始页
        int index=(currentPage-1)*currentCount;
        List <Comment> allCommentList = adminMapper.getAllCommentList(index,currentCount);
        pageBean.setContentList(allCommentList);
        return pageBean;
    }
    // 回复评论
    @Override
    public void commentReply(Comment comment) {
        adminMapper.commentReply(comment);
        // 对应的评论数加1
        adminMapper.countCommentNum(comment.getCid());
    }
    // 根据coid 获得评论
    @Override
    public Comment editJson(String coid) {
        return adminMapper.editJson(coid);
    }
    // 通过coid 修改评论的状态
    @Override
    public void editCommentStatus(Comment comment) {
        adminMapper.editCommentStatus(comment);
    }
    // 通过coid删除评论
    @Override
    public void commentDelete(String coid,String cid) {
        adminMapper.commentDelete(coid);
        // 根据coid将contents评论数减1
        adminMapper.subCommentsNum(cid);
    }

    // 根据cid获得评论列表
    @Override
    public PageBean <Comment> getCommentListByCid(String cid, int currentPage, int currentCount) {
        PageBean <Comment> pageBean = new PageBean <>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setCurrentCount(currentCount);
        // 总数
        int totalCount = adminMapper.countCommentByCid(cid);
        pageBean.setTotalCount(totalCount);
        // 总页数
        int totalPage=(int)Math.ceil(1.0*totalCount/currentCount);
        pageBean.setTotalPage(totalPage);
        // 每页的起始页
        int index=(currentPage-1)*currentCount;
        List <Comment> allCommentList = adminMapper.getCommentListByCid(cid,index,currentCount);
        pageBean.setContentList(allCommentList);
        return pageBean;
    }

    // 获得文章数量
    @Override
    public int countArticle() {
        String type="article";
        return adminMapper.countContent(type);
    }

    // 页面数
    @Override
    public int countPage() {
        String type="page";
        return adminMapper.countContent(type);
    }

    // 分类数
    @Override
    public int countCategory() {
        String type="category";
        return adminMapper.countMeta(type);
    }

    // 标签数
    @Override
    public int countTag() {
        String type="tag";
        return adminMapper.countMeta(type);
    }

    // 评论数
    @Override
    public int countComment() {
        return adminMapper.countComment();
    }

    //获得前10条最新的文章
    @Override
    public List <Content> getArticleListByOrder() {
        String type="article";
        int num=10;
        return adminMapper.getContentListByOrder(type,num);
    }

    // 获得前3条页面
    @Override
    public List <Content> getPageListByOrder() {
        String type="page";
        int num=3;
        return adminMapper.getContentListByOrder(type,num);
    }

    // 获得最近评论
    @Override
    public List <Comment> getCommentListByOrder() {
        int num=10;
        return adminMapper.getCommentListByOrder(num);
    }
    // 更新评论
    @Override
    public void updateComment(Comment comment) {
        adminMapper.updateComment(comment);
    }
    // 获得博客配置对象
    @Override
    public BlogConfigPojo getBlogConfig() {
        return adminMapper.getBlogConfig();
    }
    // 更新博客设置
    @Override
    public int setBlog(BlogConfigPojo blogConfigPojo) {
        return adminMapper.updateBlog(blogConfigPojo);
    }
    // 获得用户信息
    @Override
    public User getUser() {
        return adminMapper.getUser();
    }
    // 更新用户信息
    @Override
    public int setUser(User user) {
        return adminMapper.updateUser(user);
    }
}
