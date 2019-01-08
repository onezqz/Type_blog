package domain;

public class Field {
    /**
     * CREATE TABLE `typecho_fields` (
     `cid` int(10) unsigned NOT NULL,
     `name` varchar(150) NOT NULL,
     `type` varchar(8) default 'str',
     `str_value` text,
     `int_value` int(10) default '0',
     `float_value` float default '0',
     PRIMARY KEY  (`cid`,`name`),
     KEY `int_value` (`int_value`),
     KEY `float_value` (`float_value`)
     ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
     */
    private Integer cid;
    private String name;
    private String type;
    private  String  strValue;
    private Integer intValue;
    private  Float floatValue;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStrValue() {
        return strValue;
    }

    public void setStrValue(String strValue) {
        this.strValue = strValue;
    }

    public Integer getIntValue() {
        return intValue;
    }

    public void setIntValue(Integer intValue) {
        this.intValue = intValue;
    }

    public Float getFloatValue() {
        return floatValue;
    }

    public void setFloatValue(Float floatValue) {
        this.floatValue = floatValue;
    }
}
