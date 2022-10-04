<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<jsp:useBean id="CodeServiceImpl" class="com.lael.infra.modules.code.CodeServiceImpl"/>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>sharePot</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/share/sharePot.css">
</head>
<body>
	<!-- start -->
	<nav class="navbar mb-3" style="background-color:rgb(142, 68, 173); height: 30px;"></nav>
	<nav class="bg-transparent">
		<div class="container-fluid">
			<a class="navbar-brand" href="share">
				<img src="../../resources/images/share/sharepot.png" alt="" width="200" height="50" class="d-inline-block align-text-top ms-3">
			</a>
		</div>
	</nav>
	<nav class="navbar navbar-expand-lg bg-transparent mt-3 mb-3 js">
		<div class="c collapse navbar-collapse">
			<ul class="navbar-nav mb-2">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						카테고리
					</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">족발, 보쌈</a></li>
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
						<input class="form-control me-2 text-center" name="shValue" id="shValue" value="<c:out value="${vo.shValue }"/>" autocomplete="off" type="search" style="width: 200px;" placeholder="검색어를 입력하세요." aria-label="Search">
						<button type="button" class="btn btn-outline-success bg-transparent" href="#">Search</button>
					</form>
				</li>
			</ul>
		</div>
	</nav>
	<form id="myForm" name="myForm" method="post">
		<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
		<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
		<input type="hidden" name="seq" value="<c:out value="${vo.seq }"/>">
		<div class="a pt-2 position-relative">
			<div class="container">
				<div class="row" href="#">
					<div class="col">
						카테고리
					</div>
					<div class="col text-center">
						제목
					</div>
					<div class="col text-center">
						인원
					</div>
					<div class="col text-center">
						장소
					</div>
					<div class="col text-center">
						시간
					</div>
					<div class="col text-center">
						가격
					</div>
					<div class="col text-center">
						즐겨찾기
					</div>
				</div>
			</div>
		</div>
		<c:set var="listCodeFood" value="${shareCodeGroupServiceImpl.selectListCachedCode('4') }" />
		<c:set var="listCodeNum" value="${shareCodeGroupServiceImpl.selectListCachedCode('5') }" />
		<c:choose>
			<c:when test="${fn:length(list) eq 0}">
				<tr>
					<td class="text-center" colspan="8">There is no data!</td>
				</tr>
			</c:when>
			<c:otherwise>		
				<c:forEach items="${list}" var="list" varStatus="status">
					<div class="b pt-2 position-relative">
						<div class="container" onclick="newPage()">
							<div class="row">
								<div class="col">
									<c:forEach items="${listCodeFood}" var="listFood" varStatus="statusFood">
										<c:if test="${list.food_div eq listFood.cdSeq}"><c:out value="${listFood.name}"/></c:if>
									</c:forEach>
								</div>
								<div class="col text-center">
									${list.title}
								</div>
								<div class="col text-center">
									<c:forEach items="${listCodeNum}" var="listNum" varStatus="statusNum">
										<c:if test="${list.people_num eq listNum.cdSeq}"><c:out value="${listNum.name}"/></c:if>
									</c:forEach>
								</div>
								<div class="col text-center">
									${list.place}
								</div>
								<div class="col text-center">
									${list.time}
								</div>
								<div class="col text-center">
									${list.price}
								</div>
								<div class="col text-center"> 
									<i class="fas fa-light fa-star" type="button"  id="star" style="font-size: 20px;"></i>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<footer class="mt-5">
			<%@include file="../../common/xdmin/includeV1/pagination.jsp"%>
		</footer>
	</form>
	
	
	

	<!-- end --> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
		var star = document.querySelector("#star");
		star.onclick = function() {
			star.style.color = "yellow";
		}
	</script>
</body>
</html>
