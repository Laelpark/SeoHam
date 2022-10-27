<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<jsp:useBean id="CodeServiceImpl" class="com.lael.infra.modules.code.CodeServiceImpl"/>  <!-- 코드에서 정보 가져오기 -->

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
	<p class="mb-3" style="background-color: rgb(142, 68, 173); height: 30px;"></p>
	<div class="container1">
		<nav class="bg-transparent">
			<div class="container">
				<a class="hidden" href="share" style="width: 150px;"> <img src="../../resources/images/share/sharenow.png" alt="" width="230" height="60" class="d-inline-block align-text-top ms-3">
				</a>
			</div>
		</nav>
		<nav class="navbar navbar-expand-lg bg-transparent">
			<div class="topBtn collapse navbar-collapse" id="navbarSupportedContent">
				<input type="hidden" class="d-flex" role="search">
				<button type="button" class="btn btn-outline-danger me-4">취소</button>
				<button type="button" class="btn btn-outline-success" id="btnGoShare" name="btnGoShare">Go Share</button>
				</input>
			</div>
		</nav>
		<form id="myform" name="myform" method="post">
			<!-- *Vo.jsp s -->
			<%@include file="shareVo.jsp"%>
			<input type="hidden" name="share_member_seq" value="<c:out value="${sessSeq}"/>" />
			<!-- *Vo.jsp e -->
			<nav class="navbar navbar-expand-lg">
				<div class="a collapse navbar-collapse">
					<ul class="navbar-nav mb-2 mt-2 ms-3">
						<li class="nav-item dropdown"><img alt="" src="../../resources/images/share/user.png" style="width: 60px; height: 40px; border-radius: 100px; cursor: pointer;"></li>
						<li>
							<select class="form-select col ms-3 me-3" style="width: 180px; height: 50px;" id="food_div" name="food_div" required>
								<option value="" <c:if test="${empty item.food_div }">selected</c:if>>카테고리</option>
								<c:set var="listCodeFood" value="${CodeServiceImpl.selectListCachedCode('4') }" />
								<c:forEach items="${listCodeFood}" var="listFood" varStatus="statusFood">
									<option value="${item.food_div }" <c:if test="${item.food_div eq listFood.cdSeq}">selected</c:if>>
										<c:out value="${listFood.name }"/>
									</option>
								</c:forEach>
							</select>
						</li>
						<li class="nav-item dropdown">
							<!-- <input type="hidden" class="d-flex" for="title"/>  -->
							<input class="form-control me-2 text-center" id="title" name="title" type="text" style="width: 480px; height: 50px;" placeholder="타이틀을 입력하세요." value='<c:out value="${item.title}"/>'/>
						</li>
						<li>
							<select class="form-select col ms-3 me-3" style="width: 180px; height: 50px;" id="people_num" name="people_num" required>
								<option value="" <c:if test="${empty item.people_num}">selected</c:if>>인원</option>
								<c:set var="listCodeNum" value="${CodeServiceImpl.selectListCachedCode('5') }" />
								<c:forEach items="${listCodeNum}" var="listNum" varStatus="statusNum">
									<option value="${item.people_num }" <c:if test="${item.people_num eq listNum.cdSeq}">selected</c:if>><c:out value="${listNum.name }"/></option>
								</c:forEach>
							</select>
						</li>
					</ul>
				</div>
			</nav>
			<nav class="navbar navbar-expand-lg">
				<div class="a collapse navbar-collapse" style="height: 300px;">
					<div class="b me-3">
						<div class="filebox">
							<img src="" id="img" style="width: 300px;" id="img"> 
							<input type="file" id="chooseImg" name="chooseImg" accept="image/*" onchange="loadFile(this)" multiple> 
							<label for="chooseImg" id="imgText"> 📷 사진 업로드하기</label>
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
							<nav class="d navbar col-12 mt-4" style="background-color: rgba(233, 231, 58, 0.66);">
								<div class="row">
									<div class="col-4">
										<p id="date">거래 장소</p>
									</div>
									<div class="col-8" for="date">
										<input type="text" style="width: 850px; margin-left: auto;" id="place" name="place" value="<c:out value="${item.place}"/>">
									</div>
								</div>
							</nav>
							<nav class="d navbar col-12 mt-4" style="background-color: rgba(233, 231, 58, 0.66);">
								<div class="row">
									<div class="col-4">
										<p id="date">거래 시간</p>
									</div>
									<div class="col-8" for="time">
										<input type="text" style="width: 850px; margin-left: auto;" id="time" name="time" value="<c:out value="${item.time}"/>">
									</div>
								</div>
							</nav>
							<nav class="d navbar col-12 mt-4" style="background-color: rgba(233, 231, 58, 0.66);">
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
			<br>
		</form>
	</div>


	<!-- end -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script>
	
	// 이미지 미리보기
	
	 const reader = new FileReader();

    reader.onload = (readerEvent) => {
        document.querySelector("#img").setAttribute("src", readerEvent.target.result);
    };

    document.querySelector("#chooseImg").addEventListener("change", (changeEvent) => {

        const imgFile = changeEvent.target.files[0];
        reader.readAsDataURL(imgFile);
    })

	var goUrlInst = "/shareInst";
	var goUrlUpdt = "/shareUpdt";
	var goUrlDele = "/shareDele";
	
	var seq = $("input:hidden[name=seq]");
	var form = $("#myform");
	
	$("#btnGoShare").on("click", function() {
		alert("쉐어되었습니다!");
	}
	
	</script>
	<script>
     // 파일 업로드 s

	upload = function(objName, seq, allowedMaxTotalFileNumber, allowedExtdiv, allowedEachFileSize, allowedTotalFileSize, uiType) {
	//	objName 과 seq 는 jsp 내에서 유일 하여야 함.
	//	memberProfileImage: 1
	//	memberImage: 2
	//	memberFile : 3
		
		var totalFileSize = 0;
		var obj = $("#" + objName +"")[0].files;	
		var fileCount = obj.length;
		
		const MAX_EACH_FILE_SIZE = 5 * 1024 * 1024;		//	5M
		const MAX_TOTAL_FILE_SIZE = 25 * 1024 * 1024;	//	25M
		const MAX_TOTAL_FILE_NUMBER = 5;
		
		allowedMaxTotalFileNumber = allowedMaxTotalFileNumber == 0 ? MAX_TOTAL_FILE_NUMBER : allowedMaxTotalFileNumber;
		allowedEachFileSize = allowedEachFileSize == 0 ? MAX_EACH_FILE_SIZE : allowedEachFileSize;
		allowedTotalFileSize = allowedTotalFileSize == 0 ? MAX_TOTAL_FILE_SIZE : allowedTotalFileSize;
		
		if(checkUploadedToalFileNumber(obj, allowedMaxTotalFileNumber, fileCount) == false) { return false; }
		alert("된다")
		
		 for (var i = 0 ; i < fileCount ; i++) {
			if(checkUploadedExt($("#" + objName +"")[0].files[i].name, seq, allowedExtdiv) == false) { return false; }
			if(checkUploadedEachFileSize($("#" + objName +"")[0].files[i], seq, allowedEachFileSize) == false) { return false; }
			totalFileSize += $("#" + objName +"")[0].files[i].size;
			
			 alert("확인 : " + totalFileSize)
		}
		
		 if(checkUploadedTotalFileSize(seq, totalFileSize, allowedTotalFileSize) == false) { return false; }
	}
	
		 if (uiType == 1) {
					
			$("#ulFile" + seq).children().remove();
			
			for (var i = 0 ; i < fileCount ; i++) {
				addUploadLi(seq, i, $("#" + objName +"")[0].files[i].name);
			}
 		
			for (var i = 0 ; i < fileCount ; i++) {
				
	 			var divImage = "";
	 			divImage += '<div style="display: inline-block; height: 95px;">';
				divImage += '	<img id="aaa'+i+'" src="" class="rounded" width= "85px" height="85px">';
				divImage += '	<div style="position: relative; top:-85px; left:5px"><span style="color: red;">X</span></div>';
				divImage += '</div> ';
				
				$("#ifmmUploadedImage1View").append(divImage);
				
				var fileReader = new FileReader();
				 fileReader.readAsDataURL($("#" + objName +"")[0].files[i]);
				alert($("#" + objName +"")[0].files[i]);
				 fileReader.onload = function () {
				 alert($("#aaa"+i+""));
				 
				 if(i == 0) {
					 $("#aaa0").attr("src", fileReader.result);
				 } else if (i == 1) {
					 $("#aaa0").attr("src", fileReader.result);	
				 } else {
					 
				 }
				 }
			}			
 			
		} else if(uiType == 2) {
			$("#ulFile" + seq).children().remove();
			
			for (var i = 0 ; i < fileCount ; i++) {
				addUploadLi(seq, i, $("#" + objName +"")[0].files[i].name);
			}
		} else if (uiType == 3) {
			var fileReader = new FileReader();
			 fileReader.readAsDataURL($("#" + objName +"")[0].files[0]);
			
			 fileReader.onload = function () {
				 $("#imgProfile").attr("src", fileReader.result);	
			 }		
		} else {
			return false;
		}
		return false;
	} 
	
addUploadLi = function (seq, index, name){
		
		var ul_list = $("#ulFile0");
		
		li = '<li id="li_'+seq+'_'+index+'" class="list-group-item d-flex justify-content-between align-items-center">';
		li = li + name;
		li = li + '<span class="badge bg-danger rounded-pill" onClick="delLi('+ seq +','+ index +')"><i class="fa-solid fa-x" style="cursor: pointer;"></i></span>';
		li = li + '</li>';
		
		$("#ulFile"+seq).append(li);
	}
	
	
	delLi = function(seq, index) {
		$("#li_"+seq+"_"+index).remove();
	}
	
	 // 파일 업로드 e 
	
	</script>
</body>
</html>
