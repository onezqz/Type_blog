package domain;

import java.util.List;

public class PageBean<T> {

    // 当前页
    private Integer currentPage;
    // 每页显示的个数
    private Integer currentCount;
    // 总的文章数
    private Integer totalCount;
    // 总页数
    private Integer totalPage;
    // 每页显示文章列表
    private List<T> contentList;

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getCurrentCount() {
        return currentCount;
    }

    public void setCurrentCount(Integer currentCount) {
        this.currentCount = currentCount;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List <T> getContentList() {
        return contentList;
    }

    public void setContentList(List <T> contentList) {
        this.contentList = contentList;
    }
}
