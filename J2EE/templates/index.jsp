<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.lang.Math.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%!
protected String getResult(String p, String s){

	if(p== null || s == null){
		return "Inserisci le stringhe.";
	}else if(p=="" && s==""){
		return "Entrambi campi vuoti.";
	}

	String rit1 = p + s;
	String rit2 = p + s;

	return "Primo: " + rit1 + "<br>Secondo: " + rit2;
}
%>

<%	String url = request.getRequestURL().toString();
	String p=request.getParameter("p");	// change both!
	String s=request.getParameter("s");	// change both!
	String title = "Titolo Esercizio";
%>


<meta charset="UTF-8">
<title> <%= title %></title>
</head>
<body>

	<h1><%=title%></h1>
	<form method=GET action=<%=url%> >
		<input type=text name="p" value="<%=(p != null)?p:"" %>" />	<!-- VALORE STD: ?p:"" -->
		<input type=text name="s" value="<%=(s != null)?s:"" %>" /> <!-- VALORE STD: ?s:"" -->

		<input type=submit name="go" value="calcola"></input>
	</form>
    <%
    String res="";
    if(p == "" && s == ""){
    	res="[ERR]: Campi vuoti";
    }
    res=getResult(p,s);
    if (!"NA".equals(res)){%>
    	<br><b>Il risultato e':</b><br> <%=res%>
    <%}%>

</body>
</html>
