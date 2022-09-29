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
	<title>shareLoginForm</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="../resources/css/share/shareLoginForm.css">
	<script defer type="text/javascript" src="/resources/js/validation.js"></script>
</head>
<body>
	<!-- start -->
	<div class="navbar" style="background-color:rgb(142, 68, 173); height: 30px;"></div>
	<div class="row">
		<img class="col-6 ms-3 mt-3" src="../../resources/images/share/fullLogo_p.png" onclick="location.href='share'" style="width: 150px; height: 45px;" type="button">
		<h2 class="col-6 offset-4 mt-5" id="newmem">회원가입</h2>
	</div>
	<form id="myform" name="myform" method="post" autocomplete="off">
			<!-- *Vo.jsp s -->
			<%-- <%@include file="memberVo.jsp"%> --%>
			<!-- *Vo.jsp e -->
		<div id="input">
			<table>
				<td>
					<label for="id" class="form-label">아이디111 <span class="text-danger">*</span></label>
					<input type="hidden" id="idAllowedNy" name="idAllowedNy" value="0">
					<input type="text" class="a mt-2 form-control" id="id" name="id"
						value="<c:out value="${item.id}"/>" maxlength="20" placeholder="아이디 입력" 
						<c:if test="${not empty item.id}">readonly</c:if>>
					  <div type="hidden" class="msg" id="id_msg" name="id_msg" style="display: none;"></div>
					<div type="hidden" class="invalid-feedback" id="idFeedback"></div>
					
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<label for="pw">비밀번호 <span class="text-danger">*</span></label>
			<table>
				<td>
					<input type="password" class="a mt-2 form-control" id="pw" name="pw" placeholder="영대소문자, 숫자, 특수문자, 4~20자리" onkeypress="validation()" required>
					  <div type="hidden" class="msg" id="pw_msg" name="pw_msg" style="display: none;"></div>
					 <div type="hidden" class="invalid-feedback" id="pwFeedback"></div>
				</td>
				<td>
					<i class="fa-solid fa-lock" id="lock"></i>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<table>
				<td>
					<label  for="pwCheck" class="form-label">비밀번호 재확인<span class="text-danger">*</span></label>
					<input type="hidden" id="pwAllowedNy" name="pwAllowedNy" value="0">
					<input type="password" class="a mt-2 form-control" id="pwCheck" name="pwCheck"
						value="<c:out value="${item.pwCheck}"/>"maxlength="20" placeholder="비밀번호를 다시 입력해주세요." 
						<c:if test="${not empty item.pwCheck}">readonly</c:if>>
					<div class="invalid-feedback" id="pwCheckFeedback"></div>
				</td>
				<td>
					<i class="fa-solid fa-lock" id="lock"></i>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<label>이름 <span class="text-danger">*</span></label>
			<table>
				<td>
					<input class="a mt-2 form-control" id="name" name="name"  placeholder="이름 입력" required>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<label>닉네임</label>
			<table>
				<td>
					<input class="a mt-2 form-control" id="nick_nm" name="nick_nm"  placeholder="닉네임 입력" required>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<label>생년월일</label>
			<table>
				<td>
					<input class="b col mt-2 form-control" placeholder="년(4자)" id="dob" name="dob"
						value="<c:out value="${item.dob}"/>"
					>
				</td>
				<td>
					<input class="b mt-2 ms-4 form-control" placeholder="월" id="dob2" name="dob2"
						value="<c:out value="${item.dob2}"/>"
					>
				</td>
				<td>
					<input class="b mt-2 ms-4 form-control" placeholder="일" id="dob3" name="dob3"
						value="<c:out value="${item.dob3}"/>"
					>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<label>성별</label>
			<table>
				<td>
					<select name="gender" class="select mt-2 form-select">
						<option selected value="">성별</option>
						<option value="1" <c:if test = "${item.gender eq 1}">selected</c:if>>남성</option>
						<option value="2" <c:if test = "${item.gender eq 2}">selected</c:if>>여성</option>
						<option value="3" <c:if test = "${item.gender eq 3}">selected</c:if>>선택안함</option>
					</select>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<label>이메일</label>
			<table>
				<td>
					<input class="b col mt-2 form-control" placeholder="이메일주소" id="email" name="email"
						value="<c:out value="${item.email}"/>"
					>
				</td>
				<td>
					<span class="ms-3 mt-2">@</span>
				</td>
				<td>
					<select class="select ms-3 mt-2 form-select" id="email_div" name="email_div">
						<option selected disabled value="">이메일</option>
						<option value="4" <c:if test = "${item.email_div eq 4}">selected</c:if>>네이버(naver.com)</option>
						<option value="5" <c:if test = "${item.email_div eq 5}">selected</c:if>>다음(daum.net)</option>
						<option value="6" <c:if test = "${item.email_div eq 6}">selected</c:if>>지메일(gmail.com)</option>
					</select>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<label>전화번호</label>
			<table>
				<td>
					<select name="phone_div" class="select mt-2 form-select" requiredss>
						<option value="" <c:if test = "${empty item.phone_div}">selected</c:if>>통신사</option>
						<option value="9" <c:if test = "${item.phone_div eq 9}">selected</c:if>>SKT</option>
						<option value="8" <c:if test = "${item.phone_div eq 8}">selected</c:if>>KT</option>
						<option value="10" <c:if test = "${item.phone_div eq 10}">selected</c:if>>LG</option>
					</select>
				</td>
				<td>
					<input class="mt-2 ms-3 form-control" style="width: 400px; height: 35px;" placeholder="특수문자(-)없이 숫자만 입력" id="phone" name="phone"
						value="<c:out value="${item.phone}"/>">
				</td>
				<td>
					<button type="button" class="mt-2 ms-3 btn btn-outline-secondary">전송</button>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<label>인증번호</label>
			<table>
				<td>
					<input class="mt-2 form-control" placeholder="인증번호 입력">
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
		</div>
		<div id="wrapper" class="mt-5 mb-3">
			<button id="btnSave" name="btnSave" type="button" class="btn btn-primary btn-lg" onclick="validation();" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
				가입하기
			</button>
			<div class="modal fade" id="exampleModalCenter" tabindex="-1" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalCenterTitle">가입완료</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body"  align="center">
							<i class="fa-regular fa-thumbs-up" style="color: rgb(24, 82, 24);"></i>
							Share의 가입이 성공적으로 완료되었습니다.
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success" id="btnLogin" name="btnLogin">로그인하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>


	<!-- end --> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	
	var goUrlLogin = "/shareLogin";
	var goUrlInst = "/MemberInst";
	
	var seq = $("input:hidden[name=seq]");

	var form = $("form[name=myform]");
	var formVo = $("form[name=formVo]");

	$("#btnLogin").on("click", function() {
		form.attr("action", goUrlLogin).submit();
	});
	
/*    	$("#btnSave").on("click", function() {
		if (seq.val() == "0" || seq.val() == "") {
			form.attr("action", goUrlInst).submit();
		} else {}
	}); */
	 
	//ID ajax
 	
 		$("#id").on("focusout", function() {
			var id = $("#id").val();
			
			alert("asdfasdf");
			
            $.ajax({
				async: true
				,cache: false
				,type: "post"
				,url: "idCheck"
				,data : {"id" : "1234"}
				,success: function(response) {
					alert(response.rt);
					if (response.rt == "success") {
						document.getElementById("id").classList.remove('is-invalid');
						document.getElementById("id").classList.add('is-valid');
						
						document.getElementById("idFeedback").classList.remove('invalid-feedback');
						document.getElementById("idFeedback").classList.add('valid-feedback');
						
						document.getElementById("idFeedback").innerText = "사용 가능 합니다";
						document.getElementById("idAllowedNy").value = 1;
					} else {
						document.getElementById("id").classList.add('is-invalid');
						
						document.getElementById("idFeedback").classList.remove('valid-feedback');
						document.getElementById("idFeedback").classList.add('invalid-feedback');
						document.getElementById("idFeedback").innerText = "사용 불가능 합니다";
						
						document.getElementById("idAllowedNy").value = 0;
					}
				}
				, error : function(jqXHR, textStatus, errorThrown) {
					alert("ajaxUpdate "  + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
		});
	});
	
	//비밀번호 확인	
	
  		$(function(){
 		
 			$('#pwCheck').blur(function(){	   
 				if($('#pw').val() != $('#pwCheck').val()){	    	
 					if($('#pwCheck').val()!=''){		    
 						alert("비밀번호가 일치하지 않습니다.");	    	    
 						$('#pwCheck').val('');	          
 						$('#pwCheck').focus();	      
 					 }	   
				 }	
 			})  	   
 		});

	 	validation = function() {
			if (!pw_check("#pw", $("#pw").val(), "#pwFeedback", "비밀번호를 입력하세요")) {
				return false;
			} else if (!pw_recheck("#pwCheck", $("#pwCheck").val(), "#pwCheckFeedback", "비밀번호를 입력하세요")) {
				
			}
		} 
 		
 	 	$("#btnSave").on("click", function() {
			if (validation() == false) {
				return false;
			} else {
				$("#exampleModalCenter").modal();
			}
			
		})
	 		
	</script>
	
</body>
</html>


