<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- saved from url=(0041)http://maijiayun.cn/cg/tuihuodan/edit/122 -->
<html
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">

<head>

<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/CaiGou/css/them.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/CaiGou/js/CGTHDcheck.js"></script>
<jsp:include page="/CaiGou/jsp/cgthd/editJS.jsp"></jsp:include>

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
						<a href="http://maijiayun.cn/#" class="navbar-brand ml20">编辑采购退换货</a>
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
					</div>
					<!--panel end-->
					<!--panle star-->
					<div class="panel prl10auto" style="background: none;">
						<h4 class="tr">
							共计退款金额<span class="red"> <span id="returnSkuTotalFee"
								name="returnSkuTotalFee"></span>元
							</span>
						</h4>
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
</body>

</html>