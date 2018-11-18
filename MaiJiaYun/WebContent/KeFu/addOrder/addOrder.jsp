<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新增订单</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/KeFu/addOrder/myjs/myjs.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Common/css/bootstrap-select.css">
<body>
	<!--代码开始-->
	<div class="container" id="container">
		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
		<!--Layout left part star-->
		<!-- style="position: fixed;left:0, top:0, z-index:1030; display:none;" -->
		<!--<div class="sidebar-nav navbar-fixed-top" id="menu" style="display:none;"></div>-->
		<!--Layout left part end-->
		<!--Layout right part star-->
		<div class="content" id="content">
			<div id="uploadWaitingModel"></div>
			<!--titletab star-->
			<div class="collapse navbar-collapse navbar-default navbar-titletab" style="padding: 0px 0 0 0; background: #ffffff;">
				<div class="navbar-header">
					<a href="#" class="navbar-brand ml20">新增订单</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<!--<li class="active ml20 tab"><a href="#" style="background:#f1f1f1;">新增订单</a></li>-->
				</ul>
			</div>
			<!--titletab end-->
			<!--panel star-->
			<div class="prl10auto">
				<!--star-->
				<div class="panel prl10auto mt15">
					<div class="row">
						<div class="col-md-12">
							<form role="form" class="form-inline">
								<div class="form-group">订单类型：</div>
								<div class="form-group">
									<div class="btn-group">
										<button class="btn btn-default" type="button" id="btnOrderType">普通订单</button>
										<button style="height: 34px;" data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
											<span class="caret"></span>
										</button>
										<ul style="min-width: 100px;" role="menu" class="dropdown-menu" id="selOrderType">
											<li><a href="javascript:void(0)" onclick="putongdingdan()">普通订单</a></li>

											<li><a onclick="daixiaodingdan()">代销订单</a></li>

										</ul>
									</div>
								</div>
							</form>
						</div>
						<!---->
					</div>
				</div>
				<!--end-->
				<!--star-->
				<div class="panel prl10auto mt15">
					<h5 class="fb">订单信息</h5>

					<div class="row mt15 ">
						<div class="col-md-3">
							<form role="form" class="form-inline">
								<div class="form-group">
									店铺名称：
									<div class="form-group">
										<div id="addOrder_dianpu" style="width: 100px;" class="btn-group bootstrap-select">
											<button onclick="shopQuery()" title="4545542" data-id="eshopId" type="button" class="btn dropdown-toggle selectpicker btn-default" data-toggle="dropdown">
												<span class="filter-option pull-left">店铺名</span>&nbsp;<span class="caret"></span>
											</button>
											<div style="min-width: 0px;" class="dropdown-menu open">
												<ul class="dropdown-menu inner selectpicker" role="menu">

												</ul>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
						<!---->
						<div class="col-md-3">
							<form role="form" class="form-inline">
								<div class="form-group" style="padding-left: 36px;">付款方式：</div>
								<div class="form-group">
									<div style="width: 88px;" class="btn-group bootstrap-select">
										<button title="先付款" data-id="payType" type="button" class="btn dropdown-toggle selectpicker btn-default" data-toggle="dropdown">
											<span id="fukuanfangshiText" class="filter-option pull-left">先付款</span>&nbsp;<span class="caret"></span>
										</button>
										<div style="min-width: 0px;" class="dropdown-menu open">
											<ul class="dropdown-menu inner selectpicker" role="menu">
												<li onclick="xianfukuan()" class="selected" rel="0"><a tabindex="0" class="" style=""><span class="text">先付款</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li>
												<li onclick="huodaofukuan()" rel="1"><a tabindex="0" class="" style=""><span class="text">货到付款</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
							</form>
						</div>

						<!--线下店铺订单号-->
						<div class="col-md-3">
							<form role="form" class="form-inline">
								<div class="form-group">订单号：</div>
								<div class="form-group">
									<input name="b2cCode" ordertype="b2cCode" class="form-control" id="b2cCode" placeholder="未填则为系统默认单号" type="text"> <span id="b2cCodeSpan" style="color: red;"></span>
								</div>
							</form>
						</div>
					</div>
					<div class="row mt15 mb20">
						<div class="col-md-3">
							<form role="form" class="form-inline">
								<div class="form-group">快递公司：</div>
								<div class="form-group">
									<div id="express" style="width: 124px;" class="btn-group bootstrap-select">
										<button data-id="expressId" type="button" class="btn dropdown-toggle selectpicker btn-default" data-toggle="dropdown">
											<span class="filter-option pull-left">快递</span>&nbsp;<span class="caret"></span>
										</button>
										<div style="min-width: 0px;" class="dropdown-menu open">
											<ul class="dropdown-menu inner selectpicker" role="menu">

											</ul>
										</div>
									</div>
								</div>
							</form>
						</div>
						<!---->
						<div class="col-md-3">
							<form role="form" class="form-inline">
								<div class="form-group">
									订单优惠（元）<span class="red f16">*</span> ：
								</div>
								<div class="form-group">
									<input onfocusout="moneyCheck(this)" name="discountFee" ordertype="discountFee" class="form-control float" id="orderFee" placeholder="输入金额,如:0" type="text" />
								</div>
							</form>
						</div>
						<!---->
						<div class="col-md-3">
							<form role="form" class="form-inline">
								<div class="form-group">
									运费（元）<span class="red f16">*</span> ：
								</div>
								<div class="form-group">
									<input onfocusout="moneyCheck(this)" name="buyerPostageFee" ordertype="buyerPostageFee" class="form-control" id="yunfei" placeholder="输入金额,如:0" type="text">
								</div>
							</form>
						</div>
					</div>

					<div class="row mt15 mb20">
						<div class="col-md-12">
							<form role="form" class="form-inline">
								<div class="form-group">卖家备注：</div>
								<div class="form-group" style="width: 520px;">
									<input ordertype="sellerMemo" class="form-control" id="maijiabeizhu" placeholder="" type="text">
								</div>
							</form>
						</div>
					</div>
				</div>
				<!--end-->
				<!--star-->
				<div class="panel prl10auto">
					<h5 class="fb">客户信息</h5>
					<div class="row mt15 ">
						<!---->
						<div class="col-md-3">
							<form class="form-inline" role="form">
								<div class="form-group" style="margin-left: 15px;">
									收货人<span class="red f16">*</span> ： 
								</div>
								<div class="form-group">
									<input onchange="customerTextChange()" name="receiverName" ordertype="receiverName" class="form-control" placeholder="" type="text">
								</div>
								<div class="form-group">
									<a state="true" onclick="listOfCustomers()" href="###" id="btnAddCustomer" data-target="#addCustomerModal" data-toggle="modal">选择客户</a>
								</div>
							</form>
						</div>
					</div>
					<div class="row mt15">

						<div class="col-md-3">
							<form role="form" class="form-inline">
								<div class="form-group" style="margin-left: 15px;">
									手机号<span class="red f16">*</span> ：
								</div>
								<div class="form-group">
									<input onchange="customerTextChange()" onfocusout="phoneNumberCheck(this)" name="receiverMobile" ordertype="receiverMobile" class="form-control mobile" placeholder="" type="text">
								</div>
							</form>
						</div>
						<!---->
						<div class="col-md-3">
							<form role="form" class="form-inline">
								<div class="form-group" style="margin-left: 15px;">电话号：</div>
								<div class="form-group">
									<input onchange="customerTextChange()" onfocusout="phoneNumberCheck(this)" name="receiverPhone" ordertype="receiverPhone" class="form-control" placeholder="" type="text">
								</div>
							</form>
						</div>
						<div class="col-md-3">
							<form role="form" class="form-inline">
								<div class="form-group" style="margin-left: 25px;">
									邮编<span class="red f16">*</span> ：
								</div>
								<div class="form-group">
									<input onchange="customerTextChange()" onfocusout="youbianCheck(this)" name="receiverZip" id="receiverZip" ordertype="receiverZip" class="form-control postcode" placeholder="" type="text">
								</div>
							</form>
						</div>
						<!---->
						<jsp:include page="addcustomer.jsp"></jsp:include>
					</div>

					<div class="row mt15">
						<div class="col-md-12">
							<form role="form" class="form-inline">
								<div class="btn-group mr10 select" title="省" id="receiverState" name="receiverState" val="省">
									<div class="left btn-group-text">
										详细地址<span class="red f16">*</span>
									</div>
									<button class="btn btn-default" type="button">省</button>
									<button onclick="appendSheng('sheng')" style="height: 34px;" data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
										<span class="caret"></span> <span class="sr-only">Toggle Dropdown</span>
									</button>
									<ul style="min-width: 96px; left: 65px; height: 120px;" role="menu" class="dropdown-menu scrollspy-example">
									
									</ul>
									<input name="province" type="hidden">
								</div>
								<div class="btn-group mr10 select" title="市" id="receiverCity" name="receiverCity" val="">
									<button class="btn btn-default" type="button">市</button>
									<button onclick="appendSheng('city')" style="height: 34px;" data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
										<span class="caret"></span> <span class="sr-only">Toggle Dropdown</span>
									</button>
									<ul style="min-width: 96px; left: 0px; height: 120px;" role="menu" class="dropdown-menu scrollspy-example">

									</ul>
									<input name="city" type="hidden">
								</div>
								<div class="btn-group mr10 select" title="区/县" id="receiverDistrict" name="receiverDistrict" val="">
									<button class="btn btn-default" type="button">区</button>
									<button onclick="appendSheng('district')" style="height: 34px;" data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
										<span class="caret"></span> <span class="sr-only">Toggle Dropdown</span>
									</button>
									<ul style="min-width: 96px; left: 0px; height: 120px;" role="menu" class="dropdown-menu scrollspy-example">

									</ul>
									<input name="region" value="" type="hidden">
								</div>
								<div class="form-group mr20">
									<div style="width: 300px;" class="form-group">
										<input onchange="customerTextChange()" ordertype="receiverStreet" class="form-control" type="text">
									</div>
								</div>

							</form>

						</div>
					</div>
				</div>
				<!--end-->
				<!--star-->
				<div class="panel prl10auto" style="margin-bottom: 0px;" id="divShowSkuBySelType">
					<h5>
						<form role="form" class="form-inline">
							<div class="form-group mr40 fb">商品信息</div>
						</form>
					</h5>
					<div class="row mt15 ">
						<form role="form" class="form-inline">
							<div class="form-group">发货仓库：</div>
							<div class="form-group">
								<select id="warehouseId" ordertype="deliveryWarehouseId" class="selectpicker" data-width="auto">

								</select>
							</div>
							<a onclick="listOfProducts()" href="###" id="showSkus" style="padding-left: 20px;" data-target="#addqualitytModal" data-toggle="modal"><span class="glyphicon glyphicon-plus"></span> 添加商品<span class="red f16">*</span></a>
						</form>
					</div>
					<!---->
					<jsp:include page="addqualityModel.jsp"></jsp:include>
					<!---->
					<div class="row mt15" style="padding-bottom: 20px;" id="skuPanel">
						<div class='well well-lg tc' style='margin-bottom: 20px;'>请添订单商品</div>
					</div>

				</div>
				<!--end-->
				<div class="panel prl10auto" style="margin-bottom: 0px;">
					<h5>
						<form role="form" class="form-inline">
							<div class="form-group mr40 fb">合计</div>
						</form>
					</h5>
					<div class="row mt15" style="padding-bottom: 20px;" id="totalFeeDiv">
						<table style="margin-bottom: 0" class="table table-striped">

							<tbody>
								<tr style="background: #dcdcdc; border: 1px solid #dcdcdc;">
									<td colspan="3"></td>
									<td class="fb">共计<span id="skuTotalQuantity" class="red">0</span>件商品
									</td>

									<td class="fb" id="skuTotalFee" style="width: 500px;">商品总金额<span class="red">0</span>元 - 订单优惠<span class="red">0</span>元 - 商品总优惠<span id="skuTotalDiscount" class="red">0</span>元 = <span class="red">0</span>元
									</td>
									<td class="fb">实付<span class="red">0</span>元
									</td>
									<td style="display:none" id="orderWeight"></td>
									<td colspan="3"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!--panel end-->
			<div style="padding: 20px 10px 40px 10px">
				<a data-original-title="点击该按钮订单提交到审核环节" rel="tooltip"><button id="saveAuditOrder" type="button" class="btn btn-primary mr5" onclick="submitOrder()">提交审核</button></a> <a href="${pageContext.request.contextPath}/servlet/kefu/ddcx"><button type="button" class="btn btn-default">取消</button></a>
			</div>
		</div>
		<div class="contentbox" id="contentbox" style="background: rgb(241, 241, 241) none repeat scroll 0% 0%; display: none;"></div>
	</div>
	<!--代码结束-->
	<div id="warningComp" class="bootbox modal fade bootbox-alert in" tabindex="-1" role="dialog" aria-hidden="false" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true" style="margin-top: -10px;">×</button>
					<div id="warningText" class="bootbox-body">请选择要添加的商品!</div>
				</div>
				<div class="modal-footer">
					<button data-bb-handler="ok" type="button" class="btn btn-primary" onclick="okWarningHide()">OK</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>