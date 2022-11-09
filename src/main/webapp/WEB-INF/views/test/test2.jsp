<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://kit.fontawesome.com/15c84217dd.js" crossorigin="anonymous"></script>
	<link href="/resources/common/bootstrap/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/xdmin/css/bootstrap/sidebars.css" rel="stylesheet">
    <link href="/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.css" rel="stylesheet">    
    <link rel="stylesheet" href="/resources/xdmin/css/commonXdmin.css" />

</head>
<body>
regularRestaurant

<br>bbb : <c:out value="${resultCode }"/>
<br>bbb : <c:out value="${resultMsg }"/>
<br>bbb : <c:out value="${totalCount }"/>
<br>bbb : <c:out value="${pageIndex }"/>
<br>bbb : <c:out value="${pageUnit }"/>

<br>bbb : <c:out value="${items }"/>
<br>bbb : <c:out value="${item }"/>
<br>bbb : <c:out value="${induty }"/>
<br>bbb : <c:out value="${psnPrmisnYmd }"/>
<br>bbb : <c:out value="${mtlty }"/>
<br>bbb : <c:out value="${roadNmAddr }"/>
<br>bbb : <c:out value="${addr }"/>
<br>bbb : <c:out value="${telno }"/>

</body>
</html>