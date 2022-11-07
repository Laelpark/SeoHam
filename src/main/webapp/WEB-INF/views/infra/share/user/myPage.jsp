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
	<title>MyPage</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/resources/css/share/userprofile.css">

</head>
<body>
	<form id="myForm" name="myForm" method="post">
		<!-- *Vo.jsp s -->
		<%@include file="shareVo.jsp"%>
		<!-- *Vo.jsp e -->
		<div class="navbar" style="background-color:rgb(142, 68, 173); height: 30px; width: 100%;"></div>
		<div class="sideEmty">
			<div class="header row">
				<a class="navbar-brand col" href="share">
					<img src="../../resources/images/share/fullLogo_p.png" id="logoimg">
					<button id="btnLogout" type="button" class="btn" style="height: 30px; text-align: center;">
					<img src="../../resources/images/share/logout.png" id="Imglogout">
					Logout</button>
				</a>
				<ul class="nav nav-tabs mt-5">
					<li class="nav-item">
			  			<a class="nav-link active" aria-current="page" onclick="goMyPage()">My Page</a>
					</li>
					<li class="nav-item">
				  		<a class="nav-link" onclick="goList()">My Share List</a>
					</li>
					<li class="nav-item">
			 	 		<a class="nav-link" onclick="goInfo()">Personal Information</a>
					</li>
					<li class="nav-item">
			 	 		<a class="nav-link" onclick="goSecu()">MY Security</a>
					</li>
				</ul>
			</div>
			<div class="content">
				<div class="row">
			        <div class="first col-3">프로필 수정</div>
		         	<div class="col" style="margin-left: 90px; height: 300px; margin-top: 30px;">
							<div class="filebox">
								<img src="" id="img" width="295px;" height="230px;"> 
							</div>
							<div class="row mt-5">
								<button type="button" class="btn btn-outline-secondary ms-5 me-4" style="border-color: lightgray;">확인</button>
								<button type="button" class="btn btn-outline-secondary" style="border-color: lightgray;">취소</button>
							</div>
				    </div>
		        </div>
		        <div class="row">
			        <div class="second col-3">주 share 장소</div>
			         <input type="text" id="share_place" name="share_place" class="form-control col" placeholder="주 거래 장소를 입력해주세요." value="<c:out value="${item.share_place}"/>" disabled="disabled">
		        </div>
		        <div class="row">
			        <div class="third col-3">닉네임 변경</div>
			        <input type="text" id="nick_nm" name="nick_nm" class="form-control col" placeholder="변경할 닉네임을 입력해주세요." value="<c:out value="${item.nick_nm}"/>" disabled="disabled">
		        </div>
		        <br>
		        <br>
			    <br><div class='col-3' id="btn">
			        <button type="button" class="btn btn-outline-primary mb-2 ms-3" id="btnS">적용</button>
					<button type="button" class="btn btn-outline-danger mb-2 ms-3" id="btnC">취소</button>
			    </div>
		    </div>
		</div>
	</form>
</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
	
		const reader = new FileReader();
	
	    reader.onload = (readerEvent) => {
	        document.querySelector("#img").setAttribute("src", readerEvent.target.result);
	    };
	
	    document.querySelector("#chooseImg").addEventListener("change", (changeEvent) => {
	
	        const imgFile = changeEvent.target.files[0];
	        reader.readAsDataURL(imgFile);
	    })
	    
	    var goUrlMyList = "/myList";
		var goUrlMyPage = "/myPage";
		var goUrlMyInfo = "/personalInformation";
		var goUrlMySecu = "/mySecurity";
		var goUrlInst = "/shareMyPageInst";
		var goUrlUpdt = "/shareMyPageUpdt";
		var goUrlUpdt = "/shareMyPageUpdt";
		
		var seq = $("input:hidden[name=seq]");
		
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
	
		// 업데이트 정보 넘기기s
		
		$("#btnS").on("click", function() {
			if (seq.val() == "0" || seq.val() == "") {
				// insert
				form.attr("action", goUrlInst).submit();
			} else {
				// update
				form.attr("action", goUrlUpdt).submit();
				alert("정보변경 완료!")
			}
		});
		
		$("#btnC").on("click", function() {
			form.attr("action", goUrlMypage).submit();
		})
		
		//로그아웃 버튼
		
		$("#btnLogout").on("click", function(){
		$.ajax({
			async: true 
			,cache: false
			,type: "post"
			,url: "logoutProc"
			,data: {}
			,success: function(response) {
				if(response.rt == "success") {
					location.href = "/share";
				} else {
					// by pass
				}
			}
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
	});
		
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
