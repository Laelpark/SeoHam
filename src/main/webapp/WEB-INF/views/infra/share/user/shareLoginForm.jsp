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
			<img class="logo" src="../../resources/images/share/fullLogo_p.png" onclick="location.href='share'" style="width: 200px; height: 65px;" type="button">
			<p class="mb-3 text-center" id="newmem">Welcome to Share Member!</p>
			<!-- *Vo.jsp s -->
			<%-- <%@include file="memberVo.jsp"%> --%>
			<!-- *Vo.jsp e -->
			
			<div class="row">
              	<div class="col-8 offset-2">
                    <div class="input-control">
                        <label for="id">아이디<span style="color: red;"> *</span></label>
                        <input id="id" name="id" type="text" value="<c:out value="${item.id }"/>" autocomplete="off"> 
                        <input type="hidden" id="idAllowedNy" name="idAllowedNy" value="0" onkeypress="validationUpdt()">
                        <div class="msg" id="id_msg" name="id_msg" style="display: none;"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-8 offset-2">
                    <div class="input-control">
                        <label for="pwd">비밀번호<span style="color: red;"> *</span></label>
                        <input id="pw" name="pw" type="password" onkeypress="validationUpdt()" onfocusout="validationUpdt()" autocomplete="off">
                        <div class="msg" id="pw_msg" name="pw_msg" style="display: none;"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-8 offset-2">
                    <div class="input-control">
                        <label for="pw2">비밀번호 확인<span style="color: red;"> *</span></label>
                        <input id="pw2" name="pw2" type="password" onkeyup="validationUpdt()" onfocusout="validationUpdt()" autocomplete="off">
                        <div class="msg" id="pw2_msg" name="pw2_msg" style="display: none;"></div>
                    </div>
                </div>
            </div>
            <div class="row">
               <div class="col-8 offset-2">
                   <div class="input-control">
                       <label for="name">이름<span style="color: red;"> *</span></label>
                       <input id="name" name="name" type="text" onfocusout="validationUpdt()" autocomplete="off"> 
                       <div class="msg" id="name_msg" name="name_msg" style="display: none;"></div>
                   </div>
                </div>
            </div>    
             <div class="row">
                <div class="col-8 offset-2">
                    <div class="input-control">
                        <label for="email">이메일</label>
                        <input id="email" name="email" type="text" onfocusout="validationUpdt()" autocomplete="off" placeholder=" example) share@도메인">
                        <div class="msg" id="email_msg" name="email_msg" style="display: none;"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-8 offset-2">
                    <div class="input-control">
                        <label for="dob">생년월일</label>
                        <input id="dob" name="dob" class="datepicker" type="text" placeholder="특순문자(-)없이 8자리 숫자입력" autocomplete="off" onfocusout="validationUpdt()">
                        <div class="msg" id="dob_msg" name="dob_msg" style="display: none;"></div>
                    </div>
                </div>
            </div>			
            <div class="row">
                <div class="col-8 offset-2">
                    <div class="input-control">
                        <label for="gender">성별</label>
                        <select id="gender" name="gender" aria-label=".form-select-lg example" onfocusout="validationUpdt()">
                            <option value="" <c:if test="${empty item.gender}">selected</c:if>>선택</option>
                            <option value="1" <c:if test="${item.gender eq 5 }">selected</c:if>>남성</option>
                            <option value="2" <c:if test="${item.gender eq 6 }">selected</c:if>>여성</option>
                            <option value="3" <c:if test="${item.gender eq 6 }">selected</c:if>>선택안함</option>
                        </select>
                        <div class="msg" id="gender_msg" name="gender_msg" style="display: none;"></div>
                    </div>
                </div>
            </div>	
            <div class="row">
                <div class="col-2 offset-2">
                    <div class="input-control">
                        <label for="phone_div"><span style="color: red;">* </span>통신사</label>
                        <select id="phone_div" name="phone_div" aria-label=".form-select-lg example" onfocusout="validationUpdt()">
                            <option value="" <c:if test="${empty item.gender}">selected</c:if>>선택</option>
                            <option value="8" <c:if test="${item.gender eq 5 }">selected</c:if>>KT</option>
                            <option value="9" <c:if test="${item.gender eq 6 }">selected</c:if>>SKT</option>
                            <option value="10" <c:if test="${item.gender eq 6 }">selected</c:if>>LGT</option>
                        </select>
                        <div class="msg" id="phone_div_msg" name="phone_div_msg" style="display: none;"></div>
                    </div>
                </div>
                <div class="col-5">
                    <div class="input-control">
                        <label for="phone">전화번호</label>
                        <input id="phone" name="phone" type="text" placeholder="특수문자(-)없이 숫자만 입력" autocomplete="off" onfocusout="validationUpdt()">
                        <div class="phone" id="phone_msg" name="phone_msg" style="display: none;"></div>
                    </div>
                </div>
                <div class="col-3 mt-3">
					<button id="btnPhone" name="btnPhone" type="button" class="btn btn-primary btn-lg"> <!-- data-bs-toggle="modal" data-bs-target="#exampleModalCenter" -->
						인증
					</button>
				</div>
            </div>	
            <div class="row">
				<div id="wrapper" class="col-8 offset-2">
					<button id="btnSave" name="btnSave" type="button" class="btn btn-lg col-4 offset-4" onclick="validation()"> <!-- data-bs-toggle="modal" data-bs-target="#exampleModalCenter" -->
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
	
	 errorValidation = function(input, msg, message) {
     		$(msg).parent().removeClass('success');						
		 	$(msg).parent().addClass('error');
	        $(msg).text(message);
	        $(msg).show();
	        $(input).val('');
	        $(input).focus();
		}
     
     successValidation = function(input, msg, message) {
     	$(msg).parent().removeClass('error');
		 	$(msg).parent().addClass('success');
	        $(msg).text(message);
	        $(msg).show();
		}
     
 	$("#id").on("focusout", function(){
 		var id = $("#id").val();
 		
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				/* ,dataType:"json" */
				,url: "idCheck"
				/* ,data : $("#formLogin").serialize() */
				,data : { "id" : id }
				,success: function(response) {
					if(response.rt == "success") {
						if (id.length > 0) {
 						successValidation('#id', '#id_msg', "사용가능한 아이디 입니다.");
 						document.getElementById("idAllowedNy").value = 1;
						} else {
							 errorValidation('#id', '#id_msg', "아이디를 입력해주세요!!!");
							 document.getElementById("idAllowedNy").value = 0;
						}
					} else {
						errorValidation('#id', '#id_msg', "중복된 아이디입니다.");
						document.getElementById("idAllowedNy").value = 0;
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
 		
 	});
	
	
	 /* $("#id").on("focusout", function(){
		if ($("#id").val() == null || $("#id").val() == "" ) {
			document.getElementById("idFeedback").classList.add('invalid-feedback');
			document.getElementById("idFeedback").innerText = "아이디를 입력해주세요.";
			$("#id").focus();
		} else {
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				,url: "idCheck"
				,data : { "id" : $("#id").val() }
				,success: function(response) {
					if(response.rt == "success") {
						document.getElementById("id").classList.remove('is-invalid');
						document.getElementById("id").classList.add('is-valid');
	
						document.getElementById("idFeedback").classList.remove('invalid-feedback');
						document.getElementById("idFeedback").classList.add('valid-feedback');
						document.getElementById("idFeedback").innerText = "사용가능한 아이디입니다.";
						
						document.getElementById("idAllowedNy").value = 1;
						
					} else {
						document.getElementById("id").classList.add('is-invalid');
						
						document.getElementById("idFeedback").classList.remove('valid-feedback');
						document.getElementById("idFeedback").classList.add('invalid-feedback');
						document.getElementById("idFeedback").innerText = "사용 불가능한 아이디입니다.";
						
						document.getElementById("idAllowedNy").value = 0;
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		}
			
		}); */ 

	</script>
	<script>
	
	
		// validation.js파일
		 validationUpdt = function() {
            if (!id_regex($('input[name=id]'), $('input[name=id]').val(), "아이디를 입력해주세요.", $('#id_msg'))) {
            	return false;
            } else if(!pwd_regex($('input[name=pw]'), $('input[name=pw]').val(), "비밀번호를 입력해주세요.", $('#pw_msg'))) {
                return false;
            } else if(!pw2_regex($('input[name=pw2]'), $('input[name=pw2]').val(), "비밀번호를 확인해주세요.", $('#pw2_msg'))) {
                return false;
            } else if(!name_regex($('input[name=name]'), $('input[name=name]').val(), "이름을 입력해주세요!", $('#name_msg'))) {
                return false;
            } else if(!radio_regex($('#phone_div'), $('#phone_div').val(), "통신사를 선택헤주세요!", $('#phone_div_msg'))) {
                return false;
            } else if(!tel_regex($('input[name=phone]'), $('input[name=phone]').val(), "전화번호를 입력해주세요!", $('#phone_msg'))) {
                return false;
            } else {
                return true;
            }
        };
	
		$("#btnSave").on("click", function() {
			if(validationUpdt() == false) {
				return false;
			}
			form.attr("action", goUrlInst).submit();
				alert("가입이 완료되었습니다.")
 		});;
	 		
 	 	function swAlert(title, text, icon) {
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
	</script>
	
</body>
</html>