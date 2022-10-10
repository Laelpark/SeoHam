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
	<title>adminMain</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/css/share/chartCss.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body style="background-color: rgb(224, 224, 224);">
	<!-- start -->
    <div class="container">
        <main>
            <div>
                <h4>통계</h4>
            </div>
            <div class="cd2">
                <div class="newmem row">
                    <p class="ms-3 col mt-4" style="font-weight: bold;">
                        Today 신규가입자 수:
                        <span class="num">nn</span>
                        명
                    </p>
                    <p class="ps-3 offset-md-3 col-5 mt-4" style="font-size: 12px; text-align: right;">
                        <i class="fa-solid fa-triangle-exclamation" style="color: red;"></i>
                        고객의 유입량이 어제보다 
                        <span class="persent">13%</span>
                        감소하였습니다.
                    </p>
                    <figure class="highcharts-figure">
                        <div id="container"></div>
                    </figure>
                </div>
                <div class="newmem2 mt-4">
                    <div class="row">
                       <p class="ms-4 col mt-3" style="font-weight: bold;">
                            Today NewMember :
                            <span id="num" class="num">${vo.totalRows}</span>
                            명
                        </p>
                        <p class="offset-md-3 col-5 m-3" style="font-size: 12px; text-align: right;">
                            더보기
                            <i class="fa-solid fa-angle-right"></i>
                        </p> 
                    </div>
                    <div class="ms-3 scroll" style="height: 200px; text-align: left;">
                        <br>
						<c:choose>
							<c:when test="${fn:length(list) eq 0}">
								<p class="text-center">There is no data!</p>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="list" varStatus="status">
			                        <p id="id" name="id">${list.id}</p>
								</c:forEach>
							</c:otherwise>
						</c:choose>	
                    </div>
                </div>
				<c:set var="listCodeNum" value="${shareCodeGroupServiceImpl.selectListCachedCode('5') }" />
				<c:set var="listCodeTime" value="${shareCodeGroupServiceImpl.selectListCachedCode('6') }" />
                <c:choose>
					<c:when test="${fn:length(list) eq 0}">
                        <td class="text-center" colspan="8">There is no data!</td>
					</c:when>
                	<div class="newmem2 mt-4" style="height: 280px;">
                    	<div class="row">
	                       <p class="ms-4 col mt-3" style="font-weight: bold;">
	                           Today New Share Pot:
	                           <span class="num">${vo.totalRows}</span>
	                           개
	                       </p>
	                       <p class="offset-md-3 col-5 m-3" style="font-size: 12px; text-align: right;">
	                           더보기
	                           <i class="fa-solid fa-angle-right"></i>
	                       </p>
                    	</div>
	                    <div class="scroll" style="height: 200px; text-align: left;">
	                        <div class="sharepot">
                                <c:otherwise>		
                                    <c:forEach items="${list}" var="list" varStatus="status">
                                        <div class="row">
                                            <div class="col-3" id="title" name="title">
                                            	
                                           </div>
                                            <div class="col-1">|</div>
                                            <div class="col-2" id="people_num" name="people_num">
                         					  ${list.people_num }
												<c:forEach items="${listCodeNum}" var="listNum" varStatus="statusNum">
													<c:if test="${list.people_num eq listNum.cdSeq}"><c:out value="${listNum.name}"/></c:if>
												</c:forEach>
											</div>
                                            <div class="col-1">|</div>
                                            <div class="col-2" id="time" name="time"></div>
                                            <div class="col-1">|</div>
                                            <div class="col-2" id="price" name="price"></div>
                                        </div>
                                    </c:forEach>
                                </c:otherwise>
                            </div>
                        </div>
                    </div>
                </c:choose>
                <div class="newmem2 mt-4" style="height: 280px;">
                    <div class="row">
                        <p class="ms-4 col mt-3" style="font-weight: bold;">
                            Today New Share
                            <span class="hot">Hot</span>
                        </p>
                        <p class="offset-md-3 col-5 m-3" style="font-size: 12px; text-align: right;">
                            더보기
                            <i class="fa-solid fa-angle-right"></i>
                        </p>
                    </div>
                    <div class="scroll" style="height: 200px; text-align: left;">
                        <div class="sharepot">
                            <div class="row">
                                <div class="col-3">피자나라 콤비네이션</div>
                                <div class="col-1">|</div>
                                <div class="col-2">1/2인</div>
                                <div class="col-1">|</div>
                                <div class="col-2">14:00</div>
                                <div class="col-1">|</div>
                                <div class="col-2">15,000원</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <div id="sidebar">
            <div class="side_img">
                <img id="home" src="/resources/images/share/fullLogo_w.png">
            </div>
            <div class="side_info">
                <hr style="color: white;">
                <ul>
                    <li>
                        <i class="fa-solid fa-sliders" style="color: rgb(233, 231, 58);" onclick="location.href='../admin/adminChart.html'">&nbsp 통계</i>
                    </li>
                    <li>
                        <i class="fas fa-light fa-user" onclick="location.href='../admin/adminUser.html'">&nbsp 사용자 관리</i>
                    </li>
                    <li>
                        <i class="fas fa-regular fa-ban">&nbsp 신고자 관리</i>
                    </li>
                    <li>
                        <i class="fas fa-regular fa-clipboard-list">&nbsp 쉐어리스트</i>
                    </li>
                </ul>
            </div>
        </div>
        <footer>
            <div class="footer">
                <div class="footer_inner">
                    <!--[주]고객센터,제휴문의,서비스안내-->
                    <ul class="footer_link" id="footer_link">
                        <li><a target="_blank" class="footer_item"
                                id="fot.agreement"><span class="text">이용약관</span></a></li>
                        <li><a target="_blank" class="footer_item"
                                id="fot.privacy"><span class="text"><strong>개인정보처리방침</strong></span></a></li>
                        <li><a target="_blank" class="footer_item"
                                id="fot.disclaimer"><span class="text">책임의 한계와 법적고지</span></a></li>
                        <li><a target="_blank" class="footer_item"
                      		 	id="fot.help"><span class="text">회원정보 고객센터</span></a></li>
                    </ul>
                    <div class="footer_copy">
                        <a id="fot.naver">
                            <img src="/resources/images/share/logo_p-removebg-preview.png" alt="logo" style="width: 45px;">
                        </a>
                        <span class="text">Copyright</span>
                        <span class="corp">© SHARE Corp.</span>
                        <span class="text">All Rights Reserved.</span>
                    </div>
                </div>
            </div>
        </footer>
    </div>

	<!-- end --> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	<script type="text/javascript">
		Highcharts.chart('container', {
    chart: {
        type: 'spline'
    },
    xAxis: {
        categories: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일','토요일'],
        accessibility: {
            description: 'Weekend'
        }
    },
    yAxis: {
        title: {
            text: ''
        },
        labels: {
            formatter: function () {
                return this.value + '명';
            }
        }
    },
    tooltip: {
        crosshairs: true,
        shared: true
    },
    plotOptions: {
        spline: {
            marker: {
                radius: 4,
                lineColor: '#666666',
                lineWidth: 1
            }
        }
    },
    series: [{
        name: '오늘',
        marker: {
            symbol: 'square'
        },
        data: [{
            y: 26.4,
            accessibility: {
                description: 'Sunny symbol, this is the warmest point in the chart.'
            }
        }, 360, 355, 258, 220, 210, 158]

    }, {
        name: '어제',
        marker: {
            symbol: 'diamond'
        },
        data: [{
            y: 1.5,
            accessibility: {
                description: 'Snowy symbol, this is the coldest point in the chart.'
            }
        }, 210, 320, 120, 110, 160, 280]
        }]
    });
		
		var numItems = $('.num').length
	</script>
</body>
</html>
