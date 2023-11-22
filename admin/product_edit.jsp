<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type ="text/javascript" src ="../js/validation.js"></script>
<title>상품 편집</title>
    
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 상품을 삭제합니다!!") == true)
		   location.href = "product_delete.jsp?id=" + id;
		else
		   return;
	}
</script>
<%
	String edit = request.getParameter("edit");
%>
</head>
<body>
   <jsp:include page="top_menu_ad.jsp" />
   <div class="jumbotron">
	   <div class="container">
		<h1 class="display-3">상품 편집</h1>
	   </div>
	</div>

	<div class="container">
	   <div class="row" align="center">
		<%@ include file="../db/db_conn.jsp"%>
		<%
			String sql = "select * from product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
		%>
		<div class="col-md-4">
		<img src="../admin/image/product/<%=rs.getString("p_fileName")%>" class="card-img" alt="...">
		<h3><%=rs.getString("p_name")%></h3>
		<p><%=rs.getString("p_description")%>
		<p><%=rs.getString("p_UnitPrice")%>원
		<p>
		<%
		     if (edit.equals("update")) {
		%>
		     <a href="product_update.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-success" role="button"> 수정 &raquo;></a>
		<%
		     } else if (edit.equals("delete")) {
		%>
		     <a href="#" onclick="deleteConfirm('<%=rs.getString("p_id")%>')" class="btn btn-danger" role="button">삭제 &raquo;></a>
		<%
		     }
		%>				
	</div>
	<%
		}
		if (rs != null)
		rs.close();
		if (pstmt != null)
 			pstmt.close();
 		if (conn != null)
			conn.close();
 		%>
	</div>
	<hr>
   </div>
   <jsp:include page="footer_ad.jsp" />
</body>
</html>

