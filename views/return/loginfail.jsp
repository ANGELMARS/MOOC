<%--登陆失败
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/08/008
  Time: 02:01
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

<script>
    alert("失败");
    window.location.href = "../../index.jsp"; //失败后跳转到首页
</script>


</body>
</html>
