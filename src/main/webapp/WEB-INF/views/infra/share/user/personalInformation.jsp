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
	<title>Change My Information</title>
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
			 	 		<a class="nav-link active" onclick="goInfo()">Change My Information</a>
					</li>
					<li class="nav-item">
			 	 		<a class="nav-link" onclick="goSecu()">MY Security</a>
					</li>
				</ul>
			</div>
			<div style="margin: 30px 0px 0px 200px;">
			<table>
				<td>
					<label for="id" class="form-label">Id<span class="text-danger" style="font-size: 10px;"> 아이디는 변경불가</span></label>
					<input class="a mt-2 form-control" id="id" name="id"  placeholder="아이디 입력" value="<c:out value="${item.id}"/>" disabled="disabled">
					<div class="invalid-feedback" id="idFeedback"></div>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<table>
				<td>
					<label>Name <span class="text-danger">*</span></label>
					<input class="a mt-2 form-control" id="name" name="name"  placeholder="이름 입력" value="<c:out value="${item.name}"/>" required>
					<div class="invalid-feedback" id="nameCheckFeedback"></div>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<table>
				<td>
					<label>Nick Name <span class="text-danger">*</span></label>
					<input class="a mt-2 form-control" id="nick_nm" name="nick_nm" value="<c:out value="${item.nick_nm}"/>" placeholder="닉네임 입력" required>
					<div class="invalid-feedback" id="nick_nmCheckFeedback"></div>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<table>
				<td>
					<label>Share Place</label>
					<input class="a mt-2 form-control" id="nick_nm" name="nick_nm"  placeholder="주 거래 장소를 입력해주세요." value="<c:out value="${item.share_place}"/>" required>
					<div class="invalid-feedback" id="nick_nmCheckFeedback"></div>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<label>Email</label>
			<table>
				<td>
					<input class="b col mt-2 form-control" placeholder="이메일주소" id="email" name="email"
						value="<c:out value="${item.email}"/>">
				</td>
				<td>
					<span class="ms-3 mt-2">@</span>
				</td>
				<td>
					<select class="select ms-3 mt-2 form-select" id="email_div" name="email_div">
						<option selected disabled value="" <c:if test="${empty item.email}">selected</c:if>>이메일선택</option>
						<c:set var="listCodeEmail" value="${CodeServiceImpl.selectListCachedCode('2') }" />
							<c:forEach items="${listCodeEmail}" var="listEmail" varStatus="statusEmail">
							<option value="${item.email }" <c:if test="${item.email eq listEmail.cdSeq}">selected</c:if>><c:out value="${listEmail.name }"/></option>
						</c:forEach>
					</select>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<label>Phone</label>
			<table>
				<td>
					<select class="select mt-2 form-select" id="phone_div" name="phone_div">
						<option selected disabled value="" <c:if test="${empty item.phone}">selected</c:if>>통신사선택</option>
						<c:set var="listCodePhone" value="${CodeServiceImpl.selectListCachedCode('3') }" />
							<c:forEach items="${listCodePhone}" var="listPhone" varStatus="statusPhone">
							<option value="${item.phone }" <c:if test="${item.phone eq listPhone.cdSeq}">selected</c:if>><c:out value="${listPhone.name }"/></option>
						</c:forEach>
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
	
	$("#password").on("focusout", function() {
		var id = $("#password").val();
		
		if (!id_check("#password", $("#password").val(), "#idFeedback"	, "아이디를 입력하세요")) {
			return false;
		} else {
            $.ajax({
				async: true
				,cache: false
				,type: "post"
				,url: "idCheck"
				,data : {"id" :  $("#id").val()}
				,success: function(response) {
					
					if (response.rt == "success") {
						document.getElementById("id").classList.remove('is-invalid');
						document.getElementById("id").classList.add('is-valid');
						
						document.getElementById("idFeedback").classList.remove('invalid-feedback');
						document.getElementById("idFeedback").classList.add('valid-feedback');
						
						document.getElementById("idFeedback").innerText = "사용가능한 아이디입니다.";
						document.getElementById("idAllowedNy").value = 1;
					} else {
						document.getElementById("id").classList.add('is-invalid');
						
						document.getElementById("idFeedback").classList.remove('valid-feedback');
						document.getElementById("idFeedback").classList.add('invalid-feedback');
						document.getElementById("idFeedback").innerText = "사용 불가능한 아이디입니다.";
						
						$("#id").focus();
						
						document.getElementById("idAllowedNy").value = 0;
					}
				}
				, error : function(jqXHR, textStatus, errorThrown) {
					alert("ajaxUpdate "  + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
			
		}
	});
	
	// validation.js파일
	
 	validation = function() {
		if (!id_check("#id", $("#id").val(), "#idFeedback"	, "아이디를 입력하세요.")) {
			return false;
		} else if (!pw_check("#pw", $("#pw").val(), "#pwFeedback", "비밀번호를 입력하세요.")) {
			return false;
		} else if (!pwRecheck("#pwCheck", $("#pwCheck").val(), "#pwCheckFeedback", "비밀번호를 입력하세요.")) {
			return false;
		} else if (!name_check("#name", $("#name").val(), "#nameCheckFeedback", "이름을 입력하세요.")) {
			return false;
		} else if (!nick_nm_check("#nick_nm", $("#nick_nm").val(), "#nick_nmCheckFeedback", "닉네임을 입력하세요.")) {
			return false;
		} else true;
	};
		

	$("#btnSave").on("click", function() {
		/* if (validation() == false) {
			return false;
		} else { */
			swAlert("가입성공!", "Welcometo SHARE!", "success");
		/* } */
		
	});
 		
	 	function swAlert(title, text, icon) {
		swal({
			title: title,
			text: text,
			icon: icon,
			button: "확인"
		}).then((value) => {
			if (value) {
				location.href = "/shareLogin";
			}
		});
	}
	</script>
	
</body>
</html>
