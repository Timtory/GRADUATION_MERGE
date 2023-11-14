<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
    <meta charset="UTF-8">
    <title>삭제 결과</title>
</head>
<body>
    <center>
        <h2>삭제 결과</h2>
        <%
            Connection connection = null;
            PreparedStatement preparedStatement = null;

            try {
                // 데이터베이스 연결 정보 (MariaDB에 맞게 수정)
                String jdbc_driver = "org.mariadb.jdbc.Driver"; // 사용할 JDBC 드라이버의 클래스 이름
                String jdbc_url = "jdbc:mariadb://localhost:3306/shinhan2023"; // MariaDB 연결 URL
                String dbUser = "shinhan2023";
                String dbPassword = "tmdcks15!";

                // JDBC 드라이버 로드
                Class.forName(jdbc_driver);

                // 데이터베이스에 연결
                connection = DriverManager.getConnection(jdbc_url, dbUser, dbPassword);

                // 삭제할 ID 값들을 배열로 받아옴
                String[] deleteIds = request.getParameterValues("deleteIds");

                if (deleteIds != null && deleteIds.length > 0) {
                    // 삭제할 ID 값들을 이용하여 SQL 쿼리 생성
                    StringBuilder sql = new StringBuilder("DELETE FROM login_test WHERE id IN (");
                    for (int i = 0; i < deleteIds.length; i++) {
                        sql.append("?");
                        if (i < deleteIds.length - 1) {
                            sql.append(",");
                        }
                    }
                    sql.append(")");

                    // SQL 쿼리 준비
                    preparedStatement = connection.prepareStatement(sql.toString());

                    // 파라미터 설정
                    for (int i = 0; i < deleteIds.length; i++) {
                        preparedStatement.setString(i + 1, deleteIds[i]);
                    }

                    // SQL 실행
                    int deletedRows = preparedStatement.executeUpdate();

                    out.println("총 " + deletedRows + "개의 항목이 삭제되었습니다.");
                } else {
                    out.println("선택된 항목이 없습니다.");
                }
            } catch (Exception e) {
                out.println("오류 발생: " + e.getMessage());
            } finally {
                try {
                    if (preparedStatement != null) {
                        preparedStatement.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    out.println("데이터베이스 연결 해제 오류: " + e.getMessage());
                }
            }
        %>
        <br>
        <a href="AccountBoard.jsp">계정관리로 돌아가기</a>
    </center>
</body>
</html>
