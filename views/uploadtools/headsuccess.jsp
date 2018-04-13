<%@ page language="java" import="java.util.*" pageEncoding="gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <script>
        window.onload = function () {
            document.getElementById("sub").click();
        }
    </script>

</head>

<body>

<s:iterator value="targetfilename" status="st">
    <%--<s:property value="targetfilename[#st.index]"/>--%>
    <%--头像--%>
    <%--<img width=150 height=100 style="margin: 1% auto" src="<s:property value="'../../upload/head/'+targetfilename[#st.index]"/>" />--%>

    <form action="vipAction_rechangeVipHead" method="post" class="">
        <input style="border: 0px;" hidden="hidden" type="text" name="vname" id="name"
               value="<%=(String)session.getAttribute("username")%>"/>
        <div>
            <input hidden="hidden" style=" border:1px solid grey; height: 40px;width: 85%;  float: left;" type="text"
                   name="v_head"
                   value="<s:property value="targetfilename[#st.index]"/>">
            <input hidden="hidden" style="float: left;border:1px solid grey;" type="submit" class="" value="确认修改"
                   id="sub">
        </div>
    </form>

</s:iterator>


</body>
</html>
