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
	<title>CodeGroupForm.jsp</title>
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
			<form name="myform" id="myform" method="post" action="/codeGroup/codeGroupInst">
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
								<h2 class="needs-validation mt-2">코드그룹 관리</h2>
								<div class="content">
									<div class="row">
										<div class="col">
											<label for="codeGroup_code" class="form-label">코드그룹 코드</label>
											<input type="text" class="form-control" id="codeGroup_code" name="codeGroup_code" placeholder="영문(대소문자),숫자">	
										</div>
										<div class="col">
											<label for="codeGroup_another" class="form-label">코드그룹 코드(Another)</label>
											<input type="text" class="form-control" id="codeGroup_another" name="codeGroup_another" placeholder="영문(대소문자),숫자">	
										</div>
									</div>
									<div class="row mt-3">
										<div class="col">
											<label for="name" class="form-label">코드그룹 이름(한글)</label>
											<input type="text" class="form-control" id="name" name="name" placeholder="한글,숫자" value="<c:out value="${codeGroup.name}"/>">
										</div>
										<div class="col">
											<label for="name_eng" class="form-label">코드그룹 이름(영문)</label>
											<input type="text" class="form-control" id="name_eng" name="name_eng" placeholder="영문(대소문자),숫자">
										</div>
									</div>
									<div class="row mt-3">
										<div class="col">
											<label for="codeGroup_use" class="form-label">사용여부</label>
											<select class="form-select" id="codeGroup_use" name="codeGroup_use">
												<option selected disabled value="">선택</option>
												<option value="0">N</option>
												<option value="1">Y</option>
											  </select>
										</div>
										<div class="col">
											<label for="codeGroup_or" class="form-label">순서</label>
											<input type="text" class="form-control" id="codeGroup_or" name="codeGroup_or" placeholder="숫자">
										</div>
									</div>
									<div class="row mt-3">
										<div class="col">
											<label for="codeGroup_con" class="form-label">설명</label>
											<textarea class="form-control" id="codeGroup_con" placeholder="Required example textarea"></textarea>
										</div>
										<div class="col">
											<label for="codeGroup_del" class="form-label">삭제여부</label>
											<select class="form-select" id="codeGroup_del" name="codeGroup_del">
												<option selected disabled value="">선택</option>
												<option value="0">N</option>
												<option value="1">Y</option>
											  </select>
										</div>
									</div>
									<div class="row mt-3">
										<div class="col">
											<label for="codeGroup_V1" class="form-label">예비1(Varchar type)</label>
											<input type="text" class="form-control" id="codeGroup_V1" name="codeGroup_V1" placeholder="영문(대소문자),숫자">	
										</div>
										<div class="col">
											<label for="codeGroup_V2" class="form-label">예비2(Varchar type)</label>
											<input type="text" class="form-control" id="codeGroup_V2" name="codeGroup_V2" placeholder="영문(대소문자),숫자">	
										</div>
									</div>
									<div class="row mt-3">
										<div class="col-6">
											<label for="codeGroup_V3" class="form-label">예비3(Varchar type)</label>
											<input type="text" class="form-control" id="codeGroup_V3" name="codeGroup_V3" placeholder="영문(대소문자),숫자">	
										</div>
									</div>
									<div class="row mt-3">
										<div class="col">
											<label for="codeGroup_I1" class="form-label">예비1 (Int type)</label>
											<input type="text" class="form-control" id="codeGroup_I1" name="codeGroup_I1" placeholder="숫자">	
										</div>
										<div class="col">
											<label for="codeGroup_I2" class="form-label">예비2 (Int type)</label>
											<input type="text" class="form-control" id="codeGroup_I2" name="codeGroup_I2" placeholder="숫자">	
										</div>
									</div>
									<div class="row mt-3">
										<div class="col-6">
											<label for="codeGroup_I3" class="form-label">예비3(Int type)</label>
											<input type="text" class="form-control" id="codeGroup_I3" name="codeGroup_I3" placeholder="숫자">	
										</div>
									</div>
									<div class="row mt-3">
										<div class="col-6">
											<label for="codeGroup_tel" class="form-label">통신사</label>
											<select class="form-select" id="codeGroup_tel" name="codeGroup_tel">
												<option selected disabled value="">선택</option>
												<option value="1">SKT</option>
												<option value="2">KT</option>
												<option value="3">LGT</option>
										  	</select>
										</div>
										<div class="row mt-3">
											<div class="col-6">
												<label for="codeGroup_Gender">성별</label>
												<input type="radio" id="codeGroup_Gender1" name="codeGroup_Gender" value="1">남성	
												<input type="radio" id="codeGroup_Gender2" name="codeGroup_Gender" value="2">여성	
												<input type="radio" id="codeGroup_Gender3" name="codeGroup_Gender" value="3">기타	
											</div>
										</div>
										<div class="row mt-3">
											<div class="col-6">
												<label for="codeGroup_marry">결혼여부</label>
												<input type="checkbox" id="codeGroup_marry1" name="codeGroup_marry" value="1">기혼	
												<input type="checkbox" id="codeGroup_marry2" name="codeGroup_marry" value="2">미혼	
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
											<button type="button" id="btnSave" class="btn btn-success" onClick="test();"><i class="fa-regular fa-bookmark"></i></button>
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
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>
			// const fileInput = document.getElementById("fileUpload");
			// fileInput.onchange = () => {
			// 	const selectedFile = [...fileInput.files];
			// 	console.log(selectedFile);
			// };
			// fileInput.addEventListener("change", handleFiles);

		//	const toastTrigger = document.getElementById('savebtn')
		//	const toastLiveExample = document.getElementById('liveToast')
		//	if (toastTrigger) {
		//		toastTrigger.addEventListener('click', () => {
		//			const toast = new bootstrap.Toast(toastLiveExample)
		//
		//			toast.show()
		//		})
		//	}
		// 데이터 전송
		function here() {
			var code = document.getElementById("codeGroup_code").value;
			var codeGroup_another = document.getElementById("codeGroup_another").value;
			var chiness = document.getElementById("codeGroup_kr").value;
			var english = document.getElementById("codeGroup_eng").value;
			sessionStorage.setItem("codeGroup_code", code);
			sessionStorage.setItem("codeGroup_another", another);
            sessionStorage.setItem("codeGroup_kr", kr);
			sessionStorage.setItem("codeGroup_eng", eng);
		}
		 function test() {
			
			 /*alert("test");
			
			alert(document.getElementById("name").value);
			alert(document.getElementById("name_eng").value);
			alert(document.getElementById("codeGroup_code").value);
			alert(document.getElementById("codeGroup_another").value);
			alert(document.getElementById("codeGroup_use").value);
			alert(document.getElementById("codeGroup_or").value);
			alert(document.getElementById("codeGroup_con").value);
			alert(document.getElementById("codeGroup_del").value);
			alert(document.getElementById("codeGroup_V1").value);
			alert(document.getElementById("codeGroup_V2").value);
			alert(document.getElementById("codeGroup_V3").value);
			alert(document.getElementById("codeGroup_I1").value);
			alert(document.getElementById("codeGroup_I2").value);
			alert(document.getElementById("codeGroup_I3").value);
			alert(document.getElementById("codeGroup_tel").options[document.getElementById("codeGroup_tel").selectedIndex].value);  //select문 띄우는 구 방식
			alert(document.querySelector("input[name= 'codeGroup_Gender']:checked").value); */
			
			/* if(document.getElementById("name").value == '' || document.getElementById("name").value == null) {
				alert("코드그룹 이름(한글)을 입력해주세요.");
				document.getElementById("name").value = "";
				document.getElementById("name").focus();
				return false;
			} 
			
			if(document.getElementById("name_eng").value == '' || document.getElementById("name_eng").value == null) {
				alert("코드그룹 이름(영문)을 입력해주세요.");
				document.getElementById("name_eng").value = "";
				document.getElementById("name_eng").focus();
				return false;
			} 
			
			if(document.getElementById("codeGroup_code").value == '' || document.getElementById("codeGroup_code").value == null) {
				alert("코드그룹 코드를 입력해주세요.");
				document.getElementById("codeGroup_code").value = "";
				document.getElementById("codeGroup_code").focus();
				return false;
			} 
			
			if(document.getElementById("codeGroup_another").value == '' || document.getElementById("codeGroup_another").value == null) {
				alert("코드그룹 코드(Another)를 입력해주세요.");
				document.getElementById("codeGroup_another").value = "";
				document.getElementById("codeGroup_another").focus();
				return false;
			} 
			
			if(document.getElementById("codeGroup_use").value == '' || document.getElementById("codeGroup_use").value == null) {
				alert("사용여부를 선택해주세요.");
				document.getElementById("codeGroup_use").value = "";
				document.getElementById("codeGroup_use").focus();
				return false;
			} 
			
			if(document.getElementById("codeGroup_or").value == '' || document.getElementById("codeGroup_or").value == null) {
				alert("순서를 선택해주세요.");
				document.getElementById("codeGroup_or").value = "";
				document.getElementById("codeGroup_or").focus();
				return false;
			} 
			
			if(document.getElementById("codeGroup_con").value == '' || document.getElementById("codeGroup_con").value == null) {
				alert("설명을 입력해주세요.");
				document.getElementById("codeGroup_con").value = "";
				document.getElementById("codeGroup_con").focus();
				return false;
			} 
			
			if(document.getElementById("codeGroup_del").value == '' || document.getElementById("codeGroup_del").value == null) {
				alert("삭제여부를 선택해주세요.");
				document.getElementById("codeGroup_del").value = "";
				document.getElementById("codeGroup_del").focus();
				return false;
			} 
			
			if(document.getElementById("codeGroup_V1").value == '' || document.getElementById("codeGroup_V1").value == null) {
				alert("예비1(Var)을 선택해주세요.");
				document.getElementById("codeGroup_V1").value = "";
				document.getElementById("codeGroup_V1").focus();
				return false;
			} 
			
			if(document.getElementById("codeGroup_V2").value == '' || document.getElementById("codeGroup_V2").value == null) {
				alert("예비2(Var)을 선택해주세요.");
				document.getElementById("codeGroup_V2").value = "";
				document.getElementById("codeGroup_V2").focus();
				return false;
			} 
			
			if(document.getElementById("codeGroup_V3").value == '' || document.getElementById("codeGroup_V3").value == null) {
				alert("예비3(Var)을 선택해주세요.");
				document.getElementById("codeGroup_V3").value = "";
				document.getElementById("codeGroup_V3").focus();
				return false;
			} 
			
			if(document.getElementById("codeGroup_I1").value == '' || document.getElementById("codeGroup_I1").value == null) {
				alert("예비1(Int)을 선택해주세요.");
				document.getElementById("codeGroup_I1").value = "";
				document.getElementById("codeGroup_I1").focus();
				return false;
			} 
			
			if(document.getElementById("codeGroup_I2").value == '' || document.getElementById("codeGroup_I2").value == null) {
				alert("예비2(Int)을 선택해주세요.");
				document.getElementById("codeGroup_I2").value = "";
				document.getElementById("codeGroup_I2").focus();
				return false;
			} 
			
			if(document.getElementById("codeGroup_I3").value == '' || document.getElementById("codeGroup_I3").value == null) {
				alert("예비3(Int)을 선택해주세요.");
				document.getElementById("codeGroup_I3").value = "";
				document.getElementById("codeGroup_I3").focus();
				return false;
			} 
			
			if(document.getElementById("codeGroup_tel").value == '' || document.getElementById("codeGroup_tel").value == null) {
				alert("통신사를 선택해주세요.");
				document.getElementById("codeGroup_tel").value = "";
				document.getElementById("codeGroup_tel").focus();
				return false;
			}  */
			
			// radio 선택여부 확인용 ver.jquery

			// if($('input:radio[name=codeGroup_Gender]').is(':checked') == false) {
		    //	alert("성별을 선택하세요");
			//	} 
 
			// radio 선택여부 확인용 ver.Javascript
			
 			if (document.querySelector('input[type=radio][name=codeGroup_Gender]:checked') == null) {
 				alert("성별을 선택해주세요");
 			} else {
 				alert(document.querySelector('input[name=codeGroup_Gender]:checked').value);
 			}
		 
			var result = '';
			const checks = document.getElementsByName("codeGroup_marry");
		 	if (document.querySelector('input[type=checkbox][name=codeGroup_marry]:checked') == null) {
				alert("결혼여부를 선택해주세요");
			} else {
				// 두개 선택 시 모두 출력
				for (var i = 0; i <checks.length; i++) {
					result += checks[i].value + " ";
				} 
				alert(result);
			}
		}
		 		 
		 </script>
	</body>
</html>
