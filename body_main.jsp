<%@ page contentType = "text/html;charset=utf-8" %>
	<%! String greeting = "상단 페이지 : 쇼핑몰 메인화면 문자열 홍길동님";
      String tagline = "하단 페이지 : 확인";%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
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
      <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
        지포스 3060 시리즈
      </a>
      <a href="#" class="list-group-item list-group-item-action">지포스 3070 시리즈</a>    
    </div>
