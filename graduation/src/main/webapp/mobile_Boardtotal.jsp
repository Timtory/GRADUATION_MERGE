<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuilder htmlContent = new StringBuilder();

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        String url = "jdbc:mariadb://localhost:3306/shinhan2023";
        String username = "shinhan2023";
        String password = "tmdcks15!";
        conn = DriverManager.getConnection(url, username, password);

        String query = "SELECT post_id, title, author, ctime, contents FROM jdbc_test";
        pstmt = conn.prepareStatement(query);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            int post_id = rs.getInt("post_id");
            String title = rs.getString("title");
            String author = rs.getString("author");
            String ctime = rs.getString("ctime");
            String contents = rs.getString("contents");

            // 클릭 가능한 링크로 게시물 내용을 감싸기
            htmlContent.append("<p1>게시물 번호: " + post_id + "번<br>" + "제목: " + title + "<br>"
            + "작성자: " + author + "<br>" + "작성시각: " + ctime + "</p1>" + "<p2>" + contents + "</p2>");

        }
    } catch (Exception e) {
        // 오류 처리
        out.print("오류가 발생했습니다: " + e.getMessage());
    } finally {
        // 리소스 닫기
        if (rs != null) try { rs.close(); } catch(SQLException e) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
        if (conn != null) try { conn.close(); } catch(SQLException e) {}
    }

    // 클라이언트에게 HTML 데이터 출력
    response.setContentType("text/html");
    response.setCharacterEncoding("UTF-8");
    out.write(htmlContent.toString());
%>
