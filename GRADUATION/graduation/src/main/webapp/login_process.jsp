<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <center>
        <%
            // 데이터베이스 연결 정보
            String jdbc_driver = "org.mariadb.jdbc.Driver"; // 사용할 JDBC 드라이버의 클래스 이름
            String jdbc_url = "jdbc:mariadb://localhost:3306/shinhan2023"; // MariaDB 연결 정보
            String dbUser = "shinhan2023";
            String dbPassword = "tmdcks15!";

            // 사용자가 입력한 값 가져오기
            String inid = request.getParameter("inid");
            String inpwd = request.getParameter("inpwd");

            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            boolean isAuthenticated = false;

            try {
                // JDBC 드라이버 로드
                Class.forName(jdbc_driver);

                // 데이터베이스에 연결
                connection = DriverManager.getConnection(jdbc_url, dbUser, dbPassword);

                // SQL 쿼리 준비
                String sql = "SELECT * FROM login_test WHERE id = ? AND pwd = ?";
                preparedStatement = connection.prepareStatement(sql);

                // 파라미터 설정
                preparedStatement.setString(1, inid);
                preparedStatement.setString(2, inpwd);

                // SQL 실행 및 결과 가져오기
                resultSet = preparedStatement.executeQuery();

                // 결과 검사
                if (resultSet.next()) {
                    // 사용자가 존재하면 로그인 성공
                    isAuthenticated = true;

                    // 세션으로 넘겨줄 아이디의 사용자(oname)값을 저장
                    String userName = resultSet.getString("oname");
                    session.setAttribute("loggedInUserName", userName);
                    // 사용자 ID를 세션에 저장
                    session.setAttribute("loggedInUserId", inid);
                }
            } catch (Exception e) {
                out.println("오류 발생: " + e.getMessage());
            } finally {
                try {
                    if (resultSet != null) {
                        resultSet.close();
                    }
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

            if (isAuthenticated) {
                // 로그인 성공 시 success.jsp로 리다이렉트
                response.sendRedirect("index.jsp");
            } else {
                // 로그인 실패 시 index.html로 리다이렉트
        %>
                <script>
                    alert("로그인 실패! 이름, 아이디 또는 비밀번호를 확인하세요.");
                    window.location.href = "login.html";
                </script>
        <%
            }
        %>
    </center>
</body>
</html>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <center>
        <%
            // 데이터베이스 연결 정보
             String jdbc_driver = "oracle.jdbc.driver.OracleDriver"; //사용할 JDBC 드라이버의 클래스 이름
  			 String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";
            String dbUser = "test";
            String dbPassword = "12345";

            // 사용자가 입력한 값 가져오기
            String inid = request.getParameter("inid");
            String inpwd = request.getParameter("inpwd");

            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            boolean isAuthenticated = false;

            try {
                // JDBC 드라이버 로드
                Class.forName(jdbc_driver);

                // 데이터베이스에 연결
                connection = DriverManager.getConnection(jdbc_url, dbUser, dbPassword);

                // SQL 쿼리 준비
                String sql = "SELECT * FROM login_test WHERE id = ? AND pwd = ?";
                preparedStatement = connection.prepareStatement(sql);

                // 파라미터 설정
                preparedStatement.setString(1, inid);
                preparedStatement.setString(2, inpwd);

                // SQL 실행 및 결과 가져오기
                resultSet = preparedStatement.executeQuery();

                // 결과 검사
                if (resultSet.next()) {
                    // 사용자가 존재하면 로그인 성공
                    isAuthenticated = true;
                }
            } catch (Exception e) {
                out.println("오류 발생: " + e.getMessage());
            } finally {
                try {
                    if (resultSet != null) {
                        resultSet.close();
                    }
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

            if (isAuthenticated) {
                // 로그인 성공 시 success.jsp로 리다이렉트
                response.sendRedirect("mainPage.html");
            } else {
                // 로그인 실패 시 index.html로 리다이렉트
                response.sendRedirect("login.html");
            }
            
        %>
    </center>
</body>
</html> --%>