
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--分页 star-->
<div class="row" style="margin: 0; -moz-user-select: none;"
	onselectstart="return false;" id="paging">
	<div style="float: right;">
		<div style="margin-right: 10px; float: left;">
			<ul class="pagination">
				<li class="dropup">
					<div class="lh30 left">共</div>
					<div class="btn-group" style="margin: 0 5px;">
						<span class="lh30 left fb red" id="totalRecords">${pageInfo.rowCount}</span>
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
							<span id="currentPageSize">${pageInfo.pageSize}</span> <span
								class="caret"></span>
						</button>
						<div class="lh30 left" style="margin-left: 5px;">个</div>
						<ul role="menu" class="dropdown-menu" id="pageSizes">
							<li><a href="javascript:void(0)">10</a></li>
							<li><a href="javascript:void(0)">20</a></li>
							<li><a href="javascript:void(0)">50</a></li>
							<li><a href="javascript:void(0)">100</a></li>
							<li><a href="javascript:void(0)">200</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<div style="width: 350px; float: left;" id="pagingPages">
			<ul class="pagination">

				<c:choose>
					<c:when test="${pageInfo.pageNo==1}">
						<li class="fb fmsun"><a href="javascript:void(0);">&lt;</a></li>
					</c:when>
					<c:otherwise>
						<li class="fb fmsun"><a
							href="${initParam.url}?pageNo=${pageInfo.pageNo-1}&pageSize=${pageInfo.pageSize}">&lt;</a></li>
					</c:otherwise>
				</c:choose>
				<!-- 计算显示的页码 -->

				<c:choose>
					<c:when test="${pageInfo.pageCount+1<=5}">
						<c:set var="begin" value="1"></c:set>
						<c:set var="end" value="${pageInfo.pageCount }"></c:set>
					</c:when>
					<c:otherwise>
						<c:set var="begin" value="${pageInfo.pageNo-2 }"></c:set>
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
				<c:forEach begin="${begin }" end="${end }" var="i">

					<c:choose>
						<c:when test="${i==pageInfo.pageNo }">
							<li class="page active" page="${i}"><a
								href="${initParam.url}?pageNo=${i}&pageSize=${pageInfo.pageSize}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="${initParam.url}?pageNo=${i}&pageSize=${pageInfo.pageSize}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${end<pageInfo.pageCount }">
					<li><a href="#">...</a></li>
				</c:if>
				<c:choose>
					<c:when test="${pageInfo.pageNo==pageInfo.pageCount }">
						<li id="next" class="fb fmsun"><a href="javascript:void(0);">&gt;</a></li>
					</c:when>
					<c:otherwise>
						<li id="next" class="fb fmsun"><a
							href="${initPrarm.url }?pageNo=${pageInfo.pageNo+1}&pageSize=${pageInfo.pageSize}">&gt;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</div>
<!--分页 end-->
