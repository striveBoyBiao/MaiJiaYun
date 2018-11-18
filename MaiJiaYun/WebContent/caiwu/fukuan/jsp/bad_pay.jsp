<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卖家云-坏账</title>
</head>
<script src="${pageContext.request.contextPath }/caiwu/fukuan/js/jquery-1.7.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn").click(function(){
			var keyword= $('#q').val();
			location.href="${pageContext.request.contextPath }/servlet/cw/fukuan/bad_pay?method=showAllData&keyword="+$('#q').val()+"&"+"${pageInfo.queryParam}";
		});
	
			$("#pageSizes li a").click(function(){
			    var pageSize = $(this).html();
				$("#currentPageSize").html(pageSize);
				location.href="${pageContext.request.contextPath }/servlet/cw/fukuan/bad_pay?method=showAllData&pageSize="+pageSize+"&"+"${pageInfo.queryParam}";
			});
			
			  //由键盘的回车键进行模糊搜索 
		
		$("#q").keydown(function(event){
			  if(event.keyCode==13){
					var keyword= $('#q').val();
					location.href="${pageContext.request.contextPath }/servlet/cw/fukuan/bad_pay?method=showAllData&keyword="+$('#q').val()+"&"+"${pageInfo.queryParam}";
				 }
			 })
	});
		
	function getDataBySzlx(szlxId){
		var shouzhiTypeId = $(szlxId).attr("shouzhilxId");		
		location.href="${pageContext.request.contextPath }/servlet/cw/fukuan/bad_pay?method=showAllData&shouzhiTypeId="+shouzhiTypeId+"&"+"${pageInfo.pageSize}";
	}
</script>
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
					href="${pageContext.request.contextPath }/servlet/cw/Wait_checkServlet?method=zhujiemian">待财务审核<span></span></a></li>
				<li id="li-yingfu" val="应付款" class="tab"><a class="c6"
					href="${pageContext.request.contextPath }/servlet/cw/fukuan/ShouldPayServlet?method=showAllData">应付款</a></li>
				<li id="li-yifu" val="已付款" class="tab"><a class="c6"
					href="${pageContext.request.contextPath }/servlet/cw/fukuan/PayedServlet?method=ShowAllData">已付款</a></li>
				<li id="li-fukuanhuaizhang" val="坏账" class="tab active"><a class="c6"
					href="${pageContext.request.contextPath }/servlet/cw/fukuan/bad_pay?method=showAllData">坏账</a></li>
				<li class="pull-right mr10" id="li-query" style="padding-top: 12px;">
					<div class="w340">
						<div class="input-group">
							<input id="q" name="q" placeholder="收款人姓名/收款人昵称/相关单据"
								style="width: 300px;" class="form-control" type="text">
							<span class="input-group-btn">
								<button type="button" type="button" class="btn btn-primary query" id="btn"  style="height:34px">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<!--titletab end-->
		<div class="prl10auto" id="panel">
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
										<c:forEach var="ShouZhiTypeVO"  items="${szlxs }"  >
											<li>
												<a   shouzhilxId="${ShouZhiTypeVO.shouzhilxId}"
													onclick="getDataBySzlx(this)">${ShouZhiTypeVO.shouzhilxType }</a>
											</li>
										</c:forEach>
									</ul>
								</div>
							</th>
							<th>相关单据</th>
							<th>备注</th>
							<th>创建人</th>
							<th>创建时间</th>
							<th>操作人</th>
							<th>操作时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<!---->
						<c:forEach var="Bad_payVO" items="${pageInfo.pageDate }">
							<tr name="bad_pay_main">
								<td><input type="checkbox"></td>
								<td>${Bad_payVO.fkSkName }</td>
								<td>${Bad_payVO.fkSkNickName }</td>
								<td>${Bad_payVO.fkShouldpayMoney }</td>
								<td>${Bad_payVO.other2 }</td>
								<td>${Bad_payVO.fkNo }</td>
								<td>${Bad_payVO.fkRemark }</td>
								<td>${Bad_payVO.other1 }</td>
								<td>${Bad_payVO.fkCreaterTime }</td>
								<td>${Bad_payVO.other1 }</td>
								<td>${Bad_payVO.fkOperatorTime }</td>
								<th><a
									href="${pageContext.request.contextPath }/servlet/cw/fukuan/bad_pay?method=bad_payDetail&fkNo=${Bad_payVO.fkNo }">详情
								</a></th>
							</tr>
						</c:forEach>
						<!---->
					</tbody>
				</table>
				<!--table end-->
				<div aria-hidden="true" aria-labelledby="collect_detailModalLabel"
					role="dialog" tabindex="-1" id="collect_detailModal"
					class="modal fade" style="display: none;"></div>
				<!--table end-->


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
									<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
										<span id="currentPageSize">${pageInfo.pageSize}</span><span class="caret"></span>
									</button>
									<div class="lh30 left" style="margin-left: 5px;">个</div>

									<ul role="menu" class="dropdown-menu" id="pageSizes">
										<c:set var="pageSize" value="0"></c:set> 																
										<li><a href="javascript:void(0);" >10</a></li>
									 	<c:set var="pageSize" value="1"></c:set>
									 	<li><a href="javascript:void(0);" >20</a></li>
 										<c:set var="pageSize" value="2"></c:set>
										<li><a href="javascript:void(0);">50</a></li>
										<c:set var="pageSize" value="3"></c:set>
										<li><a href="javascript:void(0);">100</a></li>
										<c:set var="pageSize" value="4"></c:set>
										<li><a href="javascript:void(0);">200</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
					
					<div style="width: 350px; float: left;" id="pagingPages">
						<jsp:include page="pagination.jsp">
							<jsp:param
								value="${pageContext.request.contextPath }/servlet/cw/fukuan/bad_pay"
								name="url" />
						</jsp:include>	
					</div>
					
				</div>
				<!--table end-->
			</div>
		</div>
	</div>
	<!--代码结束-->
</body>
</html>