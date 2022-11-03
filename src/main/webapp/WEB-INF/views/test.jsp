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
publicCorona1List

<br>aaa : <c:out value="${resultCode }"/>
<br>aaa : <c:out value="${resultMsg }"/>

<br>aaa : <c:out value="${pageNo }"/>
<br>aaa : <c:out value="${totalCount }"/>
<br>aaa : <c:out value="${numOfRows }"/>

<br>aaa : <c:out value="${items }"/>
<br>aaa : <c:out value="${fn:length(items) }"/>

<c:forEach items="${items}" var="item" varStatus="status">
	<c:out value="${item.YYYY }"/>
	<br><c:out value="${item.MM }"/>	
	<br><c:out value="${item.KIT_PROD_QTY }"/>	
	<br><c:out value="${item.KIT_EXPRT_QTY }"/>	
	<br><c:out value="${item.KIT_STOCK_QTY }"/>	
</c:forEach>

</body>
</html>