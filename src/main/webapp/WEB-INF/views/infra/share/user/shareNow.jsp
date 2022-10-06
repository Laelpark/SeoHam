<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<%-- <jsp:useBean id="CodeServiceImpl" class="com.lael.infra.modules.code.CodeServiceImpl"/> --%>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>shareNow</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/share/shareNow.css">
</head>
<body>
	<!-- start -->
	<nav class="navbar mb-3" style="background-color:rgb(142, 68, 173); height: 30px;"></nav>
	<nav class="bg-transparent">
		<div class="container">
			<a class="navbar-brand" href="share">
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
		<input type="hidden" name="share_member_seq" value="<c:out value="${sessSeq}"/>"/>
		<!-- *Vo.jsp e -->
		<nav class="navbar navbar-expand-lg">
			<div class="a collapse navbar-collapse">
				<ul class="navbar-nav mb-2 mt-2 ms-3">
					<li class="nav-item dropdown">
						<img alt="" src="../../resources/images/share/user.png" style=" margin-left: 8px; width: 60px; height: 40px; border-radius: 100px; cursor: pointer;">
					</li>
					<li>
						<select class="form-select col ms-3 me-3" style="width: 180px; height: 50px;" id="food_div" name="food_div" required>
							<option value="" <c:if test="${empty item.food_div }">selected</c:if>>카테고리</option>
							<option value="11" <c:if test="${item.food_div eq 11}">selected</c:if>>치킨</option>
							<option value="12" <c:if test="${item.food_div eq 12}">selected</c:if>>족발/보쌈</option>
							<option value="13" <c:if test="${item.food_div eq 13}">selected</c:if>>찜/탕/찌개</option>
							<option value="14" <c:if test="${item.food_div eq 14}">selected</c:if>>돈까스/회/일식</option>
							<option value="15" <c:if test="${item.food_div eq 15}">selected</c:if>>피자</option>
							<option value="16" <c:if test="${item.food_div eq 16}">selected</c:if>>고기/구이</option>
							<option value="17" <c:if test="${item.food_div eq 17}">selected</c:if>>양식</option>
							<option value="18" <c:if test="${item.food_div eq 18}">selected</c:if>>중식</option>
							<option value="19" <c:if test="${item.food_div eq 19}">selected</c:if>>아시안</option>
							<option value="20" <c:if test="${item.food_div eq 20}">selected</c:if>>백반/죽/국수</option>
							<option value="21" <c:if test="${item.food_div eq 21}">selected</c:if>>도시락</option>
							<option value="22" <c:if test="${item.food_div eq 22}">selected</c:if>>분식</option>
							<option><hr class="dropdown-divider"></option>
							<option value="23" <c:if test="${item.food_div eq 23}">selected</c:if>>카페/디저트</option>
							<option value="24" <c:if test="${item.food_div eq 24}">selected</c:if>>그 외</option>
						</select>
					</li>
					<li class="nav-item dropdown">
						<input type="hidden" class="d-flex" for="title">
							<input class="form-control me-2 text-center" id= "title" name="title" type="text" style="width: 480px; height: 50px;" placeholder="타이틀을 입력하세요." value="<c:out value="${item.title}"/>">
						</input>
					</li>
					<li>
						<select class="form-select col ms-3 me-3" style="width: 180px; height: 50px;" id="people_num" name="people_num" required>
							<option value="" <c:if test="${empty item.people_num}">selected</c:if>>인원</option>
							<option value="25" <c:if test="${item.people_num eq 25}">selected</c:if>>1인</option>
							<option value="26" <c:if test="${item.people_num eq 26}">selected</c:if>>2인</option>
							<option value="27" <c:if test="${item.people_num eq 27}">selected</c:if>>3인</option>
							<option value="28" <c:if test="${item.people_num eq 28}">selected</c:if>>4인</option>
							<option><hr class="dropdown-divider"></option>
							<option value="29" <c:if test="${item.people_num eq 29}">selected</c:if>>그 외</option>
						</select>
					</li>
				</ul>
			</div>
		</nav>
		<nav class="navbar navbar-expand-lg">
			<div class="a collapse navbar-collapse" style="height: 300px;">
				<div class="b me-3">
					<div class="filebox">
						<label for="chooseImg"> 📷 사진 업로드하기</label>
						<img src="" id="img" width="250px;" id="img">	
						<input type="file" id="chooseImg" name="chooseImg" accept="image/*" onchange="loadFile(this)" multiple>
					</div>
				</div>
	            <div class="ms-3">
	                <div class="c" for="info">
	                	<textarea class="form-control" placeholder="주문하실 음식점 이름과 메뉴, 가격 등을 자세히 기재해주세요." rows="10" id="info" name="info" aria-label="info"> 
	                		${item.info}
	                	</textarea>
	                </div>
	            </div>
	        </div>
		</nav>
	    <nav class="navbar navbar-expand-lg">
			<div class="a collapse navbar-collapse" style="height: 250px;">
	            <div class="ms-3 me-4">
	                <div class="row">
						<nav class="d navbar col-12 mt-4" style="background-color:rgba(233, 231, 58, 0.66);">
							<div class="row">
								<div class="col-4">
									<p id="date">거래 장소</p>
								</div>
								<div class="col-8" for="date">
									<input type="text" style="width: 850px; margin-left: auto;" id="place" name="place" value="<c:out value="${item.place}"/>">
								</div>
							</div>
						</nav>
						<nav class="d navbar col-12 mt-4" style="background-color:rgba(233, 231, 58, 0.66);">
							<div class="row">
								<div class="col-4">
									<p id="date">거래 시간</p>
								</div>
								<div class="col-8" for="time">
									<input type="text" style="width: 850px; margin-left: auto;" id="time" name="time" value="<c:out value="${item.time}"/>">
								</div>
							</div>
						</nav>
						<nav class="d navbar col-12 mt-4" style="background-color:rgba(233, 231, 58, 0.66);">
							<div class="row">
								<div class="col-4">
									<p id="date">인당 가격</p>
								</div>
								<div class="col-8" for="price">
									<input type="text" style="width: 850px; margin-left: auto;" id="price" name="price" value="<c:out value="${item.price}"/>">
								</div>
							</div>
						</nav>
					</div>
	            </div>
	        </div>
		</nav>
	</form>
	

	<!-- end --> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script>
	
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
	
	// 사진 업로드
	
	const reader = new FileReader();
        reader.onload = (readerEvent) => {
            document.querySelector("#img").setAttribute("src", readerEvent.target.result);
        };
        document.querySelector("#chooseImg").addEventListener("change", (changeEvent) => {
            const imgFile = changeEvent.target.files[0];
            reader.readAsDataURL(imgFile);
        })
	
	</script>
</body>
</html>
