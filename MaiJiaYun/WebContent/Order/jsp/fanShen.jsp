<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths" style="">

	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<meta name="renderer" content="webkit">
		<meta name="keywords" content="供销平台,分销平台,分销,供销,货源,分销推荐,货源推荐,供销系统,分销系统,ERP,免费ERP,ERP软件,免费ERP软件,进销存,进销存软件,免费进销存软件">
		<meta name="description" content="禾唐卖家云独一无二的供销平台，开启供销双方合作的桥梁，无安装，免培训，极致用户体验 。包含寻找优质分销商，一键发布货源信息，一键代发、批发进货轻松接单！让您与分销商的订单业务无缝衔接，供销双方实时互动 ，沟通协作业务拓展不再是难事。">
		<meta http-equiv="X-UA-Compatible" content="IE=8,9,chrome=1">
		<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>
		<script type="text/javascript">
				/* function fanShen(obj){
				alert(111)
				code = $(obj).attr("code");
				href = "${pageInfo.servletUri}&pageSize=${pageInfo.pageSize}&pageNow=${pageInfo.pageNow}&orderCheck="+code;
				window.location.href = href;
			} */
		</script>
	</head>

	<body style="padding-right: 0px;" class="">
		<!--代码开始-->
		<div class="container" id="container">
			<!--header 开始-->
			
			<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
			
			<!--header 结束-->
			<!--Layout left part star-->
			<!-- style="position: fixed;left:0, top:0, z-index:1030; display:none;" -->
			<!--<div class="sidebar-nav navbar-fixed-top" id="menu" style="display:none;"></div>-->
			<!--Layout left part end-->
			<!--Layout right part star-->
			<div class="content" id="content">
				<div class="collapse navbar-collapse navbar-default navbar-titletab" style="padding:0px 0 0 0;">
					<div class="navbar-header">
						<a href="#" class="navbar-brand ml20">           </a>
					</div>
					<ul class="nav nav-tabs f14 fb">
						
						<li class="pull-right" id="li-query" style="padding-top: 12px;">
							<div class="w340">
								<div class="input-group">
									<input name="q" class="form-control" placeholder="店铺名/物流公司名/订单号/买家姓名/买家旺旺号" type="text">
									<span class="input-group-btn">
                      <button type="button" class="btn btn-primary query"><span class="glyphicon glyphicon-search"></span></button>
									</span>
								</div>
							</div>
						</li>
					</ul>
					<!--search end-->
				</div>
				<!--titletab end-->
				<!--panel star-->
				<div class="prl10auto white" id="panel">
					<!--功能按钮 star-->
					<div class="btn-group-block">

						<button type="button" class="btn btn-default mr5" data-toggle="modal" id="batchAudit">批量反审</button>
					</div>
					<!--功能按钮 end-->

					<!--table star-->
					<div class="panel">
						<!-- Table -->
						<%-- <table class="table table-striped table-hover" id="orderTable">
							<jsp:include page="/Order/jsp/shenHeLsz.jsp"></jsp:include>
							<tbody>
							
								<!-- 此处写所有从数据库查出来的订单信息（） -->
							
							</tbody>
						</table> --%>
						<table class="table table-striped table-hover" id="orderTable">
						<jsp:include page="/Order/jsp/shenHeLsz.jsp"></jsp:include>

						<!-- 此处写所有从数据库查出来的订单信息（） -->
						<tbody>
							<tr>
								<td colspan="42" class="h30"
									style="border-bottom: 3px solid #cccccc; border-top: none">
									<span class="caret"></span> <span class="fb"> 更早 </span> 
								</td>
							</tr>
							
							<c:forEach items="${pageInfo.orderInfos }" var="allInfo">
							  
							<tr id="unAuditTr11655707" false="" orderid="11655707"
								class="order">
								<td false="" style="background-color: rgb(240, 248, 253);">
								<input type="checkbox" style="margin-right: 5px;"></td>
								<td style="background-color: rgb(240, 248, 253);"></td>
								<!-- 店铺名 -->
								<td>${allInfo.shop.shopName }</td>
								<!--订单号/下单时间  -->
								<td false="" colname="b2cCode/createTime"><a href="javascript:void(0);" class="show-order-detail">${allInfo.order.orderCode }</a><br>${allInfos[0].order.orderTime }</td>
								<!-- 买家 -->
								<td false="" colname="customerName" style="background-color: rgb(240, 248, 253);">${allInfo.buyer.buyerName }</td>
								<!-- 买家备注 -->
								<td false="" colname="buyerMemo" style="background-color: rgb(240, 248, 253);">${allInfo.order.orderBuyerRemark }</td>
								<!-- 卖家备注 -->
								<td false="" colname="sellerMemo">${allInfo.order.orderSellerRemark }</td>
								<!-- 地址 -->
								<td>
								<c:choose>
										<c:when
											test="${fn:length(allInfo.buyer.buyerAddress)<10 }">
											${fn:substring(allInfo.buyer.buyerAddress, 0,fn:length(allInfo.buyer.buyerAddress))}
										</c:when>
										<c:when
											test="${fn:length(allInfo.buyer.buyerAddress)<20 }">
											${fn:substring(allInfo.buyer.buyerAddress, 0,10)}<br>
											${fn:substring(allInfo.buyer.buyerAddress, 10,fn:length(allInfo.buyer.buyerAddress))}
										</c:when>
										<c:otherwise>
											${fn:substring(allInfo.buyer.buyerAddress, 0,10)}<br>
											${fn:substring(allInfo.buyer.buyerAddress, 10,18)}...
										</c:otherwise>
								</c:choose>
								</td>
								<!-- 物流 -->
								<td false="" colname="expressCompanyName" style="background-color: rgb(240, 248, 253);">${allInfo.logistic.logisticName }</td>
								<!-- 数量  -->
								<td false="" colname="skuTotalQuantity" style="background-color: rgb(240, 248, 253);">${allInfo.order.orderGoodNum}</td>
								<!--实付/运费  -->
								<td false="" colname="paymentAmount/buyerPostageFee" style="background-color: rgb(240, 248, 253);">${allInfo.order.orderPayMent }
									/ ${allInfo.order.orderFreight }</td>
								<!--买家手机号  -->
								<td false="" colname="receiverMobile">${allInfo.buyer.buyerPhone }</td>
								<!--买家电话号  -->
								<td false="" colname="receiverPhone">${allInfo.buyer.buyerTel }</td>
								<!--收货人姓名  -->
								<td false="" colname="receiverName">${allInfo.buyer.buyerName }</td>
								
								<!--付款时间  -->
								<td false="" colname="paymentTime">${allInfo.order.orderPayTime }</td>
								<!--审单时间  -->
								<td false="" colname="auditTime">${allInfo.order.orderExaTime }</td>
								<!--发货时间  -->
								<td false="" colname="deliveryTime">${allInfo.order.orderSendTime }</td>
								<!--快递单号  -->
								<td false="" colname="expressCode">${allInfo.order.orderExpressCode }</td>
								<!--物流/运单号  -->
								<td false="" colname="expressCompanyName/expressCode">${allInfo.logistic.logisticName }/${allInfo.order.orderWaybill }</td>
								<td false="" colspan="2"
									style="background-color: rgb(240, 248, 253);">
									<div class="btn-group" style="margin-right: 10px;">
										<button code="${allInfo.order.orderCode}"  onclick="shenHe(this)" class="btn btn-default operation-audit fanshen" type="button">反审</button>
										<button data-toggle="dropdown" style="margin-right: 0"
											class="btn btn-default dropdown-toggle" type="button">
											<span class="caret"></span> <span class="sr-only">Toggle
												Dropdown</span>
										</button>
										<ul style="min-width: 94px;" role="menu" class="dropdown-menu">
											<li class="operation-lock"><a style="cursor: pointer;"
												data-target="#lockinfoModal" data-toggle="modal">锁单</a></li>
										</ul>
									</div>
									<div class="btn-group show-order-detail">
										<a href="javascript:void(0);" onclick="changeDetails(this)">详情</a>
									</div>
								</td>
							</tr>
							<%-- <jsp:include page="/Order/jsp/info.jsp"></jsp:include> --%>
							</c:forEach>
							<!-- ------------------>
							<!--是否隐藏-->
							<!--是否隐藏-->
						</tbody>
					<!-- 总的tbody -->
					</table>
						<jsp:include page="/Order/jsp/lieshezhi.jsp"></jsp:include>
						
					</div>
					<!--table end-->
				</div>
				<!--panel end-->
				<!--分页 star-->
				<div class="row" style="margin:0;-moz-user-select:none;" onselectstart="return false;" id="paging">
				</div>
				<!--分页 end-->
				<!-- Modal -->
				<div class="modal fade" id="tableModal" tabindex="-1" role="dialog" aria-labelledby="tableModalLabel" aria-hidden="true">
				</div>
				<!-- /.modal -->
			</div>
			<div class="contentbox" id="contentbox" style="background: rgb(241, 241, 241) none repeat scroll 0% 0%; display: none;"></div>
			<!--Layout right part end-->

			<div id="spinner" style="display:none;">
				<div class="modal fade" aria-hidden="false" role="dialog" tabindex="-1" style="display:block;">
					<div class="modal-dialog tc" style="margin-top:300px;">
						<img src="1_files/loading3.gif">
					</div>
				</div>
				<div class="modal-backdrop fade" style="background:#ffffff;"></div>
			</div>
						
		</div>
		<!--代码结束-->
		<jsp:include page="/Order/jsp/xiangQing.jsp"></jsp:include>
		<jsp:include page="/Order/jsp/page.jsp"></jsp:include>
	</body>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/Order/js/xiangqing.js"></script> --%>
</html>