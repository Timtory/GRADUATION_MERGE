<%@ page contentType="application/json" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, org.json.simple.*" %>
<%@ page import="org.json.simple.JSONArray" %>

<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    JSONArray jsonArray = new JSONArray();

    // 요청으로부터 "post_id" 파라미터 값을 가져옵니다.
    String postId = request.getParameter("post_id");

    try {
        // JDBC 드라이버 클래스를 로드
        Class.forName("org.mariadb.jdbc.Driver");
        // MariaDB 데이터베이스 연결 설정
        String url = "jdbc:mariadb://localhost:3306/shinhan2023"; // MariaDB 주소와 데이터베이스 이름
        String username = "shinhan2023"; // 데이터베이스 사용자 이름
        String password = "tmdcks15!"; // 사용자 비밀번호
        // 데이터베이스 연결
        conn = DriverManager.getConnection(url, username, password);

        String sql = "SELECT reauthor, recontents FROM reply WHERE post_id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, Integer.parseInt(postId));
        rs = stmt.executeQuery();

        while (rs.next()) {
            String reauthor = rs.getString("reauthor");
            String recontents = rs.getString("recontents");
            JSONObject item = new JSONObject();
            item.put("reauthor", reauthor);
            item.put("recontents", recontents);
            jsonArray.add(item);
        }
    } catch (SQLException e) {
        e.printStackTrace();
        // 데이터베이스 오류 메시지를 JSON 응답에 추가
        JSONObject errorObject = new JSONObject();
        errorObject.put("error", "Database error: " + e.getMessage());
        jsonArray.add(errorObject);
    } catch (Exception e) {
        e.printStackTrace();
        // 기타 오류 메시지를 JSON 응답에 추가
        JSONObject errorObject = new JSONObject();
        errorObject.put("error", "Error: " + e.getMessage());
        jsonArray.add(errorObject);
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }

    response.setContentType("application/json");
    out.print(jsonArray.toString());
%>
