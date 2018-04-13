<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mian.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
      <%!
          public String codeToString(String str){ //处理中文字符串的函数
              String s=str;
              try
              {
                  byte tempB[]=s.getBytes("ISO-8859-1");
                  s=new String(tempB);
                  return s;

              }catch(Exception e)
              {
                  return s;
              }


          }
      %>
      <%
          String username=request.getParameter("uname");
          String userpassword=request.getParameter("pwd");
          if(username!=null &userpassword!=null)
          {
              //如果用户名和密码都合法,则记下用户名,一般把用户和密码存在数据库中
              //用数据库中的信息与提交的用户名和密码比较以进行用户合法性检查
              session.setAttribute("username", codeToString(username));

          }
      %>
  </head>
  
  <body>
  您的用户名是:<%=(String)session.getAttribute("username")%>
  <a href="views/logout.jsp">注销</a>
    <a href="views/book.jsp">书籍管理</a><br/>
    <a href="views/vip.jsp">会员管理</a><br/>
  </body>
</html>
