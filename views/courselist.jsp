<%--
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/08/008
  Time: 00:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title>课程列表</title>
    <link rel="shortcut icon" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="bookmark" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/course.css"/>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>
    <script src="<%=basePath%>/js/mootools-1.js" type="text/javascript"></script>
    <link rel="stylesheet" href="<%=basePath%>/css/image-hover.css" type="text/css">

    <script src="<%=basePath%>/js/browserCheck.js" type="text/javascript"></script>
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
    <jsp:include flush="true" page="/views/header-footer/header.jsp"></jsp:include>


    <div id="main">
        <div id="main_container">
            <div id="AllCourse">
                <span id="AllCourse_Word">全部课程</span>
            </div>

            <!--视频-->
            <br>
            <br>
            <div class="course_lists" >
                <s:iterator value="pageModel.datas" var="course">
                    <ul>
                        <li class="course_movie">
                            <!--根据id跳转到相应的详情页-->
                            <a href="courseAction_findCourse?cid=<s:property value="#course.id"/>">
                                <div class="course_movie_img img">

                                    <img src="<%=basePath%>/upload/images/<s:property value="#course.img"/>">

                                    <h5><span><s:property value="#course.name"/></span></h5>
                                </div>
                            </a>
                        </li>
                    </ul>
                </s:iterator>
            </div>
            <!--清除浮动-->
            <div style="clear:left"></div>
            <!--导航条-->
            <div class="page">

                <a href="courseAction_findAllCourse?pageindex=1">首页</a>
                <a href="courseAction_findAllCourse?pageindex=<s:property value="pageindex-1"/>">上一页</a>
                <a href="courseAction_findAllCourse?pageindex=<s:property value="pageindex+1"/>">下一页</a>
                <a href="courseAction_findAllCourse?pageindex=<s:property value="pageModel.pagecount"/>">尾页</a>
                <a>第<s:property value="pageindex"/>页 共<s:property value="pageModel.pagecount"/>页</a>

            </div>

        </div>
    </div>
    <jsp:include flush="true" page="/views/header-footer/footer.jsp"></jsp:include>

</body>
</html>
