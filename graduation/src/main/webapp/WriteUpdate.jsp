<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("utf-8");
%>
<html>

<head>
    <meta charset="utf-8">
    <title>게시글 수정</title>
    	
	    
	    
	<!-- 추가 코드 -->    
	    
<link rel="canonical" href="https://getbootstrap.kr/docs/5.3/examples/sidebars/">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
	    
	    
	    
	    
	    
	    <!--  기존 코드 -->
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">

<!-- 
 <link type="text/css" rel="stylesheet" href="css/write1.css" />
 --> 

<!-- Bootstrap 및 Summernote CSS 및 JS 링크 추가 -->

	
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.css" rel="stylesheet">

	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


	
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src="lang/summernote-ko-KR.js"></script>
	<link href="summernote.css" rel="stylesheet">
	<script src="summernote.min.js"></script>

	<link href="summernote-bs5.css" rel="stylesheet">
	<script src="summernote-bs5.js"></script>
	    
    <style>
    
    @charset "UTF-8";

@import url(style.css);
@import url(media.css);
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
	width: 1140px;
	margin: auto;
	position: center;
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
		margin: 30px 30px 0px 30px;
		border-radius: 10px;
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




	.noticepart {
		width: 100%;
		height: 100%;
		padding-right: 40px;
		padding-top: 15px
	}

.ckbox {

	margin-top: 20px;
	display: inline-block;
}

.ckbox p {
	display: inline-block;
	margin-right: 15px;
	margin-left: 3px;
}

	.boardwrite {
	
		width: 100%;
		height: 300px;
		
	}

	.checkbox12 {
		margin-top: 20px;
	    margin-left: 20px;
	    display: inline-block;
	}

	.ckbox {
		display: inline-block;
	}

.checkbox1{
	    width: 30px;
    height: 30px;
    display: inline-block;
}
.ckbox p {
	display: inline-block;
	margin-right: 15px;
	margin-left: 3px;
}

.writetable {
	width: 100%;
	height: 300px;
	border: 1px black solid;
}

.noticealert {
	position: relative;
    display: inline-block;
    text-align: center;
    font-size: 20px;
    top: -7px;
    margin-top: 30px;
}



	.btn_group1 {
		float: right;
	}

	.save_btn {
		width: 50px;
		height: 30px;
	}
	
	.can_btn {
		width: 50px;
		height: 30px;
	}

#noticeboardcontrol li {
	display: inline-block;
	text-align: center;
	padding: 5px;
	margin-left: 10px;
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


.list_btn {
	width: 60px;
	height: 30px;
}

.noticelook {
	display: inline-block;
	margin-left: 20px;
}

.morelook {
	display: inline-block;
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

.sc1 span p {
	margin-left: 70px;
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

.hr1 {
	margin: 2px;
}

.notify {
	width: 300px;
}

#cb {
	margin-right: 80px;
}

.sc1 ul {
	list-style-type: none;
}

.sc1 span p {
	margin-left: 70px;
}

	.btn_group {
		float: right;
		margin-top: 30px;
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

#txt2 {
	width: 300px;
	height: 300px;
}

.gradecheck input[type="checkbox"] {
	display: inline-block;
	font-size: 14px;
	/* 폰트 크기 설정 */
	/* 다른 스타일을 추가할 수 있습니다. */
}

.gradecheck p {
	display: inline-block;
	margin-right: 20px;
	margin-left: 5px;
	font-size: 14px;
	/* 폰트 크기 설정 */
	/* 다른 스타일을 추가할 수 있습니다. */
}
.note-editing-area {
    background-color: white !important;
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

.filebox {
	margin-bottom: 20px;
	 margin-top:20px;
}
    

    .filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 633px;
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
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}
    


</style>
    
    

     

    <script>
        // Summernote 초기화
        $(document).ready(function () {
            $('#summernote').summernote({
                lang: 'ko-KR',
                height: 140,
                placeholder: '내용을 입력하세요',
                toolbar: [
                    ['style', ['style']],
                    ['font', ['bold', 'italic', 'underline', 'clear']],
                    ['fontsize', ['fontsize']],
                    ['color', ['color']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['height', ['height']],
                    ['insert', ['link', 'picture']]
                ],
                callbacks: {
                    onChange: function (contents, $editable) {
                        // 에디터 내용을 textarea에 복사
                        $('#summernote').val(contents); // ID 수정
                    }

                }
            });
        });

    </script>
    
    
    
</head>

<body>
<script>
//페이지 로드 시, 학년 체크박스 초기 설정
window.addEventListener('DOMContentLoaded', function () {
    var grade1Checkbox = document.getElementById('grade1');
    var grade2Checkbox = document.getElementById('grade2');
    var grade3Checkbox = document.getElementById('grade3');
    var grade4Checkbox = document.getElementById('grade4');
    var gradeallCheckbox = document.getElementById('gradeall');

    // 전체학년 체크박스 클릭 이벤트 처리
    gradeallCheckbox.addEventListener('change', function () {
        if (gradeallCheckbox.checked) {
            grade1Checkbox.checked = true;
            grade2Checkbox.checked = true;
            grade3Checkbox.checked = true;
            grade4Checkbox.checked = true;
        } else {
            grade1Checkbox.checked = false;
            grade2Checkbox.checked = false;
            grade3Checkbox.checked = false;
            grade4Checkbox.checked = false;
        }
    });

    // 개별 학년 체크박스 클릭 이벤트 처리
    grade1Checkbox.addEventListener('change', function () {
        if (!grade1Checkbox.checked) {
            gradeallCheckbox.checked = false;
        }
    });

    grade2Checkbox.addEventListener('change', function () {
        if (!grade2Checkbox.checked) {
            gradeallCheckbox.checked = false;
        }
    });

    grade3Checkbox.addEventListener('change', function () {
        if (!grade3Checkbox.checked) {
            gradeallCheckbox.checked = false;
        }
    });

    grade4Checkbox.addEventListener('change', function () {
        if (!grade4Checkbox.checked) {
            gradeallCheckbox.checked = false;
        }
    });
});

</script>


	<div class="container">
		<div class="asdf">
		
		<div class="row">
		<div class="col-3">

		<div class="inside1 flex-shrink-0 p-3">
			<a class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
      			<span class="fs-5 fw-semibold">카테고리</span>
    		</a>     
    		<ul class="list-unstyled ps-0">
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
      				<span class="fs-5 fw-semibold">게시글 작성</span>
    			</a>   

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

				String sql = "SELECT post_id, author, title, contents, tag, grade1, grade2, grade3, grade4, gradeall, filelocation, alert FROM jdbc_test WHERE title = ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, title1);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					String postId = rs.getString("post_id");
					String author = rs.getString("author");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					String tag = rs.getString("tag");
					String grade1 = rs.getString("grade1");
					String grade2 = rs.getString("grade2");
					String grade3 = rs.getString("grade3");
					String grade4 = rs.getString("grade4");
					String gradeall = rs.getString("gradeall");
					String alert = rs.getString("alert");
					 String filelocation = rs.getString("filelocation");
				        String fileName = (filelocation != null) ? new File(filelocation).getName() : "첨부파일";

					String loggedInUserName = (String) session.getAttribute("loggedInUserName");
					
			
			%>
			<script>
    window.addEventListener('DOMContentLoaded', function () {
        var alertValue = '<%= alert %>'; // alertValue에 alert 값 할당

        // alertValue가 "true"일 때 공지(모바일 알림) 체크박스를 체크
        if (alertValue === 'true') {
            document.querySelector('.form-check-input').checked = true;
        }
    });
</script>
			   <form action="update.do" method="post" enctype="multipart/form-data">
			
				<input type="hidden" name="post_id" value="<%=postId%>">
				<div class="form-check form-check-inline">
			  	<input class="form-check-input" id="inlineRadio1" type="radio" name="new_tag" value="학사">
			  	<label class="form-check-label" for="inlineRadio1">학사</label>
			  </div>
			  <div class="form-check form-check-inline">
			  	<input class="form-check-input" id="inlineRadio2" type="radio" name="new_tag" value="장학">
			  	<label class="form-check-label" for="inlineRadio2">장학</label>
			  </div>
			  <div class="form-check form-check-inline">
			  	<input class="form-check-input" id="inlineRadio3" type="radio" name="new_tag" value="휴복학">
			  	<label class="form-check-label" for="inlineRadio3">휴복학</label>
			  </div>
			  <div class="form-check form-check-inline">
			  	<input class="form-check-input" id="inlineRadio4" type="radio" name="new_tag" value="학생회, 동아리">
			  	<label class="form-check-label" for="inlineRadio4">학생회&동아리</label>
			  </div>
			  <div class="form-check form-check-inline">
			  	<input class="form-check-input" id="inlineRadio5" type="radio" name="new_tag" value="취창업">
			  	<label class="form-check-label" for="inlineRadio5">취창업</label>
			  </div>
			  <div class="form-check form-check-inline">
			  	<input class="form-check-input" id="inlineRadio6" type="radio" name="new_tag" value="교육행사">
			  	<label class="form-check-label" for="inlineRadio6">교육행사</label>
			  </div>
                
                <div class="gradecheck ms-auto mt-3 mb-3">
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" name="new_gradeall" id="gradeall" value="전체학년">
					  <label class="form-check-label" for="gradeall">전체</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="grade form-check-input" type="checkbox" name="new_grade1" id="grade1" value="1학년">
					  <label class="form-check-label" for="grade1">1학년</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="grade form-check-input" type="checkbox" name="new_grade2" id="grade2" value="2학년">
					  <label class="form-check-label" for="grade2">2학년</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="grade form-check-input" type="checkbox" name="new_grade3" id="grade3" value="3학년">
					  <label class="form-check-label" for="grade3">3학년</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="grade form-check-input" type="checkbox" name="new_grade4" id="grade4" value="4학년">
					  <label class="form-check-label" for="grade4">4학년</label>
					</div>
				</div>

            <div class="boardwrite">
             <%  String loggedInUserName1 = (String) session.getAttribute("loggedInUserName"); %>
                      
                  <div class="mt-3 mb-3">
				  	<label for="exampleFormControlInput1" class="form-label">제목</label>
				  	<input type="text" class="form-control" name="new_title" value="<%=title%>" id="exampleFormControlInput1" placeholder="제목을 입력하세요" required>
				  </div>
				  
				  <div class="form-group">
                     <label for="content">내용</label>
                     <textarea class="form-control" id="summernote" name="new_contents"><%=contents%></textarea>
                  </div>
                  <textarea style="display:none" name="author" id="txt2"><%=loggedInUserName1 %></textarea>
            </div>
				  
			
					<script>
            // 페이지 로드 시, request로 받아온 값에 따라 체크박스 체크
            window.addEventListener('DOMContentLoaded', function () {
                var tagValue = '<%=tag%>';
                var grade1Value = '<%=grade1%>';
                var grade2Value = '<%=grade2%>';
                var grade3Value = '<%=grade3%>';
                var grade4Value = '<%=grade4%>';
                var gradeallValue = '<%=gradeall%>';
                var alertValue = '<%= alert %>';
                

                // tag 값에 따라 radio 버튼 체크
                var tagRadios = document.querySelectorAll('input[name="new_tag"]');
                tagRadios.forEach(function (radio) {
                    if (radio.value === tagValue) {
                        radio.checked = true;
                    }
                });

                // 학년 체크박스 체크
                var grade1Checkbox = document.getElementById('grade1');
                var grade2Checkbox = document.getElementById('grade2');
                var grade3Checkbox = document.getElementById('grade3');
                var grade4Checkbox = document.getElementById('grade4');
                var gradeallCheckbox = document.getElementById('gradeall');

                if (grade1Value === '1학년') {
                    grade1Checkbox.checked = true;
                }
                if (grade2Value === '2학년') {
                    grade2Checkbox.checked = true;
                }
                if (grade3Value === '3학년') {
                    grade3Checkbox.checked = true;
                }
                if (grade4Value === '4학년') {
                    grade4Checkbox.checked = true;
                }
                if (gradeallValue === '전체학년') {
                    gradeallCheckbox.checked = true;
                }
                if (alertValue === 'true') {
                    document.querySelector('.checkbox1').checked = true;
                }
            });
        </script>
				</div>
				<div class="filebox">
					<input class="upload-name" placeholder="<%=fileName%>"
						value="<%=fileName%>" /> <label for="file">파일 찾기</label> <input
						type="file" name="uploadFile" id="file">
				</div>
				
				<div class="hstack gap-3">
				
				<div class="btn_group1 p-3 ms-auto">
	            	<input type="submit" value="저장" class="save_btn btn btn-warning" />
	            	<input type="button" value="취소" class="can_btn btn btn-warning" onclick="cancelAction()"/>
	            </div>
            
			</div>
			</form>
		</div>	
		</div>
		</div>
		</div>
		</div>		
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


	<script>
		// 취소 버튼을 눌렀을 때 실행되는 함수
		function confirmCancel() {
			var confirmResult = confirm("작성을 취소하시겠습니까?");
			if (confirmResult) {
				// 사용자가 확인을 눌렀을 때 total_listReal.jsp로 이동
				window.location.href = "total_list.jsp";
			}
		}

		// "취소" 버튼 클릭 시 confirmCancel 함수 실행
		document.querySelector('.can_btn').addEventListener('click',
				function() {
					confirmCancel();
				});
	</script>

	 <script>
        $("#file").on('change', function () {
            var fileName = $("#file").val().split('\\').pop(); // 파일명만 추출
            $(".upload-name").val(fileName);
        });

    </script>

	<script>
		// 학년 클릭 시 ul3 보이게 하기
		document.getElementById('gradebtn').addEventListener('click',
				function() {
					var ul3 = document.querySelector('.ul3');
					if (ul3.classList.contains('show')) {
						ul3.classList.remove('show');
					} else {
						ul3.classList.add('show');
					}
				});
	</script>
</body>

</html>