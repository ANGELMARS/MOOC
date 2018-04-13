<%-- 用户信息页   ajax用的异步传输
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/09/009
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title>用户信息</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/course.css">
    <link href="<%=basePath%>/css/cebianlan.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div id="page">
    <div style="float: left;">
        <div>

            <div class="info">
                <div class="info_name"><h2>名称：</h2></div>
                <div class="info_text" id="n_name"><s:property value="pageModel.datas.{vname}[0]"/></div>
            </div>
            <div class="info">
                <div class="info_name"><h2>个人信息：</h2></div>
                <div class="info_text" id="i_text"><s:property value="pageModel.datas.{text}[0]"/></div>
            </div>

        </div>
    </div>
    <div style="float: right;">
        <img style="width:140px; height: 140px;"
             src="<%=basePath%>/upload/head/<s:property value="pageModel.datas.{head}[0]"/>"
        >
    </div>

</div>

</body>
</html>
