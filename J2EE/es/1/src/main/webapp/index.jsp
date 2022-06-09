<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ page import="java.lang.Math.*" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<%!

protected String getResult(String r){
	double p=0, a=0, radius=0;
	
    try {
        radius = Double.parseDouble(r);
    } catch (NumberFormatException nfe) {
        return "Bad input";
    }
	
	a=Math.pow(Math.PI,2)* radius;
	p=2*Math.PI*radius;
	return "Perimetro: " + p + "<br>Area: " + a;
}

%>

<%		String url = request.getRequestURL().toString();
		String r=request.getParameter("r");
        String title = "Area & Permietro cerchio";
%>	


<title> <%= title %></title>
</head>
<body>
<body>
	<h1><%=title%></h1>
	<form method=GET action=<%=url%> >
		<input type=text name="r" value="<%=(r != null)?r:"" %>" />

		<input type=submit name="go" value="calcola"></input>
	</form>
    <%
    String res=getResult(r);
    if (!"NA".equals(res)){%>
    	<br><b>Il risultato e':</b><br> <%=res%>
    <%}%>

</body>
</html>