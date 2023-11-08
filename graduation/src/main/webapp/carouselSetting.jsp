<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐러셀 설정</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="/docs/5.3/assets/js/color-modes.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


<style>

.asdf {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* 그림자 설정 */
	margin: 30px 30px;
	margin-top: 30px;
	border-radius: 10px;
}
.container {
	width: 1200px;
	margin: auto;

}


.filebox .upload-name1 {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 500px;
    color: #999999;
}
.filebox .upload-name2 {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 500px;
    color: #999999;
}
.filebox .upload-name3 {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 500px;
    color: #999999;
}
.filebox .upload-name4 {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 500px;
    color: #999999;
}
.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
    width: 105px;
}
.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}
.filebox input[type="file1"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}
.filebox input[type="file2"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}
.filebox input[type="file3"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}
.filebox input[type="file4"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}
</style>



</head>
<body>
<script>
$(document).ready(function() {
    $("#file1").on('change', function () {
        var fileName1 = $("#file1").val().split('\\').pop(); // 파일명만 추출
        $(".upload-name1").val(fileName1);
    });

    $("#file2").on('change', function () {
        var fileName2 = $("#file2").val().split('\\').pop(); // 파일명만 추출
        $(".upload-name2").val(fileName2);
    });

    $("#file3").on('change', function () {
        var fileName3 = $("#file3").val().split('\\').pop(); // 파일명만 추출
        $(".upload-name3").val(fileName3);
    });

    $("#file4").on('change', function () {
        var fileName4 = $("#file4").val().split('\\').pop(); // 파일명만 추출
        $(".upload-name4").val(fileName4);
    });
});

    </script>
<div class="container">
<div class="asdf">
<center>
    <h1 class = "padding-top:20px;">케러셀 설정</h1>
    <h6>(이미지 파일만 설정가능)</h6>

    <hr />
    <br />
    <br />
    <%
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String jdbc_driver = "org.mariadb.jdbc.Driver";
			String jdbc_url = "jdbc:mariadb://localhost:3306/shinhan2023";
			String title1 = request.getParameter("title");

			try {
				Class.forName(jdbc_driver);
				conn = DriverManager.getConnection(jdbc_url, "shinhan2023", "tmdcks15!");

				String sql = "SELECT ca1, ca2, ca3, ca4 FROM carousel";

				pstmt = conn.prepareStatement(sql);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					
					String filelocation1 = rs.getString("ca1");
			        String fileName1 = new File(filelocation1).getName(); 
					
			        String filelocation2 = rs.getString("ca2");
			        String fileName2 = new File(filelocation2).getName(); 
			        
			        String filelocation3 = rs.getString("ca3");
			        String fileName3 = new File(filelocation3).getName(); 
			        
			        String filelocation4 = rs.getString("ca4");
			        String fileName4 = new File(filelocation4).getName(); 
					
			
			%>
			
			
    
    <div style="width: 800px; height: 700px;">
       <form action="carousel.do" method="post" enctype="multipart/form-data">
            <div class="filebox" style="margin-top:30px;">
    		<input class="upload-name1" value="<%= fileName1 %>" placeholder="<%= fileName1 %>">
    		<label for="file1">파일찾기</label> 
    		<input type="file" name="carouselfile1" id="file1" accept="image/*">
			</div>
            
            <div class="filebox"  style="margin-top:30px;">
    		<input class="upload-name2" value="<%= fileName2 %>" placeholder="<%= fileName2 %>">
    		<label for="file2">파일찾기</label> 
    		<input type="file" name="carouselfile2" id="file2" accept="image/*">
			</div>
			
			<div class="filebox" style="margin-top:30px;">
    		<input class="upload-name3" value="<%= fileName3 %>" placeholder="<%= fileName3 %>">
    		<label for="file3">파일찾기</label> 
    		<input type="file" name="carouselfile3" id="file3" accept="image/*">
			</div>
			
			<div class="filebox" style="margin-top:30px;">
    		<input class="upload-name4" value="<%= fileName4 %>" placeholder="<%= fileName4%>">
    		<label for="file4">파일찾기</label> 
    		<input type="file" name="carouselfile4" id="file4" accept="image/*">
			</div>
            
            <br> <input style="margin-top:30px;" type="submit" class="btn btn-sm btn-warning" value="수정">
        </form>
    </div>
    <%
	} else {
	out.println("<p>게시글을 찾을 수 없습니다.</p>");
	}
	} catch (Exception e) {
	out.println("오류 발생: " + e.getMessage());
	} finally {
	if (rs != null) {
	rs.close();
	}
	if (pstmt != null) {
	pstmt.close();
	}
	if (conn != null) {
	conn.close();
	}
	}
	%>
</center>
</div>
</div>


</body>
</html>