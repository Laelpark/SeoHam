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
	<title>shareContent.html</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<style  type="text/css">
		.a {
			float: inline-start;
			display: inline-block;
			background-color: rgb(224, 224, 224);
			height: 70px;;
			margin-top: 5px;
			margin-left: 40px;
			margin-right: 40px;
			border-radius:5px;
			border-style: solid;
			border-width: 1px;
			border-color: rgb(193, 232, 100);
			box-shadow: 3px 5px 6px rgb(142, 150, 150);
			/* justify-content: center; */
		}

		.b{
			background-color: transparent;
			border-width: 1px;
			border-style: solid;
			border-color: white;
			height: 265px;
			width: 300px;
			margin-left: 30px;
		}

		.c{
			height: 250px;
			width: 900px;
		}

		.d{
			height: 50px;
			border-radius:8px;
			border-style: solid;
			border-width: 1px;
			border-color: white;
			margin-right: 30px;
		}

		.topBtn {
			float: right;
			margin-right: 50px;
			justify-content: end;
			display:  block;
		}

		#date {
			text-align: center;
			margin-top: 5px;
		}
	</style>
</head>
<body>
	<!-- start -->
	<nav class="navbar mb-3" style="background-color:rgb(142, 68, 173); height: 30%;"></nav>
	<nav class="bg-transparent">
		<div class="container-fluid">
			<a class="navbar-brand" href="../member/main.html">
				<img src="../shareImg/sharenow.png" alt="" width="230" height="60" class="d-inline-block align-text-top ms-3">
			
		</div>
	</nav>
	<nav class="navbar navbar-expand-lg bg-transparent">
		<div class="topBtn collapse navbar-collapse" id="navbarSupportedContent">
			<form class="d-flex" role="search">
				<button type="button" class="btn btn-outline-danger me-4">취소</button>
				<button type="button" class="btn btn-outline-success">저장</button>
			</form>
		</div>
	</nav>
	<nav class="navbar navbar-expand-lg">
		<div class="a collapse navbar-collapse">
			<ul class="navbar-nav mb-2 mt-2 ms-3">
				<li class="nav-item dropdown">
					<img alt="" src="../img/user.png" style=" margin-left: 8px; width: 60px; height: 40px; border-radius: 100px;">
				</li>
				<li>
					<select class="form-select col ms-3 me-3" style="width: 180px; height: 50px;" id="Food_Select" name="Food_Select" required>
						<option>카테고리</option>
						<option>치킨</option>
						<option>족발,보쌈</option>
						<option>찜,탕,찌개</option>
						<option>돈까스,회,일식</option>
						<option>피자</option>
						<option>고기,구이</option>
						<option>양식</option>
						<option>치킨</option>
						<option>중식</option>
						<option>아시안</option>
						<option>백반,죽,국수</option>
						<option>도시락</option>
						<option>분식</option>
						<option><hr class="dropdown-divider"></option>
						<option>카페,디저트</option>
						<option>그외 음식</option>
					</select>
				</li>
				<li class="nav-item dropdown">
					<form class="d-flex">
						<input class="form-control me-2 text-center" id= "searchBox" type="text" style="width: 480px; height: 50px;" placeholder="검색어를 입력하세요." aria-label="Search">
					</form>
				</li>
				<li>
					<select class="form-select col ms-3 me-3" style="width: 180px; height: 50px;" id="emailSelect" required>
						<option>인원</option>
						<option>1인</option>
					</select>
				</li>
			</ul>
		</div>
	</nav>
	<nav class="navbar navbar-expand-lg">
		<div class="a collapse navbar-collapse" style="height: 300px;">
			<div class="b me-3">
				<div class="filebox">
					<img src="" id="preview" width="250px;" id="preview">	
					<label for="ex_file"></label>
					<input type="file" id="ex_file" name="chooseFile" accept="image/*" onchange="loadFile(this)">
				</div>
			</div>
            <div class="ms-3">
                <div class="c">
                    <textarea class="form-control" id="validationTextarea" placeholder="주문하실 음식점 이름과 메뉴, 가격 등을 자세히 기재해주세요." rows="10"></textarea>
                </div>
            </div>
        </div>
	</nav>
    <nav class="navbar navbar-expand-lg">
		<div class="a collapse navbar-collapse" style="height: 250px;">
            <div class="ms-3 me-4">
                <div class="row">
					<nav class="d navbar col-12" style="background-color:rgba(233, 231, 58, 0.66);">
						<div class="row">
							<div class="col-4">
								<p id="date">거래 장소</p>
							</div>
							<div class="col-8">
								<input type="text" style="width: 850px; margin-left: auto;">
							</div>
						</div>
					</nav>
					<nav class="d navbar col-12 mt-4" style="background-color:rgba(233, 231, 58, 0.66);">
						<div class="row">
							<div class="col-4">
								<p id="date">거래 시간</p>
							</div>
							<div class="col-8">
								<input type="text" style="width: 850px; margin-left: auto;">
							</div>
						</div>
					</nav>
					<nav class="d navbar col-12 mt-4" style="background-color:rgba(233, 231, 58, 0.66);">
						<div class="row">
							<div class="col-4">
								<p id="date">인당 가격</p>
							</div>
							<div class="col-8">
								<input type="text" style="width: 850px; margin-left: auto;">
							</div>
						</div>
					</nav>
				</div>
            </div>
        </div>
	</nav>

	<!-- end --> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script>
	
	</script>
</body>
</html>
