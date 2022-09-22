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
		<title>CodeGroup</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/css/codeGroupList.css">
	  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
									<img alt="" src="../resources/image/user.png" style=" width: 60px; height: 40px;border-radius: 100px;" class="me-4 mb-4 ">
									<span id="nm" class="d-inline-block">Tony Chang <br> Administrator</span>
								</div>
							</div>
							<div class="col">
								<select class="form-select col" id="emailSelect" required style="width: 90px;">
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
			<form id="myForm" name="myForm" method="post">
				<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
				<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
				<input type="hidden" name="ccgSeq" value='<c:out value="${vo.ccgSeq }"></c:out>'>
				<div style="height: 55px"></div>
				<div class="wrapper">
					<div class="container">
						<div class="row">
							<div class="col-3">
								<div class="sidebar">
									<!--menu item-->
									<ul>
										<li>
											<a href="#" class="active">
												<span class="icon"><i class="fas fa-home"></i></span>
												<span class="item">Home</span>
											</a>
										</li>
										<li>
											<a href="#">
												<span class="icon"><i class="fas fa-desktop"></i></span>
												<span class="item">Dashboard</span>
											</a>
										</li>
										<li>
											<a href="#">
												<span class="icon"><i class="fas fa-user-friends"></i></span>
												<span class="item">Orders</span>
											</a>
										</li>
										<li><hr class="dropdown-divider" style="color: lightgray;"></li>
										<li>
											<a href="#">
												<span class="icon"><i class="fas fa-tachometer-alt"></i></span>
												<span class="item">Account</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="col">
								<div class="content">
									<h2 class="row needs-validation ms-3 mt-3">코드그룹 관리</h2>
									<div class="row needs-validation ms-3 me-3 mt-3 mb-5 p-3 shadow-lg bg-body rounded" novalidate>
										<div class="row mb-2">
											<div class="col-md-3">
												<select class="form-select" id="shDelNy" name="shDelNy">
			                                       	<option value="" <c:if test="${empty vo.shDelNy }">selected</c:if>>선택</option>
			                                        <option value="0" <c:if test="${vo.shDelNy eq 0 }">selected</c:if>>N</option>
			                                        <option value="1" <c:if test="${vo.shDelNy eq 1 }">selected</c:if>>Y</option>
			                                    </select>
											</div>
											<div class="col-md-3">
												<select class="form-select" id="shUpdt" name="shUpdt">
													<option value="" <c:if test="${empty vo.shUpdt }">selected</c:if>>선택</option>
													<option value="1" <c:if test="${vo.shUpdt eq 1 }">selected</c:if>>등록일</option>
													<option value="2" <c:if test="${vo.shUpdt eq 2 }">selected</c:if>>수정일</option>
												</select>
											</div>
											<div class="col-md-3">
												<input type="text" class="form-control" id="datepickerS" placeholder="시작일">
											</div>
											<div class="col-md-3">
												<input type="text" class="form-control" id="datepickerE" placeholder="종료일">
											</div>
										</div>
										<div class="row">
											<div class="col-md-3">
												<select class="form-select" id="shOption" name="shOption">
			                                        <option value="" <c:if test="${empty vo.shOption }">selected</c:if>>검색구분</option>
			                                        <option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>코드그룹 코드</option>
			                                        <option value="2" <c:if test="${vo.shOption eq 2 }">selected</c:if>>코드그룹 이름(한글)</option>
			                                        <option value="3" <c:if test="${vo.shOption eq 3 }">selected</c:if>>코드그룹 이름(영문)</option>
			                                    </select>
											</div>
											<div class="col-md-3">
												<input type="text" class="form-control" name="shValue" id="shValue" value="<c:out value="${vo.shValue }"/>" autocomplete="off">
												<div class="invalid-feedback" id="shValueFeeback"></div>
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
												<button class="btn btn-danger" type="reset" id="btnReset" name="btnReset"><i class="fa-solid fa-rotate-right"></i></button>
											</div>
										</div>
									</div>
									<span class="ms-3 mt-5">Total: ${vo.totalRows}</span>
									<div class="ms-3 me-3 mt-3 mb-4 shadow-lg bg-body rounded">
										<table class="table table-striped table-hover text-center">
											<thead>
												<tr style="background-color: #6666cc;">
													<th scope="col">
														<input type="checkbox" name="chk_all" id="chk_all" onclick="location.href='../member/welcomeLogin.html'" href="" onclick="checkAll(this)">
													</th>
													<th>#</th>
													<th class="td1" scope="col">코드그룹 코드</th>
													<th class="td2" scope="col">코드그룹 이름(한글)</th>
													<th class="td3" scope="col">코드그룹 이름(영문)</th>
													<th class="td4" scope="col">주소</th>
													<th class="td4" scope="col">등록일</th>
													<th class="td4" scope="col">수정일</th>
												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${fn:length(list) eq 0}">
														<tr>
															<td class="text-center" colspan="8">There is no data!</td>
														</tr>
													</c:when>
													<c:otherwise>		
														<c:forEach items="${list}" var="list" varStatus="status">
															<tr onclick="newPage()" class="info">
																<th scope="row" class="td1" src="./memberMod.html">
																	<input type="checkbox" name="chk_box" onclick="checkSelectAll(this)">
																</th>
																<td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></td>
																<td>${list.ccgSeq}</td>
																<td><a href="javascript:goForm(<c:out value="${list.ccgSeq }"/>)" class="text-decoration-none"><c:out value="${list.name }"/></a></td>
																<td>${list.name_eng}</td>
																<td>${list.count}</td>
																<td>-</td>
																<td>-</td>
															</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
										<%@include file="../../common/xdmin/includeV1/pagination.jsp"%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="container-fluid pe-4 ps-3">
				<div class="row">
					<div class="col-md-2 offset-4"> 
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
										<i class="fas fa-light fa-triangle-exclamation me-2" style="color: red;"></i>
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
					<div class="col-md-2 offset-3" align="right">
						<button class="btn btn-primary" type="button" id="btnForm" name="btnForm"><i class="fa-solid fa-plus"></i></button>
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
							<a class="nav-link">이메일무단수집거부</a>
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
		</main>
	
		<!-- end --> 
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
		<script>
			/* const fileInput = document.getElementById("fileUpload");
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
			} */
			
			// 데이트픽커
			  $(function(){
				  $('#datepickerS').datepicker({
					  dateFormat: 'yy-mm-dd',
					  prevText: '이전 달',
					  nextText: '다음 달',
					  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
					  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
					  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
					  showMonthAfterYear: true,
					  yearSuffix: '년'
				  });
				  $('#datepickerE').datepicker({
					  dateFormat: 'yy-mm-dd',
					  prevText: '이전 달',
					  nextText: '다음 달',
					  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
					  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
					  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
					  showMonthAfterYear: true,
					  yearSuffix: '년'
				  });
				 /*  $('#datepickerS').datepicker('setDate', 'today');
				  $('#datepickerE').datepicker('setDate', '+1D'); */
        	});
			
			var goUrlList = "/codeGroup/codeGroupList"; 			/* #-> */
			var goUrlInst = "/codeGroup/codeGroupInst"; 			/* #-> */
			var goUrlUpdt = "/codeGroup/codeGroupUpdt";				/* #-> */
			var goUrlUele = "/codeGroup/codeGroupUele";				/* #-> */
			var goUrlDele = "/codeGroup/codeGroupDele";				/* #-> */
			var goUrlForm = "/codeGroup/codeGroupForm";
			
			var form = $("form[name=myForm]");
			
			var ccgSeq = $("input:hidden[name=ccgSeq]");
			
			
			 $("#btnReset").on("click", function(){
				 $(location).attr("href", goUrlList);
			 });
			
		  /* var form = $("form[name=myForm]"); */

			 goList = function(thisPage) {
	 			$("input:hidden[name=thisPage]").val(thisPage);
	 			form.attr("action", goUrlList).submit();
	 		};
	 		
	 		/* var seq = $("input:hidden[name=ccgSeq]"); */

	 		$('#btnForm').on("click", function() {
	 			goForm(0);                
	 		});

	 		goForm = function(keyValue) {
	 	    	/* if(keyValue != 0) seq.val(btoa(keyValue)); */
	 	    	ccgSeq.val(keyValue);
	 			form.attr("action", goUrlForm).submit();
	 		}
	 		
	 	
		</script>
	</body>
</html>
