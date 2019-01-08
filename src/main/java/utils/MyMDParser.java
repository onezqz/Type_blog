package utils;

import com.youbenzi.mdtool.tool.MDTool;

public class MyMDParser {
    public static String markdown2Html(String content){
        String html = MDTool.markdown2Html(content);
        return html;
    }

    public static void main(String[] args) {
        String content="##Redis：本质是一种数据库，存放键值对,是一种NoSQL数据库是基于特殊的结构，并将数据存储到内存的数据库" ;
        String html = markdown2Html(content);
        System.out.println(html);
    }
}
