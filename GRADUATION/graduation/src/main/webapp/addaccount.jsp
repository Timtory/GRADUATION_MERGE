<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<%
   // 데이터베이스 연결 관련 변수 선언
   Connection conn = null;
   PreparedStatement pstmt = null;

   // 데이터베이스 연결 관련 정보를 문자열로 선언
   String jdbc_driver = "org.mariadb.jdbc.Driver"; // MariaDB JDBC 드라이버 클래스 이름
   String jdbc_url = "jdbc:mariadb://localhost:3306/shinhan2023"; // 여기서 'your_db_name'을 실제 데이터베이스 이름으로 변경해야 합니다.
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");
   String oname = request.getParameter("oname");
   String role = request.getParameter("role");

   try {
      // JDBC 드라이버 로드
      Class.forName(jdbc_driver);

      // 데이터베이스 연결 정보를 이용해 Connection 인스턴스 확보
      conn = DriverManager.getConnection(jdbc_url, "shinhan2023", "tmdcks15!"); // 사용자 이름과 암호를 실제 데이터베이스 사용자 이름과 암호로 변경해야 합니다.

      // Connection 클래스의 인스턴스로부터 SQL 문 작성을 위한 PreparedStatement 준비
      String sql = "INSERT INTO login_test (id, pwd, oname, role) VALUES (?, ?, ?, ?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, request.getParameter("id"));
      pstmt.setString(2, request.getParameter("pwd"));
      pstmt.setString(3, request.getParameter("oname"));
      pstmt.setString(4, request.getParameter("role"));

      // 사용자가 폼을 제출할 때 입력한 데이터를 데이터베이스에 추가
      if (request.getParameter("id") != null) {
         pstmt.executeUpdate(); // 데이터베이스에 데이터를 추가
      }
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      try {
         if (pstmt != null) {
            pstmt.close();
         }
         if (conn != null) {
            conn.close();
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
%>

<HTML>
<HEAD>
   <TITLE>계정 추가</TITLE>
</HEAD>
<BODY>
<div align="center">
   <br/><br/><br/><br/><br/><br/>
   <H2 style="text-align: center;">계정이 추가되었습니다.</H2>
   <H5 style="text-align: center;">3초 후에 새로고침됩니다.</H5>
</div>
<script type="text/javascript">
    setTimeout(function(){
        window.location.href = "AccountBoard.jsp";
    }, 3000);
</script>
</BODY>
</HTML>
