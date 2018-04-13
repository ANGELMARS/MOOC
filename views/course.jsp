<%-- 课程详情
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/07/007
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="sun.misc.Request" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title>课程</title>
    <link rel="shortcut icon" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="bookmark" href="<%=basePath%>.images/favicon.ico"/>
    <script>
        //把获取到的值提前赋值
        var c_name = "<s:property escape="false" value="pageModel.datas[0][1].{name}[0]"/>";
        var c_img = "<s:property escape="false" value="pageModel.datas[0][1].{img}[0]"/>";
        var c_text = "<s:property escape="false" value="pageModel.datas[0][1].{text}[0]"/>";
        var c_homework = "<s:property escape="false" value="pageModel.datas[0][1].{homework}[0]"/>";
        var c_id = "<s:property escape="false" value="pageModel.datas[0][1].{id}[0]"/>";
        var c_tname = "<s:property escape="false" value="pageModel.datas[0][1].{tname}[0]"/>";
        var t_C = "<a href='talk_CAction_findAllTalk?tcid=" + c_id + "'>课程内容讨论</a>";
        var t_H = "<a href='talk_HAction_findAllTalk?tcid=" + c_id + "'>问题作业讨论</a>";

        //  alert(c_text);
    </script>
    <%
        String c_id = request.getParameter("cid");
        session.setAttribute("courseid", c_id);

    %>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/course.css"/>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>
    <script>
        //传值
        var url = window.location.search;
        var loc = url.substring(url.lastIndexOf('=') + 1, url.length);
        //alert(loc);
    </script>
    <%--
        session中的用户名和课程id
        (String)session.getAttribute("username")
        (String)session.getAttribute("courseid")
    --%>


</head>
<body>
<div class="container">

    <jsp:include flush="true" page="/views/header-footer/header.jsp"></jsp:include>

    <div id="main">
        <div id="courselist_main_container">
            <br><br>
            <div id="course_info">
                <div id="course_name">
                    <h2>
                        <%--课程名称--%>
                        <script>document.write(c_name);</script>

                    </h2>
                    <br><br><br><br><br>
                    <h3>
                        教师：<script>document.write(c_tname);</script>
                    </h3>
                </div>
                <div id="course_img">
                    <!--img src="<%=basePath%>/images/course-test.jpg"-->
                    <script>document.write('<img style="width:288px; height:162px;" src="<%=basePath%>/upload/images/' + c_img + '">');</script>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="course_introduce">
                <h3 class="cite">课程介绍</h3>
                <p class="Q_H">
                    <script>document.write(c_text);</script>
                </p>
            </div>
        </div>
        <div class="content">
            <div class="course_introduce">
                <h3 class="cite">课程列表</h3>
                <div class="movie_list">
                   <%-- <!--拼接movielist.jsp 链接为 movieAction_findAllMovie?mid=2   把本页的id值经过链接mid传值 找到与c_id相对应的视频-->
                    <s:action name="movieAction_findAllMovie" executeResult="true" namespace="/">
                        <s:param name="mid" value="pageModel.datas.{id}[0]"></s:param>
                    </s:action>--%>

                       <div class="list">
                           <ul>
                               <s:iterator value="pageModel.datas" var="movie" status="m">
                                   <li>
                                       <h5 class="name"><a
                                               href="<%=basePath%>views/coursemovie.jsp?mid=<s:property value="#movie[0].link"/>&cname=<s:property value="#movie[0].name"/>"
                                               target="_blank">
                                               <%--#m.count 获取序号用--%>
                                           第<s:property value="#m.count"/>章：
                                           <s:property value="#movie[0].name"/>
                                       </a></h5>
                                   </li>
                               </s:iterator>
                           </ul>
                       </div>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="course_introduce">
                <h3 class="cite">问题作业</h3>
                <div class="Q_H">
                    <span id="layout">
                        <script>document.write(c_homework);</script>
                    </span>
                    <!--显示更多-->
                    <br>【<a id='more' href='#0'>查看更多</a>】

                    <script language="javascript" type="text/javascript" src="<%=basePath%>/js/show.js"></script>
                    </div>

                <div style="float: left;">
                    <div class="uphead">
                        <a href="<%=basePath%>/upload/file/<s:property escape="false" value="pageModel.datas[0][1].{file}[0]"/>"
                           class="btn-style-01">查看作业文件
                        </a>
                    </div>
                </div>
                <br>
            </div>
        </div>
        <div class="content">
            <div class="course_introduce" style="padding-bottom: 60px;">
                <h3 class="cite">讨论</h3>
                <div class="detail">

                    <%--根据id跳转到相关的课程讨论页--%>
                    <div class="taolun">
                        <h5 class="name">
                            <script>document.write(t_C);</script>
                        </h5>
                    </div>
                    <div class="taolun">
                        <h5 class="name">
                            <script>document.write(t_H);</script>
                        </h5>
                    </div>
                </div>

            </div>
        </div>

    </div>
    <jsp:include flush="true" page="/views/header-footer/footer.jsp"></jsp:include>
</div>
</body>
</html>
