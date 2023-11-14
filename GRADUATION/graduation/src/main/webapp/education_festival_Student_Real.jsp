<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>교육행사 게시글</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	
	<!--
	<link type="text/css" rel="stylesheet" href="/css/mainPage.css" />
	-->
	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>


	<style>
		@charset "UTF-8";
        @import url(https://fonts.googleapis.com/css?family=Roboto:400,700,500);

        /* main Styles */

        html {
            box-sizing: border-box;
        }

        *,
        *:before,
        *:after {
            box-sizing: inherit;
        }

        body {
            background: #fafafa;
            font-family: "Roboto", sans-serif;

            margin: 0;
        }

        a {
            text-decoration: none;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            padding: center;
        }

        .img1 {
            position: absolute;
            width: 160px;
            height: 49px;
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
            /* 변경 */
        }

        nav {
            background: #2ba0db;
            margin-right: 200;
        }

        nav ul {
            font-size: 0;
            margin-left: 200;
            /* 변경 */
            padding: 0;
            color: white;
        }

        nav ul li {
            display: inline-block;
            position: relative;
            /* 변경 */
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
        
        .loginname {
        	position: absolute;
        	top: 0px;
        	right: 80px;
    	}
    
    
    	#login_img {
        	width: 30px;
        	height: 30px;
        	position: absolute;
        	top: 10px;
        	right: 20px;
    	}
    
    	#link {
    		width: 13px;
    		height: 13px;
    		margin-left: 5px;
    	}

        /* 반응형 스타일 추가 */
        @media (max-width: 768px) {
            .container {
                padding: 0 10px;
            }

            h1 {
                margin-top: 20px;
            }

            .img1 {
                width: 120px;
                height: 37px;
            }

            nav ul {
                margin-left: 0;
                text-align: center;
                /* 변경 */
            }

            nav ul li {
                display: inline-block;
                margin: 0 10px;
            }
        }
        
        
        
        
        
        .nav-link.active {
    		color: white; /* 흰색으로 글자 색 변경 */
		}
		
		.nav-link {
    		color: white; /* 흰색으로 글자 색 변경 */
		}
		
		.nav-link.dropdown {
    		color: white; /* 흰색으로 글자 색 변경 */
		}
        
        
		
	</style>
   
</head>

<body>
<header class="p-3 text-dark" style="background-color:#1a7bd0;">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="index.jsp" class="d-flex align-items-center mb-2 mb-lg-0 mr-lg-4 text-white">
          <img src="img/symbol.png" alt="신한대학교" width="50" height="50">
        </a>

        <ul class="nav ml-lg-2 col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
        	<li class="nav-item">
          		<a class="nav-link" href="hotreal.jsp">인기게시글</a>
        	</li>
        	<li class="nav-item dropdown">
          		<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">
          		태그별 게시판</a>
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
          		학년별 게시판</a>
          		<ul class="dropdown-menu">
			      <li><a class="dropdown-item" href="grade1_Student_Real.jsp">1학년</a></li>
			      <li><a class="dropdown-item" href="grade2_Student_Real.jsp">2학년</a></li>
			      <li><a class="dropdown-item" href="grade3_Student_Real.jsp">3학년</a></li>
			      <li><a class="dropdown-item" href="grade4_Student_Real.jsp">4학년</a></li>
			    </ul>
        	</li>
        	<li class="nav-item dropdown">
          		<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">
          		학교 홈페이지</a>
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




<iframe id="educationFrame" src="education_festival_Student.jsp" height = "800" width="100%" frameborder="0"></iframe>

   

  <script>
      $('nav li').hover(
         function () {
            $('ul', this).stop().slideDown(200);
         },
         function () {
            $('ul', this).stop().slideUp(200);
         }
      );
   </script>


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

</body>
</html>
