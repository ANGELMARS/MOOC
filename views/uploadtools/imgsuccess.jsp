<%@ page language="java" import="java.util.*" pageEncoding="gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="d" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        String cid = request.getParameter("cid");
    %>
    <script>
        window.onload = function () {
            document.getElementById("sub").click();
        }
    </script>

</head>

<body>

<s:iterator value="targetfilename" status="st">
    <%--<d:debug value="targetfilename"></d:debug>--%>
    <form action="courseAction_rechangeCourseImg" method="post">
        <input hidden="hidden" style="border: 0px;"  type="text" name="id" id="id"
               value="<%=cid%>"/>
        <input hidden="hidden" style="border: 0px;"  type="text" name="cid" id="cid"
               value="<%=cid%>"/>
        <div>
            <input hidden="hidden" style=" border:1px solid grey; height: 40px;width: 85%;  float: left;" type="text"
                   name="c_img"
                   value="<s:property value="targetfilename[#st.index]"/>">
            <input hidden="hidden" style="float: left;border:1px solid grey;" type="submit" class="" value="È·ÈÏÐÞ¸Ä"
                   id="sub">
        </div>
    </form>

</s:iterator>

</body>
</html>
