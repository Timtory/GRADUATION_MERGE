<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String token = request.getParameter("token");

    // 로그를 출력하여 받은 token 값 확인
    System.out.println("Received token: " + token);

    Connection conn = null;
    PreparedStatement pstmt = null;

    // 응답의 MIME 타입과 문자 인코딩을 설정합니다.
    response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");

    if (token == null || token.trim().isEmpty()) {
        response.getWriter().write("Token is missing or empty.");
        return;
    }

    try {
        // MariaDB JDBC 드라이버를 로드합니다.
        Class.forName("org.mariadb.jdbc.Driver");

        // 데이터베이스에 연결합니다.
        // 여기서 연결 정보를 확인하여 올바르게 수정해주세요.
        conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/shinhan2023", "shinhan2023", "tmdcks15!");

        // 쿼리를 준비합니다.
        String sql = "INSERT INTO token (tokenid) VALUES (?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, token);

        // 쿼리를 실행합니다.
        int result = pstmt.executeUpdate();

        // 결과를 처리합니다.
        if (result > 0) {
            response.getWriter().write("Token successfully saved!");
        } else {
            response.getWriter().write("Failed to save token.");
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.getWriter().write("An error occurred: " + e.getMessage());
    } finally {
        // 자원을 해제합니다.
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException ignored) {
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ignored) {
            }
        }
    }
%>