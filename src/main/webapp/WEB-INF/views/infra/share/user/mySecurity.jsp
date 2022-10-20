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
	<title>MySecurity</title>
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
				</a>
				<ul class="nav nav-tabs mt-5">
					<li class="nav-item">
			  			<a class="nav-link" aria-current="page" href="myPage?seq=${sessSeq }">My Page</a>
					</li>
					<li class="nav-item">
				  		<a class="nav-link" href="myList?seq=${sessSeq }">My Share List</a>
					</li>
					<li class="nav-item">
			 	 		<a class="nav-link active" href="mySecurity?seq=${sessSeq }">Personal Information</a>
					</li>
				</ul>
			</div>
			<div style="margin: 30px 0px 0px 200px;">
			<table>
				<td>
					<label for="id" class="form-label">아이디 <span class="text-danger">*</span></label>
					<input class="a mt-2 form-control" id="id" name="id"  placeholder="아이디 입력" value="<c:out value="${item.id}"/>" required>
					<div class="invalid-feedback" id="idFeedback"></div>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<label for="pw">기존 비밀번호 <span class="text-danger">*</span></label>
			<table>
				<td>
					<input type="password" class="a mt-2 form-control" id="pw" name="pw" placeholder="현재 비밀번호 입력" onkeydown="validation()">
				  	<div type="hidden" class="msg" id="pw_msg" name="pw_msg" style="display: none;"></div>
					<div type="hidden" class="invalid-feedback" id="pwFeedback"></div>
				</td>
				<td>
					<i class="fa-solid fa-lock" id="lock"></i>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<label for="pw">변경 비밀번호 <span class="text-danger">*</span></label>
			<table>
				<td>
					<input type="password" class="a mt-2 form-control" id="pw" name="pw" placeholder="변경하실 비밀번호 입력" onkeydown="validation()">
				  	<div type="hidden" class="msg" id="pw_msg" name="pw_msg" style="display: none;"></div>
					<div type="hidden" class="invalid-feedback" id="pwFeedback"></div>
				</td>
				<td>
					<i class="fa-solid fa-lock" id="lock"></i>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<label for="pw">변경 비밀번호 <span class="text-danger">*</span></label>
			<table>
				<td>
					<input type="password" class="a mt-2 form-control" id="pw" name="pw" placeholder="변경하실 비밀번호 입력" onkeydown="validation()">
				  	<div type="hidden" class="msg" id="pw_msg" name="pw_msg" style="display: none;"></div>
					<div type="hidden" class="invalid-feedback" id="pwFeedback"></div>
				</td>
				<td>
					<i class="fa-solid fa-unlock" id="lock"></i>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<table>
				<td>
					<label>이름 <span class="text-danger">*</span></label>
					<input class="a mt-2 form-control" id="name" name="name"  placeholder="이름 입력" value="<c:out value="${item.name}"/>" required>
					<div class="invalid-feedback" id="nameCheckFeedback"></div>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<table>
				<td>
					<label>닉네임 <span class="text-danger">*</span></label>
					<input class="a mt-2 form-control" id="nick_nm" name="nick_nm" value="<c:out value="${item.nick_nm}"/>" placeholder="닉네임 입력" required>
					<div class="invalid-feedback" id="nick_nmCheckFeedback"></div>
				</td>
			</table>
			<hr style="color: rgb(78, 78, 78); width: 800px;">
			<label>이메일</label>
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
			<label>전화번호</label>
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
	</script>

</body>
</html>
