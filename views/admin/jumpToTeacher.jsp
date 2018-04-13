<%--
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/23/023
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%!
        public String codeToString(String str) { //处理中文字符串的函数
            String s = str;
            try {
                byte tempB[] = s.getBytes("GB2312");
                s = new String(tempB);
                return s;
            } catch (Exception e) {
                return s;
            }
        }
    %>

<%
    String na = request.getParameter("tna");
    session.setAttribute("username", codeToString(na));

%>
</head>
<body>
<%

    String url = "courseAction_findteacherAllCourse?tna=" + na;
    response.sendRedirect(url);

%>

</body>
</html>
