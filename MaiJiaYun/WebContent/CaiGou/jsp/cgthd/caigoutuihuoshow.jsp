<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">

<head>

<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/CaiGou/css/them.css">
<jsp:include page="/CaiGou/jsp/cgthd/showJS.jsp"></jsp:include>

</head>

<body onload="init()">
	<!--代码开始-->
	<div class="container" id="container">
		<!--header 开始-->
		<%-- <jsp:include page="/Common/jsp/navigation.jsp"></jsp:include> --%>
		<!--header 结束-->
		<div class="content" id="content">
			<div style="background: #f1f1f1">
				<!--titletab star-->
				<div class="collapse navbar-collapse navbar-default navbar-titletab"
					style="padding: 0px 0 0 0; background-color: #FFFFFF">
					<div class="navbar-header">
						<a href="#" class="navbar-brand ml20">采购退货单详情</a>
					</div>
					<ul class="nav nav-tabs f14 fb">
						<!--<li class="active ml20 tab" ><a href="javascript:void(0);"  style="background:#f1f1f1;">编辑退换货</a></li>-->
					</ul>
				</div>
				<!--titletab end-->
				<!--panel star-->
				<div class="prl10auto">
					<div class="btn-group-block">
						<div class="lh30">
							<div class="control-label left" style="width: 250px;">
								<strong>采购单号：</strong> <span id="purchaseCode"></span>
							</div>
							<div class="col-sm-2">
								<strong>供应商：</strong><span id="supplierCName"></span>
							</div>
							<div class="col-sm-2">
								<strong>采购入库仓库：</strong><span id="purchaseWarehouseName"></span>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<!--table star-->
					<div class="panel prl10auto" id="skuPanel">
						<!-- <h4>
							退货商品 <span class="badge">共<span
								name="returnSkuTotalQuantity">1</span>件
							</span> 退货仓库: asd
							<span class="f12 pull-right fb red">应付400元</span>
						</h4>
						Table
						<table class="table table-striped table-hover">
							<thead class=" table-bordered">
								<tr>
									<th>商品图</th>
									<th>SKU编码</th>
									<th>商品名称</th>
									<th>属性</th>
									<th>实付</th>
									<th>数量</th>
									<th>退货数量</th>
									<th>已出库数量</th>
									<th>退款金额</th>
								</tr>
							</thead>
							<tbody>

								<tr modelid="300">
									<td><img src="http://maijiayun.cn/"
										style="height: 50px; width: 50px;" class="img-thumbnail"
										alt="50x50"></td>
									<td class="fb">1111</td>
									<td>asdsad</td>
									<td>asdsad</td>
									<td>1.00元</td>
									<td>10</td>
									<td>1</td>
									<td>0</td>
									<td>1.00</td>
								</tr>

							</tbody>
						</table> -->
						<!--table end-->
					</div>
					<!--panel end-->
					<!--panle star-->
					<div class="panel prl10auto" style="background: none;">
						<h4 class="tr">
							共计退款金额<span class="red"> 1.00元</span>
						</h4>
					</div>
					<!--panle end-->

					<div class="panel prl10auto" style="margin-bottom: 0px;">
						<!-- btngrunp star-->
						<form style="padding: 10px 0px;" role="form"
							class="form-horizontal">
							<!---->
							<div class="panel prl10auto">
								<div>退货备注:<span id="memo"></span></div>
							</div>
							<!---->
						</form>
					</div>

					<!--panle star-->
					<div class="panel prl10auto"
						style="background: none; margin-bottom: 0px; padding: 20px 10px 40px 10px">
						<button class="btn btn-default cancel" id="cancel" type="button">取消</button>
					</div>
					<!--panle end-->
					<!--Layout right part end-->
				</div>
			</div>
		</div>
	</div>
	<!--代码结束-->
</body>

</html>