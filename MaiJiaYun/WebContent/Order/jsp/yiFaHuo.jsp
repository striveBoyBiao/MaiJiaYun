<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<!-- saved from url=(0043)http://maijiayun.cn/dd/alreadyprintdelivery -->
<html
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit">
<meta name="keywords"
	content="供销平台,分销平台,分销,供销,货源,分销推荐,货源推荐,供销系统,分销系统,ERP,免费ERP,ERP软件,免费ERP软件,进销存,进销存软件,免费进销存软件">
<meta name="description"
	content="禾唐卖家云独一无二的供销平台，开启供销双方合作的桥梁，无安装，免培训，极致用户体验 。包含寻找优质分销商，一键发布货源信息，一键代发、批发进货轻松接单！让您与分销商的订单业务无缝衔接，供销双方实时互动 ，沟通协作业务拓展不再是难事。">
<meta http-equiv="X-UA-Compatible" content="IE=8,9,chrome=1">
<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>
</head>

<body class="" style="padding-right: 0px;">
	<!--代码开始-->
	<div class="container" id="container">
		<!--header 开始-->
		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>

		<%-- <script src="${pageContext.request.contextPath }/Order/js/myjs001.js" type="text/javascript" charset="utf-8"></script> --%>

		<!--header 结束-->
		<!--Layout left part star-->
		<!-- style="position: fixed;left:0, top:0, z-index:1030; display:none;" -->
		<!--<div class="sidebar-nav navbar-fixed-top" id="menu" style="display:none;"></div>-->
		<!--Layout left part end-->
		<!--Layout right part star-->
		<div class="content" id="content">
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0;">
				<div class="navbar-header">
					<a href="javascript:void(0)" class="navbar-brand ml20">打单发货</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<li id="li-waitFor" class="ml20 tab"><a
						href="${pageContext.request.contextPath }/servlet/order/orderServlet?method=faHuo"
						class="c6">待打单发货<span></span></a></li>
					<li id="li-already" class="tab active"><a href="${pageContext.request.contextPath }/servlet/order/orderServlet?method=yiFaHuo"
						class="">已发货</a></li>

					<jsp:include page="/Order/jsp/gaojisousuo.jsp"></jsp:include>
					<!---->
					
					<!---->
				</ul>
				</li>

				
				<!--search end-->
			</div>
			<!--panel star-->
			<div class="prl10auto" id="panel">
				<!--功能按钮 star-->
				<div class="btn-group-block">
					<button type="button" data-loading-text="正在打印...."
						class="btn btn-default mr5" id="printJH">打印拣货单</button>
					<button type="button" data-loading-text="正在打印...."
						class="btn btn-default mr5" id="printFH">打印发货单</button>
					<button type="button" data-loading-text="正在打印...."
						class="btn btn-default mr5" id="printKD">打印快递单</button>
				</div>
				<!--功能按钮 end-->
				<!--table star-->
				<div class="panel">
					<!-- Table -->

					<table class="table table-striped table-hover" id="orderTable">
						<jsp:include page="/Order/jsp/yiFaHuoLsz.jsp"></jsp:include>
						<tbody id="orderList">
							
							<!-- 此处写查询出来的数据 -->
							
								<tr>
								<td colspan="20" class="h30"
									style="border-bottom: 3px solid #cccccc; border-top: none">
									<span class="caret"></span> <span class="fb"> 更早 </span> <!-- <a href="javascript:void(0);">(100)</a> -->
								</td>
							</tr>
							<!-- 循环tr -->
							<c:forEach items="${pageInfo.orderInfos }" var="allInfo"> 
								<tr id="unAuditTr11655707" false="" orderid="11655707"
								class="order">
								<td false="" ><input type="checkbox" style="margin-right: 5px;"></td>
								<td "></td>
								<!-- 快递公司  -->
								<td false="" colname="expressCompanyName">${allInfo.logistic.logisticName }</td>
								<!--店铺名称  -->
								<td false="" colname="eShopName">${allInfo.shop.shopName }</td>
								<!-- 打印快递单 -->
								<td false="" colname="isExpressSheetPrinted">
									未打印											
								</td>
								<!-- 打印发货单 -->
								<td false="" colname="isDeliverySheetPrinted">
									未打印
								</td>
								<!-- 发货单号 -->
								<td false="" colname="deliveryCode">${allInfo.order.orderSendCode }</td>
								<!--快递单号  -->
								<td false="" colname="expressCode">${allInfo.order.orderExpressCode }</td>
								<!--订单号/下单时间  -->
								<td false="" colname="b2cCode/createTime"><a href="javascript:void(0);" class="show-order-detail">${allInfo.order.orderCode }</a><br>${allInfos[0].order.orderTime }</td>
								<!--买家姓名 -->
								<td false="" colname="customerName">${allInfo.buyer.buyerName }</td>
								<!--买家备注  -->
								<td false="" colname="buyerMemo">${allInfo.order.orderBuyerRemark }</td>
								<!--卖家备注  -->
								<td false="" colname="sellerMemo">${allInfo.order.orderSellerRemark }</td>
								
								<!--地址 -->
								<td false="" colname="receiverAddress">
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
								</c:choose></td>
								
								<!-- 数量  -->
								<td false="" colname="skuTotalQuantity">${allInfo.order.orderGoodNum}</td>
								<!--实付/运费  -->
								<td false="" colname="paymentAmount/buyerPostageFee">${allInfo.order.orderPayMent }
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
								
								<!--物流/运单号  -->
								<td false="" colname="expressCompanyName/expressCode">${allInfo.logistic.logisticName }/${allInfo.order.orderWaybill }</td>
								<td false="" colspan="2">
									<div class="btn-group">
										<button class="btn btn-default btn-sm show-order-detail" type="button" xiangQing="2" onclick="changeDetails(this)" >详情</button>
     								</div>	 			
								</td>
							</tr>
							<%-- <jsp:include page="/Order/jsp/info.jsp"></jsp:include> --%>
							</c:forEach>
							
							</tbody>
					</table>
					
					<jsp:include page="/Order/jsp/lieshezhi.jsp"></jsp:include>
					<!--table end-->
				</div>
				<!--panel end-->
				<!--分页 star-->
				<div class="row" style="margin: 0; -moz-user-select: none;"
					onselectstart="return false;" id="paging"></div>
				<!--分页 end-->
				<!-- Modal -->
				<!-- <div class="modal fade" id="tableModal" tabindex="-1" role="dialog" aria-labelledby="tableModalLabel" aria-hidden="true">
					</div>
					<div aria-hidden="true" aria-labelledby="setprintModalLabel" role="dialog" tabindex="-1" id="setprintModal" class="modal fade" style="display: none;">
					</div> -->
				<%-- <jsp:include page="/Order/jsp/lieshezhi.jsp"></jsp:include> --%>
				<!-- /.modal -->

				<!--打印快递单 star-->
				<div aria-hidden="true" aria-labelledby="expressdeliveryModalLabel"
					role="dialog" tabindex="-1" id="expressdeliveryModal"
					class="modal fade" style="display: none;">
					<div style="width: 400px;" class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button aria-hidden="true" data-dismiss="modal" class="close"
									type="button">×</button>
								<h4 id="expressdeliveryModalLabel" class="modal-title">是否打印快递公司LOGO</h4>
							</div>
							<div class="modal-body">
								<!--part one-->
								<form role="form">
									<div class="checkbox">
										<label> <input id="uplogo" type="checkbox" value="">签收联LOGO
										</label>
									</div>
									<div class="checkbox">
										<label> <input id="downlogo" type="checkbox" value="">留存联LOGO
										</label>
									</div>
								</form>
								<!--part one end-->
							</div>
							<div class="modal-footer">
								<button id="setPrintLogo" data-dismiss="modal"
									class="btn btn-default" type="button">确定</button>
								<button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!--打印快递单 end-->
			</div>
			<!--panel end-->
			
		</div>
		<div class="contentbox" id="contentbox"
			style="display: none; background: rgb(241, 241, 241);"></div>
		<!--Layout right part end-->

		<div id="spinner" style="display: none;">
			<div class="modal fade" aria-hidden="false" role="dialog"
				tabindex="-1" style="display: block;">
				<div class="modal-dialog tc" style="margin-top: 300px;">
					<img src="./img/loading3.gif">
				</div>
			</div>
			<div class="modal-backdrop fade" style="background: #ffffff;"></div>
		</div>

	</div>
	<!--代码结束-->
	<!--代码结束-->
<jsp:include page="/Order/jsp/xiangQing.jsp"></jsp:include>
<jsp:include page="/Order/jsp/page.jsp"></jsp:include>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/Order/js/xiangqing.js"></script>
</html>