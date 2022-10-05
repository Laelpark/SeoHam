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
	<!-- start -->
	<div class="navbar" style="background-color:rgb(142, 68, 173); height: 30px;"></div>
	<div class="header">
		<a class="navbar-brand" href="share">
			<img src="../../resources/images/share/fullLogo_p.png" id="logoimg">
		</a>
		<a href="../member_Login_Done/LoginDoneMain.html">
			<button type="button" class="btn col" id="btnSave">적용</button>
		</a>
		<button type="button" class="btn col" id="btnCancle">취소</button>
		<ul class="nav nav-tabs">
			<li class="nav-item">
			  <a class="nav-link active" aria-current="page" href="#">프로필 수정</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link" href="../member_Login_Done/userShareList.html">Share 목록</a>
			</li>
		</ul>
	</div>
	<div class="row" id="content">
		<div class="col-3" id="side">프로필 사진 변경</div>
		<div class="col-md-6 ms-3">
			<div class="filebox">
				<label for="ex_file"></label>
				<input class="mb-5" type="file" id="ex_file" name="chooseFile"  accept="image/*" onchange="loadFile(this)">
				<div class="row mt-5">
					<button type="button" class="btn col offset-2" id="btn">변경</button>
					<button type="button" class="btn col offset-2" id="btn">삭제</button>
					<div class="col offset-2"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row" id="content1">
		<div class="col-3" id="side">주 share 장소</div>
		<div class="col-md-6 ms-3">
			<input class="mt-5 form-control" id="textBox" type="text" placeholder="주 거래 장소를 입력해주세요.">
		</div>
	</div>
	<div class="row" id="content2">
		<div class="col-3" id="side">비밀번호 변경</div>
		<div class="col-md-6 ms-3">
			<button  class="btn mt-5" type="button" id="btn"> 비밀번호 변경</button>
		</div>
		<!-- <div class="col-md-6 ms-4">
			<div class="row mt-3">
				<input id="textBox" type="text" placeholder="현재 비밀번호">
				<input id="textBox" type="text" placeholder="새 비밀번호">
				<input id="textBox" type="text" placeholder="새 비밀번호 확인">
			</div>
		</div> -->
	</div>
	<div class="row" id="content2">
		<div class="col-3" id="side">닉네임 변경</div>
		<div class="col-md-6 ms-3">
			<input class="mt-5 form-control" id="textBox" placeholder="변경하실 닉네임을 입력해주세요.">
		</div>
	</div>


	<!-- end --> 
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
