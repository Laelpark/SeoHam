<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>adminNewUser</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/admin/newUser.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body style="background-color: rgb(224, 224, 224);">
	<div class="container">
		<nav>
			<div id="main">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="g nav-link" data-toggle="tab" id="btnUserList" name="btnUserList" style="cursor: pointer;">사용자목록</a></li>
					<li class="nav-item"><a class="g nav-link active" data-toggle="tab" id="btnNewUser" name="btnNewUser" style="cursor: pointer;">신규회원관리</a></li>
					<!-- <li class="nav-item"><a class="g nav-link" data-toggle="tab" id="btnUserAll" name="btnUserAll" style="cursor: pointer;">회원관리</a></li> -->
				</ul>
			</div>
		</nav>
		<main>
			<div class="cd2">
	            <p class="Userlist mt-4" style="font-weight: bold;">
	                Today 신규회원
	                <span class="num">${vo.totalRows}</span> 명
	            </p>
                <table class="table text-center align-midde menuout">
	               	<thead id="menu1">
	               		<tr>
	               			<th>No</th>
	               			<th>이름</th>
	               			<th>닉네임</th>
	               			<th>이메일계정</th>
	               			<th>가입일</th>
	               		</tr>
	               	</thead>
                	<tbody>
                		<c:choose>
                			<c:when test="${fn:length(list) eq 0 }">	                			
	                			<tr>
	                				<td class="text-center" colspan="8">There is no data!</td>
	                			</tr>
                			</c:when>
                			<c:otherwise>
                				<c:forEach items="${list }" var="list" varStatus="status">	                				
	                				<tr style="border-bottom: 1px solid transparent;"> 
                						<td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></td>
	                					<td>${list.name }</td>
	                					<td>${list.nick_nm }</td>
	                					<td>${list.email }</td>
	                					<td>${list.createDate }</td>
	                				</tr>
                				</c:forEach>
                			</c:otherwise>
                		</c:choose>
                	</tbody>
                </table>
                <div class="mt-3 mb-3">
					<%@include file="../../common/xdmin/includeV1/pagination.jsp"%>
                </div>
            </div>
		</main>
		<div id="sidebar">
			<div class="side_img">
				<img src="/resources/images/share/fullLogo_w.png" style="cursor: pointer;" onclick="location.href='adminMain'">
			</div>
			<div class="side_info">
				<hr style="color: white;">
                <ul>
                    <li>
                        <i class="fa-solid fa-sliders" id="btnAdmin" name="btnAdmin" style="cursor: pointer;">&nbsp 통계</i>
                    </li>
                    <li>
                        <i class="fas fa-light fa-user" style="color: rgb(233, 231, 58);" id="btnUser" name="btnUser" style="cursor: pointer;">&nbsp 사용자 관리</i>
                    </li>
                    <li>
                    	<button id="btnList" type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	                        	<i class="fas fa-regular fa-clipboard-list">&nbsp 쉐어리스트 </i>
					  	</button>
						  <ul class="dropdown-menu" id="list">
						    <li><a class="dropdown-item" href="#" id="sharePotlist">쉐어팟관리</a></li>
						    <li><a class="dropdown-item" href="#" id="shareHotlist">쉐어핫관리</a></li>
						  </ul>
                    </li>
                </ul>
            </div>
            <div class="side_info" id="midLine">
	                <hr style="color: white;">
	                <ul>
	                     <li>
	                        <i class="fa-solid fa-arrow-right-from-bracket" id="btnLogout" name="btnLogout" style="cursor: pointer;">&nbsp 로그아웃</i>
	                    </li>
	                </ul>
	            </div>
			</div>
		</div>
	</div>
	<footer class="mt-3 mb-3" id="btn_area">
		<%@include file="../../common/xdmin/includeV1/pagination.jsp"%>
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
		var goUrlAdmin = "adminMain";
		var goUrlUserList = "adminUserList";
		var goUrlSharePotList = "/adminSharePot";
		var goUrlShareHotList = "/#";

		var goUrlNewUser = "adminNewUser";
		var goUrlUserAll = "adminUserAll";

		$('#btnAdmin').on("click", function() {
			$(location).attr("href", goUrlAdmin);
			});

		$('#btnUserList').on("click", function() {
			$(location).attr("href", goUrlUserList);
			});

		$('#btnList').on("click", function() {
			$(location).attr("href", goUrlList);
			});

		$('#btnNewUser').on("click", function() {
			$(location).attr("href", goUrlNewUser);
			});

		$('#btnUserAll').on("click", function() {
			$(location).attr("href", goUrlUserAll);
			});
		
		$('#sharePotlist').on("click", function() {
			 $(location).attr("href", goUrlSharePotList);
			});
		
		$('#shareHotlist').on("click", function() {
			 $(location).attr("href", goUrlShareHotList);
			});
	</script>
</body>
</html>