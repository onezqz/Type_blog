package domain;

public class User {
    /**
     uid	int(10)	主键,非负,自增	user表主键
     name	varchar(32)	唯一	用户名称
     password	varchar(32)	可为空	用户密码
     mail	varchar(200)	唯一	用户的邮箱
     url	varchar(200)	可为空	用户的主页
     screenName	varchar(32)	可为空	用户显示的名称
     created	int(10)	非负,可为空	用户注册时的GMT unix时间戳
     activated	int(10)	非负,可为空	最后活动时间
     logged	int(10)	非负,可为空	上次登录最后活跃时间
     group	varchar(16)	N/A	用户组
     authCode	varchar(40)	可为空	用户登录验证码
     */
    private Integer uid;
    private String name;
    private String password;
    private String mail;
    private String url;
    private String screenName;
    private Integer created;
    private Integer activated;
    private Integer logged;
    private String  group;
    private String  authCode;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getScreenName() {
        return screenName;
    }

    public void setScreenName(String screenName) {
        this.screenName = screenName;
    }

    public Integer getCreated() {
        return created;
    }

    public void setCreated(Integer created) {
        this.created = created;
    }

    public Integer getActivated() {
        return activated;
    }

    public void setActivated(Integer activated) {
        this.activated = activated;
    }

    public Integer getLogged() {
        return logged;
    }

    public void setLogged(Integer logged) {
        this.logged = logged;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public String getAuthCode() {
        return authCode;
    }

    public void setAuthCode(String authCode) {
        this.authCode = authCode;
    }
}
