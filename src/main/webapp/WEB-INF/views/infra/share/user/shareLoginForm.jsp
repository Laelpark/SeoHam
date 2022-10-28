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
	<title>shareSignup</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/share/shareLoginForm.css">
	<script defer type="text/javascript" src="/resources/js/validation.js"></script>
</head>
<body>
	<!-- start -->
	<div class="navbar" style="background-color:rgb(142, 68, 173); height: 30px; width:auto;"></div>
	<div class="container">
		<form id="myform" name="myform" method="post" autocomplete="off">
			<img class="logo" src="../../resources/images/share/fullLogo_p.png" onclick="location.href='share'" style="width: 150px; height: 45px;" type="button">
			<h4 class="mt-5 text-center" id="newmem">회원가입</h4>
			<!-- *Vo.jsp s -->
			<%-- <%@include file="memberVo.jsp"%> --%>
			<!-- *Vo.jsp e -->
			
			<div class="row">
              	<div class="col-8 offset-2">
                    <div class="input-control">
                        <label for="id">Id<span style="color: red;">*</span></label>
                        <input type="hidden" id="idAllowedNy" name="idAllowedNy" value="0">
                        <input id="id" name="id" type="text" value="<c:out value="${item.id }"/>" autocomplete="off"> 
                        <div class="msg" id="id_msg" name="id_msg" style="display: none;"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-8 offset-2">
                    <div class="input-control">
                        <label for="name">Username<span style="color: red;">*</span></label>
                        <input id="name" name="name" type="text" onfocusout="validationUpdt()" autocomplete="off"> 
                        <div class="msg" id="name_msg" name="name_msg" style="display: none;"></div>
                    </div>
                </div>
            </div>                
            <div class="row">
                <div class="col-8 offset-2">
                    <div class="input-control">
                        <label for="email">Email<span style="color: red;">*</span></label>
                        <input id="email" name="email" type="text" onfocusout="validationUpdt()" autocomplete="off">
                        <div class="msg" id="email_msg" name="email_msg" style="display: none;"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-8 offset-2">
                    <div class="input-control">
                        <label for="pwd">Password<span style="color: red;">*</span></label>
                        <input id="pwd" name="pwd" type="password" onkeypress="validationUpdt()" onfocusout="validationUpdt()" autocomplete="off">
                        <div class="msg" id="pwd_msg" name="pwd_msg" style="display: none;"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-8 offset-2">
                    <div class="input-control">
                        <label for="pwd2">Password again<span style="color: red;">*</span></label>
                        <input id="pwd2" name="pwd2" type="password" onkeyup="validationUpdt()" onfocusout="validationUpdt()" autocomplete="off">
                        <div class="msg" id="pwd2_msg" name="pwd2_msg" style="display: none;"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-8 offset-2">
                    <div class="input-control">
                        <label for="dob">생년월일<span style="color: red;">*</span></label>
                        <input id="dob" name="dob" class="datepicker" type="text" placeholder="1900-01-01" autocomplete="off" onfocusout="validationUpdt()">
                        <div class="msg" id="dob_msg" name="dob_msg" style="display: none;"></div>
                    </div>
                </div>
            </div>			
            <div class="row">
                <div class="col-8 offset-2">
                    <div class="input-control">
                        <label for="gender">성별<span style="color: red;">*</span></label>
                        <select id="gender" name="gender" aria-label=".form-select-lg example" onfocusout="validationUpdt()">
                            <option value="" <c:if test="${empty item.gender}">selected</c:if>>선택</option>
                            <option value="5" <c:if test="${item.gender eq 5 }">selected</c:if>>남성</option>
                            <option value="6" <c:if test="${item.gender eq 6 }">selected</c:if>>여성</option>
                        </select>
                        <div class="msg" id="gender_msg" name="gender_msg" style="display: none;"></div>
                    </div>
                </div>
            </div>	
            <div class="row">
                <div class="col-2 offset-2">
                    <div class="input-control">
                        <label for="gender">통신사<span style="color: red;">*</span></label>
                        <select id="gender" name="gender" aria-label=".form-select-lg example" onfocusout="validationUpdt()">
                            <option value="" <c:if test="${empty item.gender}">selected</c:if>>선택</option>
                            <option value="5" <c:if test="${item.gender eq 5 }">selected</c:if>>남성</option>
                            <option value="6" <c:if test="${item.gender eq 6 }">selected</c:if>>여성</option>
                        </select>
                        <div class="msg" id="gender_msg" name="gender_msg" style="display: none;"></div>
                    </div>
                </div>
                <div class="col-5">
                    <div class="input-control">
                        <label for="dob">전화번호<span style="color: red;">*</span></label>
                        <input id="dob" name="dob" class="datepicker" type="text" placeholder="1900-01-01" autocomplete="off" onfocusout="validationUpdt()">
                        <div class="msg" id="dob_msg" name="dob_msg" style="display: none;"></div>
                    </div>
                </div>
                <div class="col-3 mt-3">
					<button id="btnSave" name="btnSave" type="button" class="btn btn-primary btn-lg" onclick="validation()"> <!-- data-bs-toggle="modal" data-bs-target="#exampleModalCenter" -->
						인증
					</button>
				</div>
            </div>	
            <div class="row">
				<div id="wrapper" class="col-8 offset-2">
					<button id="btnSave" name="btnSave" type="button" class="btn btn-primary btn-lg col-4 offset-4" onclick="validation()"> <!-- data-bs-toggle="modal" data-bs-target="#exampleModalCenter" -->
						가입하기
					</button>
				</div>
            </div>		
		</form>
	</div>


	<!-- end --> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	
	var goUrlLogin = "/shareLogin";
	var goUrlInst = "/MemberInst";
	
	var seq = $("input:hidden[name=seq]");

	var form = $("form[name=myform]");
	var formVo = $("form[name=formVo]");

	//ID ajax
 	
/* 	$("#id").val(); // id값이 id인 value값 가져오기
	$("#id").val("abc"); //id값이 id인 곳의 value 값으로 "abc" 넣기 */ 
	
	$("#id").on("focusout", function(){
		if ($("#id").val() == null || $("#id").val() == "" ) {
			document.getElementById("idFeedback").classList.add('invalid-feedback');
			document.getElementById("idFeedback").innerText = "아이디를 입력해주세요.";
			$("#id").focus();
		} else {
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				,url: "id_regex"
				,data : { "id" : $("#id").val() }
				,success: function(response) {
					if(response.rt == "success") {
						document.getElementById("id").classList.remove('is-invalid');
						document.getElementById("id").classList.add('is-valid');
	
						document.getElementById("idFeedback").classList.remove('invalid-feedback');
						document.getElementById("idFeedback").classList.add('valid-feedback');
						document.getElementById("idFeedback").innerText = "사용가능한 아이디입니다.";
						
						document.getElementById("idAllowedNY").value = 1;
						
					} else {
						document.getElementById("id").classList.add('is-invalid');
						
						document.getElementById("idFeedback").classList.remove('valid-feedback');
						document.getElementById("idFeedback").classList.add('invalid-feedback');
						document.getElementById("idFeedback").innerText = "사용 불가능한 아이디입니다.";
						
						$("#id").focus();
						
						document.getElementById("idAllowedNY").value = 0;
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		}
			
		});

	</script>
	<script>
	
	
		// validation.js파일
		validationUpdt = function() {
			if (!id_regex($('input[name=id]'), $('input[name=id]').val(), "아이디를 입력하세요!", $('#id_msg'))) {
		    	return false;
		    } else if(!name_regex($('input[name=name]'), $('input[name=name]').val(), "이름을 입력하세요!", $('#name_msg'))) {
		        return false;
		    } else if(!email_regex($('input[name=email]'), $('input[name=email]').val(), "이메일을 입력하세요!", $('#email_msg'))) {
		        return false;
		    } else if(!pwd_regex($('input[name=pwd]'), $('input[name=pwd]').val(), "비밀번호를 입력하세요!", $('#pwd_msg'))) {
		        return false;
		    } else if(!pwd2_regex($('input[name=pwd2]'), $('input[name=pwd2]').val(), "비밀번호를 입력하세요!", $('#pwd2_msg'))) {
		        return false;
		    } else if(!dob_regex($('input[name=dob]'), $('input[name=dob]').val(), "생년월일을 입력하세요!", $('#dob_msg'))) {
		        return false;
		    } else if(!gender_regex($('#gender'), $('#gender').val(), "성별을 선택하세요!", $('#gender_msg'))) {
		        return false;
		    } else if(!radio_regex($('#radio_operator'), $('#radio_operator').val(), "통신사를 선택하세요!", $('#radio_operator_msg'))) {
		        return false;
		    } else if(!tel_regex($('input[name=phone]'), $('input[name=phone]').val(), "전화번호를 입력하세요!", $('#phone_msg'))) {
		        return false;
		    }  else {
		        return true;
		    }
		};
	
		$("#btnSave").on("click", function() {
			if(validationUpdt() == false) {
				return false;
			}
			form.attr("action", goUrlInst).submit();
			/* alert("가입이 완료되었습니다.") */
 		});;
	 		
/*   	 	function swAlert(title, text, icon) {
			swal({
				title: title,
				text: text,
				icon: icon,
				button: "확인"
			}).then((value) => {
				if (value) {
					location.href = "/shareLogin";
				}
			});
		} 
	 		 */
	</script>
	
</body>
</html>