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
			<input type="hidden" name="checkboxSeqArray">
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
				            <select id="shOptionDate" name="shOptionDate" class="form-select">
				                <option value="" <c:if test="${empty vo.shOptionDate}">selected</c:if>>날짜</option>
				                <option value="1" <c:if test="${vo.shOptionDate eq 1}">selected</c:if>>가입일</option>
				                <option value="2" <c:if test="${vo.shOptionDate eq 2}">selected</c:if>>탈퇴일</option>
				            </select>
				        </div> 
						<div class="col-md-3">
							<fmt:parseDate var="shDateStart" value="${vo.shDateStart }" pattern="yyyy-MM-dd HH:mm:ss"/>
            				<input type="date" id="shDateStart" name="shDateStart" value="<fmt:formatDate value="${shDateStart }" pattern="yyyy-MM-dd" />" class="form-control" autocomplete="off">
						</div>
						<div class="col-md-3">
							<fmt:parseDate var="shDateEnd" value="${vo.shDateEnd }" pattern="yyyy-MM-dd HH:mm:ss" />
	        				<input type="date" id="shDateEnd" name="shDateEnd" value="<fmt:formatDate value="${shDateEnd }" pattern="yyyy-MM-dd"/>" class="form-control" autocomplete="off">
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
	                    <span class="num">${vo.totalRows}</span> 명
	                </p>
	                <table class="table text-center align-midde">
	                	<thead>
	                		<tr>
	                			<th style="font-size: small;">
	                				<input class="form-check-input" type="checkbox" value="" name="checkboxAll" id="checkboxAll">
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
		                						<input class="form-check-input" type="checkbox" id="checkboxSeq" name="checkboxSeq" value="<c:out value="${list.seq }"/>"> 
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
			<button id="btnDelete" class="btn btn-danger del mt-5 ms-5" type="button" style="float: left;"><i class="fa-solid fa-trash-can"></i></button>
			<button id="btnUelete" class="btn btn-warning del mt-5 ms-3" type="button" style="float: left;"><i class="fa-solid fa-xmark"></i></button>
			<button id="btnExcel" class="btn btn-success del mt-5 me-4" type="button" style="float: right; color: white;"><i class="fa-regular fa-file-excel"></i></button>
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
                        <i class="fas fa-light fa-user" style="color: rgb(233, 231, 58);" id="btnUserList" name="btnUserList" style="cursor: pointer;">&nbsp 사용자 관리</i>
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
    
   <!-- modalBase s -->
<%@include file="../../common/xdmin/includeV1/modalBase.jsp"%>
<!-- modalBase e -->

<!-- linkJs s -->
<%-- <%@include file="../../common/xdmin/includeV1/linkJs.jsp"%> --%>
<!-- linkJs e -->
    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	var goUrlAdmin = "/adminMain"; 			
	var goUrlUserList = "/adminUserList"; 			
	var goUrlSharePotList = "/adminSharePot";
	var goUrlShareHotList = "/#";
	
	var goUrlNewUser = "/adminNewUser"; 			
	var goUrlUserAll = "/adminUserAll";
	
	var goUrlDele = "/adminDele";
	var goUrlUele = "/adminUele";
	
	var excelUri = "/excelDownload";
	
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
	
	$('#sharePotlist').on("click", function() {
		 $(location).attr("href", goUrlSharePotList);
		});
	
	$('#shareHotlist').on("click", function() {
		 $(location).attr("href", goUrlShareHotList);
		});
	
	$("#btnExcel").click(function() {
		form.attr("action", excelUri).submit();
	});
	
	// 데이트픽커
	document.getElementById('datepickerS').valueAsDate = new Date();
	document.getElementById('datepickerE').valueAsDate = new Date();
	
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
			  todayHighlight :true,
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
			  todayHighlight :true,
			  yearSuffix: '년'
		  });
	  });
	  
	  // 체크박스
	  	
	  $("#checkboxAll").click(function() {
		if($("#checkboxAll").is(":checked")) $("input[name=checkboxSeq]").prop("checked", true);
		else $("input[name=checkboxSeq]").prop("checked", false);
	});
	
	
	$("input[name=checkboxSeq]").click(function() {
		var total = $("input[name=checkboxSeq]").length;
		var checked = $("input[name=checkboxSeq]:checked").length;
		
		if(total != checked) $("#checkboxAll").prop("checked", false);
		else $("#checkboxAll").prop("checked", true); 
	});
	
	// 삭제버튼
	
	var checkboxSeqArray = [];

	$("#btnUelete").on("click", function(){
		if($("input[name=checkboxSeq]:checked").length > 0 ) {
			$("input:hidden[name=exDeleteType]").val(1);
			
			$(".modal-title").text("주의");
			$(".modal-body").text("해당 데이터를 삭제하시겠습니까?");
			$("#btnModalUelete").show();
			$("#btnModalDelete").hide();
			$("#modalConfirm").modal("show");
		} else {
			$(".modal-title").text("주의");
			$(".modal-body").text("삭제하실 데이터를 선택해주세요!");
			$("#modalAlert").modal("show");
		}
	});
	

	$("#btnDelete").on("click", function(){
		if($("input[name=checkboxSeq]:checked").length > 0 ) {
			$("input:hidden[name=exDeleteType]").val(2);
			$(".modal-title").text("주의");
			$(".modal-body").text("해당 데이터를 삭제하시겠습니까?");
			$("#btnModalUelete").hide();
			$("#btnModalDelete").show();
			$("#modalConfirm").modal("show");
		} else {
			$(".modal-title").text("주의");
			$(".modal-body").text("삭제하실 데이터를 선택해주세요!");
			$("#modalAlert").modal("show");
		}
	});
	
	
	$("#btnModalUelete").on("click", function(){
		$("input[name=checkboxSeq]:checked").each(function() { 
			checkboxSeqArray.push($(this).val());
		});
		
		$("input:hidden[name=checkboxSeqArray]").val(checkboxSeqArray);
		
		$("#modalConfirm").modal("hide");
		
		form.attr("action", goUrlMultiUele).submit();
	});
	
	
	$("#btnModalDelete").on("click", function(){
		$("input[name=checkboxSeq]:checked").each(function() { 
			checkboxSeqArray.push($(this).val());
		});
		
		$("input:hidden[name=checkboxSeqArray]").val(checkboxSeqArray);
		
		$("#modalConfirm").modal("hide");
							
		form.attr("action", goUrlMultiDele).submit();
	});
	 
	</script>
</body>
</html>