<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="org.apache.commons.net.ftp.FTP, org.apache.commons.net.ftp.FTPClient" %>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>신한대학교 소프트웨어융합학과 홈페이지</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link type="text/css" rel="stylesheet" href="/css/mainPage.css" />
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

<style>
#titletext:hover {
    text-decoration: underline;
}

.nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
        wieght: 1000px;
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
        wieght: 1000px;
      }
      
 .nav-link {
    color: white;
}
      
  .small-font {
    font-size: 12px; /* Adjust the font size as needed */
}
   
      
      
      
</style>


</head>
<body>

<script>
    // Enter 키 눌렀을 때 검색 실행
    function handleSearch(event) {
        if (event.key === "Enter") {
            performSearch();
        }
    }

    function performSearch() {
        // 검색어를 입력하는 input 요소에서 값을 가져옵니다.
        var query = document.getElementById("searchQuery").value;

        // 검색어를 URL로 인코딩합니다.
        var encodedQuery = encodeURIComponent(query);

        // "search.jsp"로 이동하는 URL을 생성하고 검색어를 파라미터로 추가합니다.
        var searchUrl = "search_Student_Real.jsp?query=" + encodedQuery;

        // 생성된 URL로 이동합니다.
        window.location.href = searchUrl;
    }
 
</script>

<script>
        function showPost(postId, title, author, ctime) {
            // 게시글 정보를 URL 매개변수로 조합하여 WriteShow.jsp로 이동
            var url = "postlook_index.jsp?post_id=" + postId +
                "&title=" + encodeURIComponent(title) +
                "&author=" + encodeURIComponent(author) +
                "&ctime=" + encodeURIComponent(ctime);

            window.location.href = url;
        }
    </script>


  <header class="p-3 text-dark" style="background-color:#1a7bd0;">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="index.jsp" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <img src="/img/symbol.png" alt="신한대학교" width="50" height="50">
        </a>

        <ul class="nav ml-lg-2 col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
        	<li class="nav-item">
          		<a class="nav-link" href="hotreal.jsp">인기게시글</a>
        	</li>
        	<li class="nav-item dropdown">
          		<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">
          		카테고리</a>
          		<ul class="dropdown-menu">
          		  <li><a class="dropdown-item" href="totallist_Student_Real.jsp">전체 게시판</a></li>
			      <li><a class="dropdown-item" href="haksa_Student_Real.jsp">학사</a></li>
			      <li><a class="dropdown-item" href="janghak_Student_Real.jsp">장학</a></li>
			      <li><a class="dropdown-item" href="haksang_dongari_Student_Real.jsp">학생회&동아리</a></li>
			      <li><a class="dropdown-item" href="hubokhak_Student_Real.jsp">휴복학</a></li>
			      <li><a class="dropdown-item" href="changup_Student_Real.jsp">취창업</a></li>
			      <li><a class="dropdown-item" href="education_festival_Student_Real.jsp">교육행사</a></li>
			    </ul>
        	</li>
        	<li class="nav-item dropdown">
          		<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">
          		학년</a>
          		<ul class="dropdown-menu">
			      <li><a class="dropdown-item" href="grade1_Student_Real.jsp">1학년</a></li>
			      <li><a class="dropdown-item" href="grade2_Student_Real.jsp">2학년</a></li>
			      <li><a class="dropdown-item" href="grade3_Student_Real.jsp">3학년</a></li>
			      <li><a class="dropdown-item" href="grade4_Student_Real.jsp">4학년</a></li>
			    </ul>
        	</li>
        	<li class="nav-item dropdown">
          		<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">
          		학교</a>
          		<ul class="dropdown-menu">
			      <li><a class="dropdown-item" href="https://www.shinhan.ac.kr/sites/kr/index.do" target="_blank">신한대학교 홈페이지</a></li>
			      <li><a class="dropdown-item" href="https://cyber.shinhan.ac.kr/login.php" target="_blank">사이버캠퍼스</a></li>
			      <li><a class="dropdown-item" href="https://stins.shinhan.ac.kr/irj/portal" target="_blank">종합정보시스템</a></li>
			    </ul>
        	</li>
        	<li class="nav-item">
          		<a class="nav-link" href="homework_Student_View_Real.jsp">파일제출</a>
        	</li>
        	<li class="nav-item">
          		<a class="nav-link" href="student_write_suggestion_Real.jsp">건의사항</a>
        	</li>
        </ul>

        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search" action="search_Student_Real.jsp" method="get" name="searchForm">
          <input  type="text" class="form-control form-control-dark text-bg-white" id="searchQuery" name="query" placeholder="Enter로 검색" aria-label="Search" onkeydown="handleSearch(event)">
        </form>



		<div class="user-info">
                <%
                    String loggedInUserName = (String) session.getAttribute("loggedInUserName");

                    if (loggedInUserName != null) { %> 
                        <p style="color: white; font-weight: bold;"><%= loggedInUserName %>님 환영합니다.</p>
                        <a class="btn btn-success" href="total_listReal.jsp" role="button">편집</a>
                        <a class="btn btn-warning" href="LogoutServlet" role="button">로그아웃</a>
                        
                    <% } else { %>
                        <div class="text-end">
          				<a class="btn btn-warning" href="login.html" role="button">로그인</a>
        				</div>
                    <% }	
                %>
            </div>

      </div>
      
      
    </div>
  </header>
  
  <!--  
  <div class="container">
  <div class="nav-scroller py-1 mb-3 border-bottom">
    <nav class="nav nav-underline justify-content-between">
      <a class="nav-item nav-link link-body-emphasis" href="totallist_Student_Real.jsp">전체게시판</a>
      <a class="nav-item nav-link link-body-emphasis" href="hotreal.jsp">인기게시글</a>
      <a class="nav-item nav-link link-body-emphasis" href="haksa_Student_Real.jsp">학사</a>
      <a class="nav-item nav-link link-body-emphasis" href="janghak_Student_Real.jsp">장학</a>
      <a class="nav-item nav-link link-body-emphasis" href="haksang_dongari_Student_Real.jsp">학생회&동아리</a>
      <a class="nav-item nav-link link-body-emphasis" href="hubokhak_Student_Real.jsp">휴복학</a>
      <a class="nav-item nav-link link-body-emphasis" href="changup_Student_Real.jsp">취창업</a>
      <a class="nav-item nav-link link-body-emphasis" href="education_festival_Student_Real.jsp">교육행사</a>
      <a class="nav-item nav-link link-body-emphasis" href="gradeall_Student_Real.jsp">학년별게시판</a>
    </nav>
  </div>
  </div>
  -->



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
<div class="container mt-4">
	<!-- 큰 화면에서는 가로로 배치 -->
	<div class="row">
        <div class="col-md-6">
			<div id="carousel" class="carousel slide" data-bs-ride="carousel" style="margin: 20px;">
  				<div class="carousel-indicators">
    			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
  			</div>
  		<div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<%=imageUrl1 %>" class="d-block w-100" alt="first 1" style="max-width: 636px; max-height: 500px;">
    </div>
    <div class="carousel-item">
      <img src="<%=imageUrl2 %>" class="d-block w-100" alt="second 2" style="max-width: 636px; max-height: 500px;">
    </div>
    <div class="carousel-item">
      <img src="<%=imageUrl3 %>" class="d-block w-100" alt="third 3" style="max-width: 636px; max-height: 500px;">
    </div>
    <div class="carousel-item">
      <img src="<%=imageUrl4 %>" class="d-block w-100" alt="forth 4" style="max-width: 636px; max-height: 500px;">
    </div>
  	</div>
  	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    	<span class="visually-hidden">Previous</span>
  	</button>
  	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
    	<span class="visually-hidden">Next</span>
  	</button>
			</div>
		
		<div class="row m-2">
		  <div class="col-sm-6 mb-3">
		    <div class="card">
		      <div class="card-body">
		        <h5 class="card-title">파일제출</h5>
		        <p class="card-text">아래의 바로가기 버튼 누르면 과제 제출 페이지로 넘어갑니다</p>
		        <a href="homework_Student_View_Real.jsp" class="btn btn-secondary">바로가기</a>
		      </div>
		    </div>
		  </div>
		  <div class="col-sm-6">
		    <div class="card">
		      <div class="card-body">
		        <h5 class="card-title">건의사항</h5>
		        <p class="card-text">아래의 바로가기 버튼 누르면 건의사항 페이지로 넘어갑니다</p>
		        <a href="student_write_suggestion_Real.jsp" class="btn btn-secondary">바로가기</a>
		      </div>
		    </div>
		  </div>
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
    
            
        
		<div class="col-md-6" style="padding:20px;">
			<div class="row">
        		<div class="col-md-12">
    				<div class="position-relative p-3 text-center">
    				
    				<div class="row row-cols-1 row-cols-md-2 mb-2 text-center">
				      <div class="col">
				        <div class="card mb-4 rounded-3 shadow-sm">
				          <div class="card-header py-3">
				            <h4 class="my-0 fw-normal">🔥인기게시글</h4>
				          </div>
				          <div class="card-body">
                                <div class="row">
                                    <div class="col-2">
                                        <ul class="list-unstyled mt-3 mb-4">
                                        <%
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

					
					String query = "SELECT recommand FROM jdbc_test " +
				              "WHERE ctime >= DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 WEEK) AND recommand >= 10 " +
				              "ORDER BY recommand DESC LIMIT 6";

					pstmt = conn.prepareStatement(query);
					ResultSet resultSet = pstmt.executeQuery();

					while (resultSet.next()) {
						int recommand = resultSet.getInt("recommand");

				%>
                                            <li style="margin-bottom: 3px; background-color: #FF9999; color: white;">
    <span class="<%= recommand >= 100 ? "small-font" : "" %>">
        <%= recommand %>
    </span>
</li>
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
                                    </div>
                                    <div class="col-10">
                                        <ul class="list-unstyled mt-3 mb-4">
                    <%
				// MariaDB 연결 정보 설정
				String jdbcUrl3 = "jdbc:mariadb://localhost:3306/shinhan2023";
				String dbUser3 = "shinhan2023";
				String dbPassword3 = "tmdcks15!";

				Connection conn3 = null;
				PreparedStatement pstmt3 = null;

				try {
					// JDBC 드라이버 로드
					Class.forName("org.mariadb.jdbc.Driver");

					// 데이터베이스 연결
					conn3 = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

					
					String query = "SELECT post_id, title, author, ctime FROM jdbc_test " +
				              "WHERE ctime >= DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 WEEK) AND recommand >= 10 " +
				              "ORDER BY recommand DESC LIMIT 6";
					pstmt3 = conn3.prepareStatement(query);
					ResultSet resultSet3 = pstmt3.executeQuery();

					while (resultSet3.next()) {
						String postId = resultSet3.getString("post_id");
						String title = resultSet3.getString("title");
						String author = resultSet3.getString("author");
						String ctime = resultSet3.getString("ctime");
						
						if (title.length() > 12) {
					        title = title.substring(0, 12) + "...";
					    }

				%>                    
                                            <li class="text-start" id="titletext" style="margin-bottom: 3px;"><a href="javascript:void(0);"
								onclick="showPost(<%=postId%>, '<%=title%>', '<%=author%>', '<%=ctime%>');" style="color: black;  text-decoration: none;  cursor: pointer;"><%=title%></a></li>
                                            <%
					}
					} catch (Exception e) {
					e.printStackTrace();
					} finally {
					if (pstmt3 != null) {
					pstmt.close();
					}
					if (conn3 != null) {
					conn.close();
					}
					}
					%>
                                        </ul>
                                    </div>
                                </div>
                                <button type="button" class="w-100 btn btn-lg btn-secondary" id="hotButton">바로가기</button>
                            </div>
				        </div>
				        
				       
				        
				      </div>
				      <div class="col">
				        <div class="card mb-4 rounded-3 shadow-sm">
				          <div class="card-header py-3">
				            <h4 class="my-0 fw-normal">📅최신게시글</h4>
				          </div>
				          <div class="card-body">
                                <div class="row">
                                    <div class="col-2">
                                        <ul class="list-unstyled mt-3 mb-4">
                                        <%
				// MariaDB 연결 정보 설정
				String jdbcUrl4 = "jdbc:mariadb://localhost:3306/shinhan2023";
				String dbUser4 = "shinhan2023";
				String dbPassword4 = "tmdcks15!";

				Connection conn4 = null;
				PreparedStatement pstmt4 = null;

				try {
					// JDBC 드라이버 로드
					Class.forName("org.mariadb.jdbc.Driver");

					// 데이터베이스 연결
					conn4 = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

					
					String query = "SELECT recommand FROM jdbc_test ORDER BY ctime DESC LIMIT 6";
					pstmt4 = conn4.prepareStatement(query);
					ResultSet resultSet4 = pstmt4.executeQuery();

					while (resultSet4.next()) {
						int recommand = resultSet4.getInt("recommand");

				%>
                                            <li style="margin-bottom: 3px; background-color: #FF9999; color: white;">
    <span class="<%= recommand >= 100 ? "small-font" : "" %>">
        <%= recommand %>
    </span>
</li>
                                            <%
					}
					} catch (Exception e) {
					e.printStackTrace();
					} finally {
					if (pstmt != null) {
					pstmt4.close();
					}
					if (conn != null) {
					conn4.close();
					}
					}
					%>
                                        </ul>
                                    </div>
                                    <div class="col-10">
                                        <ul class="list-unstyled mt-3 mb-4">
                                        
                                        <%
				// MariaDB 연결 정보 설정
				String jdbcUrl5 = "jdbc:mariadb://localhost:3306/shinhan2023";
				String dbUser5 = "shinhan2023";
				String dbPassword5 = "tmdcks15!";

				Connection conn5 = null;
				PreparedStatement pstmt5 = null;

				try {
					// JDBC 드라이버 로드
					Class.forName("org.mariadb.jdbc.Driver");

					// 데이터베이스 연결
					conn5 = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

					
					String query = "SELECT post_id ,title, author, ctime FROM jdbc_test ORDER BY ctime DESC LIMIT 6";
					pstmt5 = conn5.prepareStatement(query);
					ResultSet resultSet5 = pstmt5.executeQuery();

					while (resultSet5.next()) {
						String postId = resultSet5.getString("post_id");
						String title = resultSet5.getString("title");
						String author = resultSet5.getString("author");
						String ctime = resultSet5.getString("ctime");
						
						if (title.length() > 12) {
					        title = title.substring(0, 12) + "...";
					    }

				%>      
                                            <li class="text-start" id="titletext" style="margin-bottom: 3px;"><a href="javascript:void(0);"
								onclick="showPost(<%=postId%>, '<%=title%>', '<%=author%>', '<%=ctime%>');" style="color: black;  text-decoration: none;  cursor: pointer;"><%=title%></a></li>
								<%
					}
					} catch (Exception e) {
					e.printStackTrace();
					} finally {
					if (pstmt != null) {
					pstmt5.close();
					}
					if (conn != null) {
					conn5.close();
					}
					}
					%>
                                        </ul>
                                    </div>
                                </div>
                                <button type="button" class="w-100 btn btn-lg btn-secondary" id="totalButton">바로가기</button>
                            </div>
				        </div>
				      </div>
				      
				    </div>	
				    				
    					
					
				
</div>
				</div>
	 <%
        // JDBC 연결 정보 설정
        String url1 = "jdbc:mariadb://localhost:3306/shinhan2023";
        String user1 = "shinhan2023";
        String password1 = "tmdcks15!";
    
        Connection connection1 = null;
        Statement statement1 = null;
    
        try {
            // JDBC 드라이버 로드
            Class.forName("org.mariadb.jdbc.Driver");
        
            // 데이터베이스 연결
            connection1 = DriverManager.getConnection(url1, user1, password1);
        
            // SQL 쿼리 작성
            String query1 = "SELECT s1, s2, s3 FROM weekly"; // WHERE 절에 원하는 조건을 추가하세요.
        
            statement1 = connection1.createStatement();
        
            // 쿼리 실행
            ResultSet resultSet = statement1.executeQuery(query1);
        
            if (resultSet.next()) {
                // 쿼리 결과에서 s1, s2, s3 값을 가져옴
                String s1 = resultSet.getString("s1");
                String s2 = resultSet.getString("s2");
                String s3 = resultSet.getString("s3");
    %>
			<div class="col m-3">
				<div class="card">
				  <div class="card-header">
				    이번주 주요일정
				  </div>
				  <div class="card-body">
				    <blockquote class="blockquote mb-0">
				      <p class="text-start">- <%= s1 %></p>
				      <p class="text-start">- <%= s2 %></p>
				      <p class="text-start">- <%= s3 %></p>
					</blockquote>
				  </div>
				</div>
			</div>
				
				
				
    			<%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 연결과 리소스 해제
            if (statement1 != null) {
            	statement1.close();
            }
            if (connection1 != null) {
            	connection1.close();
            }
        }
    %>   
    		</div>
		</div>
	</div>
</div>


    
<div class="container">
  <footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="https://www.shinhan.ac.kr/sites/kr/index.do" class="nav-link px-2 text-body-secondary">Home</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Features</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Pricing</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">FAQs</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About</a></li>
    </ul>
    <p class="text-center text-body-secondary">신한대학교 소프트웨어융합학과</p>
  </footer>
</div>


<div id="frogue-container" class="position-right-bottom"
data-chatbot="fa4ad435-48dc-4bed-ba40-b02848ed6ffd"
data-service-type=""
data-user="사용자ID"
data-init-key="value"
data-close-use="Y" data-close-bgcolor="#ffffff" data-close-linecolor="#000000"
data-move-use="Y" data-move-bgcolor="#ffffff" data-move-linecolor="#000000"
></div>
<!-- data-init-식별키=값 으로 셋팅하면 챗플로우에 파라미터와 연동가능. 식별키는 소문자만 가능 -->
<!-- data 속성 매뉴얼 https://doc.danbee.ai/channel_frogu.html -->
<script>
(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "https://frogue.danbee.ai/js/embed/v20220906/frogue-embed.min.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'frogue-embed'));
</script>


<script>
document.addEventListener("DOMContentLoaded", function() {
    var hotButton = document.getElementById("hotButton");

    if (hotButton) {
        hotButton.addEventListener("click", function() {
            // 버튼 클릭 시 "hotreal.jsp"로 이동
            window.location.href = "hotreal.jsp";
        });
    }
});

document.addEventListener("DOMContentLoaded", function() {
    var totalButton = document.getElementById("totalButton");

    if (totalButton) {
        totalButton.addEventListener("click", function() {
            // 버튼 클릭 시 "totalist_Student_Real.jsp"로 이동
            window.location.href = "totallist_Student_Real.jsp";
        });
    }
});
</script>



        
</body>

</html>

