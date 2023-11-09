<%@ page import="java.sql.*" %>
<%
    // 요청으로부터 파라미터 값을 가져옵니다.
    String postId = request.getParameter("postId"); // postId 파라미터 추가
    String reauthor = request.getParameter("reauthor");
    String recontents = request.getParameter("recontents");


    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // MariaDB JDBC 드라이버 로드
        Class.forName("org.mariadb.jdbc.Driver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/shinhan2023", "shinhan2023", "tmdcks15!");

        // 쿼리 준비 (postId가 포함된 쿼리)
        String sql = "INSERT INTO reply (post_id, reauthor, recontents) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, postId); // postId 설정 추가
        pstmt.setString(2, reauthor); // 변수명 수정
        pstmt.setString(3, recontents); // 변수명 수정



        // 쿼리 실행
        int result = pstmt.executeUpdate();

        // 결과 처리
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
