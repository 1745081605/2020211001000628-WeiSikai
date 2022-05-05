<%--
  Created by IntelliJ IDEA.
  User: KAI
  Date: 2022/5/5
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Demo -3 -week 11</title>
</head>
<body>
<%
    //array
    String[] fristName={"Bill","Scott","Larry"};
    //list
    ArrayList<String> lastName=new ArrayList<>();
    lastName.add("Ellison");
    lastName.add("Gates");
    lastName.add("McNealy");
    //map
    HashMap<String,String> companyName=new HashMap<>();
    companyName.put("Ellison","Sun");
    companyName.put("Gates","Oracle");
    companyName.put("McNealy","Micosoft");
    //set attribute in any one scope
    request.setAttribute("fname",fristName);
    request.setAttribute("lname",lastName);
    request.setAttribute("company",companyName);
%>

<h2>get data from Array -->List -->map --using El code</h2>
<ul>
    <li>${fname["0"]}--->${lname["0"]}--->${company."Ellison"}</li>
    <li>${fname["1"]}--->${lname["1"]}--->${company[lname["1"]]}</li>
    <li>${fname["2"]}--->${lname["2"]}--->${company[lname["2"]]}</li>
</ul>

</body>
</html>