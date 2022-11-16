<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!-- 카테고리 및 인원 이름으로 나오게 만들어줌 -->
<jsp:useBean id="CodeServiceImpl" class="com.lael.infra.modules.code.CodeServiceImpl"/>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>MyList</title>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/resources/css/share/myList.css">

</head>
<body>
	<form id="myForm" name="myForm" method="post">
		<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
		<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
		<input type="hidden" name="seq" value="<c:out value="${vo.seq}"/>"/>
		<input type="hidden" name="memberSeq" value="<c:out value="${sessSeq}"/>"/>		
		<div class="navbar" style="background-color:rgb(142, 68, 173); height: 30px; width: 100%;"></div>
		<div class="sideEmty">
			<div class="header">
				<a class="navbar-brand" href="share">
					<img src="../../resources/images/share/fullLogo_p.png" id="logoimg">
					<button id="btnLogout" type="button" class="btn ms-4" style="height: 30px; text-align: center;">
						<img src="../../resources/images/share/logout.png" id="Imglogout">
						Logout
					</button>
				</a>
				<ul class="nav nav-tabs mt-5">
					<li class="nav-item">
			  			<a class="nav-link" aria-current="page" onclick="goMyPage()">My Page</a>
					</li>
					<li class="nav-item">
				  		<a class="nav-link active" onclick="goList()">My Share List</a>
					</li>
					<li class="nav-item">
			 	 		<a class="nav-link"  onclick="goInfo()">Change My Information</a>
					</li>
					<li class="nav-item">
			 	 		<a class="nav-link" onclick="goSecu()">MY Security</a>
					</li>
				</ul>
			</div>
			 <!-- 검색창 -->
			<nav class="navbar navbar-expand-lg bg-transparent mt-3 mb-3 js">
				<div class="c collapse navbar-collapse">
					<ul class="navbar-nav mb-2">
						<li class="nav-item dropdown" value="">
							<select class="form-select" id="shOption" name="shOption">
								<option value="" <c:if test="${empty vo.shOption }">selected</c:if>>선택</option>
								<option value="2" <c:if test="${vo.shOption eq 2 }">selected</c:if>>제목</option>
								<option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>카테고리</option>
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
								<button class="btn btn-danger" type="reset" id="btnReset" name="btnReset" onclick="btnReset()"><i class="fa-solid fa-rotate-right"></i></button>
							</div>
						</li>
					</ul>
				</div>
			</nav>
            <table style="width: 100%;">
           		<thead>
           			<tr class="aa">
           				<th class="text-center ps-3 pe-3">
          					<input class="form-check-input" type="checkbox" value="" name="checkboxAll" id="checkboxAll">
           				</th>
           				<th class="text-center pe-3">카테고리</th>
           				<th class="text-center pe-3">제목</th>
           				<th class="text-center pe-3">인원</th>
           				<th class="text-center pe-3">장소</th>
           				<th class="text-center pe-3">시간</th>
           				<th class="text-center pe-3">가격</th>
           				<th class="text-center pe-3">쉐어일</th>
					</tr> 
            	 </thead>
                 <tbody>
                 	<c:choose>
						<c:when test="${fn:length(list) eq 0}">
							<tr style="height: 20px;"></tr>
							<tr class="b">
								<td class="text-center" colspan="8">There is no data!</td>
							</tr>
						</c:when>
	               		<c:otherwise>		
							<c:forEach items="${list}" var="list" varStatus="status">
								<tr style="height: 20px;"></tr>
								<tr class="pt-2 b" id="b" onclick="goNow(<c:out value="${list.seq }"/>)">
									<td class="text-center ps-3 pe-3" style="font-size: small">
                						<input class="form-check-input" type="checkbox" id="checkboxSeq" name="checkboxSeq"> 
               						</td>
									<td class="text-center">
										<c:set var="listCodeFood" value="${CodeServiceImpl.selectListCachedCode('4') }" />
										<c:forEach items="${listCodeFood}" var="listFood" varStatus="statusFood">
											<c:if test="${list.food_div eq listFood.cdSeq}"><c:out value="${listFood.name }"/></c:if>
										</c:forEach>
									</td>
	                                <td class="text-center">${list.title}</td>
	                                <td class="text-center">
	                                	<c:set var="listCodeNum" value="${CodeServiceImpl.selectListCachedCode('5') }" />
										<c:forEach items="${listCodeNum}" var="listNum" varStatus="statusNum">
											<c:if test="${list.people_num eq listNum.cdSeq}"><c:out value="${listNum.name }"/></c:if>
										</c:forEach>
	                                </td>
	                                <td class="text-center">${list.place}</td>
	                                <td class="text-center">${list.time}</td>
	                                <td class="text-center">${list.price}</td>
	                                <td class="text-center">${list.createDate}</td>
                   				</tr>	
							</c:forEach>
                   		</c:otherwise>
                  	</c:choose>
                  </tbody>
              </table>
			<div class="mt-5">		
				<%@include file="../../common/xdmin/includeV1/pagination.jsp"%>
			</div>
		</div>
	</form>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="//code.jquery.com/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		
	var goUrlMyList = "/myList";
	var goUrlMyPage = "/myPage";
	var goUrlMyInfo = "/personalInformation";
	var goUrlMySecurity = "/mySecurity";
	var goUrlInst = "/shareMyPageInst";
	var goUrlUpdt = "/shareMyPageUpdt";
	var goUrlUpdt = "/shareMyPageUpdt";
	
	var memberSeq = $("input:hidden[name=memberSeq]");
	
	var form = $("#myForm");
	
	goList = function() {
		form.attr("action", goUrlMyList).submit();
	};
	
	goMyPage = function() {
		form.attr("action", goUrlMyPage).submit();
	};
	
	goInfo = function() {
		form.attr("action", goUrlMyInfo).submit();
	};
	
	goSecu = function() {
		form.attr("action", goUrlMySecurity).submit();
	};

	  $("#btnReset").on("click", function(){
		 $(location).attr("href", goUrlMyList);
	 }); 
		 
	/* btnReset = function() {
		form.attr("action", goUrlMyList).submit(); */
	 
	
	</script>

</body>
</html>
