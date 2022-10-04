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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>CodeGroupForm.jsp</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/codeGroupList.css">
</head>
<body>
	<!-- start -->
	<header>
		<div class="header bg-light">
			<div class="container">
				<div class="row d">
					<nav class="navbar col">
						<div class="col">
							<a class="navbar-brand" href="#"> <img src="https://getbootstrap.com/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="align-text-top ms-5"> <span></span> Management System
							</a>
						</div>
						<div class="row offset-5">
							<div class="userimg col">
								<img alt="" src="../../user/img/user.png" style="width: 60px; height: 40px; border-radius: 100px;" class="me-4 mb-4 "> <span id="nm" class="d-inline-block">Tony Chang <br> Administrator
								</span>
							</div>
						</div>
						<div class="col">
							<select class="form-select col" id="emailSelect" style="width: 90px;">
								<option selected>언어</option>
								<option>한국어</option>
							</select>
						</div>
					</nav>
				</div>
			</div>
			<div style="background-color: #e3f2fd;">
				<div class="container">
					<nav class="navbar navbar-expand-lg">
						<a class="navbar-brand" href="#">Navbar</a>
						<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
							<div class="navbar-nav">
								<a class="nav-link active" aria-current="page" href="#">회원관리</a> <a class="nav-link" href="#">서비스관리</a> <a class="nav-link" href="#">사이트관리</a> <a class="nav-link" href="#">로그관리</a> <a class="nav-link" href="#">시스템관리</a> <a class="nav-link" href="#">시스템관리</a>
							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<main>
		<!-- <form name="form" id="form" method="post" enctype="multipart/form-data"> -->
		<form id="myform" name="myform" method="post" autocomplete="off">
			<!-- *Vo.jsp s -->
			<%@include file="codeGroupVo.jsp"%>
			<!-- *Vo.jsp e -->
			
			<div style="height: 70px"></div>
			<div class="wrapper">
				<div class="container">
					<div class="row">
						<div class="col-3">
							<div class="sidebar">
								<!--menu item-->
								<ul>
									<li><a href="#" class="active"> <span class="icon"><i class="fa-solid fa-angle-right"></i></span> <span class="item">Home</span>
									</a></li>
									<li><a href="#"> <span class="icon"><i class="fa-solid fa-angle-right"></i></span> <span class="item">Dashboard</span>
									</a></li>
									<li><a href="#"> <span class="icon"><i class="fa-solid fa-angle-right"></i></span> <span class="item">Orders</span>
									</a></li>
									<li><hr class="dropdown-divider" style="color: lightgray;"></li>
									<li><a href="#"> <span class="icon"><i class="fa-solid fa-angle-right"></i></span> <span class="item">Account</span>
									</a></li>
								</ul>
							</div>
						</div>
						<div class="col">
							<h2 class="needs-validation mt-2">코드그룹 관리</h2>
							<div class="content">
								<div class="row">
									<div class="col">
										<label for="ccgSeq" class="form-label">코드그룹 코드</label> <input type="text" class="form-control" id="ccgSeq" placeholder="영문(대소문자),숫자" value="<c:out value="${item.ccgSeq}"/>">
									</div>
									<div class="col">
										<label for="codeGroup_another" class="form-label">코드그룹 코드(Another)</label> <input type="text" class="form-control" id="codeGroup_another" name="codeGroup_another" placeholder="영문(대소문자),숫자" value="">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="name" class="form-label">코드그룹 이름(한글)</label> <input type="text" class="form-control" id="name" name="name" placeholder="한글,숫자" value="<c:out value="${item.name}"/>">
									</div>
									<div class="col">
										<label for="name_eng" class="form-label">코드그룹 이름(영문)</label> <input type="text" class="form-control" id="name_eng" name="name_eng" placeholder="영문(대소문자),숫자" value="<c:out value="${item.name_eng}"/>">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="codeGroup_use" class="form-label">사용여부</label> <select class="form-select" id="codeGroup_use" name="codeGroup_use">
											<option selected disabled value="">선택</option>
											<option value="0" <c:if test = "${item.codeGroup_use eq 0}">selected</c:if>>N</option>
											<option value="1" <c:if test = "${item.codeGroup_use eq 1}">selected</c:if>>Y</option>
										</select>
									</div>
									<div class="col">
										<label for="codeGroup_or" class="form-label">순서</label> <input type="text" class="form-control" id="codeGroup_or" name="codeGroup_or" placeholder="숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="codeGroup_con" class="form-label">설명</label>
										<textarea class="form-control" id="codeGroup_con" placeholder="Required example textarea"></textarea>
									</div>
									<div class="col">
										<label for="ifcgDelNy" class="form-label">삭제여부</label> <select class="form-select" id="ifcgDelNy" name="ifcgDelNy">
											<option value="0">N</option>
											<option value="1">Y</option>
										</select>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="codeGroup_V1" class="form-label">예비1(Varchar type)</label> <input type="text" class="form-control" id="codeGroup_V1" name="codeGroup_V1" placeholder="영문(대소문자),숫자">
									</div>
									<div class="col">
										<label for="codeGroup_V2" class="form-label">예비2(Varchar type)</label> <input type="text" class="form-control" id="codeGroup_V2" name="codeGroup_V2" placeholder="영문(대소문자),숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-6">
										<label for="codeGroup_V3" class="form-label">예비3(Varchar type)</label><input type="text" class="form-control" id="codeGroup_V3" name="codeGroup_V3" placeholder="영문(대소문자),숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="codeGroup_I1" class="form-label">예비1 (Int type)</label><input type="text" class="form-control" id="codeGroup_I1" name="codeGroup_I1" placeholder="숫자">
									</div>
									<div class="col">
										<label for="codeGroup_I2" class="form-label">예비2 (Int type)</label><input type="text" class="form-control" id="codeGroup_I2" name="codeGroup_I2" placeholder="숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="ccgId" class="form-label">아이디 <span class="text-danger">*</span></label>
										<input type="hidden" id="ccgIdAllowedNy" name="ccgIdAllowedNy" value="0">
										<input type="text" class="form-control" id="ccgId" name="ccgId"
											value="<c:out value="${item.ccgId}"/>"
											maxlength="20"
											placeholder="영대소문자, 숫자, 특수문자, 4~20자리"
											<c:if test="${not empty item.ccgId}">readonly</c:if>
										>
										<div class="invalid-feedback" id="ccgIdFeedback"></div>
									</div>
									<div class="col">
										<label for="codeGroup_I2" class="form-label">비번</label><input type="text" class="form-control" id="pw" name="pw" placeholder="비번">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
								  		<label for="codeGroup_I2" class="form-label">주소(한국전용)</label>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<div class="input-group">
										  <input type="text" class="form-control" placeholder="우편번호" id="sample6_postcode" name="sample6_postcode" aria-label="Recipient's username with two button addons">
										  <button class="btn btn-outline-secondary" type="button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
										  <button class="btn btn-outline-secondary" id="btnAdrClear" name="btnAdrClear" type="button">취소</button>
										</div>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
								  		<input type="text" class="form-control" id="sample6_address" name="sample6_address" placeholder="주소">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
								  		<input type="text" class="form-control" id="sample6_detailAddress" name="sample6_detailAddress" placeholder="상세주소" required>
								  		 <div class="invalid-feedback">
									        상세주소를 입력해주세요.
									      </div>
									</div>
									<div class="col">
								  		<input type="text" class="form-control" id="sample6_extraAddress" name="sample6_extraAddress" placeholder="참고항목">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
								  		<input type="text" class="form-control" id="latitude" name="latitude" placeholder="위도" required>
									</div>
									<div class="col">
								  		<input type="text" class="form-control" id="longitude" name="longitude" placeholder="경도">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-6">
										<label for="img" class="form-label">이미지 업로드</label><input type="text" class="form-control" id="img" name="img">
									</div>
								</div>
								<!-- <div class="row mt-3">
									<div class="col">
								  		<p style="margin-top:-12px">
								    		<em class="link">
										        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
										            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
										        </a>
								    		</em>
										</p>
										<div id="map" style="width:100%;height:350px;"></div>
									</div>
								</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<div class="row mt-3">
			<div class="col-md-2 offset-3">
				<button class="btn" type="button" name="btnList" id="btnList" style="background-color: gray">
					<i class="fas fa-thin fa-list-ul"></i>
				</button>
			</div>
			<div class="col-md-6 offset-md-4" align="right">
				<button class="btn btn-danger del" type="button" name="ueleteBtn" onclick=deleteValue(); data-bs-toggle="modal" data-bs-target="#exampleModalCenter1">
					<i class="fa-solid fa-xmark"></i>
				</button>
				<div class="modal fade" id="exampleModalCenter1" tabindex="-1" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalCenterTitle">삭제하시겠습니까?</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body" align="center">
								<i class="fas fa-light fa-triangle-exclamation me-2" style="color: red;"></i> 그룹 리스트에서 해당 정보가 사라집니다.
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-danger" id="ueleteBtn" name="ueleteBtn">삭제</button>
							</div>
						</div>
					</div>
				</div>
				<button class="btn btn-danger" type="button" onclick=deleteValue(); data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
					<i class="fa-solid fa-trash-can"></i>
				</button>
				<div class="modal fade" id="exampleModalCenter" tabindex="-1" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalCenterTitle">삭제하시겠습니까?</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body" align="center">
								<i class="fas fa-light fa-triangle-exclamation me-2" style="color: red;"></i> 삭제된 정보는 복구할 수가 없습니다.
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-danger" id="deleteBtn" name="deleteBtn">삭제</button>
							</div>
						</div>
					</div>
				</div>
				<button type="button" id="btnSave" name="btnSave" class="btn btn-success">
					<i class="fa-regular fa-bookmark"></i>
				</button>
				<!-- <button class="btn btn-success" type="button" href="../admin/CodeGroupModForm.html" onclick=here()><i class="fa-regular fa-bookmark"></i></button> -->
			</div>
		</div>
		<form name="formVo" id="formVo" method="post">
			<!-- *Vo.jsp s -->
			<%@include file="codeGroupVo.jsp"%>
			<!-- #-> -->
			<!-- *Vo.jsp e -->
		</form>
	</main>

	<!-- end -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd29bc43140391b0206f367d2b8c01eb&libraries=services"></script>
	<script>

		/* function test() {
			alert("test");
			
			alert(document.getElementById("name").value);
			alert(document.getElementById("name_eng").value);
			alert(document.getElementById("codeGroup_code").value);
			alert(document.getElementById("codeGroup_another").value);
			alert(document.getElementById("codeGroup_tel").options[document.getElementById("codeGroup_tel").selectedIndex].value);  //select문 띄우는 구 방식
			alert(document.querySelector("input[name= 'codeGroup_Gender']:checked").value); */

		/* if(document.getElementById("name").value == '' || document.getElementById("name").value == null) {
			alert("코드그룹 이름(한글)을 입력해주세요.");
			document.getElementById("name").value = "";
			document.getElementById("name").focus();
			return false;
		} 
		
		if(document.getElementById("codeGroup_tel").value == '' || document.getElementById("codeGroup_tel").value == null) {
			alert("통신사를 선택해주세요.");
			document.getElementById("codeGroup_tel").value = "";
			document.getElementById("codeGroup_tel").focus();
			return false;
		}  */

		// radio 선택여부 확인용 ver.jquery
		/* 	 if($('input:radio[name=codeGroup_Gender]').is(':checked') == false) {
		    	alert("성별을 선택하세요");
				} */

		// radio 선택여부 확인용 ver.Javascript
		/* 		if (document.querySelector('input[type=radio][name=codeGroup_Gender]:checked') == null) {
					alert("성별을 선택해주세요");
				} else {
					alert(document.querySelector('input[name=codeGroup_Gender]:checked').value);
				}
		 
			var result = '';
			const checks = document.getElementsByName("codeGroup_marry");
		 	if (document.querySelector('input[type=checkbox][name=codeGroup_marry]:checked') == null) {
				alert("결혼여부를 선택해주세요");
			} else {
				// 두개 선택 시 모두 출력
				for (var i = 0; i <checks.length; i++) {
					result += checks[i].value + " ";
				} 
				alert(result);
			} */

		var goUrlList = "/codeGroup/codeGroupList"; /* #-> */
		var goUrlInst = "/codeGroup/codeGroupInst"; /* #-> */
		var goUrlUpdt = "/codeGroup/codeGroupUpdt"; /* #-> */
		var goUrlUele = "/codeGroup/codeGroupUele"; /* #-> */
		var goUrlDele = "/codeGroup/codeGroupDele"; /* #-> */

		var ccgSeq = $("input:hidden[name=ccgSeq]"); /* #-> */

		var form = $("form[name=myform]");
		var formVo = $("form[name=formVo]");

		$("#btnSave").on("click", function() {
			if (ccgSeq.val() == "0" || ccgSeq.val() == "") {
				// insert
				// if (validationInst() == false) return false;
				form.attr("action", goUrlInst).submit();
			} else {
				// update
				/* keyName.val(atob(keyName.val())); */
				// if (validationUpdt() == false) return false;
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
		
		 function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		            

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("sample6_extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("sample6_extraAddress").value = '';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample6_postcode').value = data.zonecode;
		                document.getElementById("sample6_address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("sample6_detailAddress").focus();
		                
						/* lat and lng from address s */
						// 주소-좌표 변환 객체를 생성
						var geocoder = new daum.maps.services.Geocoder();
						
						// 주소로 좌표를 검색
						geocoder.addressSearch(addr, function(result, status) {
						 
							// 정상적으로 검색이 완료됐으면,
							if (status == daum.maps.services.Status.OK) {
								
								document.getElementById("longitude").value=result[0].x;
								document.getElementById("latitude").value=result[0].y;
							}
						});
						/* lat and lng from address e */
		            }
		        }).open();
		    }
		 
		 	$("#btnAdrClear").on("click", function (){
				$("#sample6_postcode").val('');
				$("#sample6_address").val('');
				$("#sample6_detailAddress").val('');
				$("#sample6_extraAddress").val('');
			});
		 	
		 	//ID ajax
		 	
			$("#ccgId").on("focusout", function(){

				var id = $("#ccgId").val();
				
				$.ajax({
					async: true 
					,cache: false
					,type: "post"
					/* ,dataType:"json" */
					,url: "/codeGroup/idCheck"
					/* ,data : $("#formLogin").serialize() */
					,data : { "ccgId" : id }
					,success: function(response) {
						if(response.rt == "success") {
							document.getElementById("ccgId").classList.add('is-valid');
		
							document.getElementById("ccgIdFeedback").classList.remove('invalid-feedback');
							document.getElementById("ccgIdFeedback").classList.add('valid-feedback');
							document.getElementById("ccgIdFeedback").innerText = "사용 가능 합니다.";
							
							document.getElementById("ccgIdAllowedNy").value = 1;
							
						} else {
							document.getElementById("ccgId").classList.add('is-invalid');
							
							document.getElementById("ccgIdFeedback").classList.remove('valid-feedback');
							document.getElementById("ccgIdFeedback").classList.add('invalid-feedback');
							document.getElementById("ccgIdFeedback").innerText = "사용 불가능 합니다";
							
							document.getElementById("ccgIdAllowedNy").value = 0;
						}
					}
					,error : function(jqXHR, textStatus, errorThrown){
						alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
					}
				});
			});
	</script>
</body>
</html>
