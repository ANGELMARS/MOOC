<%@ page language="java" import="java.io.FileOutputStream" pageEncoding="utf-8" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'book.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<h1>Book管理</h1>
<%

    //写文件
    String str = "哈哈 write a string to file!";
    String filename = request.getRealPath("test.txt");
    java.io.File f = new java.io.File(filename);
    if (!f.exists())//如果文件不存，则建立
    {
        f.createNewFile();
    }

    try {
        PrintWriter pw = new PrintWriter(new FileOutputStream(filename));
        pw.println(str);//写内容
        pw.close();
    } catch (IOException e) {
        out.println(e.getMessage());
    }

//读文件
    java.io.FileReader fr = new java.io.FileReader(f);
    char[] buffer = new char[10];
    int length; //读出的字符数(一个中文为一个字符)
//读文件内容
    out.write(filename + "<br>");
    while ((length = fr.read(buffer)) != -1) {
//输出
        out.write(buffer, 0, length);
    }
    fr.close();
%>

</body>
</html>
