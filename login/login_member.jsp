<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	
	Connection conn = null;
	String sql = "select * from member"; //sql 조작 구문
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mariaDB");
		conn = ds.getConnection(); //JNDI를 이용하여 연결된 Connection 객체를 가져온다.
		
		String id = request.getParameter("id"); //id값을 받아와서 저장
		pstmt = conn.prepareStatement(sql); //connection 객체를 사용항 PreparedStatement 객체를 생성한다.
		rs = pstmt.executeQuery(); //PreparedStatement 객체로 SQL문을 실행하여 얻어온 레코드들을 ResultSet 타입의 변수로 참조한다.
		while (rs.next()) { //레코드가 존재하지 않을 때까지 계속 레코드 행을 다음으로 이동하면서 동작한다.
			String name = rs.getString(2); //두 번째 테이블인 name 을 String name으로 받아온다
			int level = rs.getInt(3); //세 번째 테이블인 level을 int level로 받아온다
			if (rs.getString(1).equals(id) && id != null) {
				session.setAttribute("id", name); //세션지정
				session.setAttribute("level", level);
				response.sendRedirect("../board/board_list.jsp"); //member.jsp로 이동
			}
			else {
			    out.print("<script>alert('없는 id 입니다.');</script>");
			}
		}
	} catch (Exception e) {
		out.println("데이터 가져오기 실패");
		e.printStackTrace();
	} finally {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>