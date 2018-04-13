<%--视频列表 跳转前生成的页面 然后发送到course.jsp里
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/09/009
  Time: 00:13
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
    <title>视频列表</title>
    <link rel="shortcut icon" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="bookmark" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/course.css"/>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>
</head>
<body>
<div class="container">
    <!--根据id跳转到相应的详情页  movieAction_findAllMovie-->
    <div class="list">
        <ul>
            <s:iterator value="pageModel.datas" var="movie" status="m">
                <li>
                    <h5 class="name"><a
                            href="views/coursemovie.jsp?mid=<s:property value="#movie.link"/>&cname=<s:property value="#movie.name"/>"
                            target="_blank">
                            <%--#m.count 获取序号用--%>
                        第<s:property value="#m.count"/>章：
                        <s:property value="#movie.name"/>
                    </a></h5>
                </li>
            </s:iterator>
        </ul>
    </div>
</div>

</body>
</html>
