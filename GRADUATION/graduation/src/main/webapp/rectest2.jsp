<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 추천</title>

    <script>
    // 성공 메시지를 표시하고 페이지를 뒤로 가고, 그 후 일정 시간 뒤에 새로고침하는 JavaScript 함수
    function showSuccessMessage() {
        alert("게시글이 성공적으로 추천되었습니다.");
        
    }
</script>


</head>
<body>
    <%
        // 입력받아온 정보
        int recommandValue = Integer.parseInt(request.getParameter("recommand"));
        int postID = Integer.parseInt(request.getParameter("post_id"));

        // MariaDB 데이터베이스 연결 정보
        String jdbc_driver = "org.mariadb.jdbc.Driver";
        String jdbc_url = "jdbc:mariadb://localhost:3306/shinhan2023";
        String dbUser = "shinhan2023";
        String dbPassword = "tmdcks15!";
        String title1 = request.getParameter("title");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // JDBC 드라이버 로드
            Class.forName(jdbc_driver);

            // 데이터베이스 연결
            conn = DriverManager.getConnection(jdbc_url, dbUser, dbPassword);

            // 추천 버튼을 클릭한 경우
            String recommandButton = request.getParameter("recommand");
            if (recommandButton != null && recommandButton.equals("1")) {
                // 게시글의 실제 제목으로 변경
                String updateQuery = "UPDATE jdbc_test SET recommand = recommand + 1 WHERE post_id = ?";
                pstmt = conn.prepareStatement(updateQuery);
                pstmt.setInt(1, postID);

                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<script>showSuccessMessage();</script>");
                    String targetURL = "postlook_index.jsp?post_id=" + postID;
                    response.sendRedirect(targetURL);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("데이터베이스 오류: " + e.getMessage());
        } finally {
            // 자원 해제
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
    
    <script>
    // 작업이 완료되면 postlook.jsp로 리디렉션
    window.location.href = "postlook_index.jsp?title=<%= title1 %>";
</script>
</body>
</html>
