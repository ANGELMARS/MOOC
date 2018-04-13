<%--修改密码成功
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/10/010
  Time: 01:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改成功</title>
</head>
<body>
<%

    session.invalidate();
%>
<script>
    alert("修改成功");
    window.location.href = "../../index.jsp"; //修改后跳转到首页
</script>
</body>
</html>
