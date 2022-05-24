<%@ page language="java" contentType="text/html; charset=UTF-8" import="it.unimore.ingmo.AudioActiveJB" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="title" scope="page" value="Audio Active Decay" />
<c:url var="url" scope="page" value="${pageContext.request.requestURL}" />

<title><c:out value="${title}" /></title>
</head>
<body>
<form method="GET" action="<c:out value="${url}" />">
		Seed: <input type=text name="seed" value="<c:out value="${seed}" />" />
		N Iterations: <input type=text name="iter" value="<c:out value="${iter}" />" />	
		<input type=submit name="go" value="decay!"></input>	
</form>

<jsp:useBean id="audioActive" class="it.unimore.ingmo.AudioActiveJB"/>
<c:set var="seed" scope="page" value="${param.seed}" />
<c:set var="iter" scope="page" value="${param.iter}" />
<jsp:setProperty name="audioActive" property="seed" value="${seed}"/>

<c:forEach var="i" begin="1" end="${iter}">
<c:out value="${i}" />: <c:out value="${audioActive.decay}" /><br />
</c:forEach>
</body>
</html>