<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"> <!---jQuery 사용하여 날짜 선택 기능 추가--->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!---우편번호 및 주소--->
<title>배송 정보</title>
</head>
<body>
	<jsp:include page="../top_menu.jsp" />
	<div class="jumbotron">
	   <div class="container">
		<h1 class="display-3">배송 정보</h1>
	   </div>
	</div>
	<div class="container">
	   <form action="order_info_process.jsp" class="form-horizontal" method="post">
	     <input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>" />
	     <div class="form-group row">
	       <label class="col-sm-2">성명</label>
	          <div class="col-sm-3">
	      	<input name="name" type="text" class="form-control" />
	          </div>
	     </div>
	     <div class="form-group row">
	     <label class="col-sm-2">배송일</label>
	         <div class="col-sm-3">
                 <script>
                 $( function() {
                     $( "#shippingDate" ).datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "+1d" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });
                     $( "#shippingDate" ).datepicker("setDate","+1d");
                 } );
                 </script>
		     <input name="shippingDate" id="shippingDate" type="text" />
	         </div>
	     </div>
	     <div class="form-group row">
	     <label class="col-sm-2">국가명</label>
	         <div class="col-sm-3">
		     <select name="country">
                 <option value="">국가 선택</option>
                 <option id="kor">한국</option>
                 <option id="chi">중국</option>
                 <option id="jap">일본</option>
                 <option id="usa">미국</option>
             </select>
	         </div>
	     </div>
	     <div class="form-group row">
	     <label class="col-sm-2">우편번호</label>
	         <div class="col-sm-3">
     	     <input name="zipCode" id="sample6_postcode" type="text" class="form-control" />
             <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	         </div>
	     </div>
	     <div class="form-group row">
	     <label class="col-sm-2">주소</label>
         <div class="col-sm-5">
        <input name="addressName" id="sample6_address" type="text" class="form-control" />             
        <input name="addressDetail" type="text" id="sample6_detailAddress" placeholder="상세주소" class="form-control">
         <input name="addressExtra" type="text" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
         </div>
	    </div>              
        <script>
            function sample6_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }

                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if(data.userSelectedType === 'R'){
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if(extraAddr !== ''){
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                            } else {
                                document.getElementById("sample6_extraAddress").value = '';
                            }
    
                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('sample6_postcode').value = data.zonecode;
                            document.getElementById("sample6_address").value = addr;
                            // 커서를 상세주소 필드로 이동한다.
                            document.getElementById("sample6_detailAddress").focus();
                        }
                    }).open();
                }
            </script>
	     <div class="form-group row">
	         <div class="col-sm-offset-2 col-sm-10 ">
	         <a href="../cart/product_cart.jsp?cartId=<%=request.getParameter("cartId")%>" class="btn btn-secondary" role="button"> 이전 </a> 
		     <input type="submit" class="btn btn-primary" value="등록" />
		     <a href="order_cancelled.jsp" class="btn btn-secondary" role="button"> 취소 </a>
	         </div>
	     </div>
        </form>
    </div>
</body>
</html>

