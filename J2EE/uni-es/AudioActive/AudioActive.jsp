<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Audio Active Decay</title>
</head>
<body>
<%!
protected String audioActiveDecay(String s){
	//System.out.println("audioActiveDecay("+s+")");
	String ns="";
	char c, symbol='.';
	int n=0, i;
	for (i=0;i < s.length(); i++){
		c=s.charAt(i);
		//System.out.println(""+i+" c="+c+" symbol="+symbol+" n="+n);
		if (symbol=='.'){
			// initialize: start a new sequence
			symbol=c;
			n=1;
		} else if (c==symbol) {
			// another char in same sequente
			n++;
		} else {
			// start of new sequece
			ns=ns+n+symbol;
			symbol=c;
			n=1;			
		}
	}
	// flush last sequence
	ns=ns+n+symbol;
	return ns;
}
%>
<%
	String url = request.getRequestURL().toString();
	String seed=request.getParameter("seed");
	String iter=request.getParameter("iter");
%>
<form method="GET" action="<%=url%>">
		Seed: <input type=text name="seed" value="<%=(seed != null)?seed:"" %>" />
		N Iterations: <input type=text name="iter" value="<%=(iter != null)?iter:"" %>" />	
		<input type=submit name="go" value="decay!"></input>	
</form>
<% 
if ((iter != null) && (seed!=null)){
	int niter=Integer.parseInt(iter);
	String ns=seed;
	for (int i=0; i<=niter; i++){
		out.println("" + i +": "+ns+"<br>");
		ns=audioActiveDecay(ns);
	}
}
%>
</body>
</html>