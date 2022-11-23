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
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/css/share/shareLike_List.css">
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
				<%-- <c:set var="listCodeFood" value="${shareCodeGroupServiceImpl.selectListCachedCode('4') }" />
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
			</div> --%>
			<div class="d-flex justify-content-center mt-5">
			    <span>준비중...</span>
			  	<div class="spinner-border ms-3" role="status"></div>
			</div>
			<span class="mt-3" style="text-align: center;"> 즐겨찾기한 게시글이 표시됩니다. (즐겨찾기 버튼 구현 중)</span>
		</form>

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
		
		//

	</script>
</body>
</html>
