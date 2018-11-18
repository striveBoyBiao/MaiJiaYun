<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script src="${pageContext.request.contextPath}/KeFu/ddcx/js/ddcx.js"
	type="text/javascript">
	
</script>

<script src="${pageContext.request.contextPath}/KeFu/ddcx/js/lsz.js" type="text/javascript" charset="utf-8"></script>

</head>
<!-- Button trigger modal -->
<body onload="creatthead()">
	<table class="table table-striped table-hover" id="orderTable">

		<thead class=" table-bordered">
			<tr>
<!-- 				<th class="select" colname="flag" title=""> -->
<!-- 					<div class="btn-group"> -->
<!-- 						<div class="left" style="margin-right: 5px;"> -->
<!-- 							<input type="checkbox" id="selectAll" onclick="selectall()"> -->
<!-- 						</div> -->
<!-- 						<div class="dropdown left"> -->
<!-- 							<button class="btn dropdown-toggle fb" -->
<!-- 								style="padding: 0; box-shadow: none; background: none" -->
<!-- 								type="button" id="dropdownMenu1" data-toggle="dropdown"> -->
<!-- 								<span class="title"><span -->
<!-- 									class="glyphicon glyphicon-flag "></span></span> <span class="caret"></span> -->
<!-- 							</button> -->
<!-- 							<ul class="dropdown-menu" role="menu" -->
<!-- 								aria-labelledby="dropdownMenu1"> -->
<!-- 								<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 									href="javascript:void(0);"><span style="color: red" -->
<!-- 										class="glyphicon glyphicon-flag"><span class="hide">红</span></span> -->
<!-- 								</a></li> -->
<!-- 								<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 									href="javascript:void(0);"><span style="color: #F90" -->
<!-- 										class="glyphicon glyphicon-flag"><span class="hide">黄</span></span> -->
<!-- 								</a></li> -->
<!-- 								<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 									href="javascript:void(0);"><span style="color: green" -->
<!-- 										class="glyphicon glyphicon-flag"><span class="hide">绿</span></span> -->
<!-- 								</a></li> -->
<!-- 								<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 									href="javascript:void(0);"><span style="color: blue" -->
<!-- 										class="glyphicon glyphicon-flag"><span class="hide">蓝</span></span> -->
<!-- 								</a></li> -->
<!-- 								<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 									href="javascript:void(0);"><span style="color: violet" -->
<!-- 										class="glyphicon glyphicon-flag"><span class="hide">紫</span></span> -->
<!-- 								</a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</th> -->

<!-- 				<th colname="splitMergeStatus" class="select" title="提醒"> -->
<!-- 					<div class="dropdown"> -->
<!-- 						<button class="btn dropdown-toggle fb" -->
<!-- 							style="padding: 0; box-shadow: none; background: none" -->
<!-- 							type="button" id="dropdownMenu1" data-toggle="dropdown"> -->
<!-- 							<span class="title">提醒</span> <span class="caret"></span> -->
<!-- 						</button> -->
<!-- 						<ul class="dropdown-menu" role="menu" -->
<!-- 							aria-labelledby="dropdownMenu1"> -->

<!-- 							<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 								href="javascript:void(0);"><span -->
<!-- 									class="iconfont icon-tuihuo" -->
<!-- 									style="font-size: 16px; color: #F90"></span>退款</a></li> -->

<!-- 							<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 								href="javascript:void(0);"><span -->
<!-- 									class="glyphicon glyphicon-lock" style="color: #F90"></span>锁单</a> -->
<!-- 							</li> -->

<!-- 							<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 								href="javascript:void(0);">已拆分</a></li> -->

<!-- 							<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 								href="javascript:void(0);">已合并</a></li> -->

<!-- 							<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 								href="javascript:void(0);">无法送达</a></li> -->

<!-- 							<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 								href="javascript:void(0);">货到付款</a></li> -->

<!-- 							<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 								href="javascript:void(0);">预售</a></li> -->

<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</th> -->

<!-- 				<th colname="status" class="select" title="状态" -->
<!-- 					> -->
<!-- 					<div class="dropdown"> -->
<!-- 						<button class="btn dropdown-toggle fb" -->
<!-- 							style="padding: 0; box-shadow: none; background: none" -->
<!-- 							type="button" id="dropdownMenu1" data-toggle="dropdown"> -->
<!-- 							<span class="title">状态</span> <span class="caret"></span> -->
<!-- 						</button> -->
<!-- 						<ul class="dropdown-menu" role="menu" -->
<!-- 							aria-labelledby="dropdownMenu1"> -->

<!-- 							<li role="presentation" class="sort" type="up"><a -->
<!-- 								role="menuitem" tabindex="-1" href="###" onclick="up('orderState')"><span -->
<!-- 									class="glyphicon glyphicon-arrow-up"></span> 升序</a></li> -->
<!-- 							<li role="presentation" class="sort" type="down"><a -->
<!-- 								role="menuitem" tabindex="-1" href="###" onclick="down('orderState')"><span -->
<!-- 									class="glyphicon glyphicon-arrow-down"></span> 降序</a></li> -->

<!-- 							<li class="divider"></li> -->

<!-- 							<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 								href="javascript:void(0);">待付款</a></li> -->

<!-- 							<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 								href="javascript:void(0);">已付款待审核</a></li> -->

<!-- 							<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 								href="javascript:void(0);">已审核待发货</a></li> -->

<!-- 							<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 								href="javascript:void(0);">已发货</a></li> -->

<!-- 							<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 								href="javascript:void(0);">已取消</a></li> -->

<!-- 							<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 								href="javascript:void(0);">已完成</a></li> -->

<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</th> -->

<!-- 				<th colname="eShopName" class="select" title="店铺名" -->
<!-- 					> -->
<!-- 					<div class="dropdown"> -->
<!-- 						<button class="btn dropdown-toggle fb" -->
<!-- 							style="padding: 0; box-shadow: none; background: none" -->
<!-- 							type="button" id="dropdownMenu1" data-toggle="dropdown" onclick="shopQuery(this)"> -->
<!-- 							<span class="title">店铺名</span> <span class="caret"></span> -->
<!-- 						</button> -->
<!-- 						<ul class="dropdown-menu" role="menu" -->
<!-- 							aria-labelledby="dropdownMenu1"> -->

<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</th> -->

<!-- 				<th colname="b2cCode/createTime" >订单号/下单时间</th> -->

<!-- 				<th colname="customerName" >买家</th> -->

<!-- 				<th colname="buyerMemo" class="select" title="买家备注" -->
<!-- 					> -->
<!-- 					<div class="dropdown"> -->
<!-- 						<button class="btn dropdown-toggle fb" -->
<!-- 							style="padding: 0; box-shadow: none; background: none" -->
<!-- 							type="button" id="dropdownMenu1" data-toggle="dropdown"> -->
<!-- 							<span class="title">买家备注</span> <span class="caret"></span> -->
<!-- 						</button> -->
<!-- 						<ul class="dropdown-menu" role="menu" -->
<!-- 							aria-labelledby="dropdownMenu1"> -->

<!-- 							<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 								href="javascript:void(0);" onclick="liquery1('orderBuyerRemark','1')">有买家备注</a></li> -->

<!-- 							<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 								href="javascript:void(0);" onclick="liquery1('orderBuyerRemark','-1')">无买家备注</a></li> -->

<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</th> -->

<!-- 				<th colname="sellerMemo" class="select" title="卖家备注" -->
<!-- 					> -->
<!-- 					<div class="dropdown"> -->
<!-- 						<button class="btn dropdown-toggle fb" -->
<!-- 							style="padding: 0; box-shadow: none; background: none" -->
<!-- 							type="button" id="dropdownMenu1" data-toggle="dropdown"> -->
<!-- 							<span class="title">卖家备注</span> <span class="caret"></span> -->
<!-- 						</button> -->
<!-- 						<ul class="dropdown-menu" role="menu" -->
<!-- 							aria-labelledby="dropdownMenu1"> -->

<!-- 							<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 								href="javascript:void(0);" onclick="liquery1('orderSellerRemark','1')">有卖家备注</a></li> -->

<!-- 							<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 								href="javascript:void(0);" onclick="liquery1('orderSellerRemark','-1')">无卖家备注</a></li> -->

<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</th> -->

<!-- 				<th colname="receiverAddress" class="select" title="地址" -->
<!-- 					> -->
<!-- 					<div class="dropdown"> -->
<!-- 						<button class="btn dropdown-toggle fb" -->
<!-- 							style="padding: 0; box-shadow: none; background: none" -->
<!-- 							type="button" id="dropdownMenu1" data-toggle="dropdown"> -->
<!-- 							<span class="title">地址</span> <span class="caret"></span> -->
<!-- 						</button> -->
<!-- 						<ul class="dropdown-menu" role="menu" -->
<!-- 							aria-labelledby="dropdownMenu1"> -->

<!-- 							<li role="presentation" class="sort" type="up"><a -->
<!-- 								role="menuitem" tabindex="-1" href="javascript:void(0);" onclick="up('buyerAddress')"><span -->
<!-- 									class="glyphicon glyphicon-arrow-up"></span> 升序</a></li> -->
<!-- 							<li role="presentation" class="sort" type="down"><a -->
<!-- 								role="menuitem" tabindex="-1" href="javascript:void(0);" onclick="down('buyerAddress')"><span -->
<!-- 									class="glyphicon glyphicon-arrow-down"></span> 降序</a></li> -->

<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</th> -->

<!-- 				<th colname="expressCompanyName/expressCode" class="select" -->
<!-- 					title="物流/运单号"> -->
<!-- 					<div class="dropdown"> -->
<!-- 						<button class="btn dropdown-toggle fb" -->
<!-- 							style="padding: 0; box-shadow: none; background: none" -->
<!-- 							type="button" id="dropdownMenu1" data-toggle="dropdown" onclick="logisticQuery(this)"> -->
<!-- 							<span class="title">物流/运单号</span> <span class="caret"></span> -->
<!-- 						</button> -->
<!-- 						<ul class="dropdown-menu" role="menu" -->
<!-- 							aria-labelledby="dropdownMenu1"> -->

<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</th> -->

<!-- 				<th colname="expressCompanyName" class="select" title="物流" -->
<!-- 					> -->
<!-- 					<div class="dropdown"> -->
<!-- 						<button class="btn dropdown-toggle fb" -->
<!-- 							style="padding: 0; box-shadow: none; background: none" -->
<!-- 							type="button" id="dropdownMenu1" data-toggle="dropdown" onclick="logisticQuery(this)"> -->
<!-- 							<span class="title">物流</span> <span class="caret"></span> -->
<!-- 						</button> -->
<!-- 						<ul class="dropdown-menu" role="menu" -->
<!-- 							aria-labelledby="dropdownMenu1"> -->

<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</th> -->

<!-- 				<th colname="skuTotalQuantity" class="select" title="数量" -->
<!-- 					> -->
<!-- 					<div class="dropdown"> -->
<!-- 						<button class="btn dropdown-toggle fb" -->
<!-- 							style="padding: 0; box-shadow: none; background: none" -->
<!-- 							type="button" id="dropdownMenu1" data-toggle="dropdown" > -->
<!-- 							<span class="title">数量</span> <span class="caret"></span> -->
<!-- 						</button> -->
<!-- 						<ul class="dropdown-menu" role="menu" -->
<!-- 							aria-labelledby="dropdownMenu1"> -->

<!-- 							<li role="presentation" class="sort" type="up"><a -->
<!-- 								role="menuitem" tabindex="-1" href="javascript:void(0);" onclick="up('orderGoodNum')"><span -->
<!-- 									class="glyphicon glyphicon-arrow-up"></span> 升序</a></li> -->
<!-- 							<li role="presentation" class="sort" type="down"><a -->
<!-- 								role="menuitem" tabindex="-1" href="javascript:void(0);" onclick="down('orderGoodNum')"><span -->
<!-- 									class="glyphicon glyphicon-arrow-down"></span> 降序</a></li> -->

<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</th> -->

<!-- 				<th colname="paymentAmount/buyerPostageFee">实付/运费</th> -->

<!-- 				<th colname="receiverMobile" style="display: none;">收货人手机号</th> -->

<!-- 				<th colname="receiverPhone" style="display: none;">收货人电话</th> -->

<!-- 				<th colname="receiverName" style="display: none;">收货人姓名</th> -->

<!-- 				<th colname="paymentTime" style="display: none;">付款时间</th> -->

<!-- 				<th colname="auditTime" style="display: none;">审单时间</th> -->

<!-- 				<th colname="deliveryTime" style="display: none;">发货时间</th> -->

<!-- 				<th colname="expressCode" style="display: none;">快递单号</th> -->

<!-- 				<th colname="deliveryCode" style="display: none;">发货单号</th> -->

<!-- 				<th>操作</th> -->
<!-- 				<th style="border-right: none"><a data-toggle="modal" -->
<!-- 					data-target="#tableModal" style="cursor: pointer;" id="theadSet" onclick="initialize()">列设置</a> -->
<!-- 				</th> -->
			</tr>
		</thead>

		<tbody id="countbody">
			
		</tbody>


	</table>
	<!-- Modal style="display: block;"-->
	<div class="modal fade" id="tableModal" tabindex="-1" role="dialog"
		aria-labelledby="tableModalLabel" aria-hidden="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<!--modal-header-->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="tableModalLabel">列设置</h4>
				</div>
				<!-- /.modal-header -->

				<!-- modal-body -->
				<div class="modal-body">
					<div class="row">

						<!--left part-->
						<form id="formThead">
							<input name="code" value="sd_unauditorder" type="hidden">
							<div class="col-xs-9 scrollspy-example" style="height: 400px;">
								<table class="table" id="tableHead">
									<thead class=" table-bordered">
										<tr trtype="head">
											<th>行号</th>
											<th>列名</th>
											<th style="width: 185px;">显示名称</th>
											<th>显示</th>
										</tr>
									</thead>
									<tbody style="font-weight: normal">

									</tbody>
								</table>
							</div>
						</form>
						<!--left part end-->

						<!--right part-->
						<div class="col-xs-3">
							<h5 class="fb">操作</h5>
							<form>
								<button type="button" id="upButton" onclick="upOperate()"
									class="btn btn-default"
									style="width: 100%; margin-bottom: 15px" disabled="false">上移</button>
								<button type="button" id="downButton" onclick="downOperate()"
									class="btn btn-default"
									style="width: 100%; margin-bottom: 15px" disabled="false">下移</button>
								<button type="button" id="defaultButton"
									onclick="defaultOperate()" class="btn btn-default"
									style="width: 100%; margin-bottom: 45px">还原默认设置</button>

								<button type="button" id="saveCustom" onclick="saveMyCustom()"
									class="btn btn-primary" data-dismiss="modal"
									style="width: 45%;">保存</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal" style="width: 45%;">关闭</button>

							</form>
						</div>
						<!--right part end-->

					</div>
					<!-- /.row -->
				</div>
				<!-- /.modal-body -->
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</body>
