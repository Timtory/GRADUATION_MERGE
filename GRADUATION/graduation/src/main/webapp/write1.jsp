<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.css" rel="stylesheet">

	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
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
	
	.inside1 .fs-20 {
	    color: white;
	    font-size: 20px;
	    margin-top: 10px;
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
    
    <script>
	    function cancelAction() {
	        // total_list.jsp로 이동합니다.
	        window.location.href = "total_list.jsp";
	    }
	</script>
	    
    
    <script>
	    $(document).ready(function () {
	        // 전체학년 체크박스의 상태가 변경될 때
	        $("#gradeall").change(function () {
	            if ($(this).is(":checked")) {
	                $(".grade").prop("checked", true); // 모든 학년 체크박스 체크
	            } else {
	                $(".grade").prop("checked", false); // 모든 학년 체크박스 해제
	            }
	        });
	
	        // 개별 학년 체크박스 중 하나라도 체크가 해제될 때
	        $(".grade").change(function () {
	            if ($(".grade:checked").length === $(".grade").length) {
	                // 모든 학년 체크박스가 체크되어 있을 때
	                $("#gradeall").prop("checked", true);
	            } else {
	                $("#gradeall").prop("checked", false);
	            }
	        });
	    });
	</script>

    </head>

<body>

	<div class="container">
		<div class="asdf">
		
		
		<div class="row">
		<div class="col-3">
		

		

		<div class="inside1 flex-shrink-0 p-3">
			<a class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
      			<span class="fs-20 fw-semibold">카테고리</span>
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
			
				<a class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom" style="font-size: 20px; padding-top:25px;">
      				<span class="fw-semibold">게시글 작성</span>
    			</a>   
			<form action="upload2.do" method="post" enctype="multipart/form-data">
			
            
            
            
            <!--  이건 셀렉트
	           <form action="upload2.do" method="post" enctype="multipart/form-data">
	                <select class="form-select" aria-label="카테고리">
					  <option selected>카테고리를 선택해주세요</option>
					  <option value="1">학사</option>
					  <option value="2">장학</option>
					  <option value="3">휴복학</option>
					  <option value="3">학생회&동아리</option>
					  <option value="3">취창업</option>
					  <option value="3">교육행사</option>
					</select>
        		</form>
             -->
             
             
             <!--  이거는 원래 코드 
             	<div class="ckbox">
           		<form action="upload2.do" method="post" enctype="multipart/form-data">
                <label>
                    <input type="radio" name="tag" value="학사" >
                   <p>학사</p></label>
                <label>
                    <input type="radio" name="tag" value="장학" >
                    <p>장학</p></label>
                <label>
                    <input type="radio" name="tag" value="휴복학" >
                    <p>휴복학</p></label>
                <label>
                    <input type="radio" name="tag" value="학생회, 동아리" >
                    <p>학생회, 동아리</p></label>
                <label>
                   <input type="radio" name="tag" value="취창업" >
                    <p>취창업</p></label>
                <label>
                	<input type="radio" name="tag" value="교육행사" >
                	<p>교육행사</p></label>
              </div>    
              -->
              
              
              <div class="form-check form-check-inline">
			  	<input class="form-check-input" id="inlineRadio1" type="radio" name="tag" value="학사" required>
			  	<label class="form-check-label" for="inlineRadio1">학사</label>
			  </div>
			  <div class="form-check form-check-inline">
			  	<input class="form-check-input" id="inlineRadio2" type="radio" name="tag" value="장학" required>
			  	<label class="form-check-label" for="inlineRadio2">장학</label>
			  </div>
			  <div class="form-check form-check-inline">
			  	<input class="form-check-input" id="inlineRadio3" type="radio" name="tag" value="휴복학" required>
			  	<label class="form-check-label" for="inlineRadio3">휴복학</label>
			  </div>
			  <div class="form-check form-check-inline">
			  	<input class="form-check-input" id="inlineRadio4" type="radio" name="tag" value="학생회, 동아리" required>
			  	<label class="form-check-label" for="inlineRadio4">학생회&동아리</label>
			  </div>
			  <div class="form-check form-check-inline">
			  	<input class="form-check-input" id="inlineRadio5" type="radio" name="tag" value="취창업" required>
			  	<label class="form-check-label" for="inlineRadio5">취창업</label>
			  </div>
			  <div class="form-check form-check-inline">
			  	<input class="form-check-input" id="inlineRadio6" type="radio" name="tag" value="교육행사" required>
			  	<label class="form-check-label" for="inlineRadio6">교육행사</label>
			  </div>
                
                
                <div class="gradecheck ms-auto mt-3 mb-3">
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="gradeall" name="gradeall" value="전체학년">
					  <label class="form-check-label" for="gradeall">전체</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="grade form-check-input" type="checkbox" id="grade1" name="grade1" value="1학년">
					  <label class="form-check-label" for="grade1">1학년</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="grade form-check-input" type="checkbox" id="grade2" name="grade2" value="2학년">
					  <label class="form-check-label" for="grade2">2학년</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="grade form-check-input" type="checkbox" id="grade3" name="grade3" value="3학년">
					  <label class="form-check-label" for="grade3">3학년</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="grade form-check-input" type="checkbox" id="grade4" name="grade4" value="4학년">
					  <label class="form-check-label" for="grade4">4학년</label>
					</div>
				</div>
			
				
				
				
	            
          
            <div class="boardwrite">
             <%  String loggedInUserName = (String) session.getAttribute("loggedInUserName"); %>
                  
                  
                  <div class="mt-3 mb-3">
				  	<label for="exampleFormControlInput1" class="form-label">제목</label>
				  	<input type="text" class="form-control" name="title" id="exampleFormControlInput1" placeholder="제목을 입력하세요" required>
				  </div>
                  
                  <div class="form-group">
                     <label for="content">내용</label>
                     <textarea class="form-control" id="summernote" name="contents"></textarea>
                  </div>
                  <textarea style="display:none" name="author" id="txt2"><%=loggedInUserName %></textarea>
            </div>
            
            
            <div class="filebox">
			  <input class="upload-name" value="첨부파일" placeholder="첨부파일">
			  <label for ="file">파일 찾기</label>
			  <input type = "file"  name="uploadFile" id="file">
			</div>
            
            
            <!-- 기존 모바일 알림 코드 
            
            <div class="checkbox12">
    			<label class="noticealert1">
        			<input type="checkbox" value="true" name="alert"
        			style="height:30px; width:30px; display: inline-block; vertical-align: middle;" class="checkbox1">
        			<span style="font-size:16px; display: inline-block; vertical-align: middle;"> 공지 알림 (모바일 알림)</span>
    			</label>
			</div>
			
			-->
			
			
			<div class="hstack gap-3">
				<div class="form-check p-3">
				  <input class="form-check-input" type="checkbox" value="true" name="alert" id="flexCheckDefault">
				  <label class="form-check-label" for="flexCheckDefault">
				    공지(모바일 알림)
				  </label>
				</div>
				
				                  
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
        $("#file").on('change', function () {
            var fileName = $("#file").val().split('\\').pop(); // 파일명만 추출
            $(".upload-name").val(fileName);
        });

    </script>
    
    <script>
    // 폼 제출 시 유효성 검사
    document.querySelector("form").addEventListener("submit", function(event) {
        var titleField = document.querySelector("#title");
        if (titleField.value.trim() === "") {
            alert("제목을 입력하세요.");
            titleField.focus(); // 제목 필드로 포커스 이동
            event.preventDefault(); // 폼 제출 막기
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    
</body>

</html>
