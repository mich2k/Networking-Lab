<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
   <head>
      <title>c:forTokens Tag Example</title>
   </head>
   <body>
      <c:forTokens items="Tante parole in una frase" delims=" " var="word">
         <c:out value="${word}"/>
         <p>
      </c:forTokens>
   </body>
</html>