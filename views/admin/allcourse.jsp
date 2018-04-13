<%--
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/23/023
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String username = (String) session.getAttribute("username");
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title>课程列表</title>
    <link rel="shortcut icon" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="bookmark" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/course.css"/>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>

</head>
<body>
<div class="container">
    <jsp:include flush="true" page="/views/header-footer/headerAdmin.jsp"></jsp:include>


    <div id="main">
        <div id="main_container">
            <div id="AllCourse">
                <span class="AllCourse_Word">全部课程</span>
                <div style="float: right;width: 400px;">

                </div>
            </div>

            <!--视频-->
            <br>
            <br>
            <table border="1" width="100%" bgcolor="#CCCCFF">
                <tr>
                    <td>课程ID</td>
                    <td>教师名称</td>
                    <td>课程名称</td>
                    <td>操作</td>
                </tr>
                <s:iterator value="pageModel.datas" var="course">
                    <tr>
                        <td><s:property value="#course.id"/></td>
                        <td><a  style="display:block; color: brown;font-weight: bold;">
                            <s:property value="#course.tname"/></a></td>
                        <td><a href="courseAction_findteacherCourse?cid=<s:property value="#course.id"/>" target="_blank" style="display:block; color: brown;font-weight: bold;">
                            <s:property value="#course.name"/></a></td>
                        <td>
                            <a href="courseAction_delcourseAdmin?id=<s:property value="#course.id"/>">删除</a>
                        </td>
                    </tr>

                </s:iterator>
            </table>


            <!--清除浮动-->
            <div style="clear:left"></div>
            <!--导航条-->
            <div class="page">

                <a href="userAction_findAllCourse?pageindex=1">首页</a>
                <a href="userAction_findAllCourse?pageindex=<s:property value="pageindex-1"/>">上一页</a>
                <a href="userAction_findAllCourse?pageindex=<s:property value="pageindex+1"/>">下一页</a>
                <a href="userAction_findAllCourse?pageindex=<s:property value="pageModel.pagecount"/>">尾页</a>
                <a>第<s:property value="pageindex"/>页 共<s:property value="pageModel.pagecount"/>页</a>

            </div>

        </div>
    </div>
    <jsp:include flush="true" page="/views/header-footer/footer.jsp"></jsp:include>

</body>
</html>
