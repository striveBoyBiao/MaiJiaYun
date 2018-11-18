<%@page import="mjy.caiwu.fukuan.beans.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

		<nav>
		<ul class="pagination">
		<c:if test="${pageInfo.pageNo==1 }">
		<li class="disabled"><a href="#">&laquo;</a></li>
		</c:if>
		<c:if test="${pageInfo.pageNo!=1 }">
		<li><a
			href="${url }?method=showAllData&pageSize=${pageInfo.pageSize }&pageNo=${pageInfo.pageNo-1 }${pageInfo.queryParam}">&laquo;</a></li>
		</c:if>
		
		
		<c:set var="begin" value="0"></c:set>
		<c:set var="end" value="0"></c:set>

		<!-- 计算显示的页码 -->
		<c:if test="${pageInfo.pageCount<=5}">
			<c:set var="begin" value="1"></c:set>
			<c:set var="end" value="${pageInfo.pageCount}"></c:set>
		</c:if>
		<c:if test="${pageInfo.pageCount>5}">
			<c:set var="begin" value="${pageInfo.pageNo-2}"></c:set>
			<c:set var="end" value="${pageInfo.pageNo+2}"></c:set>
			<c:if test="${begin<1 }">
				<c:set var="begin" value="1"></c:set>
				<c:set var="end" value="5"></c:set>
			</c:if>
			<c:if test="${end >pageInfo.pageCount}">
				<c:set var="begin" value="${pageInfo.pageCount-5}"></c:set>
				<c:set var="end" value="${pageInfo.pageCount}"></c:set>
			</c:if>
		</c:if>
		
		<c:forEach var="i"  varStatus="st" begin="${begin }" end="${end }">
			<c:if test="${i==pageInfo.pageNo }">
				<li class="active"><a href="${url }?method=showAllData&pageSize=${pageInfo.pageSize }&pageNo=${i}${pageInfo.queryParam}">${i}</a></li>
			</c:if>
			<c:if test="${i!=pageInfo.pageNo }">
				<li><a href="${url }?method=showAllData&pageSize=${pageInfo.pageSize }&pageNo=${i}${pageInfo.queryParam}">${i}</a></li>
			</c:if>
		</c:forEach>		

		<c:if test="${end<pageInfo.pageCount}">
		<li><a href="#">....</a></li>
		</c:if>

		<c:if test="${pageInfo.pageNo ==pageInfo.pageCount }">
		<li class="disabled"><a href="#">&raquo;</a></li>
		</c:if>
		<c:if test="${pageInfo.pageNo !=pageInfo.pageCount }">
		<li><a
			href="${url }?method=showAllData&pageSize=${pageInfo.pageSize }&pageNo=${pageInfo.pageNo+1}${pageInfo.queryParam}">&raquo;</a></li>
		</c:if>
		
		</ul>
		</nav>