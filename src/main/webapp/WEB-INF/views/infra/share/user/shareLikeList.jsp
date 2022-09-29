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
	<title>shareLikeList</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/resources/css/share/shareLike_List.css">
</head>
<body>
	<!-- start -->
	<nav class="navbar mb-3" style="background-color:rgb(142, 68, 173); height: 30%;"></nav>
	<nav class="bg-transparent">
		<div class="container-fluid">
			<a class="navbar-brand" href="../member_Login_Done/LoginDoneMain.html">
				<img src="../../resources/images/share/LikeList_Full.png" alt="" width="180" height="50" class="d-inline-block align-text-top ms-3">
			</a>
		</div>
	</nav>
	<nav class="navbar navbar-expand-lg bg-transparent mt-5 mb-3 js">
		<button id="deleteBtn" type="button" class="btn btn-sm" onclick=deleteValue(); data-bs-toggle="modal" data-bs-target="#exampleModalCenter">삭제</button>
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle">제거하시겠습니까?</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body"  align="center">
						<i class="fas fa-light fa-circle-exclamation" style="color: red;"></i>
						제거된 리스트는 복구할 수가 없습니다.
					</div>
					<div class="modal-footer">
						<a>
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						</a>
						<a href="../share/shareLike_List.html">
							<button type="button" class="btn btn-danger">삭제</button>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="c collapse navbar-collapse">
			<ul class="navbar-nav mb-2">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						카테고리
					</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">족발,보쌈</a></li>
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
				<div class="col-1">
					<input type="checkbox" name="chk_all" id="chk_all" onclick="checkAll(this)">
				</div>
				<div class="col">
					카테고리
				</div>
				<div class="col-3 text-center">
					제목
				</div>
				<div class="col text-center">
					장소
				</div>
				<div class="col text-center">
					날짜
				</div>
				<div class="col text-center">
					가격
				</div>
				<div class="col text-center">
					상태
				</div>
			</div>
		</div>
	</div>
	<div class="b pt-2 position-relative">
		<div class="container">
			<div class="row" href="#">
				<div class="col-1">
					<input type="checkbox" name="chk_box" onclick="checkSelectAll(this)">
				</div>
				<div class="col">
					마라탕
				</div>
				<div class="col-3 text-center">
					탕화쿵푸 마라탕 2인
				</div>
				<div class="col text-center">
					탕화쿵푸
				</div>
				<div class="col text-center">
					2000.00.00
				</div>
				<div class="col text-center">
					12,300
				</div>
				<div class="col text-center">
					완
				</div>
			</div>
		</div>
	</div>
	<div class="b pt- position-relative">
		<div class="container">
			<div class="row" href="#">
				<div class="col-1">
					<input type="checkbox" name="chk_box" onclick="checkSelectAll(this)">
				</div>
				<div class="col">
					피자
				</div>
				<div class="col-3 text-center">
					피자헛 골드크러스트 라지
				</div>
				<div class="col text-center">
					ㅇㅇ사거리 앞
				</div>
				<div class="col text-center">
					2000.00.00
				</div>
				<div class="col text-center">
					15,000
				</div>
				<div class="col text-center">
					종료
				</div>
			</div>
		</div>
	</div>
	<nav class="footer" aria-label="Page navigation example">
		<ul class="pagination justify-content-center  active">
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</ul>
	</nav>
	
	
	

	<!-- end --> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
		var star = document.querySelector("#star");
		star.onclick = function() {
			star.style.color = "yellow";
		}

		function checkSelectAll()  {
			// 전체 체크박스
			const checkboxes 
				= document.querySelectorAll('input[name="chk_box"]');
			// 선택된 체크박스
			const checked 
				= document.querySelectorAll('input[name="chk_box"]:checked');
			// select all 체크박스
			const selectAll 
				= document.querySelector('input[name="chk_all"]');
			
			if(checkboxes.length === checked.length)  {
				selectAll.checked = true;
			}else {
				selectAll.checked = false;
			}

		}
		// 하위 체크박스 전체 선택시 전체박스 체크
		function checkAll(selectAll)  {
			const checkboxes 
				= document.getElementsByName('chk_box');
			
			checkboxes.forEach((checkbox) => {
				checkbox.checked = selectAll.checked
			})
		}
		function deleteValue(){
			var ur1 = "delete";
			var valueArr = new Array();
			var list = $()
		}
		function newPage() {
			window.location.href = '../member/main.html'
		}
	</script>
</body>
</html>
