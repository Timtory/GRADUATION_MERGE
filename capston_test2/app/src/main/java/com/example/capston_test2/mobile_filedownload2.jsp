<%@ page contentType="application/json" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, org.json.simple.*" %>

<%
    // 클라이언트로부터 받은 post_id 파라미터
    String postId = request.getParameter("post_id");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    JSONObject responseJson = new JSONObject(); // 결과를 저장할 JSON 객체

    try {
        // JDBC 드라이버 클래스를 로드
        Class.forName("org.mariadb.jdbc.Driver");

        // MariaDB 데이터베이스 연결 설정
        String url = "jdbc:mariadb://localhost:3306/shinhan2023"; // MariaDB 주소와 데이터베이스 이름
        String username = "shinhan2023"; // 데이터베이스 사용자 이름
        String password = "tmdcks15!"; // 사용자 비밀번호

        // 데이터베이스 연결
        conn = DriverManager.getConnection(url, username, password);

        // 쿼리 준비
        String sql = "SELECT filelocation FROM hw WHERE post_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, postId); // 파라미터로 받은 post_id 설정

        // 쿼리 실행 및 결과 처리
        rs = pstmt.executeQuery();
        if (rs.next()) {
            // 데이터베이스로부터 데이터 추출
            String filelocation = rs.getString("filelocation");

            // JSON 객체에 데이터 설정
            responseJson.put("filelocation", filelocation);
        }
    } catch (Exception e) {
        e.printStackTrace();
        // 에러 응답 설정
        responseJson.put("error", e.getMessage());
    } finally {
        // 리소스 정리
        if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
    }

    // JSON 형식으로 응답 전송
    response.setContentType("application/json");
    out.print(responseJson.toString());
%>