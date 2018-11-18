<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		
		
		<script type="text/javascript">
		function change(i) {
			
			var choose="choose_currentPageSize"+i;
			var choose_size="#"+choose;
			var ch_size=$(choose_size).html();
			
			$("#currentPageSize").html(ch_size);//每页显示的记录条数
			var pageSize=$("#currentPageSize").html();
			console.log("pagesize"+pageSize);

			location.href="${pageContext.request.contextPath}/servlet/kg/WeiwanchengServlet1?pageSize="+pageSize; 
			
		}
		</script>				
	</head>

	<body>
	<!-- 分页栏 -->
		<!-- <div class="row" style="margin:0;-moz-user-select:none;" onselectstart="return false;" id="paging"> -->
			<div style=" float:right;">
				<div style="margin-right: 10px; float: left;">
					<ul class="pagination">
						<li class="dropup">
							<div class="lh30 left">共${initParam.url} </div>
							<div class="btn-group" style="margin:0 5px;">
								
								<span class="lh30 left fb red" id="totalRecords">${pageInfo.rowCount}</span>
								<div class="lh30 left" style="margin-left:5px;">条记录</div>
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
										class="btn btn-default dropdown-toggle" type="button" >
										
											<span id="currentPageSize">${pageInfo.pageSize}</span> 
										<span class="caret"></span>
									</button>
									<div class="lh30 left" style="margin-left: 5px;">个</div>
									
									<ul role="menu" class="dropdown-menu" id="pageSizes">
										<c:set var="pageSize" value="0"></c:set>
										<li><a href="javascript:void(0);" id="choose_currentPageSize${pageSize}" onclick="change(${pageSize})">10</a></li>
										<c:set var="pageSize" value="1"></c:set>
										<li><a href="javascript:void(0);" id="choose_currentPageSize${pageSize}" onclick="change(${pageSize})">20</a></li>
										<c:set var="pageSize" value="2"></c:set>
										<li><a href="javascript:void(0);" id="choose_currentPageSize${pageSize}" onclick="change(${pageSize})">30</a></li>
										<c:set var="pageSize" value="3"></c:set>
										<li><a href="javascript:void(0);" id="choose_currentPageSize${pageSize}" onclick="change(${pageSize})">50</a></li>
										<c:set var="pageSize" value="4"></c:set>
										<li><a href="javascript:void(0);" id="choose_currentPageSize${pageSize}" onclick="change(${pageSize})">100</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				<div style="width:350px; float: left;" id="pagingPages">
					<ul class="pagination">
			
					<!-- < 前一页 -->
									
					<c:choose>
						<c:when test="${pageInfo.pageNo==1}">
							<li class="disabled"><a href="javascript:void(0);">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="${pageContext.request.contextPath}/servlet/kg/WeiwanchengServlet1?pageNo=${pageInfo.pageNo-1}&pageSize=${pageInfo.pageSize}${pageInfo.queryParam}">&laquo;</a></li>
						</c:otherwise>
					</c:choose>-
					
					<!-- 绘制显示的页码 -->
					<!-- 计算需要绘制页码的 始页码begin以及 末页码end -->
					<c:choose>
						<c:when test="${pageInfo.pageCount<=5}">
							<c:set var="begin" value="1"></c:set>
							<c:set var="end" value="${pageInfo.pageCount }"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="begin" value="${pageInfo.pageNo-2}"></c:set>
							<c:set var="end" value="${pageInfo.pageNo+2 }"></c:set>

							<c:if test="${begin<1}">
								<c:set var="begin" value="1"></c:set>
								<c:set var="end" value="5"></c:set>
							</c:if>
							<c:if test="${end > pageInfo.pageCount}">
								<c:set var="begin" value="${pageInfo.pageCount-4 }"></c:set>
								<c:set var="end" value="${pageInfo.pageCount}"></c:set>
							</c:if>
						</c:otherwise>
					</c:choose>
					
					<!-- 页码遍历 -->
					<c:forEach begin="${begin }" end="${end }" var="i">
						<c:choose>
							<c:when test="${i==pageInfo.pageNo}">
								<li class="active">
								<a href="${pageContext.request.contextPath}/servlet/kg/WeiwanchengServlet1?pageNo=${i}&pageSize=${pageInfo.pageSize}${pageInfo.queryParam}">${i}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
								<a href="${pageContext.request.contextPath}/servlet/kg/WeiwanchengServlet1?pageNo=${i}&pageSize=${pageInfo.pageSize}${pageInfo.queryParam}">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<!-- 添加....余页提示 -->
					<c:if test="${end<pageInfo.pageCount }">
						<li><a href="javascript:void(0);">....</a></li>
					</c:if>
					
					<!-- 后一页    > -->
					<c:choose>
					<c:when test="${pageInfo.pageNo==pageInfo.pageCount }">
						<li class="disabled"><a href="javascript:void(0);">&raquo;</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}/servlet/kg/WeiwanchengServlet1?pageNo=${pageInfo.pageNo+1}&pageSize=${pageInfo.pageSize}${pageInfo.queryParam}">&raquo;</a></li>
					</c:otherwise>
					</c:choose>
					</ul>
				</div>
			</div>
		<!-- </div> -->
	</body>

</html>