<%@page import="mjy.caiwu.fukuan.beans.FuKuanVo"%>
<%@page import="java.util.List"%>
<%@page import="mjy.caiwu.fukuan.service.impl.PayedServiceImpl"%>
<%@page import="mjy.caiwu.fukuan.service.PayedService"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已付款</title>
<script type="text/javascript"
	src="/MaiJiaYun/caiwu/fukuan/js/jquery-1.7.min.js"></script>
</head>
<body>
	<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
	<div class="content" id="content">
		<!--titletab star-->
		<div class="collapse navbar-collapse navbar-default navbar-titletab"
			style="padding: 0px 0 0 0;">
			<div class="navbar-header">
				<a href="#" class="navbar-brand ml20">付款单</a>
			</div>
			<ul class="nav nav-tabs f14 fb">
				<li id="li-auditwaitcaiwu" val="待财务审核" class="ml20 tab"><a
					class="c6"
					href="${pageContext.request.contextPath }/servlet/cw/Wait_checkServlet?method=zhujiemian">待财务审核<span></span></a></li>
				<li id="li-yingfu" val="应付款" class="tab"><a class="c6"
					href="${pageContext.request.contextPath }/servlet/cw/fukuan/ShouldPayServlet?method=showAllData">应付款</a></li>
				<li id="li-yifu" val="已付款" class="tab active"><a class="c6"
					href="${pageContext.request.contextPath }/servlet/cw/fukuan/PayedServlet?method=ShowAllData">已付款</a></li>
				<li id="li-fukuanhuaizhang" val="坏账" class="tab"><a class=""
					href="${pageContext.request.contextPath }/servlet/cw/fukuan/bad_pay?method=showAllData">坏账</a></li>
				<li class="pull-right mr10" id="li-query" style="padding-top: 12px;">
					<div class="w340">
						<div class="input-group">
							<input id="spword" placeholder="付款人姓名/付款人昵称/相关单据"
								style="width: 300px;" class="form-control" type="text"> <span
								class="input-group-btn">
								<button type="button" class="btn btn-primary query" onclick="pageSelect()">
									<span class="glyphicon glyphicon-search" ></span>
								</button>
							</span>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<!--table star-->
	<div class="panel">
		<!-- Table -->
		<table class="table table-striped table-hover">
			<thead class=" table-bordered">
				<tr>
					<th><input type="checkbox"></th>
					<th>收款人姓名</th>
					<th>收款人昵称</th>
					<th>应付金额</th>
					<th class="select" title="收支类型" id="thtype" name="thtype">
						<div class="dropdown">
							<button class="btn dropdown-toggle fb"
								style="padding: 0; box-shadow: none; background: none"
								type="button" id="dropdownMenu1" data-toggle="dropdown">
								<span class="title" id="spanType">收支类型</span> <span
									class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="dropdownMenu1" id="type_ul">
								<c:forEach var="ShouzhiType" items="${sv}" >
								<li val="67482" id="shouzhi"><a href="javascript:void(0)" code=""
									name="1"  onclick=" pageLi(this)" id="${ShouzhiType.shouzhilxId }">${ShouzhiType.shouzhilxType}</a></li>
								</c:forEach>
							</ul>
						</div>
					</th>
					<th id="fkNo">相关单据</th>
					<th>备注</th>
					<th>创建人</th>
					<th>创建时间</th>
					<th>操作人</th>
					<th>操作时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<!-- var表示你要循环的集合的别名 -->
				<c:forEach var="payedvo" items="${pageInfo.pageDate }">
					<tr>
						<td><input type="checkbox"></td>
						<td>${ payedvo.getFkSkName()}</td>
						<td>${ payedvo.getFkSkNickName()}</td>
						<td>${ payedvo.getFkShouldpayMoney()}</td>
						<td>${payedvo.getOther2()}</td>
						<td>${payedvo.getFkNo()}</td>
						<td>${payedvo.getFkRemark()}</td>
						<td>${payedvo.getOther3()}</td>
						<td>${payedvo.getFkCreaterTime()}</td>
						<td>${payedvo.getOther3()}</td>
						<td>${payedvo.getFkOperatorTime()}</td>
						<th><a
							href="${pageContext.request.contextPath }/servlet/cw/fukuan/PayedServlet?method=PayedDetailServlet&fkNo=${payedvo.getFkNo()}">详情</a></th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 分页开始 -->
		<div class="row" style="margin: 0; -moz-user-select: none;"
			onselectstart="return false;" id="paging">
			<div style="float: right;">
				<div style="margin-right: 10px; float: left;">
					<ul class="pagination">
						<li class="dropup">
							<div class="lh30 left">共</div>
							<div class="btn-group" style="margin: 0 5px;">
								<span class="lh30 left fb red" id="totalRecords">${pageInfo.rowCount }</span>
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
									<span id="currentPageSize">${pageInfo.pageSize }</span> <span class="caret"></span>
								</button>
								<div class="lh30 left" style="margin-left: 5px;">个</div>
								<ul role="menu" class="dropdown-menu" id="pageSizes">
									<li><a href="javascript:void(0);">10</a></li>
									<li><a href="javascript:void(0);">20</a></li>
									<li><a href="javascript:void(0);">50</a></li>
									<li><a href="javascript:void(0);">100</a></li>
									<li><a href="javascript:void(0);">200</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
				<div style="width: 350px; float: left;" id="pagingPages">
					<ul class="pagination">
					<!-- 上一页 -->
					<c:if test="${pageInfo.pageNo==1 }">
						<li id="last" class="disabled"><a href="javascript:void(0);">&laquo;</a></li>
					</c:if>
					<c:if test="${pageInfo.pageNo!=1 }">
					<li id="last" class="active">
						<a href="${pageContext.request.contextPath }/servlet/cw/fukuan/PayedServlet?method=ShowAllData&pageNo=${pageInfo.pageNo-1}&pagesize=${pageInfo.pageSize }&shouzhilxId=${shouzhilxId==null?null:shouzhilxId}&key=${key==null?null:key}">&laquo;</a></li>
					</c:if>
					
					<!-- 计算页数 -->
					<c:if test="${pageInfo.pageCount<=5}">
					<c:set var="begin" value="1"></c:set>
					<c:set var="end" value="${pageInfo.pageCount }"></c:set>
					</c:if>
					
					<c:if test="${pageInfo.pageCount>5}">
					<c:set var="begin" value="${pageInfo.pageNo-1 }"></c:set>
					<c:set var="end" value="${pageInfo.pageNo+2 }"></c:set>
					<c:if test="${begin<1}">
					<c:set var="begin" value="1"></c:set>
					<c:set var="end" value="5"></c:set>
					</c:if>
					<c:if test="${end>pageInfo.pageCount }">
					<c:set var="begin" value="${pageInfo.pageCount-4 }"></c:set>
					<c:set var="end" value="${end=pageInfo.pageCount}"></c:set>
					</c:if>
					</c:if>
						
					<!-- 分页条数-->
					<c:forEach var="i" begin="${begin}" end="${end}">
					<c:if test="${i==pageInfo.pageNo}">
					<li class="page active" page="1">
						<a onclick="pageClick(this)" href=" ${pageContext.request.contextPath }/servlet/cw/fukuan/PayedServlet?method=ShowAllData&pageNo=${i}&pagesize=${pageInfo.pageSize }&shouzhilxId=${shouzhilxId==null?null:shouzhilxId}&key=${key==null?null:key}">${i}</a>
					</li>
					</c:if>
					<c:if test="${i!=pageInfo.pageNo}">
					<li page="1">
						<a onclick="pageClick(this)" href=" ${pageContext.request.contextPath }/servlet/cw/fukuan/PayedServlet?method=ShowAllData&pageNo=${i}&pagesize=${pageInfo.pageSize }&shouzhilxId=${shouzhilxId==null?null:shouzhilxId}&key=${key==null?null:key}">${i}</a>
					</li>
					</c:if>
					</c:forEach>
						
					<!-- 下一页 -->
					<c:if test="${pageInfo.pageNo==pageInfo.pageCount }">
						<li id="next" class="disabled"><a href="javascript:void(0);">&raquo;</a></li>
					</c:if>
					<c:if test="${pageInfo.pageNo!=pageInfo.pageCount }">
						<li id="next">
						<a href="${pageContext.request.contextPath }/servlet/cw/fukuan/PayedServlet?method=ShowAllData&pageNo=${pageInfo.pageNo+1}&pagesize=${pageInfo.pageSize }&shouzhilxId=${shouzhilxId==null?null:shouzhilxId}&key=${key==null?null:key}">&raquo;</a>
						</li>
					</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script>
	/*  选择页面大小时的点击事件*/
	$("#pageSizes li a").click(function(){
	var choose = $(this).html();
	location.href = "${pageContext.request.contextPath }/servlet/cw/fukuan/PayedServlet?method=ShowAllData&shouzhilxId="+"${shouzhilxId==null?null:shouzhilxId}"+"$key="+"${key==null?null:key}"+"&pagesize="+choose;
	
	});
	
	/* 点击当前页时的点击事件 */
	function pageClick(object){
		$(object).parent("li").attr("class","page active");
	}
	/* 点击收支类型的点击事件 */
	function pageLi(object){
		var shouzhilxId = $(object).attr("id");
		location.href = "${pageContext.request.contextPath }/servlet/cw/fukuan/PayedServlet?method=ShowAllData&shouzhilxId="+shouzhilxId+"$key="+"${key==null?null:key}"+"&pagesize="+${pageInfo.pageSize};
	}
	/*  模糊查询时候的点击事件*/
	function pageSelect(){
		var  key = $('#spword').val();
			location.href = "${pageContext.request.contextPath }/servlet/cw/fukuan/PayedServlet?method=ShowAllData&shouzhilxId="+"${shouzhilxId==null?null:shouzhilxId}"+"&pagesize="+${pageInfo.pageSize}+"&key="+key;
	}
	$("#spword").keydown(function(event){
		if(event.keyCode==13){
			pageSelect();
		}
	})
	
	</script>
	<!--代码结束-->
</body>
</html>