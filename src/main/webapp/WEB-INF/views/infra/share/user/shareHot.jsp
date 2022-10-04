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
	<title>shareHot</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<style  type="text/css">
		.a {
			height: 45px;
			box-shadow: -3px 3px 6px rgb(142, 150, 150);
			margin-top: 5px;
			margin-left: 20px;
			margin-right: 20px;
			padding: 10px 30px;
			border-radius:30px;
			background-color: rgba(233, 231, 58, 0.66);
		}

		.b {
			height: 45px;
			box-shadow: -3px 3px 6px rgb(142, 150, 150);
			margin-top: 30px;
			margin-left: 20px;
			margin-right: 20px;
			padding: 10px 30px;
			border-radius:30px;
			border-style: solid;
			border-width: 1px;
			border-color: rgb(238, 64, 64);
			background-color: white;
			cursor: pointer;
		}

		.c {
			float: right;
			display: inline-block;
			margin-right: 50px;
			justify-content: end;
		}

		.footer {
			position: fixed;
			bottom: 0;
			width: 100%;
		}
	</style>
</head>
<body>
	<!-- start -->
	<nav class="navbar mb-3" style="background-color:rgb(142, 68, 173); height: 30px;"></nav>
	<nav class="bg-transparent">
		<div class="container-fluid">
			<a class="navbar-brand" href="share">
				<img src="../../resources/images/share/sharehot.png" alt="" width="200" height="50" class="d-inline-block align-text-top ms-3">
			</a>
		</div>
	</nav>
	<nav class="navbar navbar-expand-lg bg-transparent mt-3 mb-3 js">
		<div class="c collapse navbar-collapse">
			<ul class="navbar-nav mb-2">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						카테고리
					</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">족발, 보쌈</a></li>
						<li><a class="dropdown-item" href="#">찜,탕,찌개</a></li>
						<li><a class="dropdown-item" href="#">돈까스,회,일식</a></li>
						<li><a class="dropdown-item" href="#">피자</a></li>
						<li><a class="dropdown-item" href="#">고기,구이</a></li>
						<li><a class="dropdown-item" href="#">양식</a></li>
						<li><a class="dropdown-item" href="#">치킨</a></li>
						<li><a class="dropdown-item" href="#">중식</a></li>
						<li><a class="dropdown-item" href="#">아시안</a></li>
						<li><a class="dropdown-item" href="#">백반,죽,국수</a></li>
						<li><a class="dropdown-item" href="#">도시락</a></li>
						<li><a class="dropdown-item" href="#">분식</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">카페,디저트</a></li>
						<li><a class="dropdown-item" href="#">그외 음식</a></li>
					</ul>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						인원
					</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">1인</a></li>
						<li><a class="dropdown-item" href="#">2인</a></li>
						<li><a class="dropdown-item" href="#">3인</a></li>
						<li><a class="dropdown-item" href="#">4인</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">그 외</a></li>
					</ul>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						시간
					</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">아침(09:00 - 11:30)</a></li>
						<li><a class="dropdown-item" href="#">점심(11:31 - 13:30)</a></li>
						<li><a class="dropdown-item" href="#">늦은 점심(13:31 - 17:30)</a></li>
						<li><a class="dropdown-item" href="#">저녁(17:31 - 20:00)</a></li>
						<li><a class="dropdown-item" href="#">늦은 저녁(20:01 - 22:00)</a></li>
						<li><a class="dropdown-item" href="#">야식(22:01 - 24:00)</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">그 외</a></li>
					</ul>
				</li>
				<li class="nav-item dropdown">
					<form class="d-flex" role="search">
					<input class="form-control me-2 text-center" id= "searchBox" type="search" style="width: 200px;" placeholder="검색어를 입력하세요." aria-label="Search">
					<button type="button" class="btn btn-outline-success bg-transparent" href="#">Search</button>
					</form>
				</li>
			</ul>
		</div>
	</nav>
	<div class="a pt-2 position-relative">
		<div class="container">
			<div class="row" href="#">
				<div class="col">
					카테고리
				</div>
				<div class="col text-center">
					제목
				</div>
				<div class="col text-center">
					인원
				</div>
				<div class="col text-center">
					장소
				</div>
				<div class="col text-center">
					시간
				</div>
				<div class="col text-center">
					가격
				</div>
			</div>
		</div>
	</div>
	<div class="b pt-2 position-relative">
		<div class="container">
			<div class="row" href="#">
				<div class="col">
					마라탕
				</div>
				<div class="col text-center">
					탕화쿵푸 마라탕 2인
				</div>
				<div class="col text-center">
					1/2인
				</div>
				<div class="col text-center">
					탕화쿵푸
				</div>
				<div class="col text-center">
					19:20
				</div>
				<div class="col text-center">
					12,300원
				</div>
			</div>
		</div>
	</div>
	<%@include file="../../common/xdmin/includeV1/pagination.jsp"%>
	
	
	

	<!-- end --> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script>
	
	</script>
</body>
</html>
