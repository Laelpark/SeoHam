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
		<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
		<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
		<input type="hidden" name="seq" value="<c:out value="${vo.seq}"/>"/>
		<input type="hidden" name="memberSeq" value="<c:out value="${sessSeq}"/>"/>
		<div class="navbar" style="background-color:rgb(142, 68, 173); height: 30px; width: 100%;"></div>
		<div class="sideEmty">
			<div class="header row">
				<a class="navbar-brand" href="share" style="width: 500px;">
					<img src="../../resources/images/share/fullLogo_p.png" id="logoimg">
					<button id="btnLogout" type="button" class="btn ms-5" style="height: 30px; text-align: center;">
						<img src="../../resources/images/share/logout.png" id="Imglogout">
						Logout
					</button>
				</a>
				<ul class="nav nav-tabs mt-5">
					<li class="nav-item">
			  			<a class="nav-link active" aria-current="page" onclick="goMyPage()">My Page</a>
					</li>
					<li class="nav-item">
				  		<a class="nav-link" onclick="goList()">My Share List</a>
					</li>
					<li class="nav-item">
			 	 		<a class="nav-link" onclick="goInfo()">Change My Information</a>
					</li>
					<li class="nav-item">
			 	 		<a class="nav-link" onclick="goSecu()">MY Security</a>
					</li>
				</ul>
			</div>
			<div style="margin: 30px 0px 0px 200px;">
				<table>
					<label for="img" class="form-label">My Profile</label>
					<td>
						<div class="mt-2 mb-2">
							<label for="img" class="form-label input-file-button">
					 			<input class="form-control form-control-sm" id="img" name="img" type="file" style="display: none;" onChange="upload('memberUploadedImg', 1, 0, 1, 0, 0, 1);">
								<img src="/resources/images/share/user.png" id="img" name="img"> 
							</label>
							<div class="addScroll">
								<ul id="ulFile1" class="list-group"></ul>
							</div>
						</div>
					</td>
				</table>
				<hr style="color: rgb(78, 78, 78); width: 800px;">
				<table>
					<td>
						<label>My Share Place</label>
						<input class="mt-2 form-control" id="share_place" name="share_place" value="<c:out value="${item.share_place}"/>" disabled="disabled">
						<div class="invalid-feedback" id="idFeedback"></div>
					</td>
				</table>
				<hr style="color: rgb(78, 78, 78); width: 800px;">
				<table>
					<td>
						<label>My Nick Name</label>
						<input class="mt-2 form-control" id="nick_nm" name="nick_nm" value="<c:out value="${item.nick_nm}"/>" disabled="disabled">
						<div class="invalid-feedback" id="nick_nmCheckFeedback"></div>
					</td>
				</table>
			</div>
		</div>
	</form>
</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
	    var goUrlMyList = "/myList";
		var goUrlMyPage = "/myPage";
		var goUrlMyInfo = "/personalInformation";
		var goUrlMySecurity = "/mySecurity";
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
	
		
		
		</script>
		<script type="text/javascript">
		
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
</body>
</html>
