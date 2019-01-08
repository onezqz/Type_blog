package domain;

import java.util.Date;

public class Comment {
    /**
     coid	int(10)	主键,非负,自增	comment表主键
     cid	int(10)	索引,非负	post表主键,关联字段
     created	data(10)	非负,可为空	评论生成时的GMT unix时间戳
     author	varchar(200)	可为空	评论作者
     authorId	int(10)	非负,可为空	评论所属用户id
     ownerId	int(10)	非负,可为空	评论所属内容作者id
     mail	varchar(200)	可为空	评论者邮件
     url	varchar(200)	可为空	评论者网址
     ip	varchar(64)	可为空	评论者ip地址
     agent	varchar(200)	可为空	评论者客户端
     text	text	可为空	评论文字
     type	varchar(16)	可为空	评论类型
     status	varchar(16)	可为空	评论状态
     parent	int(10)	可为空	父级评论
     */
    private Integer coid;
    private Integer cid;
    private Date created;
    private String author;
    private Integer authorId;
    private Integer ownerId;
    private String mail;
    private String url;
    private String ip;
    private String agent;
    private String text;
    private String type;
    private String status;
    private Integer parent;

    // 评论跟文章是一对一的关系
    private Content content;

    public Content getContent() {
        return content;
    }

    public void setContent(Content content) {
        this.content = content;
    }

    public Integer getCoid() {
        return coid;
    }

    public void setCoid(Integer coid) {
        this.coid = coid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public Integer getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Integer ownerId) {
        this.ownerId = ownerId;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getAgent() {
        return agent;
    }

    public void setAgent(String agent) {
        this.agent = agent;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
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

    public Integer getParent() {
        return parent;
    }

    public void setParent(Integer parent) {
        this.parent = parent;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "coid=" + coid +
                ", cid=" + cid +
                ", created=" + created +
                ", author='" + author + '\'' +
                ", mail='" + mail + '\'' +
                ", url='" + url + '\'' +
                ", ip='" + ip + '\'' +
                ", text='" + text + '\'' +
                ", type='" + type + '\'' +
                ", status='" + status + '\'' +parent+
                '}';
    }
}
