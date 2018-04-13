<%--添加课程 返回页
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/21/021
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String url = "courseAction_findteacherAllCourse?tna=" + (String) session.getAttribute("username");
        response.sendRedirect(url);
    %>
</body>
</html>
