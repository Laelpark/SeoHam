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
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="/resources/css/share/sharePot.css">
</head>
<body>
	<!-- start -->
	<form id="myForm" name="myForm" method="post">
		<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
		<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
		<input type="hidden" name="seq" value="<c:out value="${vo.seq}"/>">
		<p style="background-color:rgb(142, 68, 173); height: 30px;"></p>
		<div class="container1">
			<nav class="bg-transparent">
				<div class="container-fluid">
					<a class="navbar-brand" href="share">
						<img src="/resources/images/share/sharepot.png" alt="" width="200" height="50" class="d-inline-block align-text-top ms-3 mt-4">
					</a>
				</div>
			</nav>
			<nav class="navbar navbar-expand-lg bg-transparent mt-3 mb-3 js">
				<div class="c collapse navbar-collapse">
					<ul class="navbar-nav mb-2">
						<li class="nav-item dropdown" value="">
							<select class="form-select" id="shOption" name="shOption">
								<option value="" <c:if test="${empty vo.shOption }">selected</c:if>>선택</option>
								<option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>카테고리</option>
								<option value="2" <c:if test="${vo.shOption eq 2 }">selected</c:if>>제목</option>
								<option value="3" <c:if test="${vo.shOption eq 3 }">selected</c:if>>인원</option>
								<option value="4" <c:if test="${vo.shOption eq 4 }">selected</c:if>>장소</option>
								<option value="5" <c:if test="${vo.shOption eq 5 }">selected</c:if>>시간</option>
							  	<option value="6" <c:if test="${vo.shOption eq 6 }">selected</c:if>>가격</option>
							</select>
						</li>
						<li class="nav-item dropdown ms-3">
							<div class="d-flex" role="search">
								<input class="form-control me-2 text-center" name="shValue" id="shValue" value="<c:out value="${vo.shValue}"/>" autocomplete="off" type="search" style="width: 300px;" placeholder="검색어를 입력하세요.">
								<button class="btn btn-outline-success bg-transparent me-2" type="submit" id="searching">Search</button>
								<button class="btn btn-danger" type="reset" id="btnReset" name="btnReset"><i class="fa-solid fa-rotate-right"></i></button>
							</div>
						</li>
					</ul>
				</div>
			</nav>
			<div class="a pt-2 position-relative">
				<div class="container">
					<div class="row" id="cate">
						<div class="col text-center">
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
								<div class="row" id="cate2">
									<div class="col text-center">
										${list.food_div }
										<c:forEach items="${listCodeFood}" var="listFood" varStatus="statusFood">
											<c:if test="${list.food_div eq listFood.cdSeq}"><c:out value="${listFood.name}"/></c:if>
										</c:forEach>
									</div>
									<div class="col text-center">
										${list.title}
									</div>
									<div class="col text-center">
										${list.people_num }
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
										<span>${list.price}</span>	
									</div>
									<div class="col text-center"> 
										<input type="hidden" id="starAllowedNy" name="starAllowedNy" value="0">
										<button id="star" type="button">
											<img src="" style="font-size: 20px;">
										</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<div class="mt-5">		
				<%@include file="../../common/xdmin/includeV1/pagination.jsp"%>
			</div>
			<br>
		</div>
	</form>
	
	
	

	<!-- end --> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
		/* var star = document.querySelector("#star");
		star.onclick = function() {
			star.style.color = "yellow";
		}; */
		
		var goUrlList = "/sharePot";
		var form = $("#myForm");
		
		goList = function(thisPage) {
			$("input:hidden[name=thisPage]").val(thisPage);
			form.attr("action", goUrlList).submit();
		};
		
		 $("#btnReset").on("click", function(){
			 $(location).attr("href", goUrlList);
		 });
		 
		 
		 // 숫자에 , 찍기
		 
	    $(document).ready(function(){

	    	var price = $(".col span").text();
	        console.log(price);  // 콘솔창에 123123123 찍힘
	        
	        don = price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        console.log(price);  // 콘솔창에 123,123,123 찍힘
	     });
	    		

		 $("#star").on("click", function(){
			
			 var allow = $("#starAllowedNy").val();
			 
			 if (allow == 0) {
				document.getElementById("starAllowedNy").value = 1;
				$("#star").attr("src", )
				
			} else {
				
				document.getElementById("starAllowedNy").value = 0;
			}
		 });
	    
	    
	</script>
</body>
</html>
