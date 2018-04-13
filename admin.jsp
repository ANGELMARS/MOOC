<%--
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/23/023
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录界面</title>
    <link rel="shortcut icon" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="bookmark" href="<%=basePath%>/images/favicon.ico"/>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/style.css"/>

    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('#login').click(function () {
                var name_state = $('#name');
                var psd_state = $('#psd');
                var name = $('#name').val();
                var psd = $('#psd').val();
                if (name == '') {
                    name_state.parent().next().next().css("display", "block");
                    return false;
                } else if (psd == '') {
                    name_state.parent().next().next().css("display", "none");
                    psd_state.parent().next().next().css("display", "block");
                    return false;
                } else {
                    name_state.parent().next().next().css("display", "none");
                    psd_state.parent().next().next().css("display", "none");
                    $('.login').submit();
                }
            });
            $('#register').click(function () {
                var name_r_state = $('#name_r');
                var psd_r_state = $('#psd_r');
                var affirm_psd_state = $('#affirm_psd');
                var name_r = $('#name_r').val();
                var psd_r = $('#psd_r').val();
                var affirm_psd = $('#affirm_psd').val();
                if (name_r == '') {
                    name_r_state.parent().next().next().css("display", "block");
                    return false;
                } else if (psd_r == '') {
                    psd_r_state.parent().next().next().css("display", "block");
                    return false;
                } else if (affirm_psd == '') {
                    affirm_psd_state.parent().next().next().css("display", "block");
                    return false;
                } else if (psd_r != affirm_psd) {
                    return false;
                } else {
                    $('.register').submit();
                }
            })
        })

        function ok_or_errorBylogin(l) {
            var content = $(l).val();
            if (content != "") {
                $(l).parent().next().next().css("display", "none");
            }
        }

        function ok_or_errorByRegister(r) {
            var affirm_psd = $("#affirm_psd");
            var psd_r = $("#psd_r");
            var affirm_psd_v = $("#affirm_psd").val();
            var psd_r_v = $("#psd_r").val();
            var content = $(r).val();
            if (content == "") {
                $(r).parent().next().next().css("display", "block");
                return false;
            } else {
                $(r).parent().next().css("display", "block");
                $(r).parent().next().next().css("display", "none");
                if (psd_r_v == "") {
                    $(psd_r).parent().next().css("display", "none");
                    $(psd_r).parent().next().next().css("display", "none");
                    $(psd_r).parent().next().next().css("display", "block");
                    return false;
                }
                if (affirm_psd_v == "") {
                    $(affirm_psd_v).parent().next().css("display", "none");
                    $(affirm_psd_v).parent().next().next().css("display", "none");
                    $(affirm_psd_v).parent().next().next().css("display", "block");
                    return false;
                }
                if (psd_r_v == affirm_psd_v) {
                    $(affirm_psd).parent().next().css("display", "none");
                    $(affirm_psd).parent().next().next().css("display", "none");
                    $(psd_r).parent().next().css("display", "none");
                    $(psd_r).parent().next().next().css("display", "none");
                    $(affirm_psd).parent().next().css("display", "block");
                    $(psd_r).parent().next().css("display", "block");
                } else {
                    $(affirm_psd).parent().next().css("display", "none");
                    $(affirm_psd).parent().next().next().css("display", "none");
                    $(psd_r).parent().next().css("display", "none");
                    $(psd_r).parent().next().next().css("display", "none");
                    $(psd_r).parent().next().css("display", "block");
                    $(affirm_psd).parent().next().next().css("display", "block");
                    return false;
                }
            }
        }

        function barter_btn(bb) {
            $(bb).parent().parent().fadeOut(1000);
            $(bb).parent().parent().siblings().fadeIn(2000);
        }
    </script>

    <script type="text/javascript">
        function s_login()
        {
            targetForm=document.forms['login'];
            targetForm.action="userAction_login";
        }
        function t_login()
        {
            targetForm=document.forms['login'];
            targetForm.action="userAction_loginteacher";
        }
    </script>
</head>

<body class="login_body">

<div class="login_div">
    <div class="col-xs-12 login_title">管理员登录</div>
    <form action="userAction_loginadmin" class="login" method="post" name="login">
        <div class="nav">
            <div class="nav login_nav">
                <div class="col-xs-4 login_username">
                    用户名:
                </div>
                <div class="col-xs-6 login_usernameInput">
                    <input type="text" name="uname" id="name" value="" placeholder="&nbsp;&nbsp;用户名/手机号"
                           onblur="javascript:ok_or_errorBylogin(this)"/>
                </div>

                <div class="col-xs-1 ok_gou">
                    √
                </div>
                <div class="col-xs-1 error_cuo">
                    ×
                </div>
                <%--选择角色--%>
                <input hidden="hidden" type="radio" name="type" value="3" checked/><br/>
            <div class="nav login_psdNav">
                <div class="col-xs-4">
                    密&nbsp;&nbsp;&nbsp;码:
                </div>
                <div class="col-xs-6">
                    <input type="password" name="pwd" id="psd" value="" placeholder="&nbsp;&nbsp;密码"
                           onBlur="javascript:ok_or_errorBylogin(this)"/>
                </div>
                <div class="col-xs-1 ok_gou">
                    √
                </div>
                <div class="col-xs-1 error_cuo">
                    ×
                </div>

            </div>

            <div class="col-xs-12 login_btn_div">
                <input type="submit" class="sub_btn" value="登录" id="login"/>
            </div>
        </div>
    </form>





</body>
</html>