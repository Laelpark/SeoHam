<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>shareMyPage</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/resources/css/share/userprofile.css">

</head>
<body>
	<div class="navbar" style="background-color:rgb(142, 68, 173); height: 30px;"></div>
	<div class="sideEmty">
		<div class="header">
			<a class="navbar-brand" href="share">
				<img src="../../resources/images/share/fullLogo_p.png" id="logoimg">
			</a>
			<!-- <button type="button" class="btn btn-outline-primary mb-2 ms-3">적용</button>
			<button type="button" class="btn btn-outline-danger mb-2 ms-3">취소</button> -->
			<ul class="nav nav-tabs mt-5">
				<li class="nav-item">
				  <a class="nav-link active" aria-current="page" href="#css">프로필 수정</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link" href="#">Share 목록</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link" href="#">보안설정</a>
				</li>
			</ul>
		</div>
		<div class="content">
			<div class="row">
		        <div class="first col-3">프로필 수정</div>
	         	<div class="col" style="margin-left: 90px; margin-top: 30px">
			    	<div class="col-md-6" id="fileBtn" style="margin-left: 90px; margin-top: 30px">
						<div class="filebox">
							<label for="ex_file"></label>
							<input class="mb-5" type="file" id="ex_file" name="chooseFile"  accept="image/*" onchange="loadFile(this)">
							<div class="row mt-5">
								<button type="button" class="btn btn-outline-secondary me-4" style="border-color: lightgray;">확인</button>
								<button type="button" class="btn btn-outline-secondary" style="border-color: lightgray;">취소</button>
							</div>
						</div>
					</div>
			    </div>
	        </div>
	        <div class="row">
		        <div class="second col-3">주 share 장소</div>
		         <input type="text" id="input" class="col" placeholder="주 거래 장소를 입력해주세요.">
	        </div>
	        <div class="row">
		        <div class="third col-3">닉네임 변경</div>
		        <input type="text" id="input" class="col" placeholder="변경할 닉네임을 입력해주세요.">
	        </div>
	        <br>
	        <br>
		    <br><div class='col-3' id="btn">
		        <button type="button" class="btn btn-outline-primary mb-2 ms-3" id="btnS">적용</button>
				<button type="button" class="btn btn-outline-danger mb-2 ms-3" id="btnC">취소</button>
		    </div>
	    </div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script type="text/javascript">

        // 이미지 미리보기
		const reader = new FileReader();
        reader.onload = (readerEvent) => {
            document.querySelector("#preview").setAttribute("src", readerEvent.target.result);
        };
        document.querySelector("#ex_file").addEventListener("change", (changeEvent) => {
            const imgFile = changeEvent.target.files[0];
            reader.readAsDataURL(imgFile);
        })
	</script>
</body>
</html>
