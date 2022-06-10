<%@ page import="java.util.*"%>
<html>
<head>
<%!String title = "Sim esame J2EE";%>
<title><%=title%></title>
<head>
<body>


	<%!Map<String, Integer> myMap;
String[] r = this.getProductNames();%>

	<%
	if (session.getAttribute("Map") == null) {

		myMap = new LinkedHashMap<>();
		for (int i = 0; i < r.length; i++) {
			myMap.put(r[i], 0);
		}
	} else {
		myMap = (Map<String, Integer>) session.getAttribute("Map");
	}
	%>
	<%session.setAttribute("Map", myMap);%>


	<h1><%=title%></h1>
	<%!public String[] getProductNames() {
	return new String[] { "product2", "product1", "product3" };
}%>


	<%!String Operation = "";%>
	<%
	Operation = request.getParameter("Go");
	String id = request.getParameter("prodID");
	%>

	<%
	try {
		if ((new String("buy")).equals(Operation)) {
			myMap.put(id, myMap.get(id) + 1);
		}
		if ((new String("remove")).equals(Operation)) {
			myMap.put(id, 0);
		}
	} catch (Exception e) {
		out.println("Errore" + session.getAttribute("isBoot"));
	}
	;
	%>


	<b>Operation:</b>
	<%=Operation%>
	<br>
	<b>qty[<%=id%>]
	</b>=<%=myMap.get(id)%>
	<br>
	<b>id is:</b>
	<%=id%>

	<br>


	<br>

	<%
	System.out.println(myMap.toString());
	String ret = "";
	for (Map.Entry<String, Integer> pair : myMap.entrySet()) {
	%>
	<form action="<%=request.getRequestURI()%>" method=GET>

		<label> <%=pair.getKey()%> ( <%=pair.getValue()%> in cart )
		</label> <input type="submit" name="Go" value="buy"> <input
			type="submit" name="Go" value="remove"> <input type="hidden"
			name="prodID" value=<%=pair.getKey()%>> <br>
	</form>

	<%
	}
	%>

</body>
</html>