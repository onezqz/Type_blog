package domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;

public class Content {
    /**
     * cid	int(10)	主键,非负,自增	post表主键
     title	varchar(200)	可为空	内容标题
     slug	varchar(200)	索引,可为空	内容缩略名
     created	int(10)	索引,非负,可为空	内容生成时的GMT unix时间戳
     modified	int(10)	非负,可为空	内容更改时的GMT unix时间戳
     text	text	可为空	内容文字
     order	int(10)	非负,可为空	排序
     authorId	int(10)	非负,可为空	内容所属用户id
     template	varchar(32)	可为空	内容使用的模板
     type	varchar(16)	可为空	内容类别
     status	varchar(16)	可为空	内容状态
     password	varchar(32)	可为空	受保护内容,此字段对应内容保护密码
     commentsNum	int(10)	非负,可为空	内容所属评论数,冗余字段
     allowComment	char(1)	可为空	是否允许评论
     allowPing	char(1)	可为空	是否允许ping
     allowFeed	char(1)	可为空	允许出现在聚合中
     */
    private Integer cid;
    private String title;
    private String slug;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date created;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date modified;
    private String text;
    private Integer order;
    private Integer authorId;
    private String template;
    private String type;
    private String status;
    private String password;
    private Integer commentsNum;
    private String allowComment;
    private String allowPing;
    private String allowFeed;
    private Integer parent;


    private ArrayList<Meta> metaList=new ArrayList<Meta>();

    private ArrayList<Comment> commentList=new ArrayList <>();

    public ArrayList <Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(ArrayList <Comment> commentList) {
        this.commentList = commentList;
    }

    public ArrayList <Meta> getMetaList() {
        return metaList;
    }

    public void setMetaList(ArrayList <Meta> metaList) {
        this.metaList = metaList;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getModified() {
        return modified;
    }

    public void setModified(Date modified) {
        this.modified = modified;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getCommentsNum() {
        return commentsNum;
    }

    public void setCommentsNum(Integer commentsNum) {
        this.commentsNum = commentsNum;
    }

    public String getAllowComment() {
        return allowComment;
    }

    public void setAllowComment(String allowComment) {
        this.allowComment = allowComment;
    }

    public String getAllowPing() {
        return allowPing;
    }

    public void setAllowPing(String allowPing) {
        this.allowPing = allowPing;
    }

    public String getAllowFeed() {
        return allowFeed;
    }

    public void setAllowFeed(String allowFeed) {
        this.allowFeed = allowFeed;
    }

    public Integer getParent() {
        return parent;
    }

    public void setParent(Integer parent) {
        this.parent = parent;
    }

    @Override
    public String toString() {
        return "Content{" +
                "title='" + title + '\'' +
                ", slug='" + slug + '\'' +
                ", created=" + created +
                ", text='" + text + '\'' +
                ", status='" + status + '\'' +
                ", commentsNum=" + commentsNum +
                ", allowComment=" + allowComment +
                ", allowPing=" + allowPing +
                ", allowFeed=" + allowFeed +
                '}';
    }
}
