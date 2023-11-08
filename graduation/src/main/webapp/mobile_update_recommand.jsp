<%@ page import="java.sql.*" %>
<%
    // 요청으로부터 "post_id" 파라미터 값을 가져옵니다.
        String postId = request.getParameter("post_id");

        // 유효성 검사: "post_id" 파라미터가 없거나 비어있는 경우 에러 메시지를 반환합니다.
        if (postId == null || postId.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing post_id parameter.");
            return; // 추가 처리 없이 요청을 종료합니다.
        }
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // MariaDB JDBC 드라이버 로드
        Class.forName("org.mariadb.jdbc.Driver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/shinhan2023", "shinhan2023", "tmdcks15!");

        // 쿼리 준비 (recommand 포함된 쿼리)
        String sql = "UPDATE jdbc_test SET recommand = recommand + 1 WHERE post_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(postId));

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