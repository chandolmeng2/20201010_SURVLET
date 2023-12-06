# JSP_20201010
### 자바웹프로그래밍2 20201010 이찬혁

## 기본설명
구름IDE를 통해 JSP 페이지를 만들고, <br/>
데이터베이스와 웹 브라우저 사이에서 데이터 처리를 하는 서블릿 설계하여 쇼핑몰 사이트 구현<br/>
모든 이미지 파일의 위치는 admin 폴더 내에 있는 image 폴더 안에 존재

## 2주차
### 메인 페이지(index.jsp) 생성
부트스트랩 적용, 현재 시각 가져오는 코드 작성

## 3주차
### index.jsp를 top_menu.jsp / body_main.jsp / footer.jsp로 분리
top_banner.jsp로 화면 최상단에 배너 생성<br/>
top_menu.jsp 로고와 메뉴바 및 드롭다운 메뉴 추가<br/>
body_main.jsp 오버레이 배경, 이미지, 추천 상품, 상품 목록(기능은 없음) 추가<br/>
footer.jsp 제작자 정보(학번, 이름), 이메일 추가

## 5주차
### DB 없이 상품목록 추가하기
WEB-INF/src/dto 폴더안에 Product.java 생성<br/>
Product.java로 변수값 생성하고 get/set 메소드로 각 생성자들에게 접근 가능하게 만듦<br/>
WEB-INF/src/dao 폴더안에 ProductRepository.java 생성<br/>
ProductRepository.java로 상품들을 저장<br/>
body_main.jsp로 상품 출력 완료<br/>
#### 연습문제
image/product 폴더 안에 이미지를 추가해서 상품 코드와 똑같은 이름을 가진 이미지 출력 가능

## 6주차
### 상품 세부 정보 출력하기
ProductRepository.java에서 상품 코드를 리턴 받는 메소드 추가하도록 수정<br/>
body_main.jsp에서 보이는 상품 밑에 '상품 상세 정보'를 클릭하면 해당 상품 상세 페이지로 이동<br/>
product_detail.jsp 파일 생성하고 상품 상세 정보를 request 메서드로 받도록 구현<br/>
product_not_found.jsp 파일 생성하여 잘못된 코드를 입력하면 출력되게 구현<br/>
'https://jsp--mmxat.run.goorm.site/product_detail.jsp?id=P1232'<br/>
위 주소로 가면 product_not_found.jsp 출력<br/>
#### 연습문제
web.xml에 <error page> 추가하여 에러 페이지 구현

## 7주차
### 상품 등록하기
admin 폴더 생성하여 기존 파일들 이름 복사하고, 이름에 'ad'를 붙여서 관리자용 파일 구현<br/>
top_menu.jsp에 관리자 모드 링크 추가<br/>
top_menu_ad.jsp에 상품 등록 링크 추가<br/>
product_add.jsp 생성하여 폼 받아서 post 방식으로 보내는 기능 구현<br/>
product_add_process.jsp 생성하여 post 방식으로 받은 정보를 저장하도록 구현<br/>
ProductRepository.java에서 정보를 추가적으로 저장할 수 있도록 클래스 변수를 인스턴스 변수로 변경<br/>
위의 파일들 수정해서 상품 이미지도 업로드 가능하게 수정(cos.jar 라이브러리 추가)

## 9주차
### 로그인 기능 추가하기
validation.js 생성하여 product_add.jsp에서 상품을 추가할 때 조건에 맞추도록 필터링 기능 구현<br/>
리눅스 터미널에서 tomcat-users.xml 파일 수정<br/>
'username="admn" password="123123" roles="admin"'<br/>
web.xml 수정해서 보안 규칙 추가<br/>
login.jsp 생성해서 로그인 화면 구현<br/>
login_failed.jsp 생성해서 로그인 실패시 다시 로그인 화면 로딩<br/>
logout.jsp 생성해서 현제 세션 삭제하도록 구현<br/>
#### 연습문제
'username="admn" password="123654" roles="manage"'

## 10주차
### 장바구니 페이지 구현하기
Product.java에 장바구니 수량 멤버 변수 추가<br/>
product_detail.jsp에 장바구니 추가를 할 수 있도록 수정<br/>
장바구니 관련 jsp들 cart 폴더에 추가하여 장바구니 기능 구현<br/>
#### 연습문제 
날짜 관련 클래스 에러 : 에러 해결(단, UTC기준으로 나옴)<br/>
장바구니 페이지 상단 로그 이미지 해결<br/>
세션 오류 문제 없음<br/>
관리자 페이지의 상세 페이지에서 각 파일 경로들 수정 완료

## 11주차
### 주문 처리 페이지 구현하기
product_cart.jsp에 주문하기 추가<br/>
order 폴더 생성하고 배송 정보를 입력받는 order_info.jsp 생성<br/>
입력받은 정보를 처리할 order_info_process.jsp 생성<br/>
입력한 배송 정보를 확인할 order_confirm.jsp 생성<br/>
주문이 완료되면 세션과 쿠키를 삭제할 order_end.jsp 생성<br/>
order_confirm.jsp에서 취소를 누르면 order_cancelled.jsp로 넘어가도록 구현
#### 연습문제
배송일 날짜를 jQuery를 활용하여 datepickup으로 클릭하여 <br/>
날짜 선택하게 설정(당일 이전은 선택할 수 없게 설계)
국가명 한국, 중국, 일본, 미국 4 국가 중 select 박스로 선택하도록 설정
우편번호 찾기를 클릭하고 주소를 입력하면 자동으로 우편번호를 찾을 수 있게 구현

## 12주차
### DB 연동하기
mysql 연동 완료(유저는 'root' 암호는 '123123', 사용하는 데이터베이스는 'ggouppang_20201010')<br/>
table product 생성 후 기존 3가지 상품 기입<br/>
db폴더 생성하고 db_conn.jsp를 통해 DB 연결 확인<br/>
body_main.jsp 파일 수정해서 상품 데이터를 클래스를 통해 가져오는 것이 아니라, DB에서 데이터를 가져오도록 구현<br/>
product_add_process.jsp 파일 수정해서 추가된 상품이 DB 안에 있는 table product에 삽입되도록 구현<br/>
#### 연습문제
관리자 패스워드 변경하여 '123654'로 변경

## 13주차
### 상품 등록 및 삭제하기(DB 연동)
top_menu_ad.jsp에서 상품 수정, 삭제 메뉴 추가<br/>
product_edit.jsp 생성해서 수정 및 삭제 가능한 페이지 구현<br/>
web.xml에서 product_edit.jsp 페이지 접근을 제한함(관리자 모드 세션이 유지되어 있다면 넘어감)<br/>
product_update.jsp 생성하여 상품 수정 화면 구현(product_edit.jsp에서 수정 메뉴를 클릭)<br/>
product_update_process.jsp 생성하여 상품 수정된 정보를 DB에 수정하도록 구현<br/>
#### 연습문제
product_delete.jsp를 생성하여 삭제할 상품을 DB에 삭제되도록 구현<br/>
(product_edit.jsp에서 삭제 메뉴를 클릭하여 product_delete.jsp로 이동)<br/>
상품 삭제되면 다시 product_edit.jsp로 이동(delete 모드)

## 14주차
### 게시판 만들기
top_menu_ad.jsp에서 게시판 메뉴 추가<br/>
web.xml에서 게시판 접속에 필요한 컨트롤러 클래스를 서블릿에 등록<br/>
Db_connection.java를 WEB-INF/src/mvc/database 폴더에 생성하여 DB 접속을 백그라운드 내장 방식으로 구현<br/>
WEB-INF/src/mvc/model 폴더 생성하고Board_dto.java 생성하여 게시판 데이터 구조와 set/get 메서드 정의<br/>
Board_dao.java 생성하여 게시판 조회, 수정, 삭제 등을 sql 통해 구현되도록 설계<br/>
WEB-INF/src/mvc/controller 폴더 생성하고<br/> 
Board_controller.jsp 생성하여 전체적인 게시판 기능을 제어하는 역할 구현<br/>
servelet-api.jar, jstl-1.2.jar 라이브러리 연동<br/>
board 폴더 생성하고<br/>
실질적으로 보여지는 board_list.jsp 생성 <br/>
게시판 글을 작성하는 board_writeform.jsp 생성<br/>
글에 대한 상세 정보를 보여주는 board_view.jsp 생성 <br/>
#### 연습문제
게시판을 접속하면 login 폴더 안에 login_user.jsp로 넘어가게 되고 <br/>
member 폴더 안에 member_join.jsp와 member_join_process.jsp 생성하여 <br/>
회원가입을 해서 그 정보가 table member 안으로 들어가도록 구현<br/>
또한, login_user_process.jsp 파일로 table member 안에 있는 계정으로 로그인할 수 있도록 구현<br/>
##### 구현 실패
14주차 게시판 만들기에서 게시판에 들어가는 것까지 구현이 되었으나 글을 작성하는 기능부터 실행되지 않는 문제가 있음