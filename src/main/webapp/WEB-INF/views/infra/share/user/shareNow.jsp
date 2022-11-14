<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<jsp:useBean id="CodeServiceImpl" class="com.lael.infra.modules.code.CodeServiceImpl"/>  <!-- 코드에서 정보 가져오기 -->

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>shareNow</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/share/shareNow.css">
<link href="/resources/images/share/smLogo.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<!-- start -->
	<p class="mb-3" style="background-color: rgb(142, 68, 173); height: 30px;"></p>
	<div class="container1">
		<nav class="bg-transparent">
			<div class="container">
				<a class="hidden" href="share" style="width: 150px;"> 
				<img src="../../resources/images/share/sharenow.png" alt="" width="230" height="60" class="d-inline-block align-text-top ms-3">
				</a>
			</div>
		</nav>
		<nav class="navbar navbar-expand-lg bg-transparent">
			<div class="topBtn collapse navbar-collapse" id="navbarSupportedContent">
				<input type="hidden" class="d-flex" role="search">
					<button type="button" class="btn btn-outline-danger me-4">취소</button>
					<button type="button" class="btn btn-outline-success" id="btnSave" name="btnSave">저장</button>
				</input>
			</div>
		</nav>
		<form id="myform" name="myform" method="post">
			<!-- *Vo.jsp s -->
			<%@include file="shareVo.jsp"%>
			<input type="hidden" name="share_member_seq" value="<c:out value="${sessSeq}"/>" />
			<!-- *Vo.jsp e -->
			<nav class="navbar navbar-expand-lg">
				<div class="a collapse navbar-collapse">
					<ul class="navbar-nav mb-2 mt-2 ms-3">
						<li class="nav-item dropdown"><img alt="" src="../../resources/images/share/user.png" style="width: 60px; height: 40px; border-radius: 100px; cursor: pointer;"></li>
						<li>
							<select class="form-select col ms-3 me-3" style="width: 180px; height: 50px;" id="food_div" name="food_div" required>
								<option value="" <c:if test="${empty item.food_div }">selected</c:if>>카테고리</option>
								<c:set var="listCodeFood" value="${CodeServiceImpl.selectListCachedCode('4') }" />
								<c:forEach items="${listCodeFood}" var="listFood" varStatus="statusFood">
									<option value="${listFood.cdSeq }" 
										<c:if test="${item.food_div eq listFood.cdSeq}">selected</c:if>>
										<c:out value="${listFood.name }"/>
									</option>
								</c:forEach>
							</select>
						</li>
						<li class="nav-item dropdown">
							<!-- <input type="hidden" class="d-flex" for="title"/>  -->
							<input class="form-control me-2 text-center" id="title" name="title" type="text" style="width: 480px; height: 50px;" placeholder="타이틀을 입력하세요." value='<c:out value="${item.title}"/>'/>
						</li>
						<li>
							<select class="form-select col ms-3 me-3" style="width: 180px; height: 50px;" id="people_num" name="people_num" required>
								<option value="" <c:if test="${empty item.people_num}">selected</c:if>>인원</option>
								<c:set var="listCodeNum" value="${CodeServiceImpl.selectListCachedCode('5') }" />
								<c:forEach items="${listCodeNum}" var="listNum" varStatus="statusNum">
									<option value="${listNum.cdSeq }" 
										<c:if test="${item.people_num eq listNum.cdSeq}">selected</c:if>>
										<c:out value="${listNum.name }"/>
									</option>
								</c:forEach>
							</select>
						</li>
					</ul>
				</div>
			</nav>
			<nav class="navbar navbar-expand-lg">
				<div class="a collapse navbar-collapse" style="height: 300px;">
					<div class="c" for="info">
						<textarea class="form-control" placeholder="주문하실 음식점 이름과 메뉴, 가격 등을 자세히 기재해주세요." rows="10" id="info" name="info" aria-label="info" >${item.info}</textarea>
					</div>
				</div>
			</nav>
			<nav class="navbar navbar-expand-lg">
				<div class="a collapse navbar-collapse" style="height: 250px;">
					<div class="ms-3 me-4">
						<div class="row">
							<nav class="d navbar col-12 mt-4" style="background-color: rgba(233, 231, 58, 0.66);">
								<div class="row">
									<div class="col-4 has-validation">
										<p id="date" for="place">거래 장소</p>
									</div>
									<div class="col-8" for="date">
										<input class="form-control" type="text" style="width: 815px; margin-left: auto;" id="place" name="place" placeholder=" 자세한 거래 장소를 입력하세요." value="<c:out value="${item.place}"/>" required>
										<div class="invalid-feedback">
									        거래장소를 입력해주세요.
										</div>
									</div>
								</div>
							</nav>
							<nav class="d navbar col-12 mt-4" style="background-color: rgba(233, 231, 58, 0.66);">
								<div class="row" style="display: -webkit-inline-box;">
									<div class="col-4">
										<p id="date">거래 시간</p>
									</div>
									<div class="col-6" for="date" style="padding-right: 0px; padding-left: 10px;" >
										<input class="form-control" type="date" style="width: 400px; margin-left: auto;" id="date" name="date" placeholder=" 거래날짜를 선택하세요." value="<c:out value="${item.date}"/>">
									</div>
									<div class="col" for="time">
										<input class="form-control" type="time" style="width: 400px; margin-left: auto;" id="time" name="time" placeholder=" 거래시간을 선택하세요." value="<c:out value="${item.time}"/>">
									</div>
								</div>
							</nav>
							<nav class="d navbar col-12 mt-4" style="background-color: rgba(233, 231, 58, 0.66);">
								<div class="row">
									<div class="col-4">
										<p id="date">인당 가격</p>
									</div>
									<div class="col-8" for="price">
										<input class="form-control" type="number" style="width: 815px; margin-left: auto;" id="price" name="price" placeholder=" 가격이 정해지지 않은 경우 숫자 '0'으로 입력하세요." value="<c:out value="${item.price}"/>">
									</div>
								</div>
							</nav>
						</div>
					</div>
				</div>
			</nav>
			<br>
		</form>
	</div>


	<!-- end -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script type="text/javascript">

	var goUrlInst = "/shareInst";
	var goUrlUpdt = "/shareUpdt";
	var goUrlDele = "/shareDele";
	
	var seq = $("input:hidden[name=seq]");
	var form = $("#myform");
	
	$("#btnSave").on("click", function() {
		if (seq.val() == "0" || seq.val() == "") {
			// insert
			form.attr("action", goUrlInst).submit();
		} else {
			// update
			form.attr("action", goUrlUpdt).submit();
		}
	});
	
	 /* $("#btnSave").on("click", function(){
	if ($("#place").val() == null || $("#place").val() == "" ) {
		document.getElementById("placeFeedback").classList.add('invalid-feedback');
		$("#place").focus();
	} else {
		if (seq.val() == "0" || seq.val() == "") {
			// insert
			form.attr("action", goUrlInst).submit();
		} else {
			// update
			form.attr("action", goUrlUpdt).submit();
		}
	});  */
	</script>
</body>
</html>
