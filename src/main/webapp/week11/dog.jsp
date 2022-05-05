<%--
  Created by IntelliJ IDEA.
  User: KAI
  Date: 2022/5/5
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.weisikai.week11.Person" %>
<%@ page import="com.weisikai.week11.Dog" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Demo 2 -week 11</title>
</head>
<body>
<%
    //create objects
    Person person=new Person();
    person.setName("Tom");
    Dog dog=new Dog();
    dog.setName("Tommy");
    person.setDog(dog);
    //set attribute
    request.setAttribute("personAtt",person);
%>
<h2>get person' dog name -using java code</h2>
<%
    Person personAtt = (Person) pageContext.findAttribute("personAtt");
    Dog d= personAtt.getDog();
    out.println(personAtt.getName()+"s' Dog name--->"+d.getName());
%>
<h2>get person' dog name -using EL code</h2>
${personAtt["name"]}‘s Dog name :${personAtt.dog.name}


</body>
</html>