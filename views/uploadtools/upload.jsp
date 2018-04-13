<%--
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/12/012
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>多文件上传</title>
    <script type="text/javascript" src="../../js/uploadfile.js"></script>
</head>

<body>
<h1>多文件上传</h1>
<form action="mfileupd_head" method="post" enctype="multipart/form-data" id="f1">
    <input type="submit" name="subm" value="上传"><br>
    文件:<input type="file" name="doc">
    <a href="javascript:addfile()">添加</a><br>
</form>
</body>
</html>
