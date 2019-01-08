package domain;

public class Relationship {
    /**
     * cid	int(10)	主键,非负	内容主键
     mid	int(10)	主键,非负	项目主键
     */
    private Integer cid;
    private Integer mid;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }
}
