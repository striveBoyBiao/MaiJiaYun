<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">

</head>

<body style="padding-right: 0px;" class="">
	<!--代码开始-->
	<div class="container" id="container">
		<!--header 开始-->
		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>





		<!--Layout right part star-->
		<div class="content" id="content"></div>
		<div class="contentbox" id="contentbox"
			style="background: rgb(241, 241, 241) none repeat scroll 0% 0%; display: block;">
			<div class="tips" style="left: 640px; display: none;"></div>
			<!--1170 star-->
			<div class="content1170 row">
				<!--left star-->
				<!--left end-->

				<!--right star-->
				<div class="col-lg-12">
					<!--1 star-->
					<div class="row white">
						<div class="row">
							<ul style="background-color: rgb(231, 231, 231);" id="myTab"
								class="nav nav-tabs" role="tablist">
								<li role="presentation" class="f20 p15">系统设置</li>
								<li role="presentation" class="active" id="inviter-tab1"><a
									class="f20" data-toggle="tab" role="tab"
									href="#setPostLimit">岗位</a></li>
								<li role="presentation" class="" id="inviter-tab2"><a
									class="f20" data-toggle="tab" role="tab"
									href="#setBossType">供销</a></li>
								<li class="pull-right f14" style="padding-top: 15px;">
									<button type="button" class="btn btn-default mr15" id="fhgzt">返回工作台</button>
								</li>
								<script>
										$("#fhgzt").click(function(){
											window.location.href = "<%=request.getContextPath()%>/servlet/gzt";
											
										});
								</script>
								<li class="pull-right f14" style="padding-top: 15px;">
									<button type="button" class="btn btn-primary mr15">保存所选功能</button>
								</li>
							</ul>
						</div>
						<!---->
						<div class="divider_line"
							style="background-color: rgb(46, 134, 233); height: 3px;"></div>
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade active in" id="setPostLimit">
								<!--1-->

								<div class="row themebgcolor3 tenantryFunction"
									tenantryfunctionid="19">


									<div class=" p15">
										<!---->
										<div class="media">
											<div class="media-body" style="overflow: unset;">
												<div style="margin: 0px 0px 3px; padding-top: 0px;"
													class="media-heading f20">
													管理员 <span class="f14 c9">已选<span class="red" id="19">3</span>项功能
													</span>
												</div>

											</div>
										</div>
										<div class="row mt10 selectblock">
											<ul>

												<li class="active" subfunctionid="27" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														店铺
												</a></li>

												<li class="active" subfunctionid="29" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														物流
												</a></li>

												<li class="active" subfunctionid="30" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														商品
												</a></li>



												<li class="userFunction" subfunctionid="41"
													name="subFunctionId" isdefault="false"><a
													href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														仓库管理
												</a></li>




											</ul>
										</div>
										<!---->
									</div>
								</div>

								<div class="row tenantryFunction" tenantryfunctionid="10">



									<div class=" p15">
										<!---->
										<div class="media">
											<div class="media-body" style="overflow: unset;">
												<div style="margin: 0px 0px 3px; padding-top: 0px;"
													class="media-heading f20">
													客服 <span class="f14 c9">已选<span class="red" id="10">4</span>项功能
													</span>
												</div>

											</div>
										</div>
										<div class="row mt10 selectblock">
											<ul>

												<li class="active" subfunctionid="1" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														订单查询
												</a></li>

												<li class="active" subfunctionid="2" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														待付款订单
												</a></li>

												<li class="active" subfunctionid="3" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														退款售后
												</a></li>



												<li class="active" subfunctionid="31" name="subFunctionId"
													isdefault="false"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														商品
												</a></li>




											</ul>
										</div>
										<!---->
									</div>
								</div>

								<div class="row themebgcolor3 tenantryFunction"
									tenantryfunctionid="11">


									<div class=" p15">
										<!---->
										<div class="media">
											<div class="media-body" style="overflow: unset;">
												<div style="margin: 0px 0px 3px; padding-top: 0px;"
													class="media-heading f20">
													订单处理 <span class="f14 c9">已选<span class="red"
														id="11">7</span>项功能
													</span>
												</div>

											</div>
										</div>
										<div class="row mt10 selectblock">
											<ul>

												<li class="active" subfunctionid="4" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														审单
												</a></li>

												<li class="active" subfunctionid="5" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														反审
												</a></li>

												<li class="active" subfunctionid="6" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														打单发货
												</a></li>

												<li class="active" subfunctionid="7" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														打印设置
												</a></li>

												<li class="active" subfunctionid="8" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														验货
												</a></li>

												<li class="active" subfunctionid="9" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														称重
												</a></li>



												<li class="active" subfunctionid="32" name="subFunctionId"
													isdefault="false"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														商品
												</a></li>

												<li class="userFunction" subfunctionid="33"
													name="subFunctionId" isdefault="false"><a
													href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														物流
												</a></li>




											</ul>
										</div>
										<!---->
									</div>
								</div>

								<div class="row tenantryFunction" tenantryfunctionid="15">



									<div class=" p15">
										<!---->
										<div class="media">
											<div class="media-body" style="overflow: unset;">
												<div style="margin: 0px 0px 3px; padding-top: 0px;"
													class="media-heading f20">
													库管 <span class="f14 c9">已选<span class="red" id="15">5</span>项功能
													</span>
												</div>

											</div>
										</div>
										<div class="row mt10 selectblock">
											<ul>

												<li class="active" subfunctionid="10" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														入库单
												</a></li>

												<li class="active" subfunctionid="11" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														出库单
												</a></li>

												<li class="active" subfunctionid="12" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														调拨单
												</a></li>

												<li class="active" subfunctionid="13" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														盘点单
												</a></li>

												<li class="active" subfunctionid="14" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														仓库管理
												</a></li>



												<li class="userFunction" subfunctionid="38"
													name="subFunctionId" isdefault="false"><a
													href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														库存监控
												</a></li>




											</ul>
										</div>
										<!---->
									</div>
								</div>

								<div class="row themebgcolor3 tenantryFunction"
									tenantryfunctionid="16">


									<div class=" p15">
										<!---->
										<div class="media">
											<div class="media-body" style="overflow: unset;">
												<div style="margin: 0px 0px 3px; padding-top: 0px;"
													class="media-heading f20">
													采购 <span class="f14 c9">已选<span class="red" id="16">6</span>项功能
													</span>
												</div>

											</div>
										</div>
										<div class="row mt10 selectblock">
											<ul>

												<li class="active" subfunctionid="15" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														采购单
												</a></li>

												<li class="active" subfunctionid="16" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														采购退货单
												</a></li>

												<li class="active" subfunctionid="17" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														库存监控
												</a></li>

												<li class="active" subfunctionid="18" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														供应商信息
												</a></li>

												<li class="active" subfunctionid="42" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														商品
												</a></li>

												<li class="active" subfunctionid="43" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														库存成本
												</a></li>






											</ul>
										</div>
										<!---->
									</div>
								</div>

								<div class="row tenantryFunction" tenantryfunctionid="17">



									<div class=" p15">
										<!---->
										<div class="media">
											<div class="media-body" style="overflow: unset;">
												<div style="margin: 0px 0px 3px; padding-top: 0px;"
													class="media-heading f20">
													运营 <span class="f14 c9">已选<span class="red" id="17">3</span>项功能
													</span>
												</div>

											</div>
										</div>
										<div class="row mt10 selectblock">
											<ul>

												<li class="active" subfunctionid="19" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														商品
												</a></li>

												<li class="active" subfunctionid="21" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														库存同步
												</a></li>

												<li class="active" subfunctionid="22" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														赠品策略
												</a></li>



												<li class="userFunction" subfunctionid="39"
													name="subFunctionId" isdefault="false"><a
													href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														订单查询
												</a></li>




											</ul>
										</div>
										<!---->
									</div>
								</div>

								<div class="row themebgcolor3 tenantryFunction"
									tenantryfunctionid="18">


									<div class=" p15">
										<!---->
										<div class="media">
											<div class="media-body" style="overflow: unset;">
												<div style="margin: 0px 0px 3px; padding-top: 0px;"
													class="media-heading f20">
													财务 <span class="f14 c9">已选<span class="red" id="18">4</span>项功能
													</span>
												</div>

											</div>
										</div>
										<div class="row mt10 selectblock">
											<ul>

												<li class="active" subfunctionid="23" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														收款
												</a></li>

												<li class="active" subfunctionid="24" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														付款
												</a></li>

												<li class="active" subfunctionid="25" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														库存成本
												</a></li>

												<li class="active" subfunctionid="26" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														基础资料
												</a></li>



												<li class="userFunction" subfunctionid="40"
													name="subFunctionId" isdefault="false"><a
													href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														订单查询
												</a></li>




											</ul>
										</div>
										<!---->
									</div>
								</div>

								<div class="row tenantryFunction" tenantryfunctionid="20">



									<div class=" p15">
										<!---->
										<div class="media">
											<div class="media-body" style="overflow: unset;">
												<div style="margin: 0px 0px 3px; padding-top: 0px;"
													class="media-heading f20">
													供销管理-分销商 <span class="f14 c9">已选<span class="red"
														id="20">6</span>项功能
													</span>
												</div>

											</div>
										</div>
										<div class="row mt10 selectblock">
											<ul>

												<li class="active" subfunctionid="44" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														我的供应商
												</a></li>

												<li class="active" subfunctionid="45" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														经销商品
												</a></li>

												<li class="active" subfunctionid="46" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														经销订单
												</a></li>

												<li class="active" subfunctionid="47" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														代销商品
												</a></li>

												<li class="active" subfunctionid="48" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														代销订单
												</a></li>

												<li class="active" subfunctionid="55" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														寻找货源
												</a></li>






											</ul>
										</div>
										<!---->
									</div>
								</div>

								<div class="row themebgcolor3 tenantryFunction"
									tenantryfunctionid="21">


									<div class=" p15">
										<!---->
										<div class="media">
											<div class="media-body" style="overflow: unset;">
												<div style="margin: 0px 0px 3px; padding-top: 0px;"
													class="media-heading f20">
													供销管理-供应商 <span class="f14 c9">已选<span class="red"
														id="21">5</span>项功能
													</span>
												</div>

											</div>
										</div>
										<div class="row mt10 selectblock">
											<ul>

												<li class="active" subfunctionid="49" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														分销发布
												</a></li>

												<li class="active" subfunctionid="51" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														我的分销商
												</a></li>

												<li class="active" subfunctionid="52" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														经销订单
												</a></li>

												<li class="active" subfunctionid="53" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														代销订单
												</a></li>

												<li class="active" subfunctionid="54" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														退款售后
												</a></li>






											</ul>
										</div>
										<!---->
									</div>
								</div>

								<div class="row tenantryFunction" tenantryfunctionid="22">



									<div class=" p15">
										<!---->
										<div class="media">
											<div class="media-body" style="overflow: unset;">
												<div style="margin: 0px 0px 3px; padding-top: 0px;"
													class="media-heading f20">
													供销服务-分销商 <span class="f14 c9">已选<span class="red"
														id="22">2</span>项功能
													</span>
												</div>

											</div>
										</div>
										<div class="row mt10 selectblock">
											<ul>

												<li class="active" subfunctionid="56" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														找货委托
												</a></li>

												<li class="active" subfunctionid="57" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														委托进度
												</a></li>






											</ul>
										</div>
										<!---->
									</div>
								</div>

								<div class="row themebgcolor3 tenantryFunction"
									tenantryfunctionid="23">


									<div class=" p15">
										<!---->
										<div class="media">
											<div class="media-body" style="overflow: unset;">
												<div style="margin: 0px 0px 3px; padding-top: 0px;"
													class="media-heading f20">
													供销服务-供应商 <span class="f14 c9">已选<span class="red"
														id="23">2</span>项功能
													</span>
												</div>

											</div>
										</div>
										<div class="row mt10 selectblock">
											<ul>

												<li class="active" subfunctionid="58" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														供销委托
												</a></li>

												<li class="active" subfunctionid="59" name="subFunctionId"
													isdefault="true"><a href="javascript:void(0);"> <span
														style="font-size: 14px;" class="iconfont icon-check"></span>
														委托进度
												</a></li>






											</ul>
										</div>
										<!---->
									</div>
								</div>




							</div>
							<div role="tabpanel" class="tab-pane fade" id="setBossType"
								style="height: 1000px;">
								<div class="row p20 mt63">
									<div class="col-md-6">
										<a class="bg-greyactive tc" href="javascript:void(0)"
											style="display: block;" id="companysupplier">
											<div class="row p20">
												<div class="f20">我是供应商</div>
												<div class="f12 mt10 c6">供应商可发布分销商品，寻找分销商，管理自己的分销商，订单等</div>
												<div class="mt15">
													<span class="iconfont icon-check" style="font-size: 60px;"></span>
												</div>

											</div>
										</a>
									</div>
									<div class="col-md-6">
										<a class="bg-grey tc" href="javascript:void(0)"
											style="display: block;" id="companydealer">
											<div class="row p20">
												<div class="f20">我是分销商</div>
												<div class="f12 mt10 c6">分销商可以采购供应商提供的商品，寻找货源，管理自己的订单等</div>
												<div class="mt15">
													<span class="iconfont icon-check" style="font-size: 60px;"></span>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
						<!---->

						<!---->
					</div>
					<!--1 end-->
				</div>
				<!--right end-->
			</div>
			<!--1170 end-->
		</div>
		<!--Layout right part end-->

		<div id="spinner" style="display: none;">
			<div class="modal fade" aria-hidden="false" role="dialog"
				tabindex="-1" style="display: block;">
				<div class="modal-dialog tc" style="margin-top: 300px;">
					<img
						src="${pageContext.request.contextPath }/Login/img/loading3.gif">
				</div>
			</div>
			<div class="modal-backdrop fade"
				style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;"></div>
		</div>

	
		<div style="width: 300px; height: 80px; display: none;" class="modal"
			id="keepsuccessModal" tabindex="-1" role="dialog"
			aria-labelledby="logisticsModalLabel" aria-hidden="false">
			<div class="modal-dialog" style="width: 300px; margin: 52px 0px 0px;">
				<div
					style="background: rgb(97, 190, 68) none repeat scroll 0% 0%; border-radius: 0px; border: medium none;"
					class="modal-content">
					<div style="padding: 5px;" class="modal-body">
						<!--part one-->
						<div style="color: rgb(255, 255, 255);" class="c6 tc"
							id="showTempDiv">保存成功！</div>
						<!--part one end-->
					</div>
				</div>
			</div>
		</div>
		<div style="width: 300px; height: 80px; display: none;" class="modal"
			id="keeperrorModal" tabindex="-1" role="dialog"
			aria-labelledby="logisticsModalLabel" aria-hidden="false">
			<div class="modal-dialog" style="width: 300px; margin: 52px 0px 0px;">
				<div
					style="background: rgb(255, 88, 49) none repeat scroll 0% 0%; border-radius: 0px; border: medium none;"
					class="modal-content">
					<div style="padding: 5px;" class="modal-body">
						<!--part one-->
						<div style="color: rgb(255, 255, 255);" class="c6 tc"
							id="showErrorTempDiv">保存失败！</div>
						<!--part one end-->
					</div>
				</div>
			</div>
		</div>


	</div>
	<!--代码结束-->
</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  