<%--视频列表 跳转前生成的页面 然后发送到course.jsp里
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/09/009
  Time: 00:13
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
    <title>视频列表</title>
    <link rel="shortcut icon" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="bookmark" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/course.css"/>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>

    <script type="text/javascript">
        function submitmovieform() {
            document.forms["changemovie"].submit();
        }
    </script>
</head>
<body>
<div class="container">

    <table border="1" width="100%" bgcolor="#CCCCFF">
        <tr>
            <td>序号</td>
            <td>视频名称</td>
            <td>操作</td>

        </tr>
        <s:iterator value="pageModel.datas" var="movie" status="m">
            <tr>
                <td><s:property value="#m.count"/></td>
                <td><div style="display:block; color: brown;font-weight: bold;">
                    <form style="float: left" action="movieAction_rechangeMovieName" method="post">
                        <input hidden="hidden" type="text" name="id" value="<s:property value="#movie.id"/>"/>
                        <input name="mname" style="width: 600px;" class="teacherchange" type="text"
                               value="<s:property value="#movie.name"/>">
                        <input style="padding: 8px;" class="btn-style-01" type="submit" value="修改名称">
                    </form>

                        <%--修改课程视频--%>
                    <form style="float: left" action="mfileupd_movie?cid=<s:property value="#movie.c_id"/>"
                          method="post" enctype="multipart/form-data" name="changemovie">
                        <div class="uphead">
                            <a style="padding: 8px;" href="javascript:void(0);" class="btn-style-01">修改视频
                                <input type="file" name="doc" value="修改视频" onchange="javascript: submitmovieform()">
                            </a>
                        </div>

                        <input hidden="hidden" type="submit" name="id"
                               value="<s:property value="#movie.id"/>">
                        <input hidden="hidden" type="submit" name="subm" value="修改">
                    </form>

                </div>

                </td>
                <td>
                        <%--点击后弹出视频来预览--%>
                    <a style="padding: 8px;" class="btn-style-01" href="javascript:void(0);"
                       onclick="javascript:window.open ('<%=basePath%>/views/teacher/coursemovie.jsp?mid=<s:property
                               value="#movie.link"/>&cname=<s:property
                               value="#movie.name"/>', '', 'height=500, width=500,top=100,left=300 toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no')">
                        预览
                    </a>

                    <a style="padding: 8px;" class="btn-style-01" href="movieAction_delmovie?id=<s:property value="#movie.id"/>">删除</a>
                </td>
            </tr>

        </s:iterator>
    </table>
</div>

</body>
</html>
