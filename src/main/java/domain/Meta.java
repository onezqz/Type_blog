package domain;

public class Meta {
    /**
     mid	int(10)	主键,非负	项目主键
     name	varchar(200)	可为空	名称
     slug	varchar(200)	索引,可为空	项目缩略名
     type	varchar(32)	可为空	项目类型
     description	varchar(200)	可为空	选项描述
     count	int(10)	非负,可为空	项目所属内容个数
     order	int(10)	非负,可为空	项目排序
     */
    private Integer mid;
    private String name;
    private  String slug;
    private  String type;
    private String description;
    private Integer count;
    private Integer order;
    private Integer parent;

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Integer getParent() {
        return parent;
    }

    public void setParent(Integer parent) {
        this.parent = parent;
    }
}
