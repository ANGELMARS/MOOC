<%--用户信息修改成功
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/11/011
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>信息修改成功</title>
</head>
<body>
<script>
    alert("修改成功");
    var link = "<%=(String) session.getAttribute("username")%>";
    link = document.referrer+"?vname=" + link;
    window.location.href = link;

</script>

</body>
</html>
