package domain;

public class Option {
    /**
     name	varchar(32)	主键	配置名称
     user	int(10)	主键,非负	配置所属用户,默认为0(全局配置)
     value	text	可为空	配置值
     */
    private String name;
    private Integer user;
    private String  value;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getUser() {
        return user;
    }

    public void setUser(Integer user) {
        this.user = user;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
