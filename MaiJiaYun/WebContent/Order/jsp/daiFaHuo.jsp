<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<!-- saved from url=(0036)http://maijiayun.cn/dd/printdelivery -->
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
<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<!-- <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../css/global.css">
<link rel="stylesheet" type="text/css" href="../css/iconfont.css">
<link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon"> -->

<!-- <script type="text/javascript" charset="UTF-8" src="../js/jquery.js"></script>
<script type="text/javascript" charset="UTF-8" src="../js/bootstrap.js"></script> -->
<script type="text/javascript" charset="UTF-8"
	src="${pageContext.request.contextPath}/Order/js/daiFaHuo.js"
	langage="javaScript"></script>
<!--日期插件-->
</head>

<body class="" style="padding-right: 0px;">
	<!--代码开始-->
	<div class="container" id="container">
		<!--header 开始-->
		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
		<script src="${pageContext.request.contextPath }/Order/js/myjs001.js"
			type="text/javascript" charset="utf-8"></script>
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
					<a href="javascript:void(0);" class="navbar-brand ml20">打单发货</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<li id="li-waitFor" class="ml20 tab active"><a
						href="${pageContext.request.contextPath }/servlet/order/orderServlet?method=faHuo"
						class="">待打单发货<span></span></a></li>
					<li id="li-already" class="tab"><a
						href="${pageContext.request.contextPath }/servlet/order/orderServlet?method=yiFaHuo"
						class="c6">已发货</a></li>

					<jsp:include page="/Order/jsp/gaojisousuo.jsp"></jsp:include>
					<!---->

					<!---->
				</ul>
				<!--search end-->
			</div>
			<!--panel star-->
			<div class="prl10auto" id="panel">
				<div id="uploadWaitingModel"></div>
				<div id="LODOP_DIV">
					<!--功能按钮 star-->
					<object id="LODOP"
						classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width="0"
						height="0">
						<embed id="LODOP_EM" type="application/x-cainiaoprint" width="0"
							height="0">
					</object>
					<div class="btn-group-block">
						<button  id="printJH" type="button"
							data-loading-text="正在打印...." class="btn btn-default mr5">打印拣货单</button>
						<button id="printFH" type="button" data-loading-text="正在打印...."
							class="btn btn-default mr5">打印发货单</button>
						<button id="printKD" type="button" data-loading-text="正在打印...."
							class="btn btn-default mr5">打印快递单</button>
						<!--修改快递单号 star-->
						<button onclick="setOrder()" id="editExpress" type="button" class="btn btn-default mr5"
							data-toggle="modal" data-target="#expressModal">批量生成快递单号</button>
						<!--修改快递单号 end-->
						<div class="btn-group mr5 dropdown" id="deliveryDiv">
							<button type="button" id="yijianfahuo" class="btn btn-default"
								data-toggle="modal" data-target="#splitModal">一键发货</button>
							<button id="showDeliveryErrorStatus" data-toggle="dropdown"
								class="btn btn-default dropdown-toggle" type="button">
								<span class="glyphicon glyphicon-share mr5"></span><span
									id="deliveryingOrderCount" class="f10" style="display: none;"></span>
							</button>
							<div id="oneKeyDeliveryStatus"
								style="width: 550px; height: 300px;" role="menu"
								class="dropdown-menu scrollspy-example"
								aria-labelledby="showDeliveryErrorStatus"></div>
						</div>
						<input type="checkbox" id="quanbuzhankai"><span
							class="f14">展开全部</span> <span style="height: 20px; width: auto"
							class="pull-right f16 red"><a href="javascript:void(0);"><img
								src="${pageContext.request.contextPath }/Order/img/dzmd.jpg" /></a></span>
					</div>
					<!--功能按钮 end-->

					<!-- 批量生成快递单号功能模态框实现 -->
					<div class="modal fade in" id="expressModal" tabindex="-1"
						role="dialog" aria-labelledby="expressModalLabel"
						aria-hidden="false">
						<div class="modal-dialog" style="width: 800px;">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="expressModalLabel">快递单号联想</h4>
								</div>
								<div class="modal-body">
									<!--part two-->
									<div class="tl lh30 scrollspy-example" style="height: 400px;">
										<table class="table table-striped table-hover"
											style="margin-bottom: 0">
											<thead class=" table-bordered">
												<tr>
													<th>序号</th>
													<th>订单编号</th>
													<th>买家昵称</th>
													<th>收货人姓名</th>
													<th>快递单号</th>
												</tr>
											</thead>
											<tbody style="font-weight: normal" id="orderExpressCode">
												<!-- onmouseover -->

											</tbody>
										</table>
									</div>
									<!--part two end-->
								</div>
								<div class="modal-footer" style="margin-top: 0">
									<button id="btnSave" type="button" class="btn btn-primary">保存</button>
									<button id="btnReset" type="button" class="btn btn-default">重置</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">取消</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
					</div>


					<!--table star-->
					<div class="panel">
						<!-- Table -->
						<table class="table table-striped table-hover" id="orderTable">
							<jsp:include page="/Order/jsp/daiFaHuoLsz.jsp"></jsp:include>
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


									<tr false="" orderid="${allInfo.order.orderCode }"
										class="order">
										<td false=""><input
											orderid="${allInfo.order.orderSendCode }" type="checkbox"
											style="margin-right: 5px;"></td>
										<td></td>

										<!-- 仓库 -->
										<td false="" colname="deliveryWarehouseName">默认仓库</td>

										<!-- 打印发货单 -->
										<td false="" colname="isDeliverySheetPrinted">未打印</td>

										<!-- 打印快递单 -->
										<td false="" colname="isExpressSheetPrinted">未打印</td>

										<!-- 发货单号 -->
										<td false="" colname="deliveryCode">${allInfo.order.orderSendCode }</td>

										<!--订单号/下单时间  -->
										<td false="" colname="b2cCode/createTime"><a
											href="javascript:void(0);" class="show-order-detail">${allInfo.order.orderCode }</a><br>${allInfos[0].order.orderTime }</td>
										<!--买家姓名 -->
										<td false="" colname="customerName">${allInfo.buyer.buyerName }</td>
										<!--买家备注  -->
										<td false="" colname="buyerMemo">${allInfo.order.orderBuyerRemark }</td>
										<!--卖家备注  -->
										<td false="" colname="sellerMemo">${allInfo.order.orderSellerRemark }</td>
										<!--店铺名称  -->
										<td false="" colname="eShopName">${allInfo.shop.shopName }</td>
										<!--地址 -->
										<td false="" colname="receiverAddress"><c:choose>
												<c:when test="${fn:length(allInfo.buyer.buyerAddress)<10 }">
											${fn:substring(allInfo.buyer.buyerAddress, 0,fn:length(allInfo.buyer.buyerAddress))}
										</c:when>
												<c:when test="${fn:length(allInfo.buyer.buyerAddress)<20 }">
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
										<td false="" colname="skuTotalQuantity">
											${allInfo.order.orderGoodNum}</td>
										<!--实付/运费  -->
										<td false="" colname="paymentAmount/buyerPostageFee">${allInfo.order.orderPayMent }
											/ ${allInfo.order.orderFreight }</td>
										<!--买家手机号  -->
										<td false="" colname="receiverMobile">${allInfo.buyer.buyerPhone }</td>
										<!--买家电话号  -->
										<td false="" colname="receiverPhone">${allInfo.buyer.buyerTel }</td>
										<!--买家姓名  -->
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
										<td false="" colspan="2">
											<div class="btn-group">
												<button class="btn btn-default btn-sm show-order-detail"
													type="button" xiangQing="2" onclick="changeDetails(this)">详情</button>
											</div>
										</td>
									</tr>
								</c:forEach>
								<%-- <jsp:include page="/Order/jsp/info.jsp"></jsp:include> --%>
							</tbody>
						</table>
						<!-- 模态框 -->
						<jsp:include page="/Order/jsp/lieshezhi.jsp"></jsp:include>
						<!--table end-->
					</div>
					<!--panel end-->
					<!--分页 star-->
					<div class="row" style="margin: 0; -moz-user-select: none;"
						onselectstart="return false;" id="paging"></div>
					<!--分页 end-->
				</div>
			</div>
			<!--panel end-->
		</div>
	</div>
	<!--代码结束-->
	
	<!-- 这个是快递单号生成模态框表格html -->
	<table>
		<tbody id="trhtml">
			<tr class="mouse-show" name="tr_order" number="1" orderid="1">
				<td>1</td>
				<td>1</td>
				<td class="fb">1</td>
				<td>1</td>
				<td>
					<div role="form" class="form-inline" id="lxparent">
						<div class="form-group mr10">
							<input id="express1" type="input" placeholder="请输入起始快递单号"
								class="form-control">
						</div>
						<!-- 鼠标悬浮时class改变为"form-group showandhidden" -->
						<div name="lx" class="form-group showandhidden sr-only"
							serialnumber="1">
							<div class="form-group mr10" name="onthe">
								<a href="javascript:void(0);" rel="tooltip"
									data-original-title="向下联想"><i
									class="glyphicon glyphicon-arrow-down"></i></a>
							</div>
							<div class="form-group" name="underthe">
								<a href="javascript:void(0);" rel="tooltip"
									data-original-title="向上联想"><i
									class="glyphicon glyphicon-arrow-up"></i></a>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</tbody>
	</table>




	<jsp:include page="/Order/jsp/xiangQing.jsp"></jsp:include>
	<jsp:include page="/Order/jsp/page.jsp"></jsp:include>
</body>
</html>