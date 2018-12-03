<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name1 = "images/1.jpg";
String name2 = "images/2.jpg";
%>
Hello
<br>
<%
out.print("<img src="+"\""+name1+"\""+" alt=\"picture1\">");
%>
</body>
</html>