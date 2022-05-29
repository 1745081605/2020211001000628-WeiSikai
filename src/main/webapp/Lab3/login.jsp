<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 5/15/2021
  Time: 11:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h1>Author:<span style="color: red">2020211001000628-WeiSikai</span></h1>
<%-- todo 9: use c:out to print message fron request --%>
<%=((request.getAttribute("message")==null)?"":request.getAttribute("message"))%>
<%--todo 1: use c:url to set url in action="validate.jsp" --%>
<form action="validate.jsp">
    Username : <input type="text" name="username"><br>
    Password : <input type="password" name="password"><br>
    <input type="submit" value="Login"/>
</form>

</body>
</html>