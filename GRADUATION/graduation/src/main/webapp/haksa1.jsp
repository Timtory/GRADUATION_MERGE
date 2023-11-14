<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>

<head>

<script src="/docs/5.3/assets/js/color-modes.js"></script>


<meta charset="utf-8">
<title>학사 게시글 관리</title>

<link rel="canonical" href="https://getbootstrap.kr/docs/5.3/examples/sidebars/">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	
	<!--
	<link type="text/css" rel="stylesheet" href="/css/mainPage.css" />
	-->
	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

<link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">

	
<style>

@charset "UTF-8";

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

a {
	text-decoration: none;
}

.container {
	width: 1200px;
	margin: auto;

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

nav {
	background: #2ba0db;
}

nav ul {
	font-size: 0;
	margin-left: 200;
	padding: 0;
}

nav ul li {
	display: inline-block;
	position: relative;
}

nav ul li a {
	color: #fff;
	display: block;
	font-size: 14px;
	padding: 15px 14px;
	transition: 0.3s linear;
}

nav ul li:hover {
	background: #126d9b;
}

nav ul li ul {
	border-bottom: 5px solid #2ba0db;
	display: none;
	position: absolute;
	width: 250px;
}

nav ul li ul li {
	border-top: 1px solid #444;
	display: block;
}

nav ul li ul li:first-child {
	border-top: none;
}

nav ul li ul li a {
	background: #373737;
	display: block;
	padding: 10px 14px;
}

nav ul li ul li a:hover {
	background: #126d9b;
}

nav .fa.fa-angle-down {
	margin-left: 6px;
}

.asdf {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* 그림자 설정 */
	margin: 30px 30px;
	margin-top: 30px;
	border-radius: 10px;
}

.row {
height: 600px;
}

	.inside1 {
		
		border-radius: 10px;
		margin: 20px 10px 20px 20px;
		background: #1a7bd0;
	}

.inside1 a {
    color: white;
}

.inside1 .fs-5 {
    color: white;
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
            position: absolute;
            top: 550px;
            height: 50px;
            
        }

	.noticepart {
		width: 100%;
		height: 100%;
		padding-right: 40px;
		padding-top: 15px
	}
	
	.custom-padding {
	        margin: 20px 20px 20px 0px;
	    }


#noticeboardcontrol li {
	display: inline-block;
	text-align: center;
	padding: 5px;
	margin-left: 3px;
}

#noticeboardcontrol {
	display: inline-block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 0px;
	margin-left: 10px;
	margin-bottom: 30px;
}

.noticelook {
	display: inline-block;
	margin-left: 20px;
}

.noticelook p {
	display: inline-block;
	font-size: 20px;
	font-weight: bold;
}

.morelook {
	display: inline;
	margin-left: 700px;
}

.big_notice span {
	display: inline-block;
}

.big_notice span p {
	margin-left: 70px;
}

.notice_start {
	display: inline-block;
	margin-left: 40px;
}


.sc1 span {
	display: inline-block;
}

.notice_pic {
	display: inline-block;
	margin-left: 50px;
	border: 2px solid red;
	background-color: red;
	width: 50px;
	height: 20px;
	text-align: center;
}



.notify1 {
	 left: 10px;
}


.notify {
    width: 380px;
}
.notify12 {
    width: 60px;
    margin-left: 0px;
}
.notify123 {
    width: 90px;
    margin-left: 30px;
}
.notify1234 {
    width: 80px;
    margin-left: 30px;
}

#cb {
	margin-right: 20px;
}

.sc1 ul {
	list-style-type: none;
}





.board_page {
	margin-top: 30px;
	text-align: center;
	font-size: 0;
	display: inline-block;
	margin-left: 300px;
	margin-bottom: 500px;
}

.numbar {
    position: absolute; /* 절대 위치로 설정 */
    top: 620px; /* 아래로 배치할 위치를 조절합니다. */
    width: 1200px;
}

.board_page a {
	display: inline-block;
	width: 32px;
	height: 32px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-left: 0;
	line-height: 100%;
}

.board_page a.bt {
	padding-top: 10px;
	font-size: 1.2rem;
	letter-spacing: -1px;
}

.board_page a.num {
	padding-top: 9px;
	font-size: 1.4rem;
}

.board_page a.num.on {
	border-color: #000;
	background: #000;
	color: #fff;
}

.board_page a:first-child {
	border-left: 1px solid #ddd;
}


.btn_group {
	margin-left: 280px;
	position: absolute;
	padding-top: 30px;
}

.add_btn {
	margin-right: 15px;
	width: 50px;
	height: 30px;
}

.delete_btn {
	margin-right: 15px;
	width: 50px;
	height: 30px;
}

.ul2 li {
	font-size: 18px;
	margin-top: 10px;
}

.ul2 li img {
	width: 17px;
	height: 17px;
}

.btnbtn {
	margin-left: 7px;
	width:60px;
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


/* 너비가 1400px 이하일 때 .notify1234 클래스 숨기기 */
@media (max-width: 1400px) {
    span.notify1234 {
        display: none;
    }
}

/* 너비가 1200px 이하일 때 .notify123 클래스 숨기기 */
@media (max-width: 1200px) {
    span.notify123 {
        display: none;
    }
}

/* 너비가 996px 이하일 때 .notify12 클래스 숨기기 */
@media (max-width: 996px) {
    span.notify12 {
        display: none;
    }
}

@media (max-width: 995px) {
    span.notify1 {
        display: none;
    }
}



      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }
      .bd-mode-toggle {
        z-index: 1500;
      }
      
.searching1 {
    position: absolute;
    margin-left: 700px;
    height: 35px;
    width: 50px;
    margin-top: -15px;
}
.searching {
    position: absolute;
    margin-left: 520px;
    height: 35px;
    margin-top: -15px;
}

</style>
	
<script>
	function deletePost(post_id) {
		if (confirm("게시물을 삭제하시겠습니까?")) {
			// 선택된 게시물의 ID를 postId 필드에 설정
			document.getElementById("post_id").value = post_id;

			// 폼 제출
			document.getElementById("deleteForm").submit();
		}
	}
</script>

<script>
        function showPost(postId, title, author, ctime) {
            // 게시글 정보를 URL 매개변수로 조합하여 WriteShow.jsp로 이동
            var url = "postlook.jsp?post_id=" + postId +
                "&title=" + encodeURIComponent(title) +
                "&author=" + encodeURIComponent(author) +
                "&ctime=" + encodeURIComponent(ctime);

            window.location.href = url;
        }
        
    

    </script>
   

</head>

<body>


	<div class="container">
		<div class="asdf">
		
		
		<div class="row" style ="height:">
		<div class="col-3">
		

		

		<div class="inside1 flex-shrink-0 p-3">
			<a class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
      			<span class="fs-5 fw-semibold">카테고리</span>
    		</a>     
    		<ul class="list-unstyled ps-0">
    			<li class="mb-1">
        			<a href="suggestionView.jsp" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">
          			건의사항
        			</a>    
        		</li>
    			<li class="mb-1">
        			<a href="haksa1.jsp" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">
          			학사
        			</a>    
        		</li>
        		<li class="mb-1">
        			<a href="janghak1.jsp" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">
          			장학
        			</a>
      			</li>
      			<li class="mb-1">
        			<a href="haksang_dongari.jsp" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">
          			학생회&동아리
        			</a>
      			</li>
      			<li class="mb-1">
        			<a href="hubokhak.jsp" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">
          			휴복학
        			</a>
      			</li>
      			<li class="mb-1">
        			<a href="changup.jsp" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">
          			취창업
        			</a>
      			</li>
		      	<li class="mb-1">
		        	<a href="education_festival.jsp" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">
          			교육행사
        			</a>
		      	</li>
		      	
		      	<li class="mb-1">
				    <a id="gradebtn" class="gradebtn btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">
				        학년
				    </a>
			        <ul class="ul3">
			            <li><a href="gradeall.jsp">전체</a></li>
			            <li><a href="grade1.jsp">1학년</a></li>
			            <li><a href="grade2.jsp">2학년</a></li>
			            <li><a href="grade3.jsp">3학년</a></li>
			            <li><a href="grade4.jsp">4학년</a></li>
			        </ul>				    
				</li>
			</ul>
		</div>



		
		</div>
		

		<div class="col-9">
	
		<div class="flex-shrink-0 custom-padding">
			<div class="noticepart">
			
				<a class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
      				<span class="fs-5 fw-semibold">학사</span>
    			<div class="p-6 col-4 ms-auto input-group-sm ">
                        
                      	<div class="d-flex">
                          <input type="text" class="form-control form-control-dark text-bg-white" name="query" id="searchQuery" placeholder="검색" >
                        <button class="btn btn-outline-success" type="submit" onclick="performSearch()" style="margin-left:5px;">Search</button>
                        </div>
                       

                    </div>
			</a>   
			<script>
// 이벤트 핸들러 함수 정의
function handleKeyPress(event) {
    if (event.key === "Enter") { // Enter 키를 눌렀을 때
        performSearch(); // 검색 함수를 호출
    }
}

// 검색 함수 정의
function performSearch() {
    var query = document.getElementById("searchQuery").value;
    // 검색어를 가지고 검색 페이지로 이동하거나 검색을 수행하는 로직을 여기에 추가하세요.
    // 예를 들어, 검색 페이지로 이동: window.location.href = "검색 페이지 URL";
}

// Enter 키 이벤트를 검색 필드에 연결
document.getElementById("searchQuery").addEventListener("keypress", handleKeyPress);
</script>
			
			
			<section class="sc1">
				<%
				int totalPages = 0; // 바깥에서 totalPages를 선언하고 초기화

				int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
				int postsPerPage = 13;

				// MariaDB 연결 정보 설정
				String jdbcUrl = "jdbc:mariadb://localhost:3306/shinhan2023";
				String dbUser = "shinhan2023";
				String dbPassword = "tmdcks15!";

				Connection conn = null;
				PreparedStatement pstmt = null;

				try {
					// JDBC 드라이버 로드
					Class.forName("org.mariadb.jdbc.Driver");

					// 데이터베이스 연결
					conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

					String countQuery = "SELECT COUNT(*) AS totalPosts FROM jdbc_test where tag ='학사'";
					pstmt = conn.prepareStatement(countQuery);
					ResultSet countResult = pstmt.executeQuery();
					countResult.next();
					int totalPosts = countResult.getInt("totalPosts");
					totalPages = (int) Math.ceil((double) totalPosts / postsPerPage); // totalPages 계산

					int offset = (currentPage - 1) * postsPerPage;
                    String query = "SELECT post_id, title, author, ctime, tag, views FROM jdbc_test WHERE tag ='학사' ORDER BY ctime DESC LIMIT ? OFFSET ?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setInt(1, postsPerPage);
					pstmt.setInt(2, offset);
                    ResultSet resultSet = pstmt.executeQuery();

                    while (resultSet.next()) {
                        int postId = resultSet.getInt("post_id");
                        String title = resultSet.getString("title");
                        String author = resultSet.getString("author");
                        String ctime = resultSet.getString("ctime");
						String views = resultSet.getString("views");
                        
                        SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        SimpleDateFormat newFormat = new SimpleDateFormat("yyyy-MM-dd");
                        java.util.Date date = originalFormat.parse(ctime); // 변수명 변경
                        ctime = newFormat.format(date);
            %>	
            <form action="post_delete.jsp" method="post">
            		<ul style="top: 20px;">
						<li style="height: 20px;"><span class="notify1"><input
								type="checkbox" id="cb" name="selectedPosts" value="<%=postId%>"></span>
							<%
// 기존의 title 값을 가져옵니다.
String originalTitle = resultSet.getString("title");

// title이 35글자 이상이면 자릅니다.
String displayedTitle = (originalTitle.length() > 35) ? originalTitle.substring(0, 35) + "..." : originalTitle;
%>
							<span class="notify" title="<%=originalTitle%>"><a href="javascript:void(0);" onclick="showPost(<%=postId%>, '<%=title%>', '<%=author%>', '<%=ctime%>');"><%=displayedTitle%></a></span>

							<span class="notify12"><p><%=author%></p></span> <span
							class="notify123"><p><%=ctime%></p></span> <span
							class="notify1234"><p>
									조회수 :
									<%=views%></p></span></li>
					</ul>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (pstmt != null) {
                        pstmt.close();
                    }
                    if (conn != null) {
                    	conn.close();
                    }
                }
            %>
				</ul>
			</section>
			<section class="numbar">
				
				
					<div class="board_page">
						<a href="#" onclick="checkAndNavigateToPreviousPage()" class="btn btn-light"><</a>
						<%
						for (int i = 1; i <= totalPages; i++) {
						%>
						<a href="<%="haksa1.jsp?page=" + i%>"
							class="num <%=(i == currentPage) ? "on" : ""%>"><%=i%></a>
						<%
						}
						%>
						<a href="#" onclick="checkAndNavigateToNextPage()" class="btn btn-light">></a>
					</div>
			<span class="btn_group">
						<input type="button" class="btn btn-sm btn-warning"
							value="추가" onclick="checkLoggedInUser()">
						<input type="submit" class="btn btn-sm btn-warning" value="삭제"
							onclick="checkLoggedInUserAndSubmit(this.form)">
					</span>
				
				<script>
    function checkAndNavigateToPreviousPage() {
        var currentPage = <%= currentPage %>; // 현재 페이지를 JSP에서 가져옵니다.
        var previousPage = currentPage - 1;

        if (currentPage === 1) {
            alert("첫 페이지입니다.");
        } else {
            window.location.href = "haksa1.jsp?page=" + previousPage;
        }
    }
    
    function checkAndNavigateToNextPage() {
        var currentPage = <%= currentPage %>;
        var totalPages = <%= totalPages %>;

        if (currentPage === totalPages) {
            alert("마지막 페이지입니다.");
        } else {
            window.location.href = "haksa1.jsp?page=" + (currentPage + 1);
        }
    }
</script>
				



				<script>
    function checkLoggedInUser() {
        // JSP에서 세션에 저장된 사용자 정보를 JavaScript로 가져옵니다.
        var loggedInUserName = '<%=(String) session.getAttribute("loggedInUserName")%>';

        if (loggedInUserName == null || loggedInUserName =="null") {
        	// 사용자가 로그인하지 않은 경우 알림창을 띄웁니다.
            alert("추가하려면 먼저 로그인을 해주세요.");
            
        } else {
        	// 사용자가 로그인한 경우, "write1.jsp" 페이지로 이동합니다.
            window.location.href = "write1.jsp";
        }
    }
</script>

				<script>
    function checkLoggedInUserAndSubmit(form) {
        // JSP에서 세션에 저장된 사용자 정보를 JavaScript로 가져옵니다.
        var loggedInUserName = '<%=(String) session.getAttribute("loggedInUserName")%>';

        if (loggedInUserName == null || loggedInUserName == "null") {
            // 사용자가 로그인하지 않은 경우 알림창을 띄웁니다.
            alert("삭제하려면 먼저 로그인을 해주세요.");
        } else {
            // 사용자가 로그인한 경우, 폼을 제출합니다.
            form.submit();
        }
    }
</script>




			</section>
		</section>
	</div>
	<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	</form>

	<script>
        // 학년 클릭 시 ul3 보이게 하기
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
    function performSearch() {
        // 검색어를 입력하는 input 요소에서 값을 가져옵니다.
        var query = document.getElementById("searchQuery").value;

        // 검색어를 URL로 인코딩합니다.
        var encodedQuery = encodeURIComponent(query);

        // "search.jsp"로 이동하는 URL을 생성하고 검색어를 파라미터로 추가합니다.
        var searchUrl = "search_haksa.jsp?query=" + encodedQuery;

        // 생성된 URL로 이동합니다.
        window.location.href = searchUrl;
    }
</script>
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="sidebars.js"></script>

</body>

</html>