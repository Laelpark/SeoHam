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
	<title>memberList.html</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<style  type="text/css">
		/* card bg-light {
		  height:100vh;
		  width: 100vw;
		} */
		.info {
			cursor:pointer;
		}
	</style>
</head>
<body>
	<!-- start -->
	<form action="./memberList.html" method="get" id="form" class="m-3 ">
		<nav class="navbar fixed-top" style="background-color: #e3f2fd;">
			<div class="container-fluid">
			  <a class="navbar-brand" href="#">
			 	<img src="DLlogo.png" alt="" width="30" height="30" class="d-inline-block align-text-top">
					DL Company
				</a>
			  <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
				<span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header">
				 	<img src="DLlogo.png" alt="" width="30" height="30" class="d-inline-block align-text-top">
				  	<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>
				<div class="offcanvas-body">
				  <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
					<li class="nav-item">
					  <a class="nav-link active" aria-current="page" href="#">회원가입</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="#">로그인</a>
					  </li>
					<li class="nav-item">
					  <a class="nav-link" href="#">지원명단</a>
					</li>
					<li class="nav-item dropdown">
					  <a class="nav-link dropdown-toggle active" href="#" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						채용공고
					  </a>
					  <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
						<li><a class="dropdown-item" href="#">IT/개발</a></li>
						<li><a class="dropdown-item" href="#">인사/노무</a></li>
						<li><a class="dropdown-item" href="#">기획/전략</a></li>
						<!-- <li>
						  <hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
					  </ul>
					</li> -->
				  </ul>
				  <div class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"  style= "width: 150px;">
					<button class="btn btn-outline-success" type="submit">Search</button>
				  </div>
				</div>
			  </div>
			</div>
		</nav>
		<div class="pb-3 pe-3 ps-3 pt-4">
			<div class="card text-white mt-5 shadow"> 
				<img src="scott-graham-OQMZwNd3ThU-unsplash.jpg" class="card-img" alt="..." style="max-height: 250px;">
				<div class="card-img-overlay p-5">
					<h2 class="card-title text-center p-5" style="color: black;">지원명단</h2>
				</div>	
			</div>
		</div>
		<div class="row needs-validation ms-3 me-3 mt-3 mb-5 p-3 shadow-lg bg-body rounded" novalidate>
			<div class="row mb-2">
				<div class="col-md-3">
					<select class="form-select" id="validationCustom01" required>
						<option selected disabled value="">삭제여부</option>
						<option>YES</option>
						<option>NO</option>
					</select>
				</div>
				<div class="col-md-3">
					<select class="form-select" id="validationCustom02" required>
						<option selected disabled value="">등록일</option>
						<option>...</option>
						<option>...</option>
					</select>
				</div>
				<div class="col-md-3">
					<input type="text" class="form-control" id="validationCustom03" placeholder="시작일" required>
				</div>
				<div class="col-md-3">
					<input type="text" class="form-control" id="validationCustom04" placeholder="종료일" required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<select class="form-select" id="validationCustom01" required>
					<option selected disabled value="">검색구분</option>
					<option>...</option>
					<option>...</option>
					</select>
				</div>
				<div class="col-md-3">
					<input type="text" class="form-control" id="validationCustom04" placeholder="검색어를 입력하세요." required>
				</div>
				<div class="col-md-2">
					<button class="btn btn-warning" type="submit" id="searching"><i class="fa-solid fa-magnifying-glass"></i></button>
					<div class="toast-container position-fixed bottom-0 end-0 p-3">
						<div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
							<div class="toast-header">
								<img src="..." class="rounded me-2" alt="...">
								<strong class="me-auto">Bootstrap</strong>
								<small>11 mins ago</small>
								<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
							</div>
							<div class="toast-body">
								Hello, world! This is a toast message.
							</div>
						</div>
					</div>
					<button class="btn btn-danger" type="submit"><i class="fa-solid fa-rotate-right"></i></button>
				</div>
			</div>
		</div>	
		<div class="mt-4">
			<ul class="nav nav-tabs ms-3 me-3">
			  <li class="nav-item">
			    <a class="nav-link active" aria-current="page">코드관리</a>
			  </li> 
			  <li class="nav-item">
			    <a class="nav-link">코드그룹관리</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link">회원관리</a>
			  </li>
			</ul>
		</div>
		
		<div class="ms-3 me-3 mt-3 mb-4 shadow-lg bg-body rounded">
			<table class="table table-striped table-hover text-center">
				<thead>
					<tr style="background-color: #6666cc;">
						<th scope="col">
							<input type="checkbox" name="chk_all" id="chk_all" onclick="checkAll(this)">
						</th>
						<th>#</th>
						<th class="td1" scope="col">이름</th>
						<th class="td2" scope="col">나이</th>
						<th class="td3" scope="col">지원분야</th>
						<th class="td4" scope="col">성별</th>
					</tr>
				</thead>
				<tbody>
				<c:set var="listCodeGender" value="${CodeServiceImpl.selectListCachedCode('2')}"/>
					<tr onclick="newPage()" class="info">
						<th scope="row" class="td1"><c:out value="${list.memSeq}" /></th>
						<td><c:out value="${list.memName}" /></td>
						<td><c:out value="${list.memAge}" /></td>
						<td><c:out value="${list.memFiled}" /></td>
						<td><c:forEach items="${list.CodeGender}" var="listGender" varStatus="statusGender">
								<c:if test="${list.memGenderCd eq listGender.cdSeq}"><c:out value="${listGender.codeName }"/></c:if>
							</c:forEach>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="row">
				<div class="col-md-4 offset-md-5">
					<nav aria-label="Page navigation example">
						<ul class="pagination pagination-sm">
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<div class="container-fluid pe-4 ps-3">
			<div class="row">
				<div class="col-md-2"> 
					<button class="btn btn-danger del" type="button" onclick=deleteValue(); data-bs-toggle="modal" data-bs-target="#exampleModalCenter"><i class="fa-solid fa-trash-can"></i></button>
					<!-- <button class="btn btn-danger" type="button"><i class="fa-solid fa-xmark"></i></button> -->
					<div class="modal fade" id="exampleModalCenter" tabindex="-1" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalCenterTitle">삭제하시겠습니까?</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body"  align="center">
									<img src="./DLlogo.png" class="rounded me-2" alt="..." style="width: 8%; height: 8%;">
									삭제된 정보는 복구할 수가 없습니다.
								</div>
								<div class="modal-footer">
									<a>
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									</a>
									<a href="./memberList.html">
										<button type="button" class="btn btn-danger">삭제</button>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2 offset-md-8" align="right">
					<!-- <button class="btn btn-success" type="button"><i class="fa-solid fa-file-excel"></i></button> -->
					<a href="./memberReg.html">
						<button class="btn btn-primary" type="button"><i class="fa-solid fa-plus"></i></button>
					</a>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-expand-lg bg-white mt-5 mb-3 position-absolute bottom-30 start-50 translate-middle-x">
		  <div class="container-fluid">
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav">
		        <li class="nav-item">
		          <a class="nav-link">이용약관</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link">개인정보처리방침</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link">이메일무단수집거부f</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link">안내사항</a>
		        </li>
				<li class="nav-item">
					<a class="nav-link disabled">© DL, All rights reserved.</a>
				  </li>
		      </ul>
		    </div>
		  </div>
		</nav>
	</form>
	<!-- end --> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script>
		const fileInput = document.getElementById("fileUpload");
		fileInput.onchange = () => {
			const selectedFile = [...fileInput.files];
			console.log(selectedFile);
		};
		fileInput.addEventListener("change", handleFiles);

		const toastTrigger = document.getElementById('savebtn')
		const toastLiveExample = document.getElementById('liveToast')
		if (toastTrigger) {
			toastTrigger.addEventListener('click', () => {
				const toast = new bootstrap.Toast(toastLiveExample)

				toast.show()
			})
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
			window.location.href = './memberMod.html'
		}
	</script>
</html>























	
		<!-- end --> 
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
		<script>
			const fileInput = document.getElementById("fileUpload");
			fileInput.onchange = () => {
				const selectedFile = [...fileInput.files];
				console.log(selectedFile);
			};
			fileInput.addEventListener("change", handleFiles);

			const toastTrigger = document.getElementById('savebtn')
			const toastLiveExample = document.getElementById('liveToast')
			if (toastTrigger) {
				toastTrigger.addEventListener('click', () => {
					const toast = new bootstrap.Toast(toastLiveExample)

					toast.show()
				})
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
				window.location.href = './memberMod.html'
			}
		</script>
	</body>
</html>
