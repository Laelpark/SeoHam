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
	<title>shareLogin</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<style  type="text/css">

		#rememberId {
			position: relative;
		}

		#loginBtn {
			margin-right: 90px;
		}
   </style>
</head>
<body style="background-color: rgb(224, 224, 224);">
	<!-- start -->
	<div class="navbar" style="background-color:rgb(142, 68, 173); height: 50px;"></div>
	<div class="container-fluid">
		<div class="row pt-5">
			<a class="col-12 text-center mb-3">
				<img alt="" src="../../resources/images/share/fullLogo_p.png" onclick="location.href='share'" style="width: 280px; height: 100px; cursor: pointer;">
			</a>
			<div class="col-12 text-center mb-3">
				<img alt="" src="../../resources/images/share/user.png"  style="width: 100px; height: 100px; border-radius: 100px;">
			</div>
			<div class="col-4 offset-4 text-center">
				<div class="input-group has-validation">
					<span class="input-group-text" id="inputGroupPrepend">
						<i class="fa-solid fa-user p-3 d-grid" style="font-size: 23px; height: 55px;"></i>
					</span>
					<input type="text" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
				</div>
			</div>
			<!-- <div class="input-group col-3 offset-4 text-center">
				<span class="input-group-text" id="idimg">
					<i class="fa-solid fa-user p-3 d-grid" style="font-size: 23px; height: 55px;"></i>
				</span>
				<input class="id" type="text" id="id"  placeholder="ID" aria-describedby="inputGroupPrepend" required>
			</div> -->
			<div class="offset-4 form-check col-4 mt-2" id="rememberId">
				<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
				<label class="form-check-label" for="flexCheckDefault">
					아이디 저장
				</label>
			</div>
			<div class="col-2 text-center">
				<button type="button" id="loginBtn" class="btn" style=" width: 100px; height: 70px; float: right; background-color: blueviolet; color: white;" onclick="location.href='shareLogDone'">로그인</button>
			</div>
			<div class="col-4 offset-4 text-center">
				<div class="input-group has-validation">
					<span class="input-group-text" id="inputGroupPrepend">
						<i class="fas fa-solid fa-lock p-3 d-grid" style="font-size: 20px;  height: 55px;"></i>
					</span>
					<input type="password" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
				</div>
			</div>
			<!-- <div class="input-group col-3 offset-4 text-center">
				<span class="input-group-text" id="pwimg">
					<i class="fas fa-solid fa-lock p-3 d-grid" style="font-size: 23px;  height: 55px;"></i>
				</span>
				<input class="pw" type="text" id="pw"  placeholder="PASSWORD" aria-describedby="inputGroupPrepend" required>
			</div> -->
			<div class="col-2 offset-4 form-check mb-3 mt-2">
				<input class="form-check-input" type="checkbox" id="flexCheckDefault" checked>
				<label class="form-check-label" for="flexCheckDefault">자동 로그인 </label>
			</div>
			<div class="container text-center mt-3">
				<div class="row">
					<div class="col-3"></div>
						<div class="a col-3 me-3" type="button" id="btnForm" name="btnForm">
							회원가입
						</div>
						<div class="a col-3" href="../member/newLoginForm.html">
							아이디/비밀번호 찾기
						</div>
						<div class="col-3"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end --> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	
		var goUrlLoginForm = "shareLoginForm";				
		
		$('#btnForm').on("click", function() {
			 $(location).attr("href", goUrlLoginForm);
			});
		
		
	</script>
 	
	
</body>
</html>
