<%@ page language="java" import="java.util.*" pageEncoding="gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'success.jsp' starting page</title>
</head>

<body>
<h1>上传结果</h1>
上传文件名:<br>
<s:iterator value="targetfilename" status="st">
    <s:property value="#st.count"/>
    <s:property value="targetfilename[#st.index]"/>
    <img width=150 height=100 src="<s:property value="'../../updfile/'+targetfilename[#st.index]"/>"/>
</s:iterator>
</body>
</html>
