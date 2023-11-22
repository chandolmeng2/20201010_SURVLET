<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>상품 수정</title>
</head>
<body>
   <jsp:include page="top_menu_ad.jsp" />
   <div class="jumbotron">
	<div class="container">
		<h1 class="display-3">상품 수정</h1>
	</div>
   </div>
   <%@ include file="../db/db_conn.jsp"%>
   <%
	String productId = request.getParameter("id");

	String sql = "select * from product where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();
	if (rs.next()) {
   %>
 <div class="container">
      <div class="row">
	<div class="col-md-4">
	    <img src="../admin/image/product/<%=rs.getString("p_fileName")%>" class="card-img" alt="...">
	</div>
	<div class="col-md-8">
	    <form name="newProduct" action="product_update_process.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
	    <div class="form-group row">
		<label class="col-sm-2">상품 코드</label>
		<div class="col-sm-3">
			<input type="text" id="productId" name="productId" class="form-control" value='<%=rs.getString("p_id")%>'>
		</div>
	    </div>
	    <div class="form-group row">
		<label class="col-sm-2">상품명</label>
		<div class="col-sm-3">
			<input type="text" id="name" name="name" class="form-control" value="<%=rs.getString("p_name")%>">
		</div>
	    </div>
	    <div class="form-group row">
		<label class="col-sm-2">가격</label>
		<div class="col-sm-3">
			<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=rs.getInt("p_unitPrice")%>">
		</div>
	    </div>
	    <div class="form-group row">
		<label class="col-sm-2">상세 설명</label>
		<div class="col-sm-5">
			<textarea name="description" cols="50" rows="2" class="form-control"><%=rs.getString("p_description")%></textarea>
		</div>
	    </div>
	    <div class="form-group row">
		<label class="col-sm-2">제조사</label>
		<div class="col-sm-3">
			<input type="text" name="manufacturer" class="form-control" value="<%=rs.getString("p_manufacturer")%>">
		</div>
	    </div>
	    <div class="form-group row">
		<label class="col-sm-2">분류</label>
		<div class="col-sm-3">
			<input type="text" name="category" class="form-control" value="<%=rs.getString("p_category")%>">
		</div>
	    </div>
	    <div class="form-group row">
		<label class="col-sm-2">제고 수</label>
		<div class="col-sm-3">
			<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value="<%=rs.getLong("p_unitsInStock")%>">
		</div>
	    </div>
		    <div class="form-group row">
		<label class="col-sm-2">상세 설명</label>
		<div class="col-sm-5">
			<textarea name="description" cols="50" rows="2" class="form-control"><%=rs.getString("p_description")%></textarea>
		</div>
	    </div>
	    <div class="form-group row">
		<label class="col-sm-2">제조사</label>
		<div class="col-sm-3">
			<input type="text" name="manufacturer" class="form-control" value="<%=rs.getString("p_manufacturer")%>">
		</div>
	    </div>
	    <div class="form-group row">
		<label class="col-sm-2">분류</label>
		<div class="col-sm-3">
			<input type="text" name="category" class="form-control" value="<%=rs.getString("p_category")%>">
		</div>
	    </div>
	    <div class="form-group row">
		<label class="col-sm-2">제고 수</label>
		<div class="col-sm-3">
			<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value="<%=rs.getLong("p_unitsInStock")%>">
		</div>
	    </div>
		    <div class="form-group row">
		<label class="col-sm-2">상태</label>
		<div class="col-sm-5">
			<input type="radio" name="condition" value="New "> 신규 제품 <input type="radio" name="condition" value="Old"> 중고 제품
			<input type="radio" name="condition" value="Refurbished"> 재생 제품
		</div>
	    </div>
	    <div class="form-group row">
	 	<label class="col-sm-2">이미지</label>
		<div class="col-sm-5">
			<input type="file" name="productImage" class="form-control">
		</div>
	    </div>
	    <div class="form-group row">
		<div class="col-sm-offset-2 col-sm-10 ">
			<input type="submit" class="btn btn-primary" value="등록">
		</div>
	    </div>
	</form>
	</div>
   </div>
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
 <hr>
 <jsp:include page="footer_ad.jsp" />
</body>
</html>