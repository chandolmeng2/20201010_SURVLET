<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp" %>

<%
    request.setCharacterEncoding("utf-8");
    
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	 
	String sql = "select * from member WHERE id=? AND password=?;";
	pstmt = conn.prepareStatement(sql); // 쿼리문 몸체만 넣기
	pstmt.setString(1, id); // 각 필드 설정 - ? 순서대로
	pstmt.setString(2, password);
	
	rs = pstmt.executeQuery(); // 최종 SQL 쿼리 실행	

    if(rs.next()) {
		response.sendRedirect("../board/board_writeform.jsp");
	}else{
        response.sendRedirect("../body_main.jsp");
    }
	
	if (pstmt != null)
 		    pstmt.close();
 	if (conn != null)
		    conn.close();
    if (rs != null)
            rs.close();
%>
