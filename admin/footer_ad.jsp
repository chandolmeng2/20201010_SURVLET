<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "example.*"%>

<footer class="container">
	<p>&copy; 쇼핑몰 대표 : 이찬혁, 고유번호 : 20201010, 연락처 : chandol2@sungkyul.ac.kr<br>
    <%
        ShopTime time = new ShopTime();
    %>
    오늘 날짜와 시간 : <%=time.timenow()%>        
    </p>
</footer>