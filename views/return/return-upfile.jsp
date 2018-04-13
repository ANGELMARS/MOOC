<%--
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/22/022
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String cid = request.getParameter("cid");

%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script>
    //alert("上传成功");
        var link = "<%=cid%>";
     link = "courseAction_findteacherCourse?cid="+ link;
     window.location.href = link;


</script>
</body>
</html>
