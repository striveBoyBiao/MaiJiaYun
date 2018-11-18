<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">

<head>

<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/CaiGou/css/them.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/CaiGou/js/CGTHDcheck.js"></script>
<jsp:include page="/CaiGou/jsp/cgthd/addJS.jsp"></jsp:include>

</head>

<body class="" style="padding-right: 0px;" onload="init()">
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
						<a href="#" class="navbar-brand ml20">新增退换货</a>
					</div>
					<ul class="nav nav-tabs f14 fb">
						<!--<li class="active ml20 tab"><a href="#" style="background:#f1f1f1;">新增退换货</a></li>-->
					</ul>
				</div>
				<!--titletab end-->
				<!--panel star-->
				<div class="prl10auto">
					<div class="btn-group-block">
						<div style="width: 250px;" class="input-group">
							<input type="text" placeholder="填写采购单号" class="form-control"
								name="purchaseOrderCode" id="purchaseOrderCode1"> <span
								class="input-group-btn">
								<button id="addPurchaseOrder" class="btn btn-primary"
									type="button" data-target="#addPurchaseOrderModal"
									data-toggle="modal">添加采购单</button>
							</span>
						</div>
					</div>
					<!--table star-->
					<div class="panel prl10auto" id="skuPanel">
						<h4>
							退货商品 <span class="badge"></span> <span
								class="f12 pull-right fb red"></span>
						</h4>
						<!-- Table -->
						<div class="well well-lg tc" id="returnResult">请添加退货订单</div>
						<!--table end-->
					</div>
					<!--panel end-->
					<!--panle star-->
					<div class="panel prl10auto" style="background: none;">
						<h4 class="tr">
							共计退款金额<span class="red"> <span id="returnSkuTotalFee"
								name="returnSkuTotalFee">0.00</span>元
							</span>
						</h4>
					</div>
					<!--panle end-->
					<!--btngrunp end-->
				</div>
				<!--panle end-->
				<div class="panel prl10auto" style="margin-bottom: 0px;">
					<!-- btngrunp star-->
					<form style="padding: 10px 0px;" role="form"
						class="form-horizontal">
						<!---->
						<div class="form-group">
							<div class="w50 left lh30">退货备注</div>
							<div class="col-sm-5">
								<textarea class="form-control" rows="3" id="memo" name="memo"></textarea>
							</div>
						</div>
						<!---->
					</form>
				</div>
				<!--panle star-->
				<div class="panel prl10auto"
					style="background: none; margin-bottom: 0px; padding: 20px 10px 40px 10px">
					<button class="btn btn-primary mr5 save" id="save" type="button">保存</button>
					<button class="btn btn-default cancel" id="cancel" type="button">取消</button>
				</div>
				<!--panle end-->
				<!--Layout right part end-->
				<div style="display: none;" aria-hidden="true"
					aria-labelledby="addgoodsModalLabel" role="dialog" tabindex="-1"
					id="addPurchaseOrderModal" class="modal fade in">
					<!--添加订单弹出 star-->
					<div style="width: 900px;" class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button aria-hidden="true" data-dismiss="modal" class="close"
									type="button">×</button>
								<h4 id="addordersModalLabel" class="modal-title">添加采购单</h4>
							</div>
							<div style="padding: 10px 20px;" class="modal-body">
								<!--part one-->
								<div class="input-group" style="width: 250px;">
									<input type="text" class="form-control" placeholder="请输入采购单号"
										name="purchaseOrderCode" id="purchaseOrderCode2" value="">
									<span class="input-group-btn">
										<button type="button" id="purchaseCodeQuery"
											class="btn btn-primary query">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
								</div>
								<!--part one end-->
								<!--part two-->
								<div style="height: 400px" class="tl lh30 scrollspy-example">
									<table style="margin-bottom: 0"
										class="table table-striped table-hover" id="purchaseResult">
									</table>
								</div>
								<!--part two end-->
							</div>
							<div
								style="margin-top: 0px; background: #ebebeb; padding: 5px 20px"
								class="modal-footer">
								<button class="btn btn-primary ok" id="chosePurchase"
									type="button">确定</button>
								<button data-dismiss="modal" class="btn btn-default"
									type="button">取消</button>
							</div>
						</div>
					</div>
					<!-- /.modal-content -->
					<!--添加订单弹出 end-->
				</div>
			</div>
		</div>

		<div
			style="width: 300px; height: 80px; left: 533px; overflow: hidden; display: none;"
			class="modal" id="keeperrorModal" tabindex="-1" role="dialog"
			aria-labelledby="logisticsModalLabel" aria-hidden="false">
			<div class="modal-dialog" style="width: 300px; margin: 52px 0 0 0;">
				<div style="background: #ff5831; border-radius: 0px; border: none"
					class="modal-content">
					<div style="padding: 5px;" class="modal-body">
						<!--part one-->
						<div style="color: #ffffff;" class="c6 tc" id="showErrorTempDiv">退货数量
							不能为空</div>
						<!--part one end-->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--代码结束-->
	<div class="bootbox modal fade bootbox-alert in" id="errorModal"
		tabindex="-1" role="dialog" aria-hidden="false" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button onclick="closeErrorModal()" type="button"
						class="bootbox-close-button close" data-dismiss="modal"
						aria-hidden="true" style="margin-top: -10px;">×</button>
					<div class="bootbox-body" id="errorModalContent"></div>
				</div>
				<div class="modal-footer">
					<button data-bb-handler="ok" onclick="closeErrorModal()"
						type="button" class="btn btn-primary">OK</button>
				</div>
			</div>
		</div>
	</div>
</body>

</html>