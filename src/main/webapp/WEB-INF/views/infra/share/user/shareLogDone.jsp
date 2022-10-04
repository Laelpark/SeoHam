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
	<title>SHARE</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/share/shareMain.css">
	<link href="/resources/images/share/smLogo.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<!-- start -->
	<form id="myform" name="myform" method="post" autocomplete="off">
		<nav class="navbar" style="background-color:rgb(142, 68, 173); height: 100%;">
			<div class="container-fluid">
				<a class="navbar-brand">
					<img src="../../resources/images/share/fullLogo_w.png" alt="" width="160px" height="60px" class="d-inline-block align-text-top">
				</a>
				<c:choose>
					<c:when test="${empty sessSeq}">
						<div class="info pt-5">
							<a>
								<span style="color: rgb(197, 26, 26); text-shadow: 2px 2px 2px black;" class="fw-bold fs-4 pe-5" type="button" id="btnHot" name="btnHot">실시간 HOT!</span>
								<span style="color: white; text-shadow: 2px 2px black;" class="fw-bold fs-4 pe-5" type="button" id="btnPot" name="btnPot">Share Pot</span>
								<span style="color: white; text-shadow: 2px 2px black;" class="fw-bold fs-4" type="button" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">Share Now</span>
								<div class="modal fade" id="exampleModalCenter" tabindex="-1" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalCenterTitle">로그인을 해주세요.</h5>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body"  align="center">
												<i class="fas fa-light fa-circle-exclamation" style="color: red;"></i>
												로그인 먼저 진행해주세요.
											</div>
											<div class="modal-footer">
												<a>
													<button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
												</a>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div id="menu">
							<ul class="navbar-nav flex-row ms-md-auto pe-3">
								<li class="nav-item col-4 me-2">
									<a class="nav-link py-2 px-0 px-lg-2" style="color: rgb(193, 232, 100); cursor: pointer;" type="button" id="btnLogin" name="btnLogin">
										<i class="fa-solid fa-user fa-lg"></i>
									</a>
								</li>
								<li class="">
									<a class="nav-link py-2 px-0 px-lg-2 me-2" style="cursor: pointer;" type="button">
										<i style="color: rgb(193, 232, 100);" class="fa-solid fa-star fa-lg" data-bs-toggle="modal" data-bs-target="#exampleModalCenter"></i>
										<div class="modal fade" id="exampleModalCenter2" tabindex="-2" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalCenterTitle2">로그인을 해주세요.</h5>
														<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body"  align="center">
														<i class="fas fa-light fa-circle-exclamation" style="color: red;"></i>
														저장된 리스트가 없습니다.
													</div>
													<div class="modal-footer">
														<a>
															<button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
														</a>
													</div>
												</div>
											</div>
										</div>
									</a>
								</li>
								<li class="nav-item col-4 me-2">
									<a class="nav-link py-2 px-0 px-lg-2" style="color: rgb(193, 232, 100); cursor: pointer;" type="button" id="btnAdmin" name="btnAdmin">
										<i class="fa-solid fa-screwdriver-wrench"></i>
									</a>
								</li>
							</ul>
						</div>
					</c:when>
					<c:otherwise>
					<div class="info pt-5">
						<a>
							<span style="color: rgb(197, 26, 26); text-shadow: 2px 2px 2px black;" class="fw-bold fs-4 pe-5" type="button" id="btnHot" name="btnHot">실시간 HOT!</span>
							<span style="color: white; text-shadow: 2px 2px black;" class="fw-bold fs-4 pe-5" type="button" id="btnPot" name="btnPot">Share Pot</span>
							<span style="color: white; text-shadow: 2px 2px black;" class="fw-bold fs-4" type="button" id="btnNow" name="btnNow" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">Share Now</span>
						</a>
					</div>
						<div id="menu">
							<ul class="navbar-nav flex-row ms-md-auto me-4">
								<li class="nav-item col-4"></li>
								<li class="nav-item col-4">
									<a class="nav-link py-2 px-0 px-lg-2" style="color: rgb(193, 232, 100); cursor: pointer;" type="button" id="btnMypage" name="btnMypage">
										<i class="fa-solid fa-user fa-lg"></i>
									</a>
								</li>
								<li class="">
									<a class="nav-link py-2 px-0 px-lg-2" style="color: rgb(193, 232, 100); cursor: pointer;"  type="button" id="btnList" name="btnList">
										<i class="fa-solid fa-star fa-lg"></i>
									</a>
								</li>
								<li class="nav-item col-4 ms-3">
									<a class="nav-link py-2 px-0 px-lg-2" style="color: rgb(193, 232, 100); cursor: pointer;" type="button" id="btnLogout" name="btnLogout">
										<i class="fa-solid fa-arrow-right-from-bracket fa-lg"></i>
									</a>
								</li>
							</ul>
							<span style="color: white; text-shadow: 2px 2px black; float: right;" class="">
								<br><c:out value="${sessName }"/>님,
								Welcome to SHARE!</span>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
	  	</nav>
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			</div>
			<div id="bg-img" class="carousel slide container-fluid gx-0" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="../../resources/images/share//1g.jpg" class="d-block w-100" alt="..." style="height: 880px;">
						<ul class="imtext position-absolute fw-bold" style="z-index: 1; color:white; font-size: 80px; width: 800px; top: 150px; left: 20px;">
							<li class="pb-3">
								<a style="font-size: 80px">1인배달,</a>
							</li>
							<li class="pb-3">
								<a style="font-size: 80px">이젠 망설이지 말고</a>
							</li>
							<li>
								<a style="color: rgb(142, 68, 173); text-shadow: 6px 2px 2px white; font-size: 80px;">SHARE</a>하자!
							</li>
						</ul>
					</div>
					<div class="carousel-item">
						<img src="../../resources/images/share/2g.jpg" class="d-block w-100 inner-shadow" alt="..." style="height: 880px;">
						<div class="row">
							<ul class="imtext position-absolute fw-bold" style="z-index: 1; color:white; font-size: 80px; width: 800px; top: 90px; left: 20px;">
								<li class="col-5 offset-2">
									<a style="font-size: 100px; color: white; text-shadow: 6px 2px 2px rgba(241, 196, 15);">
										Share
									</a>
								</li>
								<li class="col-5 offset-5">
									<a style="font-size: 130px; color: white; text-shadow: 6px 2px 2px rgba(241, 196, 15);">
										Together
									</a>
								</li>
								<li class="col-1 offset-11">
									<a style="font-size: 150px; color: white; text-shadow: 6px 2px 2px rgba(241, 196, 15);"> 
										Now
									</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="c navbar navbar-expand-lg">
						<div class="box">
							<div class="container-1">
								<div class="dropdown">
									<button class="btn btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
										카테고리
									</button>
									<ul class="dropdown-menu mt-5">
										<li><a class="dropdown-item" href="#">치킨</a></li>
										<li><a class="dropdown-item" href="#">족발/보쌈</a></li>
										<li><a class="dropdown-item" href="#">찜/탕/찌개</a></li>
										<li><a class="dropdown-item" href="#">돈까스/회/일식</a></li>
										<li><a class="dropdown-item" href="#">피자</a></li>
										<li><a class="dropdown-item" href="#">고기/구이</a></li>
										<li><a class="dropdown-item" href="#">양식</a></li>
										<li><a class="dropdown-item" href="#">중식</a></li>
										<li><a class="dropdown-item" href="#">아시안</a></li>
										<li><a class="dropdown-item" href="#">백반/죽/국수</a></li>
										<li><a class="dropdown-item" href="#">도시락</a></li>
										<li><a class="dropdown-item" href="#">분식</a></li>
										<li><a class="dropdown-item" href="#"><hr class="dropdown-divider"></a></li>
										<li><a class="dropdown-item" href="#">카페/디저트</a></li>
										<li><a class="dropdown-item" href="#">그외 음식</a></li>
									</ul>
								</div>
								<input class="search form-control" type="search" id="search" placeholder="검색어를 입력해주세요." />
								<button class="btn btn-outline-success text-white" type="submit">Search</button>
							</div>
						</div>
					</div>
				<div>
			</div>
		</div>
		<div class="footerinfo">
			<a>회사소개</a>
			<span>|</span>
			<a>이용약관</a>
			<span>|</span>
			<a>공지사항</a>
			<span>|</span>
			<a>개인정보처리방침</a>
			<span>|</span>
			<a>이메일무단수집거부</a>
			<span>|</span>
			<a>© SHARE</a>
			<span>|</span>
		</div>
	</form>
	
	<!-- end --> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	
	var goUrlHot = "shareHot"; 			
	var goUrlPot = "sharePot"; 			
	var goUrlNow = "shareNow";				
	var goUrlLogin = "shareLogin";		
	var goUrlMyPage = "shareMyPage";		
	var goUrlLikeList = "shareLikeList";				
	var goUrlAdmin = "adminLogin";
	
	
	$('#btnHot').on("click", function() {
		 $(location).attr("href", goUrlHot);
		});

	$('#btnPot').on("click", function() {
		 $(location).attr("href", goUrlPot);
		});
	$('#btnNow').on("click", function() {
		 $(location).attr("href", goUrlNow);
		});
	
	$('#btnLogin').on("click", function() {
		 $(location).attr("href", goUrlLogin);
		});
	$('#btnMypage').on("click", function() {
		 $(location).attr("href", goUrlMyPage);
		});
	$('#btnList').on("click", function() {
		 $(location).attr("href", goUrlLikeList);
		});
	
	$('#btnAdmin').on("click", function() {
		 $(location).attr("href", goUrlAdmin);
		});
	
	
	// 로그아웃
	
	$("#btnLogout").on("click", function(){
		$.ajax({
			async: true 
			,cache: false
			,type: "post"
			,url: "logoutProc"
			,data: {}
			,success: function(response) {
				if(response.rt == "success") {
					location.href = "/share";
				} else {
					// by pass
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