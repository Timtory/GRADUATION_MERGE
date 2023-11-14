<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<html>

<head>
<meta charset="utf-8">
<title>건의사항 게시판</title>
<link rel="stylesheet"
    href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">

<!-- Bootstrap 및 Summernote CSS 및 JS 링크 추가 -->
<link
    href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    rel="stylesheet">
<link
    href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.css"
    rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
    src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="lang/summernote-ko-KR.js"></script>
<link href="summernote.css" rel="stylesheet">
<script src="summernote.min.js"></script>

<script>
    // Summernote 초기화
    $(document)
        .ready(
            function() {
                $('#summernote')
                    .summernote(
                        {
                            lang : 'ko-KR',
                            height : 140,
                            placeholder : '내용을 입력하세요',
                            toolbar : [
                                [ 'style', [ 'style' ] ],
                                [
                                    'font',
                                    [
                                        'bold',
                                        'italic',
                                        'underline',
                                        'clear' ] ],
                                [ 'fontname',
                                    [ 'fontname' ] ],
                                [ 'fontsize',
                                    [ 'fontsize' ] ],
                                [ 'color', [ 'color' ] ],
                                [
                                    'para',
                                    [ 'ul', 'ol',
                                        'paragraph' ] ],
                                [ 'height', [ 'height' ] ],
                                [ 'table', [ 'table' ] ],
                                [
                                    'insert',
                                    [ 'link',
                                        'picture',
                                        'video' ] ] ],
                            callbacks : {
                                onChange : function(contents,
                                        $editable) {
                                    // 에디터 내용을 textarea에 복사
                                    $('#summernote').val(
                                        contents); // ID 수정
                                }

                            }
                        });
            });
</script>

<style>
@charset "UTF-8";

@import url(style.css);

@import url(media.css);

@import url(https://fonts.googleapis.com/css?family=Roboto:400,700,500);

/* main Styles */
html {
    box-sizing: border-box;
}

*, *:before, *:after {
    box-sizing: inherit;
}

body {
    background: #fafafa;
    font-family: "Roboto", sans-serif;
    font-size: 14px;
    margin: 0;
}

.noticelook {
    display: inline-block;
    margin-left: 20px;
    height: 60px;
}

.allpost {
    display: inline-block;
    font-size: 20px;
    font-weight: bold;
    margin-top: 15px;
}

a {
    text-decoration: none;
}

.container {
    width: 1000px;
    margin: auto;
    position: center;
    height: auto;
}

.img1 {
    width: 160px;
    height: 49px;
    position: absolute;
}

h1 {
    text-align: center;
    margin-top: 150px;
}

/* Navigation Styles */
#ul1 {
    text-align: center;
}

ul1 li {
    display: inline-block;
}
.asdf {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* 그림자 설정 */
	margin: 30px 30px;
	margin-top: 30px;
	border-radius: 10px;
	width:1000px;
	height:600px;
        }

.inside1 {
    border: 1px solid black;
    width: 200px;
    height: 550px;
    float: left;
    margin: 30px;
}

.notice_write {
    border: 2px solid black;
}

.ul2 {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 20px;
}

.inside2 {
    border: 1px solid black;
    margin: 10px;
    width: 500px;
    height: 500px;
}

.inside1 ul li {
    list-style-type: none;
}

.inside1 ul li a {
    text-decoration-line: none;
}

.boardimg {
    width: 10px;
    height: 11px;
    margin-right: 5px;
}

.inside_under {
    position: relative;
    margin-top: 240px;
    height: 50px;
    border-top: 1px solid black;
}

.noticepart {
  
    
    margin-top: 30px;
    height: 550px;
    width: 850px;
}

.ckbox {
    margin-left: 170px;
    margin-top: 20px;
    display: inline-block;
}

.ckbox p {
    display: inline-block;
    margin-right: 15px;
    margin-left: 3px;
}

.boardwrite {
    margin: 20px;
    width: 800px;
    height: 300px;
}



.checkbox12 {
    margin-left: 30px;
    display: inline-block;
}

.checkbox1 {
    width: 30px;
    height: 30px;
    display: inline-block;
}

.writetable {
    width: 100%;
    border: 1px black solid;
}

.noticealert {
    position: relative;
    display: inline-block;
    text-align: center;
    font-size: 20px;
    top: -7px;
    padding-left: 15px;
}

.noticepart {
   
    
    margin-top: 30px;
    min-height: 500px; /* 최소 높이를 조정하세요 */
    max-height: 600px; /* 최대 높이를 조정하세요 */
    overflow-y: auto; /* 내용이 넘칠 경우 스크롤 표시 */
    width: 850px;
}

.notify {
	width: 280px;
	 
}

.notify1 {
	 left: 10px;
}


.notify12 {
	 width: 120px;
	 margin: -100px;
	 
	 
}

.notify123 {
	width:230px;
	margin-left:120px;
	
}

.notify1234{
	width: 140px;
    margin-left: -70px; 
}

.btn_group {
    margin-left: 280px;
    position: absolute;
    padding-top: 30px;
}

.update_btn {
    margin-right: 10px;
}

.ul2 li {
    font-size: 18px;
    margin-top: 10px;
}

.ul2 li img {
    width: 17px;
    height: 17px;
}

#txt2 {
    width: 300px;
    height: 300px;
}

.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    border-radius: 5px;
}

h1 {
    font-size: 24px;
    margin-bottom: 10px;
}

.post-meta {
    display: flex; /* 가로로 배치하기 위해 flex 사용 */
    font-size: 14px;
    color: #777;
    position: relative;
    top: -30px;
}

.post-meta-item {
    margin-right: 20px; /* 아이템 간격 조절 */
}

.post-content {
    font-size: 16px;
    line-height: 1.6;
    position: relative;
    top: -150px;
}

.maincontents {
    text-align: center;
}

.upper {
    position: relative;
    top: -130px; /* 원하는 만큼 조정하여 위로 이동시킵니다. */
}

.ul3 {
            display: none;
        }
/* ul3를 보여주는 스타일 */
.ul3.show {
	display: block;
	animation: slide-down 0.5s ease;
}

@keyframes slide-down {
	0% {
		opacity: 0;
		transform: translateY(-10px);
	}

	100% {
		opacity: 1;
		transform: translateY(0);
	}
}

.cancle_btn {
	position: absolute;
	right: 255px;
	top : 650px;
}

.chumbu {
        
			display:flex;
        	margin-top: 145px;
        }
        
        .chumbufile {
            font-size: 13px;
            color: #777;
            margin-left: 40px;
        }
        
        .chumbufilebtn {
        font-size:13px;
        margin-left: 30px;
        	    width: 70px;
    height: 30px;
        	
            
        }
</style>

</head>

<body>
<center>
    <div class="asdf">
        
        <%
            String listPageURL = "suggestionView.jsp";
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String jdbc_driver = "org.mariadb.jdbc.Driver";
            String jdbc_url = "jdbc:mariadb://localhost:3306/shinhan2023";
            String post_id = request.getParameter("post_id");
            String title1 = request.getParameter("title");
            String author = request.getParameter("author");
            
        %>
        <%
            try {
                Class.forName(jdbc_driver);
                conn = DriverManager.getConnection(jdbc_url, "shinhan2023", "tmdcks15!");

               

                String sql = "SELECT post_id, author, title, contents, ctime, filelocation FROM suggestion WHERE post_id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, post_id);
                

                rs = pstmt.executeQuery();

                while (rs.next()) {
                    String postTitle = rs.getString("title");
                    String postContents = rs.getString("contents");
                    String ctime = rs.getString("ctime");
                    String filelocation = rs.getString("filelocation");
                    String fileName = (filelocation != null && !filelocation.equals("/tomcat/webapps/upload/")) ? new File(filelocation).getName() : "파일없음";

                    
        %>
                    <div>
                        <section class="noticepart">
                            <div class="container">
                                <div class="upper">
                                    <h1 class="title1"><%= postTitle %></h1>
                                    <hr />
                                    <br /> <span class="post-meta">
                                        <p class="post-meta-item">작성자: <%= author %></p>
                                        <p class="post-meta-item">작성일: <%= ctime %></p>
                                        <p class="post-meta-item">글번호 : <%= rs.getInt("post_id") %></p>
                                    </span>
                                </div>
                                <div class="post-content">
                                    <p class="maincontents"><%= postContents %></p>
                                </div>
                            </div>
                           <%
if (fileName != null && !fileName.equals("파일없음") ) {
%>
<span class="chumbu">
    <p class="chumbufile">첨부 파일 : <%= fileName %></p>
    <button class="chumbufilebtn" id="downloadButton" onclick="downloadFile('<%= filelocation %>')">다운로드</button>
</span>
<%
}
%>
                        </section>
                    </div>
        <%
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
        
        <div class = "btn1">
            <a class="cancle_btn1" href="<%= listPageURL %>">
                <input type="button" class="cancle_btn" value="목록보기" />
            </a>
        </div>
        
    </div>
    </center>
    <script>
        document.getElementById('gradebtn').addEventListener('click', function () {
            var ul3 = document.querySelector('.ul3');
            if (ul3.classList.contains('show')) {
                ul3.classList.remove('show');
            } else {
                ul3.classList.add('show');
            }
        });
    </script>
    
    <script>
    // 클릭한 파일을 FTP 서버로부터 다운로드
    function downloadFile(filelocation) {
        // 파일 경로에서 파일명 추출
        var fileName = filelocation.split('/').pop();
        
        // 다운로드 링크 생성
        var downloadLink = document.createElement("a");
        downloadLink.href = "download.jsp?filelocation=" + filelocation; // download.jsp는 파일 다운로드를 처리하는 서블릿 또는 페이지로 대체
        downloadLink.download = fileName;
        downloadLink.style.display = "none";
        document.body.appendChild(downloadLink);
        downloadLink.click();
        document.body.removeChild(downloadLink);
    }
</script>
    
</body>


</html>
