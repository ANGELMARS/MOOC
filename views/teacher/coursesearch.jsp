<%--
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/19/019
  Time: 23:35
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
    <!--选项选中-->
    <script>
        var cur;
        $(document).ready(function () {
            $(".course_selection_item").click(function () {

                this.className = 'course_selection_item on'

            });
        });
    </script>

</head>
<body>
<div class="container">
    <jsp:include flush="true" page="/views/header-footer/headerTeacher.jsp"></jsp:include>
        <%
            String i = request.getParameter("info");

        %>

    <div id="main">
        <div id="main_container">
            <div id="AllCourse">
                <span class="AllCourse_Word">课程管理</span>
                <div style="float: right;width: 400px;">
                    <span class="AllCourse_Word" style="float: left">课程添加:&nbsp</span>
                    <form action="courseAction_addcourse">
                        <input type="text" hidden="hidden" name="tname" value="<%=username%>">
                        <input type="text" style="border:1px solid grey; height: 40px;width: 50%; float: left;"
                               name="name">
                        <input type="text" hidden="hidden" name="img" value="course-test.jpg">
                        <input type="text" hidden="hidden" name="text" value="详情为空">
                        <input type="text" hidden="hidden" name="homework" value="作业为空">
                        <input type="submit" class="btn-style-01" style="float:right;" value="添加">
                    </form>
                </div>
            </div>

            <!--视频-->
            <br>
            <br>
            <%--          <div class="course_lists">
                          <s:iterator value="pageModel.datas" var="course">
                              <ul>
                                  <li class="course_movie">
                                      <!--根据id跳转到相应的详情页-->
                                      <a href="courseAction_findCourse?cid=<s:property value="#course.id"/>">
                                          <div class="course_movie_img">
                                              <img src="../upload/images/<s:property value="#course.img"/>">
                                              <h5><span><s:property value="#course.name"/></span></h5>
                                          </div>
                                      </a>
                                  </li>
                              </ul>
                          </s:iterator>
                      </div>--%>

            <table border="1" width="100%" bgcolor="#CCCCFF">
                <tr>
                    <td>课程教师</td>
                    <td>课程名称</td>
                    <td>操作</td>
                </tr>
                <s:iterator value="pageModel.datas" var="course">
                    <tr>
                        <td><s:property value="#course.tname"/></td>
                        <td><a style="display:block; color: brown;font-weight: bold;">
                            <s:property value="#course.name"/></a></td>
                        <td><a href="courseAction_findteacherCourse?cid=<s:property value="#course.id"/>">编辑</a>
                            <a href="courseAction_delcourse?id=<s:property value="#course.id"/>">删除</a>
                        </td>
                    </tr>

                </s:iterator>
            </table>


            <!--清除浮动-->
            <div style="clear:left"></div>
            <!--导航条-->
            <div class="page">

                <a href="courseAction_findteacherAllCourse?tna=<%=username%>&pageindex=1">首页</a>
                <a href="courseAction_findteacherAllCourse?tna=<%=username%>&pageindex=<s:property value="pageindex-1"/>">上一页</a>
                <a href="courseAction_findteacherAllCourse?tna=<%=username%>&pageindex=<s:property value="pageindex+1"/>">下一页</a>
                <a href="courseAction_findteacherAllCourse?tna=<%=username%>&pageindex=<s:property value="pageModel.pagecount"/>">尾页</a>
                <a>第<s:property value="pageindex"/>页 共<s:property value="pageModel.pagecount"/>页</a>

            </div>

        </div>
    </div>
    <jsp:include flush="true" page="/views/header-footer/footer.jsp"></jsp:include>

</body>
</html>
