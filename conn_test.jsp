<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page import ="java.sql.*" %>
<html>
    <head>
        <title>mysql 데이터베이스 접속 테스트</title>
    </head>
    <body>
        <%
            Statement stm = null;
            ResultSet rs = null;
            Boolean conn_state = false;
        
            Class.forName("com.mysql.jdbc.Driver");
	        String myUrl = "jdbc:mysql://localhost/ggouppang_20201010";
	        Connection conn = DriverManager.getConnection(myUrl, "root", "123123");
	        try {
        	    stm = conn.createStatement();
                conn_state = true;
        	    if(stm.execute("select * from product")) {
                    	rs = stm.getResultSet();
                }
                while(rs.next()) {
                    out.println(rs.getString("p_id"));
                    out.println(rs.getString("p_name"));
                    out.println(rs.getString("p_unitPrice"));
                    out.println(rs.getString("p_description"));
                    out.println(rs.getString("p_manufacturer"));
                    out.write("<br><br>");
                }
                rs.close();
                stm.close();
            }
            catch(Exception e) {
                out.println("rs.next() ERROR");
            }
            conn.close();
        %> 

    <%
	    if(conn_state == true){
    %>
    	데이터베이스에 연결되었습니다.
    <%
        }else{
    %>
    	연결에 실패하였습니다.
    <% 
        } 
    %>
    </body>
</html>