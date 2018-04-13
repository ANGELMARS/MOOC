<%--登陆成功
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/08/008
  Time: 00:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>登陆成功</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
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
    <%--
        String username = request.getParameter("uname");
        String userpassword = request.getParameter("pwd");
        if (username != null & userpassword != null) {
            //如果用户名和密码都合法,则记下用户名,一般把用户和密码存在数据库中
            //用数据库中的信息与提交的用户名和密码比较以进行用户合法性检查

            session.setAttribute("username", codeToString(username));
        }
    --%>

</head>
<body>
<%
    response.sendRedirect("userAction_findAllUser");
%>
</body>
</html>

