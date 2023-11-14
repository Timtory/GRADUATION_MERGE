<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
   
    <title>계정관리 페이지</title>
    <link type="text/css" rel="stylesheet" href="css/AccountBoard.css" />
    <script>
function validateForm() {
    var name = document.getElementById("name").value;
    var id = document.getElementById("id").value;
    var password = document.getElementById("password").value;
    var role = document.querySelector('input[name="role"]:checked');

    if (name === "" || id === "" || password === "" || role === null) {
        alert("모든 필수 입력 필드를 채워주세요.");
        return false; // 폼 제출을 막음
    }
    
    return true; // 폼 제출을 허용
}
</script>

<script>
// 모달 열기
function openModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "block";
}

// 모달 닫기
function closeModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
}

// 폼 제출 시 처리
document.getElementById("signupForm").addEventListener("submit", function(event) {
    if (!validateForm()) {
        event.preventDefault(); // 폼 제출 막음
    } else {
        // 사용자가 입력한 값을 가져옴
        var name = document.getElementById("name").value;
        var id = document.getElementById("id").value;
        var password = document.getElementById("password").value;

    
        // 모달 닫기
        closeModal();
    }
});
</script>


<style>
.asdf {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* 그림자 설정 */
	margin: 30px 30px;
	margin-top: 30px;
	border-radius: 10px;
	height:800px;
}
.container {
	width: 1200px;
	margin: auto;

}
</style>
</head>
<body>
<div class="container">
<div class="asdf">
 <div id="myModal" class="modal">
        <div class="modal-content">
            <span onclick="closeModal()" style="float:right; cursor:pointer;">&times;</span>
            <h2>회원 가입</h2>
            <form id="signupForm" method="POST" action="addaccount.jsp">
                <label>
                    <input type="radio" name="role" value="관리자" >
                    관리자(조교)</label>
                <label>
                    <input type="radio" name="role" value="교수" >
                    교수</label>
                <label>
                    <input type="radio" name="role" value="학생회" >
                    학생회</label>    
                <br/><br/>
                
                <label for="name">이름:</label>
                <input type="text" id="name" name="oname"><br><br>
                
                <label for="id">아이디:</label>
                <input type="text" id="id" name="id"><br><br>
                
                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="pwd"><br><br>
                
                <input type="submit" value="추가">
            </form>
        </div>
    </div>
    <center>
        <h2 style="margin-top:50px;">계정관리</h2>
        <form action="deleteRecords.jsp" method="post">
        <table border="1" width="900px" class="center-table" >
            <tr>    
            	<th></th>      
				<th>이름</th> 
                <th>ID</th>
                <th>PW</th>
                <th>그룹</th>
            </tr>
            <%
                Connection connection = null;
                PreparedStatement preparedStatement = null;
                ResultSet resultSet = null;

                try {
                    // 데이터베이스 연결 정보
                     String jdbc_driver = "org.mariadb.jdbc.Driver"; //사용할 JDBC 드라이버의 클래스 이름
   					String jdbc_url = "jdbc:mariadb://localhost:3306/shinhan2023";
                    String dbUser = "shinhan2023";
                    String dbPassword = "tmdcks15!";

                    // JDBC 드라이버 로드
                    Class.forName(jdbc_driver);

                    // 데이터베이스에 연결
                    connection = DriverManager.getConnection(jdbc_url, dbUser, dbPassword);

                    // SQL 쿼리 준비
                    String sql = "SELECT oname, id, pwd, role FROM login_test ";
                    preparedStatement = connection.prepareStatement(sql);

                    // SQL 실행 및 결과 가져오기
                    resultSet = preparedStatement.executeQuery();

                    while (resultSet.next()) {
                    	String oname = resultSet.getString("oname");
                        String id = resultSet.getString("id");
                        String pw = resultSet.getString("pwd");
                        String role = resultSet.getString("role");

                        // 그룹에 따라 다른 표시
                        String groupLabel = "";
                        if ("관리자".equals(role)) {
                            groupLabel = "관리자";
                        } else if ("교수".equals(role)) {
                            groupLabel = "교수";
                        } else if ("학생회".equals(role)) {
                            groupLabel = "학생회";
                        }
            %>
                        <tr class="center-table">
                        	<td><input type="checkbox" name="deleteIds" value="<%= id %>"></td>
                       		<td><%= oname %></td>
                            <td><%= id %></td>
                            <td><%= pw %></td>
                            <td><%= groupLabel %></td>
                        </tr>
            <%
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
            %>
        </table>
        <br/>
        <button type="button" onclick="openModal()" class="add_btn">추가</button>
        <input type="submit" value="삭제">
        </form>
    </center>
    </div>
    </div>
</body>
</html>
