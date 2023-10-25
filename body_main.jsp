<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />

	<%! String greeting = "현재 페이지는 VGA 그래픽 카드 상품 목록입니다.";
      String tagline = "하단 페이지 : 확인";%>
<div class="container">
	<div class="jumbotron">
		<div class="container">
			<h3 class="display-4">
				<%=greeting%>
            </h3>
		</div>
	</div>
<%
	ArrayList<Product> listOfProducts = productDAO.getAllProducts(); // 리스트에 상품 전체 정보를 얻어온다.
%>
    <div class="container">
		<div class="row" align="center">
			<%
				for (int i = 0; i < listOfProducts.size(); i++) {
					Product product = listOfProducts.get(i);
			%>
			<div class="col-md-4">
                    <div class="card bg-dark text-white">
                        <img src = "admin/image/product/<%=product.getFilename()%>" class="card-img" alt="...">
                        <div class="card-img-overlay">
                            <h5 class="card-title">그래픽 카드 이미지 샘플</h5>
                            <p class="card-text">
                                출처: 구글 검색
                            </p>
                        </div>
                    </div>
				<h3><%=product.getPname()%></h3><!--상품이름-->
				<p><%=product.getDescription()%><!--상품정보-->
				<p><%=product.getUnitPrice()%>원<!--상품가격-->
                <p>
                    <a href="product_detail.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary" role = "button"> 상품 상세 정보 &raquo;</a>
                </p>
			</div>
			<%
				} //반복문 끝
			%>
		</div>
		<hr>
	</div>
    
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline%>
			</h3>
		</div>
		<hr>
	</div>

<div class="card bg-dark text-white">
        <img src = "image\title.png" class = "card-img" alt = "...">
    <div class = "card-img-overlay">
        <h5 class = "card_title" >그래픽 카드 이벤트</h5>
        <p class="card_text">출처:다나와</p>
    </div>
</div>

<div class="list-group">
      <a href="#" class="list-group-item list-group-item-action active" aria-current="true">지포스 3060 시리즈</a>
      <a href="#" class="list-group-item list-group-item-action">지포스 3070 시리즈</a>    
</div>