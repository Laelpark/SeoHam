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
	<title>User Form</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/resources/css/admin/userForm.css">
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
	        </nav>
	        <main class="cd2 mt-3">
	        	<h2 class="needs-validation mt-2">User Form</h2>
					<div class="content">
						<div class="row ms-3 me-3">
							<div class="col-6">
								<label class="form-label">코드</label> 
								<input type="text" class="form-control col-6" value="<c:out value="${item.ifmnSeq}"/>">
							</div>
							<div class="col-6">	
			   					<label class="form-label">사용자 구분</label> 
			   					<select class="form-select" >
									<option selected disabled value="">선택</option>
									<option>고객</option>
									<option>사장님</option>
									<option>관리자</option>
								</select>
				   			</div>
						</div>
						<div class="row mt-3 ms-3 me-3">
							<div class="col-2">
								<label class="form-label">통신사</label> 
								<select class="form-select">
									<option selected disabled value="">선택</option>
									<option>KT</option>
									<option>SKT</option>
									<option>LGT</option>
									<option>...</option>
								</select>
							</div>
							<div class="col">
								<label class="form-label">전화번호</label> 
								<input type="text" class="form-control" placeholder="특수문자(-)없이 숫자만 입력 ">
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-6">
								<label class="form-label">이메일</label> 
								<input type="text" class="form-control" placeholder="영문(대소문자),숫자, @이후 전체 이메일 주소 포함 ">
							</div>
						</div>
							<div class="col">
								<label class="form-label">삭제여부</label> <select class="form-select">
									<option selected disabled value="">선택</option>
									<option>N</option>
									<option>Y</option>
								</select>
							</div>
						</div>
	        		</main>
			<div class="row align-items-center mt-5">
	            <div class="col-2">
	                <button  class="border-0 btn bg-secondary shadow" type="button" id="btnList">
	                    <i class="fa-solid fa-bars" style="color: white;"></i>
	                </button>
	                <button id="btnUel" value="Uel" class="border-0 btn bg-danger shadow" type="button" data-bs-toggle="modal"
	                    data-bs-target="#deleteModal">
	                    <i class="fa-solid fa-xmark" style="color: white;"></i>
	                </button>
	            </div>
	            <div class="col-3 offset-7" align="right">
	                <div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false"
	                    tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	                    <div class="modal-dialog">
	                        <div class="modal-content">
	                            <div class="modal-header">
	                                <h5 class="modal-title fw-bold" id="staticBackdropLabel">게시물 삭제</h5>
	                                <button type="button" class="btn-close" data-bs-dismiss="modal"
	                                    aria-label="Close"></button>
	                            </div>
	                            <div class="modal-body fs-6">
	                           		선택하신 게시물을 정말로 삭제하시겠습니까?
	                            </div>
	                            <div class="modal-footer">
	                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	                                <button id="delBtn" type="button" class="btn btn-primary">삭제</button>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <button id="btnDel" value="Del" class="border-0 btn bg-danger shadow" type="button" data-bs-toggle="modal" data-bs-target="#deleteModal">
	                    <i class="fa-solid fa-trash-can" style="color: white;"></i>
	                </button>
	                <button id="btnSave" class="border-0 btn bg-success shadow" type="button">
	                    <i class="fa-regular fa-bookmark" style="color: white;"></i>
	                </button>
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
	
	var goUrlInst = "/adminUserInst"; /* #-> */
	var goUrlUpdt = "/adminUserUpdt"; /* #-> */
	var goUrlDele = "/adminDele";
	var goUrlUele = "/adminUele";
	
	
	// 사이드 바
	var goUrlAdmin = "/adminMain"; 			
	var goUrlUserList = "/adminUserList"; 			
	var goUrlSharePotList = "/adminSharePot";
	var goUrlShareHotList = "/#";
	var goUrlNewUser = "/adminNewUser"; 			
	var goUrlUserAll = "/adminUserAll";
	
	
	
	var form = $("#myForm");
	var seq = $("input:hidden[name=seq]");
	
	 
 	$("#btnSave").on("click", function() {
		if (ccgSeq.val() == "0" || ccgSeq.val() == "") {
			form.attr("action", goUrlInst).submit();
		} else {
			form.attr("action", goUrlUpdt).submit();
		}
	});
	
	$("#btnList").on("click", function() {
		formVo.attr("action", goUrlList).submit();
	});
	
	$("#deleteBtn").on("click", function() {
		formVo.attr("action", goUrlDele).submit();
	});

	$("#ueleteBtn").on("click", function() {
		formVo.attr("action", goUrlUele).submit();
	});
	
// ----- 게시물 삭제 -----
 	
 	$("#btnUel").on("click", function() {
		DelValidation("#delBtn", goUrlUele, "선택하신 게시물을 삭제하시겠습니까?");
	})
	
	$("#btnDel").on("click", function() {
		DelValidation("#delBtn", goUrlDele, "선택하신 게시물을 진짜로 삭제하시겠습니까?");		
	})
	
	DelValidation = function(confirm, url, msg) {
		$(".modal-body").html(msg);
		$(confirm).on("click", function() {
			form.attr("action", goUrlList).submit();
		})
	}
	
	
	// --------------------- //
	 goList = function(thisPage) {
			$("input:hidden[name=thisPage]").val(thisPage);
			form.attr("action", goUrlUserList).submit();
		};
	
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