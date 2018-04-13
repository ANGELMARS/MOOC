<%--
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/05/005
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/course.css"/>

    <script language="javascript">
        function fsubmit(search) {
            search.submit();
        }

    </script>

</head>
<body >
<div id="header" >
    <!--导航栏-->
    <div id="menu" style="position:fixed;z-index:1;">
        <a href="courseAction_findAllCourse"><img id="logo" src="<%=basePath%>/images/logo.png"></a>
        <ul>
            <li><a class="tab" href="courseAction_findAllCourse">课程</a></li>

        </ul>

        <%--搜索条--%>
        <div class="search-warp" style="min-width: 32px; height: 60px;float: left;margin-left: 20%;">
            <form name="search" id="search" action="courseAction_searchCourse">
                <div class="search-area" data-search="top-banner" style="display: block;">
                    <input name="info" class="search-input" data-suggest-trigger="suggest-trigger"
                           placeholder="请输入想搜索的内容..." type="text" autocomplete="off">
                    <input type="hidden" class="btn_search" data-search-btn="search-btn">
                </div>
                <div class="showhide-search" data-show="yes">
                    <input hidden="hidden" type="submit" value="搜索"> <a href="javascript:void(0);"
                                                                        onclick="javascript:fsubmit(document.search);">搜索</a>
                </div>
            </form>
        </div>

        <div style="margin-right:5%; float: right;">
        <ul >
            <li>
                <div id="username">
                    <form action="vipAction_findVip" method="post" style="margin-top: 25%">
                        <input style="display:none;" type="text" name="vname"
                               value="<%=(String)session.getAttribute("username")%>" readonly="readonly"/>
                        <input type="submit" style="border: none;background: none;cursor: pointer;color:white;"
                               value="<%=(String)session.getAttribute("username")%>">
                    </form>
                </div>
            </li>
            <li>
                <div id="username">
                    <a href="views/return/logout.jsp">退出</a>
                </div>
            </li>
        </ul>
        </div>
    </div>
    <br><br><br>
</div>
</body>
</html>
