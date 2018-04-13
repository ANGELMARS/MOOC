<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
    <link rel="shortcut icon" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="bookmark" href="<%=basePath%>/images/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>修改密码</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/style.css"/>
    <script src="<%=basePath%>/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/js/login_changepwd.js" type="text/javascript"></script>
</head>

<body class="login_body">

<div class="login_div">
    <div class="col-xs-12 login_title">密码修改</div>
    <form action="userAction_rechangeUser" class="register" method="post">
        <div class="nav">
            <div class="nav register_nav">
                <div class="col-xs-4">
                    用户名:
                </div>
                <div class="col-xs-6">
                    <input readonly="readonly" type="text" name="uname" id="name"
                           value="<%=(String)session.getAttribute("username")%>" placeholder="&nbsp;&nbsp;用户名/手机号"
                           onBlur="javascript:ok_or_errorByRegister(this)"/>
                </div>
                <div class="col-xs-1 ok_gou">
                    √
                </div>
                <div class="col-xs-1 error_cuo">
                    ×
                </div>
            </div>
            <div class="nav register_psdnav">
                <div class="col-xs-4">
                    新密码:
                </div>
                <div class="col-xs-6">
                    <input type="password" name="u_pwd" id="psd" value="" placeholder="&nbsp;&nbsp;密码"
                           onBlur="javascript:ok_or_errorByRegister(this)"/>
                </div>
                <div class="col-xs-1 ok_gou">
                    √
                </div>
                <div class="col-xs-1 error_cuo">
                    ×
                </div>
            </div>
            <div class="nav register_affirm">
                <div class="col-xs-4">
                    确认密码:
                </div>
                <div class="col-xs-6">
                    <input type="password" name="" id="affirm_psd" value="" placeholder="&nbsp;&nbsp;确认密码"
                           onBlur="javascript:ok_or_errorByRegister(this)"/>
                </div>
                <div class="col-xs-1 ok_gou">
                    √
                </div>
                <div class="col-xs-1 error_cuo">
                    ×
                </div>
            </div>
            <div class="col-xs-12 register_btn_div">
                <input type="submit" class="sub_btn" value="修改" id="register"/>
            </div>
        </div>
    </form>
</div>


</body>
</html>