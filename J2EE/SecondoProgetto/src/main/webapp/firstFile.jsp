<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*"%>

<%! String title="hello, i'm useless"; %>	<!--  thanks to this statement i can define a variable -->

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="1">
<title><%= title %></title>
</head>
<body>

<h1>
	<%=title%>
</h1>
	It is <%= new java.util.Date() %>
	<h2>

</h2>

</body>
</html>

<!-- 
	the jsp file is not created in the java folder since is not a java class but 
		goes in the webapp folder
 -->
 
 <!-- 
 
 URL:
 
 http://localhost:8080/SecondoProgetto/firstFile.jsp
 
  -->