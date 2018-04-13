<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'vipfind.jsp' starting page</title>

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
<h1>查找会员 您的用户名是:<%=(String)session.getAttribute("username")%></h1>
<form action="vipManagerAction_findVip" method="post">
    请输入会员名称：<input style="display:none;" type="text" name="vname" value="<%=(String)session.getAttribute("username")%>" readonly="readonly"/>
    <input type="submit" style="border: none;background: none;cursor: pointer;" value="<%=(String)session.getAttribute("username")%>">
</form>
</body>
</html>
