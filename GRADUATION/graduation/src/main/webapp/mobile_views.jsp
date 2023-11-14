<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*,java.util.*,javax.sql.*" %>

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
    ResultSet rs = null;
    String resultContent = "";

    try {
        // MariaDB JDBC 드라이버 로드
        Class.forName("org.mariadb.jdbc.Driver");

        // 데이터베이스 연결 설정 (URL, 사용자 이름, 비밀번호를 본인의 DB 정보로 설정하세요)
        String url = "jdbc:mariadb://localhost:3306/shinhan2023";
        String username = "shinhan2023";
        String password = "tmdcks15!";
        conn = DriverManager.getConnection(url, username, password);

        // post_id에 해당하는 레코드를 조회하는 SQL 쿼리를 준비합니다.
        String sql = "SELECT views FROM jdbc_test WHERE post_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(postId));

        // 쿼리를 실행하고 결과를 받아옵니다.
        rs = pstmt.executeQuery();

        // 결과 처리: 해당 post_id의 컨텐츠를 가져옵니다.
        if (rs.next()) {
            resultContent = rs.getString("views");
        } else {
            // 해당 post_id가 없는 경우
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Content not found for provided post_id.");
            return;
        }
    } catch (Exception e) {
        // 예외 처리: 데이터베이스 오류 또는 다른 문제가 발생한 경우
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred.");
        return;
    } finally {
        // 사용한 리소스를 정리합니다.
        if (rs != null) try { rs.close(); } catch(SQLException ignored) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ignored) {}
        if (conn != null) try { conn.close(); } catch(SQLException ignored) {}
    }

    // 최종 결과를 클라이언트에게 반환합니다.
    response.setContentType("text/html; charset=UTF-8");
    out.write(resultContent.toString());
%>