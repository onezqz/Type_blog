package domain;

public class BlogConfigPojo {

    /**
     * bid
     blogName
     blogKeywords
     blogDesc
     blogCommentTimeFormat
     blogCommentListNum
     blogCommentAvatarUrl
     blogArticleTimeFormat
     blogArticleNumEachPage
     blogArticleSub
     */
    private Integer bid;
    private String blogName;
    private String blogKeywords;
    private String blogDesc;
    private String blogCommentTimeFormat;
    private Integer blogCommentListNum;
    private String blogCommentAvatarUrl;
    private String blogArticleTimeFormat;
    private Integer blogArticleNumEachPage;
    private String blogArticleSub;

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getBlogName() {
        return blogName;
    }

    public void setBlogName(String blogName) {
        this.blogName = blogName;
    }

    public String getBlogKeywords() {
        return blogKeywords;
    }

    public void setBlogKeywords(String blogKeywords) {
        this.blogKeywords = blogKeywords;
    }

    public String getBlogDesc() {
        return blogDesc;
    }

    public void setBlogDesc(String blogDesc) {
        this.blogDesc = blogDesc;
    }

    public String getBlogCommentTimeFormat() {
        return blogCommentTimeFormat;
    }

    public void setBlogCommentTimeFormat(String blogCommentTimeFormat) {
        this.blogCommentTimeFormat = blogCommentTimeFormat;
    }

    public Integer getBlogCommentListNum() {
        return blogCommentListNum;
    }

    public void setBlogCommentListNum(Integer blogCommentListNum) {
        this.blogCommentListNum = blogCommentListNum;
    }

    public String getBlogCommentAvatarUrl() {
        return blogCommentAvatarUrl;
    }

    public void setBlogCommentAvatarUrl(String blogCommentAvatarUrl) {
        this.blogCommentAvatarUrl = blogCommentAvatarUrl;
    }

    public String getBlogArticleTimeFormat() {
        return blogArticleTimeFormat;
    }

    public void setBlogArticleTimeFormat(String blogArticleTimeFormat) {
        this.blogArticleTimeFormat = blogArticleTimeFormat;
    }

    public Integer getBlogArticleNumEachPage() {
        return blogArticleNumEachPage;
    }

    public void setBlogArticleNumEachPage(Integer blogArticleNumEachPage) {
        this.blogArticleNumEachPage = blogArticleNumEachPage;
    }

    public String getBlogArticleSub() {
        return blogArticleSub;
    }

    public void setBlogArticleSub(String blogArticleSub) {
        this.blogArticleSub = blogArticleSub;
    }
}
