<%@ page contentType="application/json" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, org.json.simple.*" %>
<%@ page import="org.json.simple.JSONArray" %>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    JSONArray jsonArray = new JSONArray();

    try {
        // JDBC 드라이버 클래스를 로드
        Class.forName("org.mariadb.jdbc.Driver");
        // MariaDB 데이터베이스 연결 설정
        String url = "jdbc:mariadb://localhost:3306/shinhan2023"; // MariaDB 주소와 데이터베이스 이름
        String username = "shinhan2023"; // 데이터베이스 사용자 이름
        String password = "tmdcks15!"; // 사용자 비밀번호
        // 데이터베이스 연결
        conn = DriverManager.getConnection(url, username, password);
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT s1, s2, s3 FROM weekly");

        while (rs.next()) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("s1", rs.getString("s1"));
            jsonObject.put("s2", rs.getString("s2"));
            jsonObject.put("s3", rs.getString("s3"));
            jsonArray.add(jsonObject);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }

    response.setContentType("application/json");
    out.print(jsonArray.toString());
%>
