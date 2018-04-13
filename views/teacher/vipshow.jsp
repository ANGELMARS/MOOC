<%--个人中心页面--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <link rel="shortcut icon" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="bookmark" href="<%=basePath%>/images/favicon.ico"/>
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/course.css"/>
    <script src="<%=basePath%>/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/js/login_changepwd.js" type="text/javascript"></script>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="<%=basePath%>/css/cebianlan.css" type="text/css" rel="stylesheet"/>

    <script>
        //把获取到的值提前赋值
        var v_name = "<s:property escape="false" value="pageModel.datas.{vname}[0]"/>";
        var v_text = "<s:property escape="false" value="pageModel.datas.{text}[0]"/>";
        // alert(v_text);
    </script>

    <script>
        $(document).ready(function () {
            $("#changepwd").click(function () {
                $('#page').load('/views/changepwd.jsp');
            })
        })
        $(document).ready(function () {
            $("#changetext").click(function () {
                $('#page').load('vipAction_findVip1', c_name);
            })
        })
        var c_name = "<s:property escape="false" value="pageModel.datas.{vname}[0]"/>";
        c_name = "vname=" + c_name;
        $(document).ready(function () {
            $("#userinfo").click(function () {
                $('#page').load('vipAction_findVip0', c_name);
            })
        })
    </script>
</head>
<body>
<div class="container">
    <jsp:include flush="true" page="/views/header-footer/headerTeacher.jsp"></jsp:include>

    <div id="main">
        <%--侧边栏--%>
        <div style="float: left;">

            <ul class="dropdown">
                <h1 style="margin-bottom: 1%; margin-left: 6%; font-size:30px; color:red;">个人中心</h1>
                <li style="border:solid;border-width: 1px;"><a href="#">信息</a>
                    <ul>
                        <li><a id="userinfo" href="javascript:void(0)">个人信息</a></li>
                    </ul>
                </li>
                <li style="border:solid;border-width: 1px;"><a href="#">修改</a>
                    <ul>
                        <li><a id="changepwd" href="javascript:void(0)">修改密码</a></li>
                        <li><a id="changetext" href="javascript:void(0)">修改信息</a></li>
                    </ul>
                </li>
            </ul>
            <script src="js/cebianlan.min.js"></script>
            <script src="js/cebianlan.js"></script>
            <script>
                $('.dropdown').tendina({
                    animate: true,
                    speed: 500,
                    openCallback: function ($clickedEl) {
                        console.log($clickedEl);
                    },
                    closeCallback: function ($clickedEl) {
                        console.log($clickedEl);
                    }
                })
            </script>
        </div>
        <div id="main_container">

            <div id="page">
                <div style="float: left;">
                    <div>
                        <div class="info">
                            <div class="info_name"><h2>名称：</h2></div>
                            <div class="info_text" id="n_name"><s:property value="pageModel.datas.{vname}[0]"/></div>
                        </div>
                        <div class="info">
                            <div class="info_name"><h2>个人信息：</h2></div>
                            <div class="info_text" id="i_text"><s:property value="pageModel.datas.{text}[0]"/></div>
                        </div>

                    </div>
                </div>
                <div style="float: right;">
                    <img style="width:140px; height: 140px;"
                         src="<%=basePath%>/upload/head/<s:property value="pageModel.datas.{head}[0]"/>"
                    >
                </div>
            </div>
        </div>
    </div>
    <jsp:include flush="true" page="/views/header-footer/footer.jsp"></jsp:include>
</div>


</body>
</html>
