<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>shareMain</title>
    <link rel="stylesheet" href="/resources/css/main/main.css">
    <link href="/resources/images/share/smLogo.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
    <div class="container">
        <!-- main 영역 -->
        <main class="card">
            <div id="img">
                <img src="/resources/images/share/fullLogo_w.png" alt="logo">
            </div>
            <div id="content">
                <a id="user" href="/share">
                    <div class="card">
                        <div class="user_img me-3">
                            <img class="card_img" src="https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80" alt="user_page">
                        </div>
                        <div class="user_text">
                            User Page
                        </div>
                    </div>
                </a>
                <a id="admin" href="/adminLogin">
                    <div class="card">
                        <div class="admin_img">
                            <img class="card_img" src="https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" alt="admin_page">
                        </div>
                        <div class="admin_text">
                            admin Page
                        </div>
                    </div>
                </a>
            </div>
        </main>

        <footer>
            <div class="footer">
                <div class="footer_inner">
                    <!--[주]고객센터,제휴문의,서비스안내-->
                    <ul class="footer_link" id="footer_link">
                        <li><a target="_blank" class="footer_item" href="http://www.naver.com/rules/service.html"
                                id="fot.agreement"><span class="text">이용약관</span></a></li>
                        <li><a target="_blank" class="footer_item" href="http://www.naver.com/rules/privacy.html"
                                id="fot.privacy"><span class="text"><strong>개인정보처리방침</strong></span></a></li>
                        <li><a target="_blank" class="footer_item" href="http://www.naver.com/rules/disclaimer.html"
                                id="fot.disclaimer"><span class="text">책임의 한계와 법적고지</span></a></li>
                        <li><a target="_blank" class="footer_item"
                                href="https://help.naver.com/support/service/main.nhn?serviceNo=532" id="fot.help"><span
                                    class="text">회원정보 고객센터</span></a></li>
                    </ul>
                    <div class="footer_copy">
                        <span class="text">Copyright</span>
                        <span class="corp">© SHARE Corp.</span>
                        <span class="text">All Rights Reserved.</span>
                    </div>
                </div>
            </div>
        </footer>
    </div>

    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
</body>

</html>