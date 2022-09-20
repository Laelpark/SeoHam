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
	<title>memberForm.html</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<style type="text/css">
		table, th, td{
			border: 1px solid black;
			border-collapse: collapse;
		}
		
		th, td {
			padding: px;
		}
	</style>
</head>
<body>
	<!-- start -->
	<form class="p-5">
		<nav class="navbar fixed-top" style="background-color: #e3f2fd;">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">
					<img src="DLlogo.png" alt="" width="30" height="30" class="d-inline-block align-text-top">
					   DL Company
				</a>
			</div>
		</nav>
        <div class="mt-5">
			<ul class="nav nav-tabs ms-3 me-3">
			  <li class="nav-item">
			    <a class="nav-link" aria-current="page">지원명단</a>
			  </li> 
			  <li class="nav-item">
			    <a class="nav-link  active">코드관리</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link">코드그룹관리</a>
			  </li>
			</ul>
		</div>
		<h3 style="text-align: center" class="pt-3 pb-3 mb-5">회원관리</h3>
		<div>
			<div class="container mb-3 text-center">
				<div class="row">
					<div class="col">
						지원분야
					</div>
					<div class="col">
						경력구분
					</div>
					<div class="col">
						희망연봉
					</div>
				</div>
			</div>
		</div>
		<div class="container mb-3 text-center">
			<div class="row">
				<div class="col">
					<select name="applyFild" id="apply_fild">
						<option>지원분야 선택
						<option>기획/전략
						<option>마케팅/홍보/조사
						<option>회계/세무/재무
						<option>인사/노무
						<option>영업/판매/무역
						<option>상품기획/MD
						<option>개발/IT
					</select>
				</div>
				<div class="col">
					<select name="career" id="career">
						<option>경력구분
						<option>경력
						<option>신입
					</select>
				</div>
				<div class="col">
					<input type="text" value="" id="pay" class="form-control text-center" placeholder="회사내규">
				</div>
			</div>
		</div>
		<div>
			<h5 class="pt-3 pb-3 ps-3 ms-3 me-3 mt-3 shadow-lg bg-body rounded bg-light"><i class="fa-solid fa-circle-info"> 기본정보</i></h5>
		</div>
		<c:set var="listCodeGender" value="${CodeServiceImpl.selectListCachedCode('3')}"/>
		<form id="myform" name="myform" method="post" autocomplete="off">
			<!-- *Vo.jsp s -->
			<%@include file="memberVo.jsp"%>
			<!-- *Vo.jsp e -->
			<div class="card pt-3 pb-3 ps-3 mb-5 ms-3 me-3 mt-3">
				<div class="row g-0">
					<div class="col-md-4">
						<div class="filebox">
							<img src="" id="preview" width="250px;" id="preview">	
							<label for="ex_file"></label>
							<input type="file" id="ex_file" name="chooseFile" accept="image/*" onchange="loadFile(this)">
						</div>
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<div class="row text-center">
								<div class="col-md-2">
									<p class="card-text">성명</p>
								</div>
								<div class="col-md-4">
									<input type="text" value="" class="form-control" id="name">
								</div>
								<div class="col-md-2">
									<p class="card-text" >한문</p>
								</div>
								<div class="col-md-4">
									<input type="text" value="" class="form-control" id="name_cn">
								</div>
							</div>
							<div class="row text-center pt-3 pb-3">
								<div class="col-md-2">
									<p class="card-text" >영문</p>
								</div>
								<div class="col-md-4">
									<input type="text" value="" class="form-control" id="name_en">
								</div>
								<div class="col-md-2">
									<p class="card-text">생년월일</p>
								</div>
								<div class="col-md-4">
									<input type="date" value="" class="form-control" id="dob">
									<!-- <input type="date" id="birthday" name="birthday" min="1950-01-01" max="2029-12-31"  style="display: block; margin: 0 auto;"> -->
								</div>
							</div>
							<div class="row text-center pb-3">
								<div class="col-md-2">
									<p class="card-text">전화번호</p>
								</div>
								<div class="col-md-4">
									<input type="text" value="" class="form-control" id="tell_num">
								</div>
								<div class="col-md-2">
									<p class="card-text">성별</p>
								</div>
								<div class="col-md-4">
									<select class="form-select" id="gender" name="gender">
										<option selected disabled value="">성별선택</option>
										<option value="1" <c:if test = "${list.gender eq 1}">selected</c:if>>남성</option>
										<option value="2" <c:if test = "${list.gender eq 2}">selected</c:if>>여성</option>
									</select>
								</div>
							</div>
							<div class="row text-center pb-3">
								<div class="col-md-2">
									<p class="card-text">이메일</p>
								</div>
								<div class="col-md-3">
									<input type="text" value="" class="form-control" id="email">
								</div>
								<div class="col-md-4">
									<div class="input-group">
										<span class="input-group-text" id="inputGroupPrepend2">@</span>
										<input type="text" class="form-control" id="validationDefaultUsername"  aria-describedby="inputGroupPrepend2" required>
									</div>
								</div>
								<div class="col-md-3">
									<select class="form-select" id="emailSelect" required>
										<option selected disabled value="">이메일선택</option>
										<option>naver.com</option>
										<option>daum.net</option>
										<option>gmail.com</option>
										<option>kakao.com</option>
									</select>
								</div>
							</div>
							<div class="row text-center">
								<div class="col-md-2">
									<p class="card-text">주소</p>
								</div>
								<div class="col-md-10">
									<input type="text" value="" class="form-control" id="addr">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid pe-4 ps-3">
				<div class="row">
					<div class="col-md-2"> 
	                    <a href="./memberList.html"><i class="fa-solid fa-angle-left"></i>이전</a>
	                </div>
					<div class="col-md-2 offset-md-8" align="right">
	                    <a href="./memberMod.html" onclick=here()><i class="fa-solid fa-angle-right"></i>다음</a>
	                </div>	
				</div>
			</div>
	</form>
		<!-- end --> 
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
		<script type="text/javascript">
			var goUrlList = "/code/codeList";
			var goUrlInst = "/code/codeInst";
			var goUrlUpdt = "/code/codeUpdt";
			var goUrlUele = "/code/codeUele";
			var goUrlDele = "/code/codeDele";
			
			var form = $("form[name=myForm]"); 
			var formVo = $("form[name=formVo]");
			
			var cdSeq = $("input:hidden[name=cdSeq]");
			
			$("#btnSave").on("click", function() {
				
				/* alert(cdSeq.val()); */
				if (cdSeq.val() == 0 || cdSeq.val() == "") {
					form.attr("action", goUrlInst).submit();
				}else {
					form.attr("action", goUrlUpdt).submit();
				}
				
			});
			
			$("#btnList").on("click", function(){
				formVo.attr("action", goUrlList).submit();
			});
			
			$("#deleteBtn").on("click", function(){
			   		formVo.attr("action", goUrlDele).submit();
		   	});
			
			$("#ueleteBtn").on("click", function(){
		   		formVo.attr("action", goUrlUele).submit();
	   		});
		</script>
	</body>
</html>