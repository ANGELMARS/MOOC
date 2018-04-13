<%--用户信息修改 在vipshow.jsp里加载
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/10/010
  Time: 23:47
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
    <title>用户信息修改</title>
    <link rel="shortcut icon" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="bookmark" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/course.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/cebianlan.css"/>

    <script>
        //把获取到的值提前赋值
        var v_name = "<s:property escape="false" value="pageModel.datas.{vname}[0]"/>";
        var v_text = "<s:property escape="false" value="pageModel.datas.{text}[0]"/>";
        //  alert(v_text);
    </script>
    <%--选择图片后 自动提交--%>
    <script type="text/javascript">
        function submitform() {
            document.forms["changehead"].submit();
        }
    </script>
</head>
<body>
<div id="page">
    <div style="float: left;">
        <div>
            <div class="info">
                <div class="info_name"><h2>名称：</h2></div>
                <div class="info_text" id="n_name"><%=(String) session.getAttribute("username")%>
                </div>
            </div>
            <div class="info">
                <div class="info_name"><h2>个人信息：</h2></div>

                <form action="vipAction_rechangeVip" method="post" class="">
                    <input style="border: 0px;" hidden="hidden" type="text" name="vname" id="name"
                           value="<%=(String)session.getAttribute("username")%>"/>
                    <div>
                        <input style="border:1px solid grey; height: 40px;width: 85%; float: left;" type="text"
                               name="v_text"
                               value="<s:property escape="false" value="pageModel.datas.{text}[0]"/>">
                        <input class="btn-style-01" style="float: left;" type="submit" class="" value="修改" id="">
                    </div>
                </form>

            </div>
            <div class="info">
                <div class="info_name"><h2>修改头像：</h2></div>
                <form action="mfileupd_head" method="post" enctype="multipart/form-data" id="f1" name="changehead">
                    <div class="uphead">
                        <a href="javascript:void(0);" class="btn-style-01">选择图片
                            <input type="file" name="doc" value="修改头像" onchange="javascript: submitform()">
                        </a>
                    </div>
                    <input hidden="hidden"  style=" float: right;border:1px solid grey;" type="submit" name="subm"
                           value="修改"><br>
                </form>
            </div>
        </div>
    </div>

    <%--头像显示--%>
    <div style="float: right;">
        <img style="width:140px; height: 140px;"
             src="<%=basePath%>/upload/head/<s:property value="pageModel.datas.{head}[0]"/>"
        >
    </div>
</div>
</body>
</html>

