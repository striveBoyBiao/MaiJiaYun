<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/Order/js/xiangqing.js">
</script> 
<script type="text/javascript">
	function page() {
		var numA = $("#pageSizes").children("li").children("a");
		var href1 = "${pageInfo.servletUri}";
		$.each(numA, function(index, element) {
			var href = href1 + "&pageSize=" + $(element).text();
			$(element).attr("href", href)
			$(element).click(function() {
				$("#currentPageSize").text($(element).text())
				
			});
		});
		var pageA = $("#pagingPages").children("ul").children("li").children(
				"a");
		/* alert("pagesA的长度" + pageA.length) */
		/* var pageA = $(pageAs).eq(2) */
		/* alert(pageA.text())
		alert("pageA长度:"+pageA.length); */
		/* alert("pageA的长度"+pageA.length) */
		$.each(pageA, function(index, element) {
			if (index == 0) {
				var href = href1 + "&pageSize=" + $("#currentPageSize").text() + "&pageNow=" + ${pageInfo.pageNow - 1};
			}
			if (index > 0 && index < pageA.length - 1) {
				var href = href1 + "&pageSize=" + $("#currentPageSize").text() + "&pageNow=" + $(element).text();
			}
			if (index == pageA.length - 1) {
				var href = href1 + "&pageSize=" + $("#currentPageSize").text() + "&pageNow=" + ${pageInfo.pageNow + 1};
			}
			$(element).attr("href", href);
		}) 
		}
	//审核反审等
	function shenHe(obj){
		code = $(obj).attr("code");
		href = "${pageInfo.servletUri}&pageSize=${pageInfo.pageSize}&pageNow=${pageInfo.pageNow}&orderCheck="+code;
		window.location.href = href;
	}
</script>
</head>
<body>
	<div class="row" style="margin: 0; -moz-user-select: none;"
		onselectstart="return false;" id="paging">
		<div style="float: right;">
			<div style="margin-right: 10px; float: left;">
				<ul class="pagination">
					<li class="dropup">
						<div class="lh30 left">共</div>
						<div class="btn-group" style="margin: 0 5px;">
							<span class="lh30 left fb red" id="totalRecords">${pageInfo.ordersNum }</span>
							<div class="lh30 left" style="margin-left: 5px;">条记录</div>

						</div>
					</li>
				</ul>
			</div>
			<div style="width: 150px; float: left;">
				<ul class="pagination">
					<li class="dropup">
						<div class="lh30 left">每页显示</div>
						<div class="btn-group" style="margin: 0 5px;">
							<button data-toggle="dropdown"
								class="btn btn-default dropdown-toggle" type="button">
								<span id="currentPageSize">${pageInfo.pageSize }</span> <span
									class="caret"></span>
							</button>
							<div class="lh30 left" style="margin-left: 5px;">个</div>
							<ul role="menu" class="dropdown-menu" id="pageSizes">
								<li><a href="/servlet/order/shenHe">10</a></li>
								<li><a href="1">20</a></li>
								<li><a href="2">50</a></li>
								<li><a href="3">100</a></li>
								<li><a href="4">200</a></li>
								<!-- <li><a href="javascript:void(0);">20</a></li>
                            <li><a href="javascript:void(0);">50</a></li> -->
							</ul>
						</div>
					</li>
				</ul>
			</div>
			<div style="width: 350px; float: left;" id="pagingPages">
				<ul class="pagination">
					<c:choose>
						<c:when test="${pageInfo.pageNow==1 }">
							<li id="last" class="fb fmsun disabled"><a
								href="javascript:void(0);">&lt;</a></li>
						</c:when>
						<c:otherwise>
							<li id="last" class="fb fmsun"><a href="javascript:void(0);">&lt;</a></li>
						</c:otherwise>
					</c:choose>
					<c:set var="begin" value="1"></c:set>
					<c:set var="end" value="5"></c:set>
						<!-- 如果总页数少于或等于5页，则让显示的页数为总页数 -->
							<!-- 否则：如果当前页大于第三页，让显示的第一页为当前页的前两页到后两页 -->
							<!-- 如果当前页大于总页数的倒数第二页，不让页面再滚动 -->
					<c:choose>
						<c:when test="${pageInfo.pageCounts<=end }">
							<c:set var="end" value="${pageInfo.pageCounts }"></c:set>
						</c:when>
						<c:otherwise>
							<c:if test="${pageInfo.pageNow>3 }">
								<c:set var="begin" value="${pageInfo.pageNow-2}"></c:set>
								<c:set var="end" value="${pageInfo.pageNow+2 }"></c:set>
							</c:if>
							<c:if test="${pageInfo.pageNow>=pageInfo.pageCounts-2 }">
								<c:set var="begin" value="${pageInfo.pageCounts-4}"></c:set>
								<c:set var="end" value="${pageInfo.pageCounts }"></c:set>
							</c:if>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${begin }" end="${end }" var="i">
						<c:choose>
							<c:when test="${pageInfo.pageNow==i }">
								<li class="page active" page="${i }"><a href="">${i }</a></li>
							</c:when>
							<c:otherwise>
								<li page="${i }"><a href="">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${pageInfo.pageNow==pageInfo.pageCounts }">
							<li id="next" class="fb fmsun disabled"><a
								href="javascript:void(0);">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li id="next" class="fb fmsun"><a href="">&gt;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>