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
	<title>shareLogin</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<style  type="text/css">

		#rememberId {
			position: relative;
		}

		#loginBtn {
			margin-right: 90px;
		}
   </style>
</head>
<body style="background-color: rgb(224, 224, 224);">
	<!-- start -->
	<form action="" id="login_form"  name="form">
	<input type="hidden" name="snsId"> 
	<input type="hidden" name="name"> 
		<div class="navbar" style="background-color:rgb(142, 68, 173); height: 50px;"></div>
		<div class="container-fluid">
			<div class="row pt-5">
				<a class="col-12 text-center mb-3">
					<img alt="" src="../../resources/images/share/fullLogo_p.png" onclick="location.href='share'" style="width: 280px; height: 100px; cursor: pointer;">
				</a>
				<div class="col-12 text-center mb-4 mt-4">
					<img alt="" src="../../resources/images/share/user.png"  style="width: 100px; height: 100px; border-radius: 100px;">
				</div>
				<div class="col-4 offset-4 text-center">
					<div class="input-group has-validation">
						<span class="input-group-text" id="inputGroupPrepend">
							<i class="fa-solid fa-user p-3 d-grid" style="font-size: 23px; height: 55px;"></i>
						</span>
						<input type="text" class="form-control form-group" id="id" name="id" aria-describedby="inputGroupPrepend" tabindex="1" value="zxcv">
						<div class="invalid-feedback" id="idFeedback"></div>
						<input type="hidden" id="idAllowedNy" name="idAllowedNy" value="0" onkeypress="validationUpdt()">
	                    <div class="msg" id="id_msg" name="id_msg" style="display: none;"></div>
					</div>
				</div>
				<div class="offset-4 form-chseck col-4 mt-2" id="rememberId">
					<input class="form-check-input keepLogin" type="checkbox" value="" id="saveId" name="saveId" tabindex="4">
					<label class="form-check-label keepLogin" for="saveId">
						아이디 저장
					</label>
				</div>
				<div class="col-4 offset-4 text-center">
					<div class="input-group has-validation mt-4">
						<span class="input-group-text" id="inputGroupPrepend">
							<i class="fas fa-solid fa-lock p-3 d-grid" style="font-size: 20px;  height: 55px;"></i>
						</span>
						<input type="password" id="pw" name="pw" class="form-control form-group" aria-describedby="inputGroupPrepend" tabindex="2" value="123456">
					</div>
				</div>
				<div class="col-2 text-center">
					<button type="button" id="btnLogin" name="btnLogin" class="btn" tabindex="3" style=" width: 100px; height: 70px; float: right; background-color: blueviolet; color: white;">로그인</button>
				</div>
				<div class="col-2 offset-4 form-check mb-3 mt-2">
					<input class="form-check-input" type="checkbox" id="autoLogin" name="autoLogin" tabindex="5">
					<label class="form-check-label" for="autoLogin">자동 로그인 </label>
				</div>
				<div class="container text-center mt-3">
					<div class="row">
						<div class="col-3"></div>
						<div class="a col-3 me-3" style="cursor: pointer;" id="btnSignup" name="btnSignup" onclick=" location='/shareSignup'">
							회원가입
						</div>
						<div class="a col-3" style="cursor: pointer;" onclick=" location='/shareFindLogin'">
							아이디/비밀번호 찾기
						</div>
						<div class="col-3"></div>
					</div>
				</div>
				<div class="container text-center mt-3">
					<div class="row">
						<div class="col-3"></div>
						<div class="a col-3 me-3" style="cursor: pointer;" id="btnKakao" name="btnSignup">
							<button class='btn' type="button" name="btnKakao" id="btnKakao" style="background-color: #ffcc00">
								<i class="fa-solid fa-k"></i> 카카오 로그인
							</button>
						</div>
						<div class="a col-3 btn_login_wrap">
							<button class='btn btn-success' type="button" name="naverIdLogin" id="naverIdLogin"  onclick="btnNaverLogin();">
								<i class="fa-solid fa-n"></i> 네이버 로그인
							</button>
						</div> 
						<!-- <div class="a col-3 btn_login_wrap">
							<div id="naverIdLogin" onclick="naverLogin();"></div>
                        </div> -->
						<div class="col-3"></div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- end --> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	<script>
		// 로그인
		
		/* errorValidation = function(input, msg, message) {
	        $(msg).text(message);
	        $(msg).show();
	        $(input).val('');
	        $(input).focus();
		}
		
			if ($("#id").val() == null || $("#id").val() == "" ) {
				document.getElementById("id").classList.add('is-invalid');
				document.getElementById("idFeedback").innerText = "아이디를 다시 확인해주세요.";
				$("#id").focus();
			} else {
				document.getElementById("id").classList.add('is-valid');
			} */
			
		$("#btnLogin").on("click", function(){
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				,url: "loginProc"
				,data : { "id" : $("#id").val(), "pw" : $("#pw").val()}
				,success: function(response) {
					if(response.rt == "success") {
							location.href = "/share";
						}else {
							alert("회원없음")
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		});
		
		
	</script>
	
	<script type="text/javascript">
	
	/* kakao login test s */
	
	var goUrlList = "/share";
	
	Kakao.init('bd29bc43140391b0206f367d2b8c01eb');
	console.log(Kakao.isInitialized());
	
	$("#btnKakao").on("click", function() {
		/* Kakao.Auth.authorize({
		      redirectUri: 'http://localhost:8080/member/kakaoCallback',
		    }); */
		
		Kakao.Auth.login({
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
		        	  
		        	  var accessToken = Kakao.Auth.getAccessToken();
		        	  Kakao.Auth.setAccessToken(accessToken);

		        	  var account = response.kakao_account;
  	        	  
  	        	 /*  $("form[name=form]").attr("action", "/member/kakaoLoginProc").submit(); */
  	        	 
  	        	  $.ajax({
					async: true
					,cache: false
					,type:"POST"
					,url: "/kakaoLoginProc"
					,data: {"name": account.profile.name, "snsId": "카카오로그인", "email": account.email}
					,success : function(response) {
						if (response.rt == "fail") {
							alert("아이디와 비밀번호를 다시 확인 후 시도해 주세요.");
							return false;
						} else {
							window.location.href = "/share";
						}
					},
					error : function(jqXHR, status, error) {
						alert("알 수 없는 에러 [ " + error + " ]");
					}
				});
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
	});
	
	</script>
	
	<script type="text/javascript">
	
	/* naver login test s */
		
		/* var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "b8EhDTV3tvvAE_gRRBoJ",
			callbackUrl: "http://localhost:8080/userLogin",
			isPopup: false,
			loginButton: {color: "green", type: 3, height: 70} 
		}
	); */
		
		var naverLogin  = new naver.LoginWithNaverId(
		{
			clientId: "iJCCP3K5HUMLGunSs9PZ",
			callbackUrl: "http://localhost:8080/shareLogin",
			isPopup: true,
			callbackHandle: true
		}
	);
	
		naverLogin.init();
		
		function btnNaverLogin() {
			
			naverLogin.getLoginStatus(function (status) {
				if(!status)
					naverLogin.authorize();
	            else
	                setLoginStatus();  //하늘님 메소드 실행 -> Ajax
			});
		}
		
		function setLoginStatus() {
			
				/* if (naverLogin.user.gender == 'M'){
					$("input[name=gender]").val(1);
				} else {
				$("input[name=gender]").val(2);
			} */ 
			
		$.ajax({
			async: true
			,cache: false
			,type:"POST"
			,url: "/naverLoginProc"
			,data: {"name": naverLogin.user.name, "snsId": "네이버로그인", "email": naverLogin.user.email, "phone": naverLogin.user.mobile}
			,success : function(response) {
				if (response.rt == "fail") {
					alert("아이디와 비밀번호를 다시 확인 후 시도해 주세요.");
					return false;
				} else {
					window.location.href = "/share";
				}
			},
			error : function(jqXHR, status, error) {
				alert("알 수 없는 에러 [ " + error + " ]");
			}
		});
	}
	/* naver login test e */
	
	</script>
	
</body>
</html>