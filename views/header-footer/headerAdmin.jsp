<%--
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/23/005
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/course.css"/>


</head>
<body>
<div id="header">
    <!--导航栏-->
    <div id="menu" style="position:fixed;z-index:1;">
        <a><img id="logo" src="<%=basePath%>/images/logo.png"></a>
        <ul>
            <li><a class="tab" href="userAction_findAllUser">学生管理</a></li>
            <li><a class="tab" href="userAction_findAllTeacher">教师管理</a></li>
            <li><a class="tab" href="userAction_findAllCourse">课程管理</a></li>
            <li><a class="tab" href="userAction_findAllTalk_H">作业讨论</a></li>
            <li><a class="tab" href="userAction_findAllTalk_C">课程讨论</a></li>

        </ul>


        <ul style="margin-right:10%; float: right;">
            <li>
                <div id="username">
                    <form action="vipAction_findVip" method="post" style="margin-top: 25%">
                        <input style="display:none;" type="text" name="vname"
                               value="<%=(String)session.getAttribute("username")%>" readonly="readonly"/>
                        <%-- <input type="submit" style="border: none;background: none;cursor: pointer;color:white;"
                                value="<%=(String)session.getAttribute("username")%>">--%>
                    </form>
                </div>
            </li>
            <li>
                <div id="username">
                    <a href="<%=basePath%>/views/return/logout.jsp">退出</a>
                </div>
            </li>
        </ul>

    </div>
    <br><br><br>
</div>
</body>
</html>
