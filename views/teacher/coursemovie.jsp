<%--视频预览
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/4/14/014
  Time: 23:29
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
    <title>视频播放</title>
    <link rel="shortcut icon" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="bookmark" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/course.css"/>

    <script>
        function GetQueryString(name) {
//            获取链接里面cid的值
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null)return unescape(r[2]);
            return null;
        }
        var c = GetQueryString("cname");//页面传个来的 章节名称
        var m = GetQueryString("mid");//页面传个来的 播放ID
        var addr = "<%=basePath%>/upload/movie/" + m;  //拼接播放路径
    </script>
</head>
<body>

<%
    /*获取链接中传来的cname*/
    String send = request.getParameter("cname");
/*    request.setAttribute("cname",send);
    String cname=(String)request.getAttribute("cname");*/
%>

<div class="list">
    <script>
        document.write(
                '<video src="' + addr + '" width="500px" height="500px" controls="controls">你的浏览器不支持视频播放</video>'
        );

    </script>
</div>
</body>
</html>
