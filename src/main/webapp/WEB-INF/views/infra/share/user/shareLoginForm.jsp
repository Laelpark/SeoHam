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
	<title>newLoginForm</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="../css/newLoginForm.css">
</head>
<body>
	<!-- start -->
	<div class="navbar" style="background-color:rgb(142, 68, 173); height: 30px;"></div>
	<div class="row">
		<img class="col-6 ms-3 mt-3" src="../img/fullLogo_p.png" style="width: 150px; height: 45px;">
		<h2 class="col-6 offset-4 mt-5" id="newmem">회원가입</h2>
	</div>
	<div id="input">
		<label>아이디</label>
		<table>
			<td>
				<input class="a mt-2">
			</td>
		</table>
		<hr style="color: rgb(78, 78, 78); width: 800px;">
		<label>비밀번호</label>
		<table>
			<td>
				<input type="password" class="a mt-2">
			</td>
			<td>
				<i class="fa-solid fa-lock" id="lock"></i>
			</td>
		</table>
		<hr style="color: rgb(78, 78, 78); width: 800px;">
		<label>비밀번호 재확인</label>
		<table>
			<td>
				<input type="password" class="a mt-2">
			</td>
			<td>
				<i class="fa-solid fa-lock-open col-3 offset-2" id="lock"></i>
			</td>
		</table>
		<hr style="color: rgb(78, 78, 78); width: 800px;">
		<label>이름</label>
		<table>
			<td>
				<input class="a mt-2">
			</td>
		</table>
		<hr style="color: rgb(78, 78, 78); width: 800px;">
		<label>생년월일</label>
		<table>
			<td>
				<input class="b col mt-2" placeholder="년(4자)">
			</td>
			<td>
				<select class="select ms-3 mt-2 form-select" requiredss>
					<option>월</option>
					<option>1</option>
					<option>2</option>
				</select>
			</td>
			<td>
				<input class="b mt-2 ms-4" placeholder="일">
			</td>
		</table>
		<hr style="color: rgb(78, 78, 78); width: 800px;">
		<label>성별</label>
		<table>
			<td>
				<select class="select mt-2 form-select" requiredss>
					<option>성별</option>
					<option>남성</option>
					<option>여성</option>
					<option>선택안함</option>
				</select>
			</td>
		</table>
		<hr style="color: rgb(78, 78, 78); width: 800px;">
		<label>이메일</label>
		<table>
			<td>
				<input class="b col mt-2" placeholder="이메일주소">
			</td>
			<td>
				<span class="ms-3 mt-2">@</span>
			</td>
			<td>
				<select class="select ms-3 mt-2 form-select" requiredss>
					<option>이메일</option>
					<option>네이버(naver.com)</option>
					<option>다음(daum.net)</option>
					<option>지메일(gmail.com)</option>
				</select>
			</td>
		</table>
		<hr style="color: rgb(78, 78, 78); width: 800px;">
		<label>전화번호</label>
		<table>
			<td>
				<select class="select mt-2 form-select" requiredss>
					<option>통신사</option>
					<option>SKT</option>
					<option>KT</option>
					<option>LG</option>
				</select>
			</td>
			<td>
				<input class="mt-2 ms-3" style="width: 400px; height: 35px;" placeholder="특수문자(-)없이 숫자만 입력">
			</td>
			<td>
				<button type="button" class="mt-2 ms-3 btn btn-outline-secondary">전송</button>
			</td>
		</table>
		<hr style="color: rgb(78, 78, 78); width: 800px;">
		<label>인증번호</label>
		<table>
			<td>
				<input class="mt-2" placeholder="인증번호 입력">
			</td>
		</table>
		<hr style="color: rgb(78, 78, 78); width: 800px;">
	</div>
	<div id="wrapper" class="mt-5 mb-3">
		<button id="done" type="submit" class="btn btn-primary btn-lg" onclick=deleteValue(); data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
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
						<a href="../member/main.html">
							<button type="button" class="btn btn-secondary">확인</button>
						</a>
						<a href="../member/loginForm.html">
							<button type="button" class="btn btn-success">로그인하기</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- end --> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
</body>
</html>


