<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>

 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>캐러셀</title>

<style>
   
    /* 인스타그램 섹션 */
    .insta {
        margin-top: 30px;
        position: absolute;
        border: 1px solid black;
        width: 100%; /* 캐로셀을 화면 너비에 맞게 확장 */
    }

    .carousel-inner img {
        width: 100%; /* 이미지를 캐로셀의 너비에 맞게 조절 */
        height: auto; /* 이미지의 가로세로 비율을 유지 */
    }

    .carousel-inner img {
        max-width: 100%;
        height: auto;
    }


</style>

</head>
<body>
<%
    // JDBC 연결 정보 설정
    String url = "jdbc:mariadb://localhost:3306/shinhan2023";
    String user = "shinhan2023";
    String password = "tmdcks15!";

    Connection connection = null;
    Statement statement = null;

    try {
        // JDBC 드라이버 로드
        Class.forName("org.mariadb.jdbc.Driver");

        // 데이터베이스 연결
        connection = DriverManager.getConnection(url, user, password);

        // SQL 쿼리 작성
        String query = "SELECT ca1, ca2, ca3, ca4 FROM carousel where num=1"; // WHERE 절에 원하는 조건을 추가하세요.

        statement = connection.createStatement();

        // 쿼리 실행
        ResultSet resultSet = statement.executeQuery(query);

        if (resultSet.next()) {
            // 쿼리 결과에서 ca1, ca2, ca3, ca4 값을 가져옴
            String ca1 = resultSet.getString("ca1");
            String ca2 = resultSet.getString("ca2");
            String ca3 = resultSet.getString("ca3");
            String ca4 = resultSet.getString("ca4");

            // FTP 서버의 URL 생성
            String imageUrl1 = "http://www.shinhan-software.co.kr/" + ca1;
            String imageUrl2 = "http://www.shinhan-software.co.kr/" + ca2;
            String imageUrl3 = "http://www.shinhan-software.co.kr/" + ca3;
            String imageUrl4 = "http://www.shinhan-software.co.kr/" + ca4;
            
    %>
 <div class="insta">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="<%=imageUrl1 %>" alt="first 1" >
                </div>
                <div class="item">
                    <img src="<%=imageUrl2 %>" alt="second 2">
                </div>
                <div class="item">
                    <img src="<%=imageUrl3 %>" alt="third 3" >
                </div>
                <div class="item">
                    <img src="<%=imageUrl4 %>" alt="forth 4" >
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">이전</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">다음</span>
            </a>
        </div>
    </div>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 연결과 리소스 해제
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    %>   
</body>
</html>