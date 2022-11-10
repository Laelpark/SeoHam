<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!-- 카테고리 및 인원 이름으로 나오게 만들어줌 -->
<jsp:useBean id="CodeServiceImpl" class="com.lael.infra.modules.code.CodeServiceImpl"/>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>MY Security</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/resources/css/share/mySecurity.css">

</head>
<body>
	<form id="myForm" name="myForm" method="post">
		<!-- *Vo.jsp s -->
		<%@include file="shareVo.jsp"%>
		<!-- *Vo.jsp e -->
		<div class="navbar" style="background-color:rgb(142, 68, 173); height: 30px; width: 100%;"></div>
		<div class="sideEmty">
			<div class="header">
				<a class="navbar-brand" href="share">
					<img src="../../resources/images/share/fullLogo_p.png" id="logoimg">
					<button id="btnLogout" type="button" class="btn ms-4" style="height: 30px; text-align: center;">
						<img src="../../resources/images/share/logout.png" id="Imglogout">
						Logout
					</button>
				</a>
				<ul class="nav nav-tabs mt-5">
					<li class="nav-item">
			  			<a class="nav-link" aria-current="page" onclick="goMyPage()">My Page</a>
					</li>
					<li class="nav-item">
				  		<a class="nav-link" onclick="goList()">My Share List</a>
					</li>
					<li class="nav-item">
			 	 		<a class="nav-link" onclick="goInfo()">Change My Information</a>
					</li>
					<li class="nav-item">
			 	 		<a class="nav-link active" onclick="goSecu()">MY Security</a>
					</li>
				</ul>
			</div>
			<div style="margin: 20px 0px 0px 200px;">
			<h3 style="margin-bottom: 35px;">비밀번호 변경</h3>
			<label for="pw">현재 비밀번호 <span class="text-danger">*</span></label>
			<table>
				<td>
					<input type="password" class="a mt-2 form-control" id="pw" name="pw" placeholder="현재 비밀번호 입력"">
				  	<div type="hidden" class="msg" id="pw_msg" name="pw_msg" style="display: none;"></div>
					<div type="hidden" class="invalid-feedback" id="pwFeedback"></div>
				</td>
				<td>
					<i class="fa-solid fa-user-lock" id="lock"></i>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<label for="pw">변경하실 비밀번호 <span class="text-danger">*</span></label>
			<table>
				<td>
					<input type="password" class="a mt-2 form-control" id="pwNew" name="pwNew" placeholder="변경하실 비밀번호 입력" onkeydown="validation()">
				  	<div type="hidden" class="msg" id="pwNew_msg" name="pwNew_msg" style="display: none;"></div>
					<div type="hidden" class="invalid-feedback" id="pwFeedback"></div>
				</td>
				<td>
					<i class="fa-solid fa-lock" id="lock"></i>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<label for="pw">변경한 비밀번호 확인 <span class="text-danger">*</span></label>
			<table>
				<td>
					<input type="password" class="a mt-2 form-control" id="pwNew2" name="pwNew2" placeholder="변경하신 비밀번호 재 입력" onkeydown="validation()">
				  	<div type="hidden" class="msg" id="pwNew2_msg" name="pwNew2_msg" style="display: none;"></div>
					<div type="hidden" class="invalid-feedback" id="pwFeedback"></div>
				</td>
				<td>
					<i class="fa-solid fa-unlock" id="lock"></i>
				</td>
			</table>
		</div>
		<div id="wrapper" class="mt-5 mb-3">
			<button id="btnSave" name="btnSave" type="button" class="btn btn-primary btn-lg" onclick="validation();">   <!-- data-bs-toggle="modal" data-bs-target="#exampleModalCenter" -->
				수정하기
			</button>
		</div>
		</div>
	</form>
</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
	var goUrlMyList = "/myList";
	var goUrlMyPage = "/myPage";
	var goUrlMyInfo = "/personalInformation";
	var goUrlMySecurity = "/mySecurity";
	var goUrlInst = "/shareMyPageInst";
	var goUrlUpdt = "/shareMyPageUpdt";
	var goUrlUpdt = "/shareMyPageUpdt";
	
	var seq = $("input:hidden[name=seq]");
	
	var form = $("#myForm");

	goList = function() {
		form.attr("action", goUrlMyList).submit();
	};
	
	goMyPage = function() {
		form.attr("action", goUrlMyPage).submit();
	};
	
	goInfo = function() {
		form.attr("action", goUrlMyInfo).submit();
	};
	
	goSecu = function() {
		form.attr("action", goUrlMySecurity).submit();
	};
	</script>
	
	<script type="text/javascript">
	
	//Pw ajax
	
	$("#btnSave").on("click", function(){
			/* if(validation() == false) return false; */
			
		 $("#pw").on("focusout", function(){
			if ($("#pw").val() == null || $("#pw").val() == "" ) {
				document.getElementById("pwFeedback").classList.add('invalid-feedback');
				document.getElementById("pwFeedback").innerText = "비밀번호를 입력해주세요.";
				$("#pw").focus();
			} else {
				$.ajax({
					async: true 
					,cache: false
					,type: "post"
					,url: "loginProc"
					,data : {"pw" : $("#pw").val()}
					,success: function(response) {
						if(response.rt == "success") {
								document.getElementById("pw").classList.remove('is-invalid');
								document.getElementById("pw").classList.add('is-valid');
			
								document.getElementById("pwFeedback").classList.remove('invalid-feedback');
								document.getElementById("pwFeedback").classList.add('valid-feedback');
								document.getElementById("pwFeedback").innerText = "올바른 비밀번호 입니다.";
								
							}else {
								document.getElementById("pw").classList.add('is-invalid');
								
								document.getElementById("pwFeedback").classList.remove('valid-feedback');
								document.getElementById("pwFeedback").classList.add('invalid-feedback');
								document.getElementById("pwFeedback").innerText = "비밀번호를 다시 확인해주세요.";
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
