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
	<title>shareFindLogin</title>
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
				<li class="nav-item">
		  			<a class="nav-link active" aria-current="page" onclick="goFindId()">Find Id</a>
				</li>
				<li class="nav-item">
			  		<a class="nav-link" onclick="goList()">Find PassWord</a>
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
						<input class="b col mt-2 form-control" placeholder="년(4자)" id="dob" name="dob">
					</td>
					<td>
						<input class="b mt-2 ms-4 form-control" placeholder="월" id="dob2" name="dob2">
					</td>
					<td>
						<input class="b mt-2 ms-4 form-control" placeholder="일" id="dob3" name="dob3">
					</td>
				</table>
				<hr style="color: rgb(78, 78, 78); width: 800px;">
				<label>전화번호</label>
				<table>
					<td>
						<input class="mt-2 ms-3 form-control" style="width: 400px; height: 35px;" placeholder="특수문자(-)없이 숫자만 입력" id="phone" name="phone"
							value="<c:out value="${item.phone}"/>">
					</td>
					<td>
						<button type="button" class="mt-2 ms-3 btn btn-outline-secondary">전송</button>
					</td>
				</table>
				<hr style="color: rgb(78, 78, 78); width: 800px;">
				<table class="a mt-5" style="text-decoration: none; text-align: center;">
					<td>
						<h5 type="text" value="<c:out value="${item.name}"/>">님의 </h5>
					</td>
					<td>
						<h5 type="text"> 아이디는 </h5>
					</td>
					<td>
						<h5 type="text" value="<c:out value="${item.id}"/>"> 입니다.</h5>
					</td>
				</table>
			</div>
			<div id="wrapper" class="mb-3" style="padding-top: 50px;">
				<button id="findId" name="findId" type="button" class="btn btn-primary btn-lg">
					아이디 찾기
				</button>
			</div>
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
	
	var seq = $("input:hidden[name=seq]");

	var form = $("form[name=myform]");
	var formVo = $("form[name=formVo]");

	//ID ajax
	
	$("#findId").on("click", function() {
			
			$.ajax({
				async: true
				,cache: false
				,type:"POST"
				,url: "idFind"
				,data: {"name": $("#name").val(), "dob": $("#dob").val(), "dob2": $("#dob2").val(), "dob3": $("#dob3").val(), "phone" : $("#phone").val()}
				,success : function(response) {
					if (response.rt == "success") {
						$(".personerId").html(response.id.id);
					} else {
						alert("정확한 정보를 입력해주세요.");
					}
				},
				/* error : function(jqXHR, status, error) {
					alert("알 수 없는 에러 [ " + error + " ]");
				} */
				error : function(jqXHR, status, error) {
					$(".personerId").html("없는 정보");
					alert("등록된 회원 정보가 없습니다.");
				}
			});
		})
	
	
	
/*  	
	$("#id").on("focusout", function(){
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				,url: "idFind"
				,data : { "id" : $("#id").val() }
				,success: function(response) {
					if(response.rt == "success") {
	
				
					} else {
						document.getElementById("idFeedback").innerText = "없는 아이디입니다.";
						
						$("#id").focus();
						
						document.getElementById("idAllowedNY").value = 0;
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
			
		}); */

	</script>
</body>
</html>