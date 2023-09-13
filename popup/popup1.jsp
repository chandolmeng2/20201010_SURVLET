<%@ page contentType = "text/html;charset=utf-8" %>
<html>
    <head>
        <body>
            <h4>
                현재 페이지는 팝업 페이지 입니다.
                <br><br>
                파일명은 popup1.jsp
                <br><br>
                홈페이지 메인 화면 로딩 후 자동으로 열립니다.
            </h4>
            <jsp:forward page="popup2.jsp"/>
        </body>
    </head>
</html>