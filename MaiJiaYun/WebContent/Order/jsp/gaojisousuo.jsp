<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/Order/css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/Order/css/font-awesome.min.css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath }/Order/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/Order/js/locales/bootstrap-datetimepicker.fr.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/Order/js/MyStrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/Order/js/daiShenHe.js"></script>
</head>
<body>
	<li class="dropdown pull-right" id="li-searchpro"><a
		href="javascript:void(0);" class="dropdown-toggle f12 blue c6"
		data-toggle="dropdown"
		style="padding: 0px 15px 0; background: none; border: none; font-weight: normal;"><b
			id="advanced">高级搜索 </b><b class="caret"></b></a>
		<ul class="dropdown-menu Adsearch-menu" style="width: 700px;"
			id="search-pro">
			<form method='post' action="${pageInfo.servletUri }">
				<li role="presentation" class="dropdown-header"
					data-stoppropagation="true" style="line-height: 20px;">常用查询
					<button type="button" id="close" class="close">×</button>
				</li>
				<li role="presentation" class="dropdown-header">
					<div class="navbar-form" role="input">
						<!-- Split button -->
						<!-- 店铺 -->
						<div class="btn-group mr5">
							<div class="left btn-group-text"
								style="margin-left: 21px; margin-top: 6px">店铺</div>
							<select name="shopId" class="form-control input-sm"
								id="eShopName" style="width: 95px;">
								<option value="">请选择</option>

								<c:forEach items="${pageInfo.shops }" var="shop">
									<option value="${shop.shopId }">${shop.shopName }</option>
								</c:forEach>
							</select>

						</div>

						<!-- 物流 -->
						<div class="btn-group mr5">
							<div class="left btn-group-text" style="margin-top: 6px;">物流公司</div>
							<select class="form-control input-sm" name="expressCompanyName"
								id="expressCompanyName" style="width: 100px;">
								<option value="">请选择</option>
								<c:forEach items="${pageInfo.logistics }" var="logistic">
									<option value="${logistic.logisticId }">${logistic.logisticName }</option>
								</c:forEach>

							</select>

						</div>

						<!-- 付款方式 -->
						<div class="btn-group mr5">
							<div class="left btn-group-text"
								style="margin-top: 6px; margin-left: 10px;">付款方式</div>
							<select class="form-control input-sm" style="width: 100px;"
								name="paymentMethod" id="paymentMethod">
								<option value="">全部</option>
								<option value="1">在线付款</option>
								<option value="2">货到付款</option>
							</select>
						</div>

						<!-- 订单号 -->
						<div class="form-group mr5">
							<div class="left btn-group-text">订单号</div>
							<div class="form-group" style="width: 95px;">
								<input id="b2cCode" name="b2cCode" type="text"
									class="form-control input-sm" placeholder="请输入订单号">
							</div>
						</div>
						<div class="form-group mr5">
							<div class="left btn-group-text">昵称</div>
							<div class="form-group" style="width: 135px;">
								<input id="customerNickName" name="customerNickName" type="text"
									class="form-control input-sm" placeholder="请输入昵称">
							</div>
						</div>
						<div class="form-group mr5">
							<div class="left btn-group-text" style="margin-left: 10px;">收货人</div>
							<div class="form-group" style="width: 95px;">
								<input id="receiverName" name="receiverName" type="text"
									class="form-control input-sm" placeholder="请输入收货人">
							</div>
						</div>
						<div class="form-group mr5">
							<div class="left btn-group-text" style="margin-left: 11px;">手机号</div>
							<div class="form-group" style="width: 100px;">
								<input id="receiverMobile" name="receiverMobile" value=""
									type="text" class="form-control input-sm" placeholder="请输入手机号">
							</div>
						</div>
						<div class="form-group mr5">
							<div class="left btn-group-text" style="margin-left: 11px;">电话</div>
							<div class="form-group" style="width: 95px;">
								<input id="receiverPhone" name="receiverPhone" type="text"
									class="form-control input-sm" placeholder="请输入电话">
							</div>
						</div>
						<div class="form-group">
							<div class="left btn-group-text">地址</div>
							<div class="form-group" style="width: 135px;">
								<input id="receiverAddress" name="receiverAddress" type="text"
									class="form-control input-sm" placeholder="请输入地址">
							</div>
						</div>

					</div>
				</li>
				<li role="presentation" class="dropdown-header"
					style="line-height: 20px;">商品查询</li>
				<li class="dropdown-header" role="presentation">
					<div role="input" class="navbar-form">
						<div class="btn-group mr5">
							<select style="width: 80px;" id="selIncludeGoods"
								name="selIncludeGoods" class="form-control input-sm">
								<option value="包含">包含</option>
								<option value="仅包含">仅包含</option>
							</select>
						</div>
						<div class="form-group  mr5">
							<div class="left btn-group-text">商品货号</div>
							<div style="width: 125px;" class="form-group">
								<input type="text" class="form-control input-sm" id="goodsCode"
									name="goodsCode">
							</div>
						</div>
						<div class="form-group mr5">
							<div class="left btn-group-text">sku编码</div>
							<div style="width: 125px;" class="form-group">
								<input type="text" class="form-control input-sm" id="skuCode"
									name="skuCode">
							</div>
						</div>
						<div class="form-group ">
							<div class="left btn-group-text">商品名称</div>
							<div style="width: 125px;" class="form-group">
								<input type="text" class="form-control input-sm" id="goodsTitle"
									name="goodsTitle">
							</div>
						</div>
						<div class="form-group  mr5">
							<div class="left btn-group-text">商品数量</div>
							<div style="width: 80px;" class="form-group">
								<input type="text" class="form-control input-sm" id="goodsNum"
									name="goodsNum">
							</div>
						</div>
					</div>
				</li>

				<li role="presentation" class="dropdown-header"
					style="line-height: 20px;">备注查询</li>
				<li role="presentation" class="dropdown-header">
					<div class="navbar-form" role="input">
						<!-- Split button -->
						<div>
							<div class="btn-group mr5">
								<div class="left btn-group-text" style="margin-top: 5px;">买家备注</div>
								<select id="hasBuyerMemo" name="hasBuyerMemo"
									class="form-control input-sm" style="width: 233px;">
									<option value="">请选择</option>
									<option value="1">有买家备注</option>
									<option value="2">无买家备注</option>
								</select>

							</div>
							<div class="form-group ">
								<div class="form-group" style="width: 343px;">
									<input id="buyerMemo" name="buyerMemo" type="text"
										class="form-control input-sm" placeholder="请输入关键字"
										style="display: none;">
								</div>
							</div>
						</div>
						<div>
							<div class="btn-group mr5">
								<div class="left btn-group-text" style="margin-top: 5px;">卖家备注</div>
								<select id="hasSellerMemo" name="hasSellerMemo"
									class="form-control input-sm" style="width: 233px;">
									<option value="">请选择</option>
									<option value="1">有卖家备注</option>
									<option value="2">无卖家备注</option>
								</select>

							</div>
							<div class="form-group ">
								<div class="form-group" style="width: 343px;">
									<input id="sellerMemo" name="sellerMemo" type="text"
										class="form-control input-sm" placeholder="请输入关键字"
										style="display: none;">
								</div>
							</div>
						</div>
					</div>
				</li>
				<li role="presentation" class="dropdown-header">
					<div class="panel-group" id="accordion">
						<div class="panel">
							<div class="panel-heading" style="padding: 0">
								<h4 class="panel-title" style="line-height: 25px;">
									<a id="moreSearchBtn" class="f14 fb" data-toggle="collapse"
										data-parent="#accordion" href="javascript: void(0);"> <b
										id="moreSearchIcon" class="caret_down"></b> 更多查询条件
									</a>
								</h4>
							</div>
							
							<div id="collapseOne" class="panel-collapse collapse in"
								show="ture">
								<div class="navbar-form" role="input">
									<!-- Split button -->
									<div style="padding: 3px 0px;">
										<div>
											<div role="search" class="form-group mr20">
												<!--时间控件 star-->
												<div class="left btn-group-text" style="padding-top: 3px;">下单时间</div>
												<div class="form-group w170">
													<div class="input-append date form_datetime">
														<input
															style="height: 25px; cursor: not-allowed; line-height: 25px; text-align: center;"
															size="16" id="orderTimeFrom" name="orderTimeFrom"
															type="text" value="" disabled="disabled"> <span
															class="add-on"><i class="icon-calendar"></i></span>
													</div>

												</div>
												<div class="form-group">—</div>
												<div class="form-group w170">
													<div class="input-append date form_datetime">
														<input
															style="height: 25px; cursor: not-allowed; line-height: 25px; text-align: center;"
															size="16" id="orderTimeTo" name="orderTimeTo" type="text"
															value="" disabled="disabled"> <span
															class="add-on"><i class="icon-calendar"></i></span>
													</div>
												</div>
											</div>
										</div>
										<div>
											<div role="search" class="form-group mr20">
												<!--时间控件 star-->
												<div class="left btn-group-text">审单时间</div>
												<div class="form-group w170">
													<div class="input-append date form_datetime">
														<input
															style="height: 25px; cursor: not-allowed; line-height: 25px; text-align: center;"
															size="16" id="orderExaTimeFrom" name="orderExaTimeFrom"
															type="text" value="" disabled="disabled"> <span
															class="add-on"><i class="icon-calendar"></i></span>
													</div>
												</div>
												<div class="form-group">—</div>
												<div class="form-group w170">
													<div class="input-append date form_datetime">
														<input
															style="height: 25px; cursor: not-allowed; line-height: 25px; text-align: center;"
															size="16" id="orderExaTimeTo" name="orderExaTimeTo"
															type="text" value="" disabled="disabled"> <span
															class="add-on"><i class="icon-calendar"></i></span>
													</div>
												</div>
											</div>
										</div>
										<div>
											<div role="search" class="form-group mr20">
												<!--时间控件 star-->
												<div class="left btn-group-text">发货时间</div>
												<div class="form-group w170">
													<div class="input-append date form_datetime">
														<input
															style="height: 25px; cursor: not-allowed; line-height: 25px; text-align: center;"
															size="16" id="orderSendTimeFrom" name="orderSendTimeFrom"
															type="text" value="" disabled="disabled"> <span
															class="add-on"><i class="icon-calendar"></i></span>
													</div>
												</div>
												<div class="form-group">—</div>
												<div class="form-group w170">
													<div class="input-append date form_datetime">

														<input
															style="height: 25px; cursor: not-allowed; line-height: 25px; text-align: center;"
															size="16" id="orderSendTimeTo" name="orderSendTimeTo"
															type="text" value="" disabled="disabled"> <span
															class="add-on"><i class="icon-calendar"></i></span>
													</div>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li role="presentation" class="dropdown-header"><button
						type="submit" class="btn btn-primary search">查询订单</button></li>
			</form>
		</ul>
	</li>
	<script type="text/javascript">
			$(".form_datetime").datetimepicker({
				format: "yyyy-mm-dd hh:ii:ss",
				autoclose: true,
				todayBtn: true,
				pickerPosition: "bottom-left"
			});
		</script>
	<li class="pull-right" id="li-query" style="padding-top: 12px;">
		<div class="w340">
			<div class="input-group">
				<input name="q" type="text" class="form-control"
					placeholder="店铺名/物流公司名/订单号/买家姓名/买家旺旺号/发货单号"> <span
					class="input-group-btn">
					<button type="button" class="btn btn-primary query">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</span>
			</div>
		</div>
	</li>
	
</body>
</html>