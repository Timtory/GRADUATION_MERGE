<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%-- 데이터베이스 연결 및 게시물 데이터 가져오기 --%>

<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    Class.forName("org.mariadb.jdbc.Driver");
    String url = "jdbc:mariadb://localhost:3306/shinhan2023";
    String username = "shinhan2023";
    String password = "tmdcks15!";
    conn = DriverManager.getConnection(url, username, password);

    // 클라이언트에서 폼으로 입력한 contents 값 받기
    String clientContents = request.getParameter("htmlContent");

    String selectQuery = "SELECT contents FROM jdbc_test WHERE contents = ?";
    pstmt = conn.prepareStatement(selectQuery);
    pstmt.setString(1, clientContents);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        // DB에서 해당 내용을 찾았을 경우
        String updateQuery = "UPDATE jdbc_test SET recommand = recommand + 1 WHERE contents = ?";
        PreparedStatement updateStatement = conn.prepareStatement(updateQuery);
        updateStatement.setString(1, clientContents);
        int updatedRows = updateStatement.executeUpdate();

        if (updatedRows > 0) {
            // 업데이트 성공
            out.println("추천이 완료되었습니다.");
        } else {
            // 업데이트 실패
            out.println("추천 업데이트에 실패했습니다.");
        }
        updateStatement.close();
    } else {
        // DB에서 해당 내용을 찾지 못한 경우
        out.println("해당 내용을 DB에서 찾을 수 없습니다.");
    }

} catch (Exception e) {
    // 오류 처리
    out.println("오류가 발생했습니다: " + e.getMessage());
} finally {
    // 리소스 닫기
    if (rs != null) try { rs.close(); } catch(SQLException e) {}
    if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
    if (conn != null) try { conn.close(); } catch(SQLException e) {}
}
%>
