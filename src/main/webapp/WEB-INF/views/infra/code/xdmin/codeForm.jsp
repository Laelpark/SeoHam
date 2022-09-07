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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>CodeForm.html</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/codeGroupList.css">
	</head>
	<body>
		<!-- start -->
		<header>
			<div class="header bg-light">
				<div class="container">
					<div class="row d">
						<nav class="navbar col">
							<div class="col">
								<a class="navbar-brand" href="#">
									<img src="https://getbootstrap.com/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="align-text-top ms-5">
									<span></span> Management System
								</a>
							</div>
							<div class="row offset-5">
								<div class="userimg col">
									<img alt="" src="../../user/img/user.png" style=" width: 60px; height: 40px;border-radius: 100px;" class="me-4 mb-4 ">
									<span id="nm" class="d-inline-block">Tony Chang <br> Administrator</span>
								</div>
							</div>
							<div class="col">
								<select class="form-select col" id="emailSelect" style="width: 90px;">
									<option selected>언어</option>
									<option>한국어</option>
								</select>
							</div>
						</nav>
					</div>
				</div>
				<div style="background-color: #e3f2fd;">
					<div class="container" >
						<nav class="navbar navbar-expand-lg">
							<a class="navbar-brand" href="#">Navbar</a>
							<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
								<div class="navbar-nav">
									<a class="nav-link active" aria-current="page" href="#">회원관리</a>
									<a class="nav-link" href="#">서비스관리</a>
									<a class="nav-link" href="#">사이트관리</a>
									<a class="nav-link" href="#">로그관리</a>
									<a class="nav-link" href="#">시스템관리</a>
									<a class="nav-link" href="#">시스템관리</a>
								</div>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</header>
		<main>
			<form method="get" action="/code/codeInst">
				<div style="height: 70px"></div>
				<div class="wrapper">
					<div class="container">
						<div class="row">
							<div class="col-3">
								<div class="sidebar">
									<!--menu item-->
									<ul>
										<li>
											<a href="#" class="active">
												<span class="icon"><i class= "fa-solid fa-angle-right"></i></span>
												<span class="item">Home</span>
											</a>
										</li>
										<li>
											<a href="#">
												<span class="icon"><i class= "fa-solid fa-angle-right"></i></span>
												<span class="item">Dashboard</span>
											</a>
										</li>
										<li>
											<a href="#">
												<span class="icon"><i class= "fa-solid fa-angle-right"></i></span>
												<span class="item">Orders</span>
											</a>
										</li>
										<li><hr class="dropdown-divider" style="color: lightgray;"></li>
										<li>
											<a href="#">
												<span class="icon"><i class= "fa-solid fa-angle-right"></i></span>
												<span class="item">Account</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="col">
								<h2 class="needs-validation mt-2">코드 관리</h2>
								<div class="content">
									<div class="row mt-3">
										<div class="col-6">
											<label for="codeGroup_I3" class="form-label">코드그룹</label>
											<select class="form-select" id="ccgSeq" name="ccgSeq">
												<c:forEach items="${list1}" var="list1" varStatus="status">
													<option value="${list1.ccgSeq}">${list1.name}</option>			
												</c:forEach>
										  	</select>
										</div>
									</div>
									<div class="row mt-3">
										<div class="col">
											<label for="codeGroup_code" class="form-label">코드그룹 코드</label>
											<input type="text" class="form-control" id="codeGroup_code" placeholder="영문(대소문자),숫자">	
										</div>
										<div class="col">
											<label for="codeGroup_another" class="form-label">코드그룹 코드(한글)</label>
											<input type="text" class="form-control" id="codeGroup_another" placeholder="영문(대소문자),숫자">	
										</div>
									</div>
									<div class="row mt-3">
										<div class="col">
											<label for="codeName" class="form-label">코드</label>
											<input type="text" class="form-control" name="codeName" id="codeName" placeholder="한글,숫자">
										</div>
										<div class="col">
											<label for="codeGroup_eng" class="form-label">대체코드</label>
											<input type="text" class="form-control" id="codeGroup_eng" placeholder="영문(대소문자),숫자">
										</div>
									</div>
									<div class="row mt-3">
										<div class="col">
											<label for="codeName" class="form-label">코드이름(한글)</label>
											<select class="form-select" id="codeGroup_kr">
												<option selected disabled value="">선택</option>
												<option>Y</option>
												<option>N</option>
											  </select>
										</div>
										<div class="col">
											<label for="codeGroup_or" class="form-label">코드이름(영문)</label>
											<input type="text" class="form-control" id="codeGroup_or" placeholder="숫자">
										</div>
									</div>
									<div class="row mt-3">
										<div class="col">
											<label for="codeGroup_con" class="form-label">설명</label>
											<textarea class="form-control" id="codeGroup_con" placeholder="Required example textarea"></textarea>
										</div>
										<div class="col">
											<label for="codeGroup_del" class="form-label">삭제여부</label>
											<select class="form-select" id="codeGroup_del">
												<option selected disabled value="">선택</option>
												<option>Y</option>
												<option>N</option>
											  </select>
										</div>
									</div>
									<div class="row mt-3">
										<div class="col">
											<label for="codeGroup_V1" class="form-label">예비1(Varchar type)</label>
											<input type="text" class="form-control" id="codeGroup_V1" placeholder="영문(대소문자),숫자">	
										</div>
										<div class="col">
											<label for="codeGroup_V2" class="form-label">예비2(Varchar type)</label>
											<input type="text" class="form-control" id="codeGroup_V2" placeholder="영문(대소문자),숫자">	
										</div>
									</div>
									<div class="row mt-3">
										<div class="col-6">
											<label for="codeGroup_V3" class="form-label">예비3(Varchar type)</label>
											<input type="text" class="form-control" id="codeGroup_V3" placeholder="영문(대소문자),숫자">	
										</div>
									</div>
									<div class="row mt-3">
										<div class="col">
											<label for="codeGroup_I1" class="form-label">예비1 (Int type)</label>
											<input type="text" class="form-control" id="codeGroup_I1" placeholder="숫자">	
										</div>
										<div class="col">
											<label for="codeGroup_I2" class="form-label">예비2 (Int type)</label>
											<input type="text" class="form-control" id="codeGroup_I2" placeholder="숫자">	
										</div>
									</div>
									<div class="row mt-3">
										<div class="col-6">
											<label for="codeGroup_I3" class="form-label">예비3(Int type)</label>
											<input type="text" class="form-control" id="codeGroup_I3" placeholder="숫자">	
										</div>
									</div>
									<div class="row mt-3">
										<div class="col-md-2"> 
											<button class="btn" type="button" style="background-color: rgb(159, 160, 161);" onclick="location.href='../admin/CodeGroupList.html'">
												<i class="fas fa-thin fa-list-ul"></i>
											</button>
										</div>
										<div class="col-md-6 offset-md-4" align="right">
											<button class="btn btn-danger del" type="button" ><i class="fa-solid fa-xmark"></i></button>
											<button class="btn btn-danger" type="button"onclick=deleteValue(); data-bs-toggle="modal" data-bs-target="#exampleModalCenter"><i class="fa-solid fa-trash-can"></i></button>
											<div class="modal fade" id="exampleModalCenter" tabindex="-1" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalCenterTitle">삭제하시겠습니까?</h5>
															<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body"  align="center">
															<i class="fas fa-light fa-triangle-exclamation me-2" style="color: red;"></i>
															삭제된 정보는 복구할 수가 없습니다.
														</div>
														<div class="modal-footer">
															<a>
																<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
															</a>
															<a onclick="location.href='../admin/CodeGroupList.html'">
																<button type="button" class="btn btn-danger">삭제</button>
															</a>
														</div>
													</div>
												</div>
											</div>
											<button type="button" id="btnSave" class="btn btn-success" onclick="test();"><i class="fa-regular fa-bookmark"></i></button>
											<!-- <button class="btn btn-success" type="button" href="../admin/CodeGroupModForm.html" onclick=here()><i class="fa-regular fa-bookmark"></i></button> -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</main>
	
		<!-- end --> 
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
		<script type="text/javascript">
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
			
			function test() {
				alert("test");
			}
		</script>
	</body>
</html>