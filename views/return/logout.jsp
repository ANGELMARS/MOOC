<%--退出
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/03/003
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>

</head>
<body>
<%
    session.invalidate();
    response.sendRedirect("../../index.jsp");
%>

</body>
</html>
