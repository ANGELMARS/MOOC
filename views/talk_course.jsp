<%--课程讨论页面
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/13/013
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title>课程讨论</title>
    <link rel="shortcut icon" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="bookmark" href="<%=basePath%>/images/favicon.ico"/>
    <script>
        //把获取到的值提前赋值
        var c_name = "<s:property escape="false" value="pageModel.datas_c.{name}[0]"/>";//课程名称
        var c_img = "<s:property escape="false" value="pageModel.datas_c.{img}[0]"/>";//课程图片
        var c_text = "<s:property escape="false" value="pageModel.datas_c.{text}[0]"/>";//课程信息
        var c_homework = "<s:property escape="false" value="pageModel.datas_c.{homework}[0]"/>";//课程作业
        var c_id = "<s:property escape="false" value="pageModel.datas_c.{id}[0]"/>";//课程id


        //  alert(c_text);
    </script>
    <%
        String c_id = request.getParameter("cid");
        session.setAttribute("courseid", c_id);

    %>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/course.css"/>
    <script>
        //传值
        var url = window.location.search;
        var loc = url.substring(url.lastIndexOf('=') + 1, url.length);
        //alert(loc);
    </script>
</head>
<body>
<div class="container">
    <jsp:include flush="true" page="/views/header-footer/header.jsp"></jsp:include>

    <div id="main">
        <div id="courselist_main_container">
            <br>
            <a class="btn-style-01"<%--返回按钮--%>
               href="courseAction_findCourse?cid=<s:property escape="false" value="pageModel.datas_c.{id}[0]"/>"
            >返回</a>
            <br>

            <div id="course_info">
                <div id="course_name">
                    <h2>
                        <%--课程名称--%>
                        <script>document.write(c_name);</script>
                    </h2>

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
                <p class="jianjie">
                    <script>document.write(c_text);</script>
                </p>
            </div>
        </div>

        <div style="clear:left"></div>
        <div class="page">
            <!--导航条-->
            <a href="talk_CAction_findAllTalk?tcid=<s:property escape="false" value="pageModel.datas_c.{id}[0]"/>&pageindex=1">首页</a>
            <a href="talk_CAction_findAllTalk?tcid=<s:property escape="false" value="pageModel.datas_c.{id}[0]"/>&pageindex=<s:property value="pageindex-1"/>">上一页</a>
            <a href="talk_CAction_findAllTalk?tcid=<s:property escape="false" value="pageModel.datas_c.{id}[0]"/>&pageindex=<s:property value="pageindex+1"/>">下一页</a>
            <a href="talk_CAction_findAllTalk?tcid=<s:property escape="false" value="pageModel.datas_c.{id}[0]"/>&pageindex=<s:property value="pageModel.pagecount"/>">尾页</a>
            <a>第<s:property value="pageindex"/>页 共<s:property value="pageModel.pagecount"/>页</a>
        </div>

        <s:iterator value="pageModel.datas" var="talk">
            <div id="alltalk">
                <div class="talk">
                    <div class="img-name">
                        <div class="vimg">
                                <%--用户头像--%>
                            <img src="<%=basePath%>/upload/head/<s:property value="#talk[1].head"/>">
                        </div>
                            <%--用户名称--%>
                        <div class="vname"><s:property value="#talk[0].vname"/></div>
                    </div>
                    <div class="text-time">
                            <%--用户发表的评论--%>
                        <div class="text"><s:property value="#talk[0].text"/></div>
                        <div class="time">
                                <%--发表的时间 2016-05-18 21:58:28.0 把后面的“.0” 去掉 选择第0到19的字符--%>
                            <script type="text/javascript">
                                var time = "<s:property value="#talk[0].time"/>"
                                document.write(time.substring(0, 19))
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </s:iterator>

        <div style="clear:left"></div>
        <div class="page">
            <!--导航条-->
            <a href="talk_CAction_findAllTalk?tcid=<s:property escape="false" value="pageModel.datas_c.{id}[0]"/>&pageindex=1">首页</a>
            <a href="talk_CAction_findAllTalk?tcid=<s:property escape="false" value="pageModel.datas_c.{id}[0]"/>&pageindex=<s:property value="pageindex-1"/>">上一页</a>
            <a href="talk_CAction_findAllTalk?tcid=<s:property escape="false" value="pageModel.datas_c.{id}[0]"/>&pageindex=<s:property value="pageindex+1"/>">下一页</a>
            <a href="talk_CAction_findAllTalk?tcid=<s:property escape="false" value="pageModel.datas_c.{id}[0]"/>&pageindex=<s:property value="pageModel.pagecount"/>">尾页</a>
            <a>第<s:property value="pageindex"/>页 共<s:property value="pageModel.pagecount"/>页</a>
        </div>

        <%--回复--%>
        <div class="content">
            <div class="course_introduce">
                <h3 class="cite">讨论回复</h3>

                <div id="response">
                    <form action="talk_CAction_addTalk" id="c_talk">
                        <input type="text" hidden="hidden" name="vname"
                               value="<%=(String)session.getAttribute("username")%>">
                        <input type="text" hidden="hidden" name="cid"
                               value="<s:property escape="false" value="pageModel.datas_c.{id}[0]"/>">
                        <input id="response_text" type="text" name="text">
                        <input type="submit" class="btn-style-01" value="发布">
                    </form>
                </div>
                <br>
            </div>

        </div>


    </div>
    <jsp:include flush="true" page="/views/header-footer/footer.jsp"></jsp:include>
</div>

</body>
</html>
