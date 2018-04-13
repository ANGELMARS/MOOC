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
        var t_C = "<a href='talk_CAction_findTeacherAllTalk?tcid=" + c_id + "'>课程内容讨论管理</a>";
        var t_H = "<a href='talk_HAction_findTeacherAllTalk?tcid=" + c_id + "'>问题作业讨论管理</a>";
        //  alert(c_text);

        function page_onload() {
            document.getElementById("tcname").value = c_name;
            document.getElementById("tctext").value = c_text;
            document.getElementById("tchomework").value = c_homework;
            document.getElementById("c_id").value = c_id;

        }

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

    <%--选择图片后 自动提交--%>
    <script type="text/javascript">
        function submitform() {
            document.forms["changeimg"].submit();
        }

        function submitformfile() {
            document.forms["changefile"].submit();
        }


    </script>

</head>
<body onload="page_onload()">
<div class="container">

    <jsp:include flush="true" page="/views/header-footer/headerTeacher.jsp"></jsp:include>

    <div id="main">
        <div id="courselist_main_container">
            <br><br>
            <div id="course_info">
                <div id="course_name">
                    <h2>
                        <%--课程名称--%>
                        <script>document.write(c_name);</script>

                    </h2>
                    <div>
                        <%--更改课程的名字--%>
                        <form action="courseAction_rechangeCourseName" id="c-name" method="post">
                            <h3>新的名字：</h3>
                            <input hidden="hidden" type="text" name="id"
                                   value="<s:property escape="false" value="pageModel.datas[0][1].{id}[0]"/>"/>
                            <input name="tcname" id="tcname" class="teacherchange" type="text" value="">
                            <input class="btn-style-01" type="submit" value="修改">

                        </form>
                    </div>
                    <br><br>
                    <h3>
                        教师：
                        <script>document.write(c_tname);</script>
                    </h3>
                </div>

                <div id="course_img">
                    <!--img src="<%=basePath%>/images/course-test.jpg"-->
                    <script>document.write('<img style="width:288px; height:162px;" src="<%=basePath%>/upload/images/' + c_img + '">');</script>
                </div>
                <div style="float: right;">
                    <%--修改课程图片--%>
                    <form action="mfileupd_img?cid=<s:property escape="false" value="pageModel.datas[0][1].{id}[0]"/>"
                          method="post" enctype="multipart/form-data" name="changeimg">
                        <div class="uphead">
                            <a href="javascript:void(0);" class="btn-style-01">选择图片
                                <input type="file" name="doc" value="修改图片" onchange="javascript: submitform()">
                            </a>
                        </div>
                        <input hidden="hidden" type="submit" name="id"
                               value="<s:property escape="false" value="pageModel.datas[0][1].{id}[0]"/>">
                        <input hidden="hidden" type="submit" name="subm" value="修改">
                    </form>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="course_introduce">
                <h3 class="cite">课程介绍</h3>
                <p class="Q_H">
                    <script>document.write(c_text);</script>
                </p>
                <div>
                    <form action="courseAction_rechangeCourseText" id="c-text" method="post">
                        <%--更改课程的详细信息--%>
                        <h3>更改简介：</h3>
                        <input hidden="hidden" type="text" name="id"
                               value="<s:property escape="false" value="pageModel.datas[0][1].{id}[0]"/>"/>
                        <input name="tctext" id="tctext" class="teacherchange" type="text" value="">
                        <input class="btn-style-01" type="submit" value="修改">
                    </form>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="course_introduce">
                <h3 class="cite">课程列表
                    <div style="float: right;">
                        <a>添加视频：</a>
                        <%--添加课程的一个视频--%>
                        <form action="movieAction_addmovie" method="post">
                            <input type="text" hidden="hidden" name="link" value="movie.mp4">
                            <input type="text" hidden="hidden" name="c_id" id="c_id" value="">
                            <input class="teacherchange" type="text" name="name">
                            <input class="btn-style-01" type="submit" value="添加">
                        </form>
                    </div>
                </h3>
                <div class="movie_list">


                    <table border="1" width="100%" bgcolor="#CCCCFF">
                        <tr>
                            <td>序号</td>
                            <td>视频名称</td>
                            <td>操作</td>

                        </tr>
                        <s:iterator value="pageModel.datas" var="movie" status="m">
                            <tr>
                                <td><s:property value="#m.count"/></td>
                                <td>
                                    <div style="display:block; color: brown;font-weight: bold;">
                                        <form style="float: left" action="movieAction_rechangeMovieName" method="post">
                                            <input hidden="hidden" type="text" name="id"
                                                   value="<s:property value="#movie[0].id"/>"/>
                                            <input name="mname" style="width: 600px;" class="teacherchange" type="text"
                                                   value="<s:property value="#movie[0].name"/>">
                                            <input style="padding: 8px;" class="btn-style-01" type="submit"
                                                   value="修改名称">
                                        </form>

                                        <script>
                                            function submitmovieform_<s:property value="#m.count"/>() {
                                                document.forms["changemovie_<s:property value="#m.count"/>"].submit();
                                            }
                                        </script>

                                            <%--修改课程视频--%>
                                        <form style="float: left"
                                              action="mfileupd_movie?cid=<s:property value="#movie[0].c_id"/>"
                                              method="post" enctype="multipart/form-data"
                                              name="changemovie_<s:property value="#m.count"/>">
                                            <div class="uphead">
                                                <a style="padding: 8px;" href="javascript:void(0);"
                                                   class="btn-style-01">上传视频
                                                    <input type="file" name="doc" value="上传视频"
                                                           onchange="javascript: submitmovieform_<s:property
                                                                   value="#m.count"/>()">
                                                </a>
                                            </div>

                                            <input hidden="hidden" type="text" name="mid" id="mid"
                                                   value="<s:property value="#movie[0].id"/>">
                                            <input hidden="hidden" class="btn-style-01" type="submit" name="subm"
                                                   value="修改">
                                        </form>

                                    </div>

                                </td>
                                <td>
                                        <%--点击后弹出视频来预览--%>
                                    <a style="padding: 8px;" class="btn-style-01" href="javascript:void(0);"
                                       onclick="javascript:window.open
                                               ('<%=basePath%>/views/teacher/coursemovie.jsp?mid=<s:property
                                               value="#movie[0].link"/>&cname=<s:property value="#movie[0].name"/>'
                                               , '', 'height=500, width=500,top=100,left=300 toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no')">
                                        预览
                                    </a>

                                    <a style="padding: 8px;" class="btn-style-01"
                                       href="movieAction_delmovie?id=<s:property value="#movie[0].id"/>">删除</a>
                                </td>
                            </tr>

                        </s:iterator>
                    </table>


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
                <div>
                    <%--更改课程的作业--%>
                    <form action="courseAction_rechangeCourseHomework" id="c-homework" method="post">
                        <h3>更改问题作业：</h3>
                        <input hidden="hidden" type="text" name="id"
                               value="<s:property escape="false" value="pageModel.datas[0][1].{id}[0]"/>"/>
                        <input name="tchomework" id="tchomework" class="teacherchange" type="text" value="">
                        <input class="btn-style-01" type="submit" value="修改">
                    </form>
                </div>


                <div>
                    <%--上传作业文件--%>
                    <div style="float: left;">
                        <form action="mfileupd_file?cid=<s:property escape="false" value="pageModel.datas[0][1].{id}[0]"/>"
                              method="post" enctype="multipart/form-data" name="changefile">
                            <div class="uphead">
                                <a href="javascript:void(0);" class="btn-style-01">修改作业文件
                                    <input type="file" name="doc" value="修改作业文件"
                                           onchange="javascript: submitformfile()">
                                </a>
                            </div>
                            <input hidden="hidden" type="submit" name="id"
                                   value="<s:property escape="false" value="pageModel.datas[0][1].{id}[0]"/>">
                            <input hidden="hidden" type="submit" name="subm" value="修改">
                        </form>
                    </div>
                    <div style="float: left;">
                        <div class="uphead">
                            <a href="<%=basePath%>/upload/file/<s:property escape="false" value="pageModel.datas[0][1].{file}[0]"/>"
                               class="btn-style-01">查看作业文件
                            </a>
                        </div>
                    </div>

                    <div style="float: left;">
                        <form action="courseAction_delCourseFile" method="post">
                            <input hidden="hidden" type="text" name="id"
                                   value="<s:property escape="false" value="pageModel.datas[0][1].{id}[0]"/>"/>
                                <input hidden="hidden"  type="text" name="c_file" value="homework.docx">
                                <input type="submit" class="btn-style-01" value="删除作业文件">
                        </form>
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
