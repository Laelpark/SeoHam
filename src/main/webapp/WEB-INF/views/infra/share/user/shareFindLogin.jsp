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
	<title>Find Id</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/share/shareFindLogin.css">
	<script defer type="text/javascript" src="/resources/js/validation.js"></script>
</head>
<body>
	<!-- start -->
	<form id="myform" name="myform" method="post" autocomplete="off">
		<div class="navbar" style="background-color:rgb(142, 68, 173); height: 30px; width:auto;"></div>
		<div class="row">
			<img class="col-6 ms-3 mt-3" src="../../resources/images/share/fullLogo_p.png" onclick="location.href='share'" style="width: 150px; height: 45px;" type="button">
			<h2 class="col-6 offset-4" id="newmem">아이디 찾기</h2>
		</div>
		<div class="container">
			<ul class="nav nav-tabs mt-5">
				<li class="nav-item" id="shareFindLogin">
		  			<a class="nav-link active" aria-current="page">Find Id</a>
				</li>
				<li class="nav-item" id="shareFindPw">
			  		<a class="nav-link">Find PassWord</a>
				</li>
			</ul>
			<div class="mt-5" id="input">
				<table>
					<td>
						<label class="form-label">이름</label> 
						<input type="text" class="a mt-2 form-control" placeholder="이름입력" name="name" id="name">
					</td>
				</table>
				<hr style="color: rgb(78, 78, 78); width: 800px;">
				<label>생년월일</label>
				<table>
					<td>
						<input class="a col mt-2 form-control" placeholder="생년월일 8자리 숫자입력" oninput="autoHyphen1(this)" maxlength="10" id="dob" name="dob">
					</td>
				</table>
				<hr style="color: rgb(78, 78, 78); width: 800px;">
				<label>전화번호</label>
				<table>
					<td>
						<input class="a col mt-2 form-control" placeholder="전화번호 입력" oninput="autoHyphen2(this)" maxlength="13" id="phone" name="phone"
							value="<c:out value="${item.phone}"/>">
					</td>
				</table>
				<div class="idPop" style="display: none;">
					<hr style="color: rgb(78, 78, 78); width: 800px;">
					<table class="a mt-5 FindId" style="text-decoration: none; text-align: center;">
						<td>
							<p type="text"> 회원님의 아이디는 <span type="text" value="" id="id" style="text-decoration: underline; "></span>입니다.</p>
						</td>
					</table>
				</div>
			</div>
			<table id="wrapper" class="mb-3 mt-5" style="padding-top: 50px;">
				<td class="idPop1">
					<button id="findId" name="findId" type="button" class="btn">
						아이디 찾기
					</button>
				</td>
				<td class="idPop" style="display: none;">
					<button id="btnLogin" name="btnLogin" type="button" class="btn" style="background-color: blueviolet; color:white;">
						로그인
					</button>
					<button class="btn ms-3" type="button" id="GOfindPw" name="GOfindPw">
						비밀번호 찾기
					</button>
				</td>
			</table>
		</div>
	</form>


	<!-- end --> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	
	var goUrlLogin = "/shareLogin";
	var goUrlInst = "/MemberInst";
	var goUrlFindId = "/shareFindLogin";
	var goUrlFindPw = "/shareFindPw";
	
	var seq = $("input:hidden[name=seq]");

	var form = $("form[name=myform]");
	var formVo = $("form[name=formVo]");

	$("#btnLogin").on("click", function(){
		 $(location).attr("href", goUrlLogin);
	 });
	
	$("#shareFindLogin").on("click", function(){
		 $(location).attr("href", goUrlFindId);
	 });
	
	$("#shareFindPw").on("click", function(){
		 $(location).attr("href", goUrlFindPw);
	 });
	
	$("#GOfindPw").on("click", function(){
		 $(location).attr("href", goUrlFindPw);
	 });
	
	//ID 찾기
	
	$("#findId").on("click", function() {
			$.ajax({
				async: true
				,cache: false
				,type:"POST"
				,url: "idFind"
				,data: {"name": $("#name").val(), "dob": $("#dob").val(), "phone" : $("#phone").val()}
				,success : function(response) {
					if (response.rt == "success") {
						$(".idPop1").css("display", "none");  // 아이디 찾기 성공하며 띄어주는 화면
						$(".idPop").css("display", "");  // 아이디 찾기 성공하며 띄어주는 화면
						$("#name").html(response.id.name);
						$("#id").html(response.id.id);
						$mValue = preg_replace('/.{3}$/', '***', $str);
					} else {
						alert("정확한 정보를 입력해주세요.");
					}
				},
				/* error : function(jqXHR, status, error) {
					alert("알 수 없는 에러 [ " + error + " ]");
				} */
				error : function(jqXHR, status, error) {
					$("#id").html("없는 정보");
					alert("등록된 회원 정보가 없습니다.");
				}
			});
		})
	
		const autoHyphen2 = (target) => {
 	 		 target.value = target.value
 	 		   .replace(/[^0-9]/g, '')
 	 		  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
 	 		}

 	 	const autoHyphen1 = (target) => {
 	 		 target.value = target.value
 	 		   .replace(/[^0-9]/g, '')
 	 		  .replace(/^(\d{0,4})(\d{0,2})(\d{0,2})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
 	 		}

	</script>
</body>
</html>