<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<%
    // 파라미터 값 가져오기
    String title = request.getParameter("title");
    String contents = request.getParameter("contents");
    String author = request.getParameter("author");
    String filelocation = request.getParameter("filelocation");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // MariaDB JDBC 드라이버 로드
        Class.forName("org.mariadb.jdbc.Driver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/shinhan2023", "shinhan2023", "tmdcks15!");

        // SQL 쿼리 준비
        String sql = "INSERT INTO suggestion (title, contents, author, filelocation) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, contents);
        pstmt.setString(3, author);

        if (filelocation != null && !filelocation.isEmpty()) {
            pstmt.setString(4, "/tomcat/webapps/upload/" + filelocation);
        } else {
            // filelocation이 없을 경우 null로 설정
            pstmt.setNull(4, Types.VARCHAR);
        }

        // 쿼리 실행
        int result = pstmt.executeUpdate();

        // 결과 출력
        if (result > 0) {
            out.print("Data has been saved successfully.");
        } else {
            out.print("Unable to save data.");
        }
    } catch (Exception e) {
        out.print("An error occurred: " + e.getMessage());
    } finally {
        // 자원 해제
        if (pstmt != null) { try { pstmt.close(); } catch (SQLException ignored) {} }
        if (conn != null) { try { conn.close(); } catch (SQLException ignored) {} }
    }
%>