<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<!-- saved from url=(0028)http://maijiayun.cn/sd/split -->
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

<body>
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
			<!--titletab star-->
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0;">
				<div class="navbar-header">
					<a href="http://maijiayun.cn/#" class="navbar-brand ml20">审单</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<li id="li-wait" class="ml20 tab"><a
						href="${pageContext.request.contextPath}/servlet/order/orderServlet?method=shenHe"
						class="c6">待审核 <span></span></a></li>
					<li id="li-merge" class="tab"><a class="c6"
						href="${pageContext.request.contextPath}/servlet/order/orderServlet?method=heBing">待合并
							<span></span>
					</a></li>
					<li id="li-split" class="tab active"><a class=""
						href="${pageContext.request.contextPath}/servlet/order/orderServlet?method=chaiFen">待拆分
							<span></span>
					</a></li>

					<li class="dropdown pull-right" id="li-searchpro"
						style="display: none;"><a href="javascript:void(0);"
						class="dropdown-toggle f12 blue c6" data-toggle="dropdown"
						style="padding: 0px 15px 0; background: none; border: none; font-weight: normal;">高级搜索
							<b class="caret"></b>
					</a>
						<ul class="dropdown-menu Adsearch-menu" style="width: 700px;"
							id="search-pro"></ul></li>

					<li class="pull-right" id="li-query"
						style="padding-top: 12px; display: none;">
						<div class="w340">
							<div class="input-group">
								<input name="q" type="text" class="form-control"
									placeholder="店铺名/物流公司名/订单号/买家姓名/买家旺旺号"> <span
									class="input-group-btn">
									<button type="button" class="btn btn-primary query">
										<span class="glyphicon glyphicon-search"></span>
									</button>
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
				<!-- <div class="btn-group-block">
  <div class="modal fade" id="splitModal" tabindex="-1" role="dialog" aria-labelledby="splitModalLabel" aria-hidden="true">
  </div>
</div> -->
				<!--手工拆单 star-->
				<!--手工拆单 end-->
				<!--功能按钮 end-->
				<!--table star-->
				<div class="panel">
					<div class="panel mt15">
						<!-- Table -->
						
						<table class="table table-striped table-hover" id="orderTable">
							<jsp:include page="/Order/jsp/shenHeLsz.jsp"></jsp:include>
							<tbody id="orderList">
							
							<!-- 此处写查询出来的数据 -->
							
								<tr>
								<td colspan="42" class="h30"
									style="border-bottom: 3px solid #cccccc; border-top: none">
									<span class="caret"></span> <span class="fb"> 更早 </span> <!-- <a href="javascript:void(0);">(100)</a> -->
								</td>
							</tr>
							<!-- 循环tr -->
							<c:forEach items="${pageInfo.orderInfos }" var="allInfo"> 
							
							
							<tr id="unAuditTr11655707" false="" orderid="11655707"
								class="order">
								<td false="" ><input
									type="checkbox" style="margin-right: 5px;"></td>
								<td "></td>
								
								<!--订单号/下单时间  -->
								<td false="" colname="b2cCode/createTime"
									><a
									href="javascript:void(0);" class="show-order-detail">${allInfo.order.orderCode }</a><br>${allInfos[0].order.orderTime }</td>
								<!--买家姓名 -->
								<td false="" colname="customerName"
									>${allInfo.buyer.buyerName }</td>
								<!--买家备注  -->
								<td false="" colname="buyerMemo"
									>${allInfo.order.orderBuyerRemark }</td>
								<!--卖家备注  -->
								<td false="" colname="sellerMemo"
									>${allInfo.order.orderSellerRemark }</td>
								<!--店铺名称  -->
								<td false="" colname="eShopName"
									>${allInfo.shop.shopName }</td>
								<!--地址 -->
								<td false="" colname="receiverAddress"
									><c:choose>
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
								<!-- 快递公司  -->
								<td false="" colname="expressCompanyName">
									<!-- ems -->${allInfo.logistic.logisticName }</td>
								<!-- 数量  -->
								<td false="" colname="skuTotalQuantity"
									>
									${allInfo.order.orderGoodNum}</td>
								<!--实付/运费  -->
								<td false="" colname="paymentAmount/buyerPostageFee"
									>${allInfo.order.orderPayMent }
									/ ${allInfo.order.orderFreight }</td>
								<!--买家手机号  -->
								<td false="" colname="receiverMobile"
									>${allInfo.buyer.buyerPhone }</td>
								<!--买家电话号  -->
								<td false="" colname="receiverPhone"
									>${allInfo.buyer.buyerTel }</td>
								<!--买家姓名  -->
								<td false="" colname="receiverName"
									>${allInfo.buyer.buyerName }</td>
								<!--付款时间  -->
								<td false="" colname="paymentTime"
									>${allInfo.order.orderPayTime }</td>
								<!--审单时间  -->
								<td false="" colname="auditTime"
									>${allInfo.order.orderExaTime }</td>
								<!--发货时间  -->
								<td false="" colname="deliveryTime"
									>${allInfo.order.orderSendTime }</td>
								<!--快递单号  -->
								<td false="" colname="expressCode"
									>${allInfo.order.orderExpressCode }</td>
								<!--物流/运单号  -->
								<td false="" colname="expressCompanyName/expressCode">${allInfo.logistic.logisticName }/${allInfo.order.orderWaybill }</td>
								<td false="" colspan="2">
									<div class="btn-group">
										<button class="btn btn-default btn-sm show-order-detail" type="button" xiangQing="2" onclick="changeDetails(this)" >详情</button>
     								</div>	 			
								</td>
							</tr>
							</c:forEach>
							<%-- <jsp:include page="/Order/jsp/info.jsp"></jsp:include> --%>
							</tbody>
						</table>
						<!-- 模态框 -->
						<jsp:include page="/Order/jsp/lieshezhi.jsp"></jsp:include>
					
					</div>
				<!--table end-->
				</div>
				<!--分页 star-->
				<div class="row" style="margin: 0; -moz-user-select: none;"
					onselectstart="return false;" id="paging"></div>
				<!--分页 end-->
				<!-- Modal -->
				<div class="modal fade" id="tableModal" tabindex="-1" role="dialog"
					aria-labelledby="tableModalLabel" aria-hidden="true"></div>
				<!-- /.modal -->
				<div class="modal fade" id="splitModal" tabindex="-1" role="dialog"
					aria-labelledby="splitModalLabel" aria-hidden="true"></div>
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
					<img src="img/loading3.gif">
				</div>
			</div>
			<div class="modal-backdrop fade" style="background: #ffffff;"></div>
		</div>
	</div>
	<!--代码结束-->
</body>

</html>