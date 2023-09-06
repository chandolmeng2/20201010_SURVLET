<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page import="example.*" %> 
<%
    HelloWorld h = new HelloWorld();
%>
<html>
<body>
    message = <%=h.hello() %>
</body>	
</html>
