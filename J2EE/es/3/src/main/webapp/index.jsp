<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.lang.Math.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%!protected String getResult(String ip) {

		if (ip == null) {
			return "Inserisci l'indirizzo ip.";
		} else if (ip == "") {
			return "Inserito indirizzo nullo.";
		}

		boolean isValid = true;

		for (int i = 0; i < ip.length(); i++) {
			if (ip.charAt(i) != '.' && !(Character.isDigit(ip.charAt(i)))) {
				isValid = false;
			}
		}
		if (isValid) {

			String arr[]= ip.split("[.]");
			if(arr.length != 4){
				isValid=false;
			}else{
				for(int i = 0; i < 4; i++){
					if(arr[i].length() > 3 || arr[i].length() == 0){
						isValid=false;
					}else{
						if(Integer.parseInt(arr[i]) > 255){
							isValid=false;
						}
					}
				}
			}
			
		}

		return "<br><b>Il risultato e':</b><br>" + isValid;

	}%>

<%
String url = request.getRequestURL().toString();
String ip = request.getParameter("ip");
String title = "Terzo Esercizio";
%>


<meta charset="UTF-8">
<title><%=title%></title>
</head>
<body>

	<h1><%=title%></h1>
	<form method=GET action=<%=url%>>
		<input type=text name="ip" value="<%=(ip != null) ? ip : ""%>" /> <input
			type=submit name="go" value="calcola"></input>
	</form>
	<%
	String res = "";

	res = getResult(ip);
	if (!"NA".equals(res)) {
	%>
	<br>
	<%=res%>
	<%}%>

</body>
</html>