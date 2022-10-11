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
	<title>UserList</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/resources/css/admin/userList.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body style="background-color: rgb(224, 224, 224);">
    <div class="container">
    	<form id="myForm" name="myForm" method="post">
			<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
			<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
			<input type="hidden" name="seq" value="<c:out value="${vo.seq}"/>">
	        <nav>
	        	<h2 class="row needs-validation ms-4 mt-3">사용자 관리</h2>
				<div class="row needs-validation ms-3 me-3 mt-3 mb-5 p-3 shadow-lg bg-body rounded" novalidate>
					<div class="row mb-2">
						<div class="col-md-3">
							<select class="form-select" id="shDelNy" name="shDelNy">
		                     	<option value="" <c:if test="${empty vo.shDelNy }">selected</c:if>>유저상태</option>
		                        <option value="0" <c:if test="${vo.shDelNy eq 0 }">selected</c:if>>활성화</option>
		                        <option value="1" <c:if test="${vo.shDelNy eq 1 }">selected</c:if>>탈퇴</option>
	                       	</select>
						</div>
						<div class="col-md-3">
							<select class="form-select" id="shUpdt" name="shUpdt">
								<option value="1" <c:if test="${vo.shUpdt eq 1 }">selected</c:if>>가입일</option>
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
	                           <option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>이름</option>
	                           <option value="2" <c:if test="${vo.shOption eq 2 }">selected</c:if>>닉네임</option>
	                           <option value="3" <c:if test="${vo.shOption eq 3 }">selected</c:if>>이메일계정</option>
	                           <option value="4" <c:if test="${vo.shOption eq 4 }">selected</c:if>>쉐어회수</option>
	                        </select>
						</div>
						<div class="col-md-3">
							<input placeholder="검색해주세요." type="text" class="form-control" name="shValue" id="shValue" value="<c:out value="${vo.shValue }"/>" autocomplete="off">
							<div class="invalid-feedback" id="shValueFeeback"></div>
						</div>
						<div class="col-md-2">
							<button class="btn btn-warning" type="submit" id="searching"><i class="fa-solid fa-magnifying-glass"></i></button>
							<button class="btn btn-danger" type="reset" id="btnReset" name="btnReset"><i class="fa-solid fa-rotate-right"></i></button>
						</div>
					</div>
				</div>
	            <div class="mb-3 ms-4" id="main">
	                <ul class="nav nav-tabs">
	                    <li class="nav-item">
	                        <a class="g nav-link active"  data-toggle="tab" id="btnUserList" name="btnUserList" style="cursor: pointer;">사용자목록</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="g nav-link" data-toggle="tab" id="btnNewUser" name="btnNewUser" style="cursor: pointer;">신규회원관리</a>
	                    </li>
	                   <!--  <li class="nav-item">
	                        <a class="g nav-link" data-toggle="tab" id="btnUserAll" name="btnUserAll" style="cursor: pointer;">회원관리</a>
	                    </li> -->
	                </ul>
	            </div>
	        </nav>
	        <main>
            	<div class="cd2">
	                <p class="Userlist mt-4" style="font-weight: bold;">
	                    전체사용자
	                    <span class="num">${vo.totalRows}</span>
	                    명
	                </p>
	                <table class="table text-center align-midde">
	                	<thead>
	                		<tr>
	                			<th style="font-size: small;">
	                				<input class="form-check-input" type="checkbox" value="">
	                			</th>
	                			<th>#</th>
	                			<th>코드번호</th>
	                			<th>이름</th>
	                			<th>닉네임</th>
	                			<th>이메일계정</th>
	                			<th>가입일</th>
	                			<th>쉐어횟수</th>
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
		                					<td style="font-size: small">
		                						<input class="form-check-input" type="checkbox" value="" id=""> 
	                						</td>
	                						<td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></td>
		                					<td>${list.seq }</td>
		                					<td>${list.name }</td>
		                					<td>${list.nick_nm }</td>
		                					<td>${list.email }</td>
		                					<td>${list.createDate }</td>
		                					<td>${list.shareCount }</td>
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
			<button class="btn btn-danger del mt-5 ms-5" type="button" onclick=deleteValue(); data-bs-toggle="modal" data-bs-target="#exampleModalCenter" style="float: left;"><i class="fa-solid fa-trash-can"></i></button>
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
        </form>
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
                        <i class="a fas fa-regular fa-clipboard-list" id="btnList" name="btnList" style="cursor: pointer;">&nbsp 쉐어팟 관리</i>
                    </li>
                </ul>
            </div>
        </div>
    </div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	var goUrlAdmin = "/adminMain"; 			
	var goUrlUserList = "/adminUserList"; 			
	/* var goUrlList = "/adminList";	 */
	
	var goUrlNewUser = "/adminNewUser"; 			
	var goUrlUserAll = "/adminUserAll";
	
	var goUrlDele = "/adminDele";
	
	var form = $("#myForm");
	var seq = $("input:hidden[name=seq]");
	
	 goList = function(thisPage) {
			$("input:hidden[name=thisPage]").val(thisPage);
			form.attr("action", goUrlUserList).submit();
		};
	
	$("#btnReset").on("click", function(){
		 $(location).attr("href", goUrlUserList);
	 });
	
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
	
	</script>
</body>
</html>