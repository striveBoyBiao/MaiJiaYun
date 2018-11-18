<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<title>应付款</title>

<script type="text/javascript">

	function paginationCount(i) {
		
		var choose="choose_currentPageSize"+i;
		var choose_size="#"+choose;
		var ch_size=$(choose_size).html();
		
		$("#currentPageSize").html(ch_size);//每页显示的记录条数
		var pageSize=$("#currentPageSize").html();

		location.href="${pageContext.request.contextPath}/servlet/cw/fukuan/ShouldPayServlet?method=showAllData&shouzhiTypeId="+"${szTypeId==null?"":szTypeId}"+"&pageSize="+pageSize;
		
	}
	

	function click_yes(id){
		
		if(id=="#yes_pay"){
			location.href="${pageContext.request.contextPath}/servlet/cw/fukuan/ShouldPayServlet?method=operatePay&fkNo="+fkno;
		}
		if(id=="#yes_badpay"){
			location.href="${pageContext.request.contextPath}/servlet/cw/fukuan/ShouldPayServlet?method=operateBadPay&fkNo="+fkno;
		}
		

	}
	function change(i,fkNo){
		
		
		$(i).css("display","block")
		
		fkno=fkNo;
		
	}
	

</script>

</head>
<body style="padding-right: 0px;" class="">
	<!--代码开始-->
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
					href="${pageContext.request.contextPath}/servlet/cw/Wait_checkServlet?method=zhujiemian">待财务审核<span></span></a></li>
				<li id="li-yingfu" val="应付款" class="tab active"><a class="c6"
					href="${pageContext.request.contextPath}/servlet/cw/fukuan/ShouldPayServlet?method=showAllData">应付款</a></li>
				<li id="li-yifu" val="已付款" class="tab"><a class="c6"
					href="${pageContext.request.contextPath}/servlet/cw/fukuan/PayedServlet?method=ShowAllData">已付款</a></li>
				<li id="li-fukuanhuaizhang" val="坏账" class="tab"><a class=""
					href="${pageContext.request.contextPath}/servlet/cw/fukuan/bad_pay?method=showAllData">坏账</a></li>
				<li class="pull-right mr10" id="li-query" style="padding-top: 12px;">
					<form
						action="${pageContext.request.contextPath }/servlet/cw/fukuan/ShouldPayServlet?method=showAllData&shouzhiTypeId=${szTypeId}&pageSize=${pageCount}"
						method="post">
						<div class="w340">
							<div class="input-group">
								<input name="keyword" placeholder="收款人姓名/收款人昵称/相关单据"
									style="width: 300px;" class="form-control" type="text">
								<span class="input-group-btn">
									<button type="button" class="btn btn-primary query"
										onclick="this.form.submit()">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
					</form>
				</li>
			</ul>
		</div>
		<!--titletab end-->
		<div class="prl10auto" id="panel">
			<!--table star-->
			<div class="panel">
				<!-- Table -->
				<div class="form-group mr20" style="padding-top: 15px;">
					<a
						href="${pageContext.request.contextPath}/mjy/caiwu/fukuan/servlet/AddServlet?method=pageJumpAfk"><button
							id="btnAddFuKuan" class="btn btn-default" type="button">添加应付单</button></a>
				</div>
				<table class="table table-striped table-hover">
					<thead class=" table-bordered">
						<tr>
							<th><input type="checkbox"></th>
							<th>收款人姓名</th>
							<th>收款人昵称</th>
							<th>应付金额</th>
							<th class="select" title="收支类型" id="thtype">
								<div class="dropdown">
									<button class="btn dropdown-toggle fb"
										style="padding: 0; box-shadow: none; background: none"
										type="button" id="dropdownMenu1" data-toggle="dropdown">
										<span class="title" id="spanType">收支类型</span> <span
											class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu"
										aria-labelledby="dropdownMenu1" id="type_ul">
										<c:forEach var="shouzhilxType" items="${shouzhilxType }" varStatus="st">
											<li val="">
												<a href="${pageContext.request.contextPath }/servlet/cw/fukuan/ShouldPayServlet?method=showAllData&shouzhiTypeId=${shouzhilxType.shouzhilxId}&pageSize=${pageCount}" 
													id="${shouzhilxType.shouzhilxId}">${shouzhilxType.shouzhilxType }</a>
													<input type="hidden" id="${st.index }" value="${shouzhilxType.shouzhilxId}">
											</li>
										</c:forEach>
									</ul>
								</div>
							</th>
							<th>相关单据</th>
							<th>备注</th>
							<th>创建人</th>
							<th>创建时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ShouldpayVO" items="${shouldpayvo }">
							<tr>
								<td><input type="checkbox"></td>
								<td>${ShouldpayVO.fkSkName }</td>
								<td>${ShouldpayVO.fkSkNickName }</td>
								<td>${ShouldpayVO.fkShouldpayMoney }</td>
								<td>${ShouldpayVO.other1 }</td>
								<td>${ShouldpayVO.fkNo }</td>
								<td>${ShouldpayVO.fkRemark }</td>
								<td>${ShouldpayVO.other2 }</td>
								<td>${ShouldpayVO.fkCreaterTime }</td>
								<td>
									<button id="pay" modelid="91197" name="btnFuKuan" type="button" class="btn btn-default mr5" onclick="change('#comfirm_pay','${ShouldpayVO.fkNo }')">付款</button>
								 
									<button id="badpay" modelid="91197" name="btnHuaiZhang" type="button" class="btn btn-default mr5" onclick="change('#comfirm_badpay','${ShouldpayVO.fkNo }')">坏账</button>
								<a
									href="${pageContext.request.contextPath }/servlet/cw/fukuan/ShouldPayServlet?method=shouldpayDetail&fkNo=${ShouldpayVO.fkNo }">详情</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!--table end-->

				<div style="float: right;">
					<div style="margin-right: 10px; float: left;">
						<ul class="pagination">
							<li class="dropup">
								<div class="lh30 left">共</div>
								<div class="btn-group" style="margin: 0 5px;">
									<span class="lh30 left fb red" id="totalRecords">${count }</span>
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
										class="btn btn-default dropdown-toggle" type="button" >
										<c:if test="${pageSize==null }">
											<span id="currentPageSize">10</span> 
										</c:if>
										<c:if test="${pageSize!=null }">
											<span id="currentPageSize">${pageSize}</span> 
										</c:if>
										<span class="caret"></span>
									</button>
									<div class="lh30 left" style="margin-left: 5px;">个</div>
									
									<ul role="menu" class="dropdown-menu" id="pageSizes">
										<c:set var="pageSize" value="0"></c:set>
										<li><a href="javascript:void(0);" id="choose_currentPageSize${pageSize}" onclick="paginationCount(${pageSize})">10</a></li>
										<c:set var="pageSize" value="1"></c:set>
										<li><a href="javascript:void(0);" id="choose_currentPageSize${pageSize}" onclick="paginationCount(${pageSize})">20</a></li>
										<c:set var="pageSize" value="2"></c:set>
										<li><a href="javascript:void(0);" id="choose_currentPageSize${pageSize}" onclick="paginationCount(${pageSize})">30</a></li>
										<c:set var="pageSize" value="3"></c:set>
										<li><a href="javascript:void(0);" id="choose_currentPageSize${pageSize}" onclick="paginationCount(${pageSize})">50</a></li>
										<c:set var="pageSize" value="4"></c:set>
										<li><a href="javascript:void(0);" id="choose_currentPageSize${pageSize}" onclick="paginationCount(${pageSize})">100</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<div style="width: 350px; float: left;" id="pagingPages">

						<jsp:include page="pagination.jsp">
							<jsp:param
								value="${pageContext.request.contextPath }/servlet/cw/fukuan/ShouldPayServlet"
								name="url" />
						</jsp:include>

					</div>
				</div>

				<!--table end-->
			</div>
		</div>
	</div>

	<!--代码结束-->
	
	<div id ="comfirm_pay"  aria-hidden="true" style="display: none;" class="bootbox modal fade bootbox-confirm in" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button style="margin-top: -10px;" type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
					<div class="bootbox-body">您是否确认付款，确认后无法驳回！</div>
				</div>
				<div class="modal-footer">
					<a href="${pageContext.request.contextPath}/servlet/cw/fukuan/ShouldPayServlet?method=showAllData">
						<button data-bb-handler="cancel" type="button" class="btn btn-default">取消</button>
					</a>
					<button id="yes_pay" data-bb-handler="confirm" type="button" class="btn btn-primary" onclick="click_yes('#yes_pay');">确认</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<div id ="comfirm_badpay"  aria-hidden="true" style="display: none;" class="bootbox modal fade bootbox-confirm in" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button style="margin-top: -10px;" type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
					<div class="bootbox-body">您是否确认坏账，确认后无法驳回！</div>
				</div>
				<div class="modal-footer">
					<a href="${pageContext.request.contextPath}/servlet/cw/fukuan/ShouldPayServlet?method=showAllData">
						<button data-bb-handler="cancel" type="button" class="btn btn-default">取消</button>
					</a>
					<button id="yes_badpay" data-bb-handler="confirm" type="button" class="btn btn-primary" onclick="click_yes('#yes_badpay');">确认</button>
				</div>
			</div>
		</div>
	</div>
	

	
	
</body>
</html>