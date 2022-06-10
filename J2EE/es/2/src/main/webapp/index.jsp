<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.net.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<%!

protected String getResult(String ip, String mask){
	String nhost,nmask,network,ret;
	String subnet = ip+"/"+mask;
	SubnetUtils utils = new SubnetUtils(subnet);
	try{
	nhost = ""+utils.getInfo().getAddressCountLong();
	nmask = utils.getInfo().getNetmask();
	network= utils.getInfo().getNetworkAddress();
	}catch(IllegalArgumentException e){
		return "Illegal input arg.";
	}catch(Exception e){
		return "Something bad happened";
	}
	ret = String.format("<ul><li><b>N.host: </b>%s</li><li><b>Ext.mask: </b>%s</li><li><b>Network: </b>%s/%s</li></ul>",nhost, nmask,network,mask);
	return ret;
	}

%>


<%	String url = request.getRequestURL().toString();
	String ip=request.getParameter("ip");
	String mask=request.getParameter("mask");
    String title = "NetCalc";
%>	



<title> <%= title %></title>
</head>
<body>
	<h1><%=title%></h1>
	<form method=GET action=<%=url%> >
		<input type=text name="ip" value="<%=(ip != null)?ip:"0.0.0.0" %>" />
		<input type=text name="mask" value="<%=(mask != null)?mask:"0" %>" />
		

		<input type=submit name="go" value="calcola"></input>
	</form>
    <%
    String res="";
    if(mask == "" || ip == "" || ip == null || mask == null){
    	res = "Illegal arguments as input. (null)";
    	System.out.println("Null input args");
    }else{
    res=getResult(ip,mask);
    }
    if (!"NA".equals(res)){%>
    	<br><b>L'output e':</b><br><%=res%>
    <%}%>
</body>
</html>