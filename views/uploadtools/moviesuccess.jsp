<%--
  Created by IntelliJ IDEA.
  User: ZYP
  Date: 2016/05/22/022
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        String mid = request.getParameter("mid");
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
   <%-- <s:debug value="targetfilename"></s:debug>--%>
    <form action="movieAction_rechangeMovieLink" method="post">
        <input hidden="hidden" style="border: 0px;" type="text" name="id" id="id"
               value="<%=mid%>"/>
        <input hidden="hidden" style="border: 0px;"  type="text" name="cid" id="cid"
               value="<%=cid%>"/>
        <div>

            <input hidden="hidden" style=" border:1px solid grey; height: 40px;width: 85%;  float: left;" type="text"
                   name="mclink"
                   value="<s:property value="targetfilename[#st.index]"/>">

            <input hidden="hidden" style="float: left;border:1px solid grey;" type="submit" class="" value="È·ÈÏÐÞ¸Ä"
                   id="sub">
        </div>
    </form>

</s:iterator>

</body>
</html>
