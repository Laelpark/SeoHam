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
	<title>adminLogin</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/admin/adminLogin.css">
	
</head>
<body style="background-color: rgb(224, 224, 224);">
	<!-- start -->
	<div class="navbar" style="background-color:rgb(142, 68, 173); height: 50px;">
		<div class="col-6"></div>
		<i class="c fas fa-light fa-circle-info"> 관리자 로그인</i>
	</div>
	<div class="container-fluid">
		<div class="row pt-5">
				<a class="col-12 text-center mb-3">
					<img alt="" src="../../resources/images/share/fullLogo_p.png" onclick="location.href='share'" style="width: 280px; height: 100px; cursor: pointer;">
				</a>
				<div class="col-12 text-center mb-4 mt-4">
					<img alt="" src="../../resources/images/share/user.png"  style="width: 100px; height: 100px; border-radius: 100px;">
				</div>
				<div class="col-4 offset-4 text-center">
					<div class="input-group has-validation">
						<span class="input-group-text" id="inputGroupPrepend">
							<i class="fa-solid fa-user p-3 d-grid" style="font-size: 23px; height: 55px;"></i>
						</span>
						<input type="text" class="form-control form-group" id="id" name="id" aria-describedby="inputGroupPrepend" tabindex="1" value="dfksjf">
					</div>
				</div>
				<div class="offset-4 form-check col-4 mt-2" id="rememberId">
					<input class="form-check-input keepLogin" type="checkbox" value="" id="saveId" name="saveId" tabindex="4">
					<label class="form-check-label keepLogin" for="saveId">
						아이디 저장
					</label>
				</div>
				<div class="col-4 offset-4 text-center">
					<div class="input-group has-validation mt-4">
						<span class="input-group-text" id="inputGroupPrepend">
							<i class="fas fa-solid fa-lock p-3 d-grid" style="font-size: 20px;  height: 55px;"></i>
						</span>
						<input type="password" id="pw" name="pw" class="form-control form-group" aria-describedby="inputGroupPrepend" tabindex="2" value="123456">
					</div>
				</div>
				<div class="col-2 text-center">
					<button type="button" id="btnLogin" name="btnLogin" class="btn" tabindex="3" style=" width: 100px; height: 70px; float: right; background-color: blueviolet; color: white;">로그인</button>
				</div>
				<div class="col-2 offset-4 form-check mb-3 mt-2">
					<input class="form-check-input" type="checkbox" id="autoLogin" name="autoLogin" tabindex="5">
					<label class="form-check-label" for="autoLogin">자동 로그인 </label>
				</div>
				<div class="container text-center mt-3">
					<div class="row">
						<div class="col-3"></div>
						<div class="a col-3 me-3" style="cursor: pointer;" id="btnSignup" name="btnSignup" onclick=" location='/shareSignup'">
							회원가입
						</div>
						<div class="a col-3" style="cursor: pointer;" onclick=" location='/shareFindLogin'">
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
	<script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
	<script>
		
		// 로그인
		
		$("#btnLogin").on("click", function(){
			/* if(validation() == false) return false; */
			
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				,url: "loginProc"
				,data : { "id" : $("#id").val(), "pw" : $("#pw").val()}
				,success: function(response) {
					if(response.rt == "success") {
							location.href = "/adminMain";
						}else {
							alert("회원없음");
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		});
	</script>
	
</body>
</html>
