<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   String jdbc_driver = "org.mariadb.jdbc.Driver"; // MariaDB JDBC 드라이버 클래스
   String jdbc_url = "jdbc:mariadb://localhost:3306/shinhan2023"; // MariaDB 연결 URL (포트 및 데이터베이스 이름 변경 필요)
   
   String s1 = request.getParameter("new_s1");
   String s2 = request.getParameter("new_s2");
   String s3 = request.getParameter("new_s3");
 
   try {
      Class.forName(jdbc_driver);
      conn = DriverManager.getConnection(jdbc_url, "shinhan2023", "tmdcks15!"); // 사용자명과 비밀번호를 적절하게 변경
      
      // 게시글 업데이트     
      String updateSQL = "UPDATE weekly SET s1 = ?, s2 = ?, s3 = ?"; // 수정 쿼리
      pstmt = conn.prepareStatement(updateSQL);
      pstmt.setString(1, s1);
      pstmt.setString(2, s2);
      pstmt.setString(3, s3);      
      
      pstmt.executeUpdate();
      
      // 변경사항을 커밋
      conn.commit();
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      try {
         if (rs != null) {
            rs.close();
         }
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
   <TITLE>3줄 요약 작성</TITLE>
  
</HEAD>

<BODY>
<div align="center">
<br/><br/><br/><br/><br/><br/>
<H2 style ="text-align: center;">3줄 요약이 수정되었습니다.</H2>
<H5 style ="text-align: center;">3초후에 새로고침됩니다.</H5>
</div>
<script type="text/javascript">
    setTimeout(function(){
        window.location.href = "3sUpload.jsp";
    }, 3000);
</script>
<%
   try {
      Class.forName(jdbc_driver);
      conn = DriverManager.getConnection(jdbc_url, "user1", "tmdcks15"); // 사용자명과 비밀번호를 적절하게 변경

      String sql = "SELECT s1, s2, s3 FROM weekly";

      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      int i = 1;

      while (rs.next()) {
        // 결과 처리를 여기에서 수행
        String s1Value = rs.getString("s1");
        String s2Value = rs.getString("s2");
        String s3Value = rs.getString("s3");
        // 결과를 사용하거나 출력하는 등의 작업을 수행
      }
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      try {
         if (rs != null) {
            rs.close();
         }
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
</BODY>
</HTML>
