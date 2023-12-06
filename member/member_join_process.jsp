<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../db/db_conn.jsp" %>

<%
    request.setCharacterEncoding("utf-8");
    
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String birth = request.getParameter("birth");
	String mail = request.getParameter("mail_1") + request.getParameter("mail_2");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");

    // 현재 시간을 얻어오기
    Timestamp currentTime = new Timestamp(System.currentTimeMillis());
    
    // Timestamp를 문자열로 변환
    SimpleDateFormat dateFormat = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
    String formattedTime = dateFormat.format(currentTime);
   
	String sql = "insert into member values(?,?,?,?,?,?,?,?,?);";
	pstmt = conn.prepareStatement(sql); // 쿼리문 몸체만 넣기
	pstmt.setString(1, id); // 각 필드 설정 - ? 순서대로
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, birth);
    pstmt.setString(6, mail);
	pstmt.setString(7, phone);
	pstmt.setString(8, address);
    pstmt.setString(9, formattedTime);

	pstmt.executeUpdate(); // 최종 SQL 쿼리 실행	
	if (pstmt != null)
 		    pstmt.close();
 	if (conn != null)
		    conn.close();

	response.sendRedirect("../index.jsp");
%>
