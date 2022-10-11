<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>adminNewUser</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/admin/newUser.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body style="background-color: rgb(224, 224, 224);">
	<div class="container">
		<nav>
			<div id="main">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="g nav-link" data-toggle="tab" id="btnUserList" name="btnUserList" style="cursor: pointer;">사용자목록</a></li>
					<li class="nav-item"><a class="g nav-link active" data-toggle="tab" id="btnNewUser" name="btnNewUser" style="cursor: pointer;">신규회원관리</a></li>
					<!-- <li class="nav-item"><a class="g nav-link" data-toggle="tab" id="btnUserAll" name="btnUserAll" style="cursor: pointer;">회원관리</a></li> -->
				</ul>
			</div>
		</nav>
		<main>
			<div class="cd2">
				<p class="Userlist mt-4" style="font-weight: bold;">
					Today 신규회원 <span class="num">nnn</span> 명
				</p>
				<div class="menuout">
					<div id="menu1">
						<ul>
							<li>No</li>
							<li>닉네임</li>
							<li>계정</li>
							<li>가입일</li>
						</ul>
					</div>
				</div>
				<div id="hr">
					<br>
					<hr>
				</div>
				<div class="menuout2">
					<div id="menu1">
						<ul>
							<li>1</li>
							<li>눈누난나</li>
							<li>sfsfgaf3@naver.com</li>
							<li>2000년00월00일</li>
						</ul>
					</div>
				</div>
			</div>
		</main>
		<div id="sidebar">
			<div class="side_img">
				<img src="/resources/images/share/fullLogo_w.png" style="cursor: pointer;" onclick="location.href='adminMain'">
			</div>
			<div class="side_info">
				<hr style="color: white;">
				<ul>
					<li><i class="fa-solid fa-sliders" id="btnAdmin" name="btnAdmin" style="cursor: pointer;">&nbsp 통계</i></li>
					<li><i class="fas fa-light fa-user" style="color: rgb(233, 231, 58);" id="btnUser" name="btnUser" style="cursor: pointer;">&nbsp 사용자 관리</i></li>
					<li><i class="a fas fa-regular fa-clipboard-list" id="btnList" name="btnList" style="cursor: pointer;">&nbsp 쉐어팟 관리</i></li>
				</ul>
			</div>
		</div>
	</div>
	<footer>
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
		var goUrlAdmin = "adminMain";
		var goUrlUserList = "adminUserList";
		var goUrlList = "adminList";

		var goUrlNewUser = "adminNewUser";
		var goUrlUserAll = "adminUserAll";

		$('#btnAdmin').on("click", function() {
			$(location).attr("href", goUrlAdmin);
		});

		$('#btnUserList').on("click", function() {
			$(location).attr("href", goUrlUserList);
		});

		$('#btnList').on("click", function() {
			$(location).attr("href", goUrlList);
		});

		$('#btnNewUser').on("click", function() {
			$(location).attr("href", goUrlNewUser);
		});

		$('#btnUserAll').on("click", function() {
			$(location).attr("href", goUrlUserAll);
		});
	</script>
</body>
</html>