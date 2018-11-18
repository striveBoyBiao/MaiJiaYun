<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/Order/js/xiangqing.js"></script> --%>
</head>
<body>
<!--代码结束-->
	<table id="xqHtml" style="display: none">
		<tr class="order-detail">
			<td colspan="42" height="290px" style="padding: 0px;">
				<div class="btn-group" data-toggle="buttons"
					style="padding: 10px 8px;">
					<label class="btn btn-default" id="label-kh" class="label-kh">
						<input type="radio" id="option-kh"> 客户信息
					</label> <label class="btn btn-default active" id="label-sp"
						class="label-sp"> <input type="radio" id="option-sp">
						商品信息
					</label> <label class="btn btn-default " id="label-jy" class="label-jy">
						<input type="radio" id="option-jy"> 交易信息
					</label> <label class="btn btn-default" id="label-bz" class="label-bz">
						<input type="radio" id="option-bz"> <span
						style="padding: 0px 12px; display: block">备注</span>
					</label>
				</div> <!--客户信息 star-->
				<form role="input" class="navbar-form"
					style="padding: 0px 8px; height: 205px; display: none;"
					id="form-kh">
					<!-- Split button -->
					<div class="mb20 pt10">
						<div class="form-group mr20">
							<div class="left btn-group-text">用户名称</div>
							<div style="width: 106px;" class="form-group">
								<input id="buyerName" type="text" class="form-control" disabled="disabled"
									name="customerNickName" value="向羽">
							</div>
						</div>
						<div class="form-group mr20">
							<div class="left btn-group-text">收货人</div>
							<div style="width: 96px;" class="form-group">
								<input id="buyerName2" validate="" showname="收货人" type="text"
									class="form-control order" name="receiverName" value="">
							</div>
						</div>
						<div class="form-group mr20">
							<div class="left btn-group-text">电话号</div>
							<div style="width: 106px;" class="form-group">
								<input id="tel" type="text" class="form-control order phone"
									name="receiverPhone" value="" placeholder="区号-电话号码">
							</div>
						</div>
						<div class="form-group mr20">
							<div class="left btn-group-text">手机号</div>
							<div style="width: 106px;" class="form-group">
								<input id="Phone" type="text" class="form-control order mobile"
									name="receiverMobile" value="">
							</div>
						</div>
						<div id="logistic" class="btn-group mr20 select necessary" name="expressId"
							validate="" showname="物流公司" val="2445">
							<div class="left btn-group-text">物流公司</div>
							<button class="btn btn-default" type="button" id="logisticName">ems</button>
							<button data-toggle="dropdown" onclick="setLogisti()"
								class="btn btn-default dropdown-toggle" type="button">
								<span class="caret"></span>
							</button>
							<ul style="min-width: 96px; left: 57px;" role="menu"
								class="dropdown-menu">
								<!-- 选项区 -->
							</ul>
						</div>
					</div>
					<!-- Split button -->
					<div class="mb20">
						<div class="btn-group mr10 select necessary"
							name="deliveryWarehouseId" validate="" showname="发货仓库"
							val="17999">
							<div class="left btn-group-text">发货仓库</div>
							<button class="btn btn-default" type="button">默认仓库</button>
							<button data-toggle="dropdown"
								class="btn btn-default dropdown-toggle" type="button">
								<span class="caret"></span>
							</button>
							<ul style="min-width: 96px; left: 57px; height: 120px;"
								role="menu" class="dropdown-menu scrollspy-example">

								<li val="17999"><a href="javascript:void(0);">默认仓库</a></li>

								<li val="18181"><a href="javascript:void(0);">仓库1</a></li>

								<li val="18250"><a href="javascript:void(0);">仓库2</a></li>

								<li val="18495"><a href="javascript:void(0);">库存3</a></li>

							</ul>
						</div>

						<div class="btn-group mr10 select" title="省" id="receiverState"
							name="receiverState" val="湖北省" validate="" showname="省">
							<div class="left btn-group-text">详细地址</div>
							<button class="btn btn-default" type="button" name="Province">省</button>
							<button onclick="appendSheng('sheng')"  data-toggle="dropdown"
								class="btn btn-default dropdown-toggle" type="button">
								<span class="caret"></span> <span class="sr-only">Toggle
									Dropdown</span>
							</button>
							<ul style="min-width: 96px; left: 57px; height: 120px;"
								role="menu" class="dropdown-menu scrollspy-example">
								<!-- 选项区 -->
							</ul>
						</div>
						<div id="receiverCity" class="btn-group mr10 select" title="市" name="receiverCity"
							val="荆州市" validate="" showname="市">
							<button class="btn btn-default" type="button" name="City">市</button>
							<button data-toggle="dropdown" onclick="appendSheng('city')"
								class="btn btn-default dropdown-toggle" type="button">
								<span class="caret"></span> <span class="sr-only">Toggle
									Dropdown</span>
							</button>
							<ul style="min-width: 96px; height: 120px;" role="menu"
								class="dropdown-menu scrollspy-example">
								<!-- 选项区 -->
							</ul>
						</div>
						<div id="receiverDistrict" class="btn-group mr10 select" title="区/县"
							name="receiverDistrict" val="其它区" validate="" showname="区/县">
							<button class="btn btn-default" type="button" name="District">区</button>
							<button data-toggle="dropdown" onclick="appendSheng('district')"
								class="btn btn-default dropdown-toggle" type="button">
								<span class="caret"></span> <span class="sr-only">Toggle
									Dropdown</span>
							</button>
							<ul style="min-width: 96px; height: 120px;" role="menu"
								class="dropdown-menu scrollspy-example">
								<!-- 选项区 -->
							</ul>
						</div>
						<div class="form-group mr20">
							<div style="width: 320px;" class="form-group">
								<input validate="" showname="详细地址" type="text"
									class="form-control order" name="receiverStreet" value="潜江市"
									placeholder="详细地址">
							</div>
						</div>
					</div>
					<div>
						<div class="form-group mr10">
							<div class="left btn-group-text">邮政编码</div>
							<div style="width: 76px;" class="form-group">
								<input validate="" showname="邮政编码" type="text"
									class="form-control order postcode" name="receiverZip"
									value="">
							</div>
						</div>
					</div>
				</form> <!--客户信息 end--> <!--商品信息展开 star-->
				<form class="form-horizontal form-inline" role="form"
					style="padding: 0px 8px; height: 205px;" id="form-sp">
					<div class="form-group">

						<a href="javascript: void(0);" data-target="#addGiftGoodsModal"
							id="addGiftGoodsBtn" data-toggle="modal" warehouseid="17999"><span
							class="glyphicon glyphicon-plus"></span> 添加赠品</a>
						<div aria-hidden="true" aria-labelledby="addGiftGoodsModalLabel"
							role="dialog" tabindex="-1" id="addGiftGoodsModal"
							class="modal fade"></div>

					</div>
					<div class="form-group pull-right">
						<div class="left lh30 mr40">
							共计 <b class="red"><span name="skuTotalQuantity"></span></b>
							件商品， 总重量<b class="red"><span name="skuTotalWeight"></span></b>kg
							<!-- ， 总价格 <b class="red"><span name="skuTotalFee">500.00</span></b> 元 -->
						</div>
						<div class="left lh30">
							商品总金额：<span class="fb mr0" name="skuTotalFee"></span>
							<b class="mr0">－</b> 订单优惠：<span class="fb mr0" name="discountFee"></span>
							<b class="mr0">－</b> 商品总优惠：<span class="fb mr0"
								name="skuTotalDiscount"></span>
							<b class="mr0">=</b> <span class="fb mr40"
								name="skuTotalFee-discountFee-skuTotalDiscount"></span>
							实付：<span class="fb red mr10" name="paymentAmount"></span>
						</div>
						
					</div>
					<div style="height: 155px" class="tl lh30 scrollspy-example">
						<table style="margin-bottom: 0" class="table">
							<thead class="table-bordered">
								<tr>
									<th>商品图</th>
									<th>SKU编码</th>
									<th>商品名称</th>
									<th>属性</th>
									<th>零售价</th>
									<th>数量</th>
									<th>优惠</th>
									<th>应付</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="detailGood" style="font-weight: normal">

								<!-- 此处添加商品信息动态加入 -->

							</tbody>
						</table>
					</div>
				</form> <!--商品信息展开 end--> <!--交易信息 star-->
				<form role="input" class="navbar-form"
					style="padding: 0px 8px; height: 205px; display: none;"
					id="form-jy">

					<!-- Split button -->
					<div>
						<div class="btn-group mr20">
							<div class="left btn-group-text" style="margin-right: 10px;">付款方式</div>
							<button class="btn btn-default" type="button" name="payment"></button>

						</div>
						<div class="btn-group mr20">
							<div class="left btn-group-text">付款类型</div>
							<button class="btn btn-default" type="button" name="PayTpye">网银</button>

						</div>
						<div class="btn-group mr20">
							<div class="left btn-group-text">支付账号</div>
							<div style="width: 228px;" class="form-group">
								<input type="text" class="form-control" name="paymentAccount"
									value="" disabled="disabled">
							</div>
						</div>
						<div class="form-group mr20">
							<div class="left btn-group-text" style="margin-right: 22px;">付款时间</div>
							<div style="width: 168px;" class="form-group">
								<input type="text" class="form-control" name="paymentTime"
									value="" disabled="disabled">
							</div>
						</div>
					</div>
					<!--展开样式 开发票信息 star-->
					<div>
						<div id="accordion" class="panel-group">
							<div style="padding: 0" class="panel-heading">
								<h4 style="line-height: 40px;" class="panel-title">
									<a href="http://maijiayun.cn/#collapseTwo"
										data-parent="#accordion" data-toggle="collapse" class="f14 fb">
										<b class="caret"></b> 发票信息
									</a>
								</h4>
							</div>
							<div class="panel-collapse collapse in" id="collapseTwo">
								<!-- Split button -->
								<div style="padding: 3px 0px;">

									<div class="form-group mr20">无发票信息</div>

								</div>
								<!-- Split button end-->
							</div>
						</div>
					</div>
					<!--开发票信息 end-->
				</form> <!--交易信息 end--> <!--备注信息展开 star-->
				<form class="form-horizontal" role="form"
					style="padding: 0px 8px; height: 205px; display: none;"
					id="form-bz">
					<div class="form-group">
						<label for="inputflag" class="w50 control-label left">旗帜</label>
						<div class="col-sm-5">
							<div class="form-inline" role="form">
								<div class="radio mr20">
									<label><input type="radio" value="无" checked=""
										name="flag"> 无</label>
								</div>
								<!-- <div class="radio mr20"><label><input type="radio" value="全部" < %=flag=="全部" ? "checked" : "" %> name="flag"> <span style="color: #666666" class="glyphicon glyphicon-flag"></span></label></div> -->
								<div class="radio mr20">
									<label><input type="radio" value="红" name="flag">
										<span style="color: red" class="glyphicon glyphicon-flag"></span></label>
								</div>
								<div class="radio mr20">
									<label><input type="radio" value="黄" name="flag">
										<span style="color: #F90" class="glyphicon glyphicon-flag"></span></label>
								</div>
								<div class="radio mr20">
									<label><input type="radio" value="绿" name="flag">
										<span style="color: green" class="glyphicon glyphicon-flag"></span></label>
								</div>
								<div class="radio mr20">
									<label><input type="radio" value="蓝" name="flag">
										<span style="color: blue" class="glyphicon glyphicon-flag"></span></label>
								</div>
								<div class="radio mr20">
									<label><input type="radio" value="紫" name="flag">
										<span style="color: violet" class="glyphicon glyphicon-flag"></span></label>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="w50 left lh30">买家备注</div>
						<div class="col-sm-5">
							<input type="text" class="form-control order" id="inputbuy"
								placeholder="请输入买家备注" name="buyerMemo" value="">
						</div>
					</div>
					<div class="form-group">
						<div class="w50 left lh30">卖家备注</div>
						<div class="col-sm-5">
							<input type="text" class="form-control order" id="inputsell"
								placeholder="请输入卖家备注" name="sellerMemo" value="">
						</div>
					</div>
					<div class="form-group">
						<div class="w50 left lh30">卖家云备注</div>
						<div class="col-sm-5">
							<input type="text" class="form-control order" id="inputsell"
								placeholder="请输入卖家云备注" name="sellerMemo" value="">
						</div>
					</div>
					<div class="form-group">
						<div class="left lh30">订单最后更改时间 ：</div>
						<div class="col-sm-1">
							<!--修改记录 star-->
							<a id="btnModifyLog" style="cursor: pointer;" data-toggle="modal"
								data-target="#modifyorderModal">订单修改记录</a>
							<!--修改记录 end-->
						</div>
					</div>
				</form> <!--备注信息展开 end-->

				<div style="background: #dcdcdc; padding: 5px 8px;">

					<button type="submit" class="btn btn-primary btn-xs mr10" id="ok" onclick="saveClient()">确定</button>

					<button type="submit" class="btn btn-default btn-xs" id="fold"
						onclick="showThisMsg()">收起</button>
				</div> <!-- Modal -->
				<div id="divOrderTrackLog" class="modal fade" tabindex="-1"
					role="dialog" aria-labelledby="followinfoModalLabel"
					aria-hidden="true"></div> <!-- /.modal --> <!-- Modal -->
				<div class="modal fade" id="modifyorderModal" tabindex="-1"
					role="dialog" aria-labelledby="modifyorderModalLabel"
					aria-hidden="true"></div> <!-- /.modal -->
			</td>
		</tr>
	</table>
	
	<!-- 用来装商品信息的 -->
	<table id="goodHtml" style="display: none">
		<tbody>
			<tr modelid="18466430" warehouseid="17999">
			<!-- 图片0 -->
				<td>
					<div class=" m-goodsinfo">
						<a class="s-avatar" href="http://maijiayun.cn/#"> 
						<img src="tupian" style="height: 50px; width: 50px;" class="img-thumbnail"
							alt="50x50">
						</a>

					</div>
				</td>
				<!-- sku1 ${allInfos[0].detailGoods[0].sku }-->
				<td class="fb"></td>
				<!-- 商品名2 ${allInfos[0].detailGoods[0].goodName }-->
				<td></td>
				<!-- 商品属性3 -->
				<td>无</td>
				<!-- 零售价4 ${allInfos[0].detailGoods[0].goodPrice } -->
				<td></td>

				<!-- 数量5 ${allInfos[0].detailGoods[0].detailGoodNum }-->
				<td><span></span></td>

				<!-- 优惠6 ${allInfos[0].detailGoods[0].detailGoodPrivilege }-->
				<td></td>
				<!-- 应付 ${allInfos[0].detailGoods[0].detailTotal }-->
				<td></td>
				<td><a href="javascript:void(0);"
					data-target="changeSkuGoodsModal" data-toggle="modal"
					class="changeSku">换货</a>
					<div aria-hidden="true" aria-labelledby="changeSkuGoodsModalLabel"
						role="dialog" tabindex="-1" id="changeSkuGoodsModal"
						class="modal fade"></div></td>
			</tr>
		</tbody>
	</table>
</body>
</html>