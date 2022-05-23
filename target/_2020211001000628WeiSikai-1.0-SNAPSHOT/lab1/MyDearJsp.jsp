<%--
  Created by IntelliJ IDEA.
  User: KAI
  Date: 2022/5/16
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MyDearJsp.jsp</title>
</head>
<body>
<h1>Author:<span style="color: red">2020211001000628-WeiSikai</span></h1>
<%
    request.setCharacterEncoding("UTF-8");
%>
<h2>The get result by java code</h2>
name:<%=request.getParameter("name")%><br/>
submit:<%=request.getParameter("submit")%><br/>
class:<%=request.getParameter("_class")%><br/>
ID:<%=request.getParameter("ID")%><br/>
<hr/>
<h2>The get result by EL</h2>
name:${param.name}<br/>
submit:${param.submit}<br/>
class:${param._class}<br/>
ID:${param.ID}<br/>
</body>
</html>