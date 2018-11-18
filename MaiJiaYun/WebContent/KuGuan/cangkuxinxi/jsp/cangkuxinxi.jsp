<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">
<head>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/KuGuan/cangkuxinxi/js/jquery-1.7.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/KuGuan/cangkuxinxi/js/cangkuxinxi.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body class="modal-open" style="padding-right: 0px;"
	onload="queryWarehouseInfo();">

	<!--代码开始-->
	<div class="container" id="container">
		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
		<div class="content" id="content">
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0;">
				<div class="navbar-header">
					<a href="http://maijiayun.cn/gzt" class="navbar-brand ml20"><span
						class="fb fmsun">&lt;&nbsp;</span>仓库管理</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<li class="ml20 tab" id="li-goodshouse"><a
						href="${pageContext.request.contextPath}/CangKuXinxiMethodServlet?method=requestDis"
						class="c6">商品库存</a></li>
					<li class="ml20 tab active" id="li-houseinfo"><a class=""
						href="${pageContext.request.contextPath}/CangKuXinxiMethodServlet?method=requestDisp">仓库信息
					</a></li>
				</ul>
			</div>
			<!-- context start -->
			<div id="panel" class="prl10auto">
				<!---->
				<div class="btn-group-block">
					<!--search star-->
					<div class="input-group col-md-3">
						<form class="form-inline" role="form">

							<div class="radio mr20">
								<label> <input onclick="queryWarehouseInfo()"
									type="radio" id="allRadio" class="operate-radios" name="radios"
									value="" checked=""> 全部
								</label>
							</div>
							<div class="radio">
								<label> <input onclick="queryWarehouseInfo()"
									type="radio" id="freeRadio" class="operate-radios"
									name="radios" value="空闲"> 空闲
								</label>
							</div>
						</form>
					</div>
					<!--search end-->
				</div>
				<div class="row" style="margin: 0px;">
					<!--parttwo star-->
					<div id="parttwo" class="col-md-3 mr20"
						style="margin-top: 0px; background: #f7f7f7; height: 515px; padding: 0;">
						<h5 style="padding: 0px 10px;">
							<strong class="lh30">仓库</strong> <span class="pull-right">
								<button class="btn btn-default" type="button"
									data-toggle="modal" data-target="#warehouse_addModal">新增仓库</button>
							</span>
							<div class="clear"></div>
						</h5>
						<div id="warehouseInfo" class="list-group scrollspy-example"
							style="height: 475px;"></div>
					</div>
					<!--新增仓库 star-->
					<div aria-hidden="true" aria-labelledby="warehouse_addModalLabel"
						role="dialog" tabindex="-1" id="warehouse_addModal"
						class="modal fade" style="display: none;">
						<div class="modal-dialog" style="width: 460px;">
							<div class="modal-content">
								<div class="modal-header">
									<button aria-hidden="true" data-dismiss="modal" class="close"
										type="button">×</button>
									<h4 id="warehouse_addModalLabel" class="modal-title">新增仓库</h4>
								</div>
								<div class="modal-body">
									<label class="radio-inline"> <input type="radio"
										onclick="ziyoucangku()" name="inlineRadioOptions"
										id="inlineRadio1" value="option1" checked="checked">
										自有仓库
									</label> <label class="radio-inline"> <input type="radio"
										name="inlineRadioOptions" id="inlineRadio2" value="option2"
										onclick="qimencangku()"> 奇门仓库
									</label> <label class="red ml20" style="display: none" id="qimenRemark">注:外部仓储公司只支持奇门对接仓储</label>
									<div class="tab-content">
										<form class="form-horizontal" id="ziyouWarehouse" role="form"
											style="padding: 10px 0px;">
											<div class="form-group" id="ziyouNameError"
												style="overflow: hidden; display: none;">
												<span id="errorSpan" class="help-block"
													style="color: rgb(169, 68, 66); overflow: hidden; display: none;">请填写仓库名称</span>
											</div>
											<div class="form-group">
												<div class="w50 left lh30 fb">仓库名称</div>
												<div class="col-sm-10">
													<input type="text" id="ziyouName" class="form-control">
													<div class="form-group" id="ziyouNameError2"
														style="overflow: hidden; display: none;">
														<span id="errorSpan" class="help-block"
															style="color: rgb(169, 68, 66); overflow: hidden; display: block;">请填写仓库名称</span>
													</div>
												</div>
											</div>

											<!---->
											<div class="form-group">
												<div class="w50 left lh30 fb">仓库简介</div>
												<div class="col-sm-10">
													<textarea id="ziyouMemo" rows="3" class="form-control"></textarea>
												</div>
											</div>
											<!---->

										</form>
										<form class="form-horizontal" id="qimenWarehouse" role="form"
											style="padding: 10px 0px; display: none">
											<!---->
											<!---->
											<div class="form-group">
												<div class="w100 left lh30 fb tr">外部仓储公司</div>
												<div class="col-sm-9">
													<select class="form-control" id="qimenVendor">
														<option value="kejie">科捷</option>
														<option value="juwo">巨沃</option>
														<option value="yiwuliu">易物流</option>
														<option value="disifang">递四方</option>
													</select>
												</div>
											</div>
											<div class="form-group" id="qimenNameError"
												style="display: none"></div>
											<div class="form-group">
												<div class="w100 left lh30 fb tr">仓库名称</div>
												<div class="col-sm-9">
													<input type="text" id="qimenName" class="form-control">
												</div>
											</div>
											<!---->
											<div class="form-group">
												<div class="w100 left lh30 fb tr">仓库简介</div>
												<div class="col-sm-9">
													<textarea id="qimenMemo" rows="2" class="form-control"></textarea>
												</div>
											</div>
											<!---->
											<div class="form-group" id="qimenCustomerIdError"
												style="display: none"></div>
											<div class="form-group">
												<div class="w100 left lh30 fb tr">奇门分配用户账户</div>
												<div class="col-sm-9">
													<input type="text" id="qimenCustomerId"
														class="form-control">
												</div>
											</div>
											<div class="form-group">
												<div class="w100 left lh30 fb tr">奇门分配仓库编码</div>
												<div class="col-sm-9">
													<input type="text" id="qimenWarehouseCode"
														class="form-control">
												</div>
											</div>
											<div class="form-group">
												<div class="w100 left lh30 fb tr">仓库货主</div>
												<div class="col-sm-9">
													<input type="text" id="qimenOwnerCode" class="form-control">
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="modal-footer" style="margin-top: 0px;">
									<button class="btn btn-primary" id="saveWarehouse"
										onclick="addWarehouseInfo()" data-toggle="modal"
										data-target="#warehouse_addModal" type="button">确定</button>
									<button data-dismiss="modal" class="btn btn-default"
										id="hideWarehouse" type="button">取消</button>
									<button class="btn btn-default" id="initWarehouse"
										type="button">立即初始化库存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- 新增仓库 end-->
					<!-- 仓库信息弹出 star-->
					<div aria-hidden="false" aria-labelledby="warehouseinfoModalLabel"
						role="dialog" tabindex="-1" id="warehouseinfoModal"
						class="modal fade in" style="display: none;">
						<div class="modal-dialog" style="width: 550px;">
							<div class="modal-content">
								<div class="modal-header">
									<button aria-hidden="true" data-dismiss="modal" class="close"
										type="button">×</button>
									<h4 id="warehouseinfoModalLabel" class="modal-title">仓库信息</h4>
								</div>
								<div class="modal-body">
									<div class="tab-content">
										<form class="form-horizontal" id="form1" role="form"
											style="padding: 0px 0px;" warehouseid="18065" zoneid=""
											locationid="" status="ck">

											<div class="form-group">
												<div class="w100 left lh30 fb tr">仓库名称</div>
												<div class="col-sm-9">
													<input name="name" id="ckName" type="text"
														class="form-control" value="">
												</div>
											</div>
											<!---->
											<div class="form-group">
												<div class="w100 left lh30 fb tr">仓库状态</div>
												<div class="col-sm-9 lh30">使用</div>
											</div>

											<div class="form-group">
												<div class="w100 left lh30 fb tr">仓库类型</div>
												<div class="col-sm-9 lh30" id="warehouseType"
													name="warehouseType">自有仓库</div>
											</div>

											<!---->
											<div class="form-group">
												<div class="w100 left lh30 fb tr">仓库简介</div>
												<div class="col-sm-9">
													<textarea name="memo" id="memo" rows="2"
														class="form-control"></textarea>
												</div>
											</div>
											<!---->
										</form>
									</div>
								</div>
								<div class="modal-footer" style="margin-top: 0px;">
									<button class="btn btn-primary" onclick="updateWarehouseInfo()"
										id="update-house" type="button">确定</button>
									<button data-dismiss="modal" class="btn btn-default"
										type="button">取消</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- 仓库信息弹出 end-->
					<!-- 库区信息弹出 star -->
					<div aria-hidden="false" aria-labelledby="reservoirinfoModalLabel"
						role="dialog" tabindex="-1" id="reservoirinfoModal"
						class="modal fade in" style="display: none;">
						<div class="modal-backdrop fade in"></div>
						<div class="modal-dialog" style="width: 550px;">
							<div class="modal-content">
								<div class="modal-header">
									<button aria-hidden="true" data-dismiss="modal" class="close"
										type="button">×</button>
									<h4 id="reservoirinfoModalLabel" class="modal-title">仓库信息</h4>
								</div>
								<div class="modal-body">
									<div class="tab-content">
										<form class="form-horizontal" id="form1" role="form"
											style="padding: 0px 0px;" warehouseid="" zoneid=""
											locationid="" status="qw">

											<div class="form-group">
												<div class="w100 left lh30 fb tr">库区名称</div>
												<div class="col-sm-9">
													<input name="name" id="kqName" type="text"
														class="form-control" value="">
												</div>
											</div>
											<!---->
											<div class="form-group">
												<div class="w100 left lh30 fb tr">库区状态</div>
												<div class="col-sm-9 lh30">空闲</div>
											</div>

											<!---->
											<div class="form-group">
												<div class="w100 left lh30 fb tr">库区简介</div>
												<div class="col-sm-9">
													<textarea name="memo" id="memo" rows="2"
														class="form-control"></textarea>
												</div>
											</div>
											<!---->
										</form>
									</div>
								</div>
								<div class="modal-footer" style="margin-top: 0px;">
									<button class="btn btn-primary" onclick="updateReservoirInfo()"
										id="update-reser" type="button">确定</button>
									<button data-dismiss="modal" class="btn btn-default"
										type="button">取消</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- 库区信息弹出 end -->
					<!--parttwo end-->
					<!--partthree star-->
					<div
						style="width: 25%; float: left; padding-right: 20px; display: none;"
						id="partthree">
						<!-- 库区-->
						<div class="col-md-12 mr20"
							style="margin-top: 0px; background: #f7f7f7; height: 515px; padding: 0;">
							<h5 style="padding: 0px 10px;">
								<strong class="lh30">库区</strong> <span class="pull-right">
									<button class="btn btn-default" data-toggle="modal"
										data-target="#zone_addModal" type="button">新增库区</button>
								</span>
								<div class="clear"></div>
							</h5>
							<div class="list-group scrollspy-example" id="reservoirInfo"
								style="height: 475px;"></div>
						</div>
						<!--新增库位 star-->
						<div style="display: none;" class="modal fade" id="zone_addModal"
							tabindex="-1" role="dialog" aria-labelledby="zone_addModalLabel"
							aria-hidden="true">
							<div style="width: 410px;" class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h4 class="modal-title" id="zone_addModalLabel">新增库区</h4>
									</div>
									<div class="modal-body">
										<form style="padding: 10px 0px;" id="formZone" role="form"
											class="form-horizontal">
											<input type="hidden" value="18323" id="warehouseId"
												name="warehouseId"> <input type="hidden"
												name="status" value="kq">
											<div class="form-group" style="margin-bottom: 0">
												<div class="col-md-10 col-md-offset-2" style="padding: 0">
													<span id="errorSpan" class="help-block"
														style="color: #A94442"></span>
												</div>
											</div>
											<!--错误显示框has-error-->
											<div class="form-group">
												<div class="left lh30 fb">库区名称</div>
												<div class="col-sm-10">
													<input type="text" name="name" id="vname"
														class="form-control">
												</div>
											</div>
											<div class="form-group">
												<div class="left lh30 fb">库区简介</div>
												<div class="col-sm-10">
													<textarea id="memo" name="memo" class="form-control"
														rows="3"></textarea>
												</div>
											</div>
											<!---->
										</form>
									</div>
									<div style="margin-top: 0px;" class="modal-footer">
										<button type="button" id="saveZone"
											onclick="addRreservoirInfo()" class="btn btn-primary">确定</button>
										<button type="button" id="hideWarehouseZone"
											class="btn btn-default" data-dismiss="modal">取消</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!--新增库位 end-->

						<!--partthree end-->
					</div>
					<!-- 库位信息弹出star -->
					<div aria-hidden="false" aria-labelledby="warehouseinfoModalLabel"
						role="dialog" tabindex="-1" id="locationinfoModal"
						class="modal fade in" style="display: none;">
						<div class="modal-dialog" style="width: 550px;">
							<div class="modal-content">
								<div class="modal-header">
									<button aria-hidden="true" data-dismiss="modal" class="close"
										type="button">×</button>
									<h4 id="warehouseinfoModalLabel" class="modal-title">库位信息</h4>
								</div>
								<div class="modal-body">
									<div class="tab-content">
										<form class="form-horizontal" id="form1" role="form"
											style="padding: 0px 0px;">

											<div class="form-group">
												<div class="w100 left lh30 fb tr">库位名称</div>
												<div class="col-sm-9">
													<input name="name" id="name" type="text"
														class="form-control" value="">
												</div>
											</div>
											<!---->
											<div class="form-group">
												<div class="w100 left lh30 fb tr">库位状态</div>
												<div class="col-sm-9 lh30">空闲</div>
											</div>

											<!---->
											<div class="form-group">
												<div class="w100 left lh30 fb tr">库位简介</div>
												<div class="col-sm-9">
													<textarea name="memo" id="memo" rows="2"
														class="form-control"></textarea>
												</div>
											</div>
											<!---->
										</form>
									</div>
								</div>
								<div class="modal-footer" style="margin-top: 0px;">
									<button class="btn btn-primary" id="update-house" type="button">确定</button>
									<button data-dismiss="modal" class="btn btn-default"
										type="button">取消</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!--partthree end-->
					<!--partfour star-->
					<div id="partfour" style="width: 25%; float: left; display: none">
						<!--库位信息-->
						<div class="col-md-12 mr20"
							style="margin-top: 0px; background: #f7f7f7; height: 515px; padding: 0;">
							<h5 style="padding: 0px 10px;">
								<strong class="lh30">库位</strong> <span class="pull-right">
									<button data-toggle="modal"
										data-target="#warehouseLocation_addModal"
										class="btn btn-default" type="button">新增库位</button>
								</span>
								<div class="clear"></div>
							</h5>
							<div class="list-group scrollspy-example" id="locationInfo"
								style="height: 475px;" id="locationInfo"></div>
						</div>
						<!--新增库位 star-->
						<div style="display: none;" class="modal fade"
							id="warehouseLocation_addModal" tabindex="-1" role="dialog"
							aria-labelledby="warehouse_addModalLabel" aria-hidden="true">
							<div style="width: 520px;" class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h4 class="modal-title" id="warehouse_addModalLabel">批量新增</h4>
									</div>
									<div class="modal-body">
										<form style="padding: 10px 0px;" role="form" id="formLocation"
											class="form-horizontal">
											<input type="hidden" value="18323" name="warehouseId">
											<input type="hidden" value="646" name="warehouseZoneId">
											<!---->
											<div class="form-inline form-group " role="form">
												<div class="form-group">起始库位名称：</div>
												<div class="form-group w80 " style="margin-right: 10px">
													<input id="startName" type="text" class="form-control "
														placeholder="">
												</div>
												<div class="form-group">批量生成：</div>
												<div class="form-group w80">
													<input id="kwNum" type="text" class="form-control integer"
														placeholder="">
												</div>
												<div class="form-group">个，根据最后的数字位生成</div>
											</div>
											<!---->
											<div class="help-block c9" style="margin-bottom: 20px;">如：A-01-01，生成10个，则会生成A-01-02，A-01-03，A-01-04，A-01-05....A-01-10</div>
											<!---->
											<div class="form-inline form-group " role="form">
												<div class="form-group" style="margin-right: 10px;">
													<button id="showBut" class="btn btn-default" type="button"
														style="width: 75px;">预览</button>
												</div>
												<div class="form-group">
													<div id="showResult"></div>
												</div>
											</div>
										</form>
									</div>
									<div style="margin-top: 0px;" class="modal-footer">
										<button type="button" id="saveLoaction"
											class="btn btn-primary" data-toggle="modal"
											data-target="#myModal" onclick="addLocationInfo()">确定</button>
										<button type="button" class="btn btn-default"
											id="hideReservoirZone" data-dismiss="modal">取消</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!--新增库位 end-->
					</div>
					<!--partfour end-->
				</div>
			</div>
			<!-- context end -->
		</div>
		<div class="contentbox" id="contentbox"
			style="display: block; background: rgb(241, 241, 241);"></div>
		<!--Layout right part end-->
		<div id="spinner" style="display: none;">
			<div class="modal fade" aria-hidden="false" role="dialog"
				tabindex="-1" style="display: block;">
				<div class="modal-dialog tc" style="margin-top: 300px;">
					<img src="./卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台_files/loading3.gif">
				</div>
			</div>
		</div>
		<div id="chatMessageModal" class="modal fade ng-scope"
			aria-hidden="true">
			<div class="right w-xxl bg-white md-whiteframe-z2 ng-scope" style="">
				<div class="chatbox ng-scope">
					<div class="p-h-md tc bgf1">
						<a class="pull-right text-muted-lt text-2x m-t-n inline p-sm"
							data-dismiss="modal" href="http://maijiayun.cn/#">×</a> <a
							class="pull-left f18" data-toggle="modal"
							data-target="#chatContactModal" data-dismiss="modal"
							href="http://maijiayun.cn/#"> <span
							class="glyphicon glyphicon-arrow-left"></span>
						</a> <strong><span id="chatUserName">&nbsp;</span></strong>
					</div>
					<div class="box-row">
						<div class="box-cell" id="chatMessageScrollBox">
							<div class="box-inner m-userinfo">
								<div class="p-md">
									<div id="chatMessageCheckHistory">
										<div class="clear tc">
											<div class="p p-v-xs inline">&nbsp;</div>
										</div>
									</div>
									<div id="chatMessageTopTimeDivider"></div>
									<div id="chatMessageList"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="p-h-md p-v bgf1">
						<div class="ng-pristine ng-valid">
							<div class="input-group">
								<input type="text" placeholder="按回车发送消息" autocomplete="off"
									class="form-control" id="sendChatMessageInput"> <span
									class="input-group-btn">
									<button type="button" class="btn btn-primary"
										id="sendChatMessageButton">发送</button>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div data-backdrop="false" id="chatGroupSendingModal"
			class="modal fade ng-scope" aria-hidden="true">
			<div class="right w-xl bg-white md-whiteframe-z2 ng-scope" style="">
				<div class="chatbox ng-scope">
					<!--1-->
					<div class="p-h-md tc">
						<a class="pull-right text-muted-lt text-2x m-t-n inline p-sm"
							data-dismiss="modal" href="http://maijiayun.cn/#">×</a> <a
							class="pull-left f18" data-toggle="modal"
							data-target="#chatContactModal" data-dismiss="modal"
							href="http://maijiayun.cn/#" id="chatGroupSendingBack"> <span
							class="glyphicon glyphicon-arrow-left"></span>
						</a> <strong>选择联系人</strong>
					</div>
					<!--搜索-->
					<div class="row p-h-plr">
						<div class="has-feedback dropdown">
							<input type="text" data-toggle="dropdown"
								placeholder="查找公司/姓名/手机"
								class="form-control input-sm dropdown-toggle"
								id="chatGroupSendingSearchBox"> <span
								style="width: 30px; height: 30px; line-height: 30px;"
								class="glyphicon glyphicon-search form-control-feedback c9"></span>
							<!---->
							<div style="padding-top: 0" role="menu" class="dropdown-menu row">
								<ul class="media-list m-userinfo scrollspy-example "
									style="margin-bottom: 0px; max-height: 470px; margin-top: 0px;"
									id="chatGroupSendingSearchResult">
								</ul>
							</div>
							<!---->
						</div>
					</div>
					<!--搜索 end-->
					<!--2-->
					<div class="box-row">
						<div class="box-cell">
							<div class="box-inner plate">
								<ul class="media-list m-userinfo scrollspy-example"
									style="margin-bottom: 0px; height: 100%; margin-top: 0px;"
									id="chatGroupSendingContactList">
								</ul>
							</div>
						</div>
					</div>
					<!--3-->
					<div class="p-h-md bgf1 tc">
						<span class="text-muted">选择联系人添加到群发</span>
					</div>
					<!--end-->
				</div>
			</div>
			<div class="say w-xxl bg-white md-whiteframe-z2 ng-scope">
				<div class="chatbox ng-scope">
					<!--1-->
					<div class="p-h-md tc bgf1">
						<strong class="sayblock">发送消息给</strong>
					</div>
					<!--2-->
					<div class="box-row">
						<div class="box-cell">
							<div class="box-inner">
								<!---->
								<div class="row f12 tc c6">
									<div class="p p-v-xs bg-chattime inline mt15">从右侧选择联系人</div>
								</div>
								<!---->
								<div class="row m-userinfo plate">
									<ul class="scrollspy-example"
										style="margin-bottom: 0px; height: 100%; margin-top: 0px;"
										id="chatGroupSendingSelectedList">
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!--3-->
					<div class="p-h-md p-v bgf1">
						<div class="ng-pristine ng-valid">
							<div class="input-group">
								<input type="text" placeholder="按回车发送消息" autocomplete="off"
									class="form-control" id="sendChatGroupMessageInput"> <span
									class="input-group-btn">
									<button type="button" class="btn btn-primary"
										id="sendChatGroupMessageButton">发送</button>
								</span>
							</div>
						</div>
					</div>
					<!--end-->
				</div>
			</div>
		</div>
		<div id="manageContactModal" class="modal fade" tabindex="-1"
			role="dialog" aria-labelledby="manageContactModalLabel"
			aria-hidden="true">
			<div style="width: 795px;" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title" id="manageContactModalLabel">分配岗位</h4>
					</div>
					<div role="tabpanel" class="modal-body"
						style="padding: 15px 0 0 0;">
						<!--1 star-->
						<div class="row f14">
							<form class="form-horizontal" role="form">
								<!---->
								<div class="col-md-8">
									<label for="inputEmail3" class="col-sm-2 control-label c6">姓名</label>
									<div class="form-group has-feedback">
										<div class="col-sm-10">
											<input disabled="" id="manageContactUserNameInput"
												type="text" name="name" value="" class="form-control"
												placeholder="请输入您同事的姓名"> <span
												class="glyphicon form-control-feedback"></span>
										</div>
									</div>
								</div>
								<div class="col-md-4" style="padding-left: 0px;">
									<div class="form-group">
										<div name="name" class="alert alert-danger p7 f12"
											role="alert" style="display: none;"></div>
									</div>
								</div>
								<!---->
								<div class="col-md-8">
									<label for="inputEmail3" class="col-sm-2 control-label c6">手机</label>
									<div class="form-group has-feedback">
										<div class="col-sm-10">
											<input disabled="" id="manageContactUserPhoneInput"
												type="text" name="phone" class="form-control" value=""
												placeholder="请输入您同事的手机号码"> <span
												class="glyphicon form-control-feedback"></span>
										</div>
									</div>
								</div>
								<div class="col-md-4" style="padding-left: 0px;">
									<div class="form-group">
										<div name="phone" class="alert alert-danger p7 f12"
											role="alert" style="display: none;"></div>
									</div>
								</div>
								<!---->
								<div class="col-md-8">
									<label for="inputEmail3" class="col-sm-2 control-label c6">Email</label>
									<div class="form-group has-feedback">
										<div class="col-sm-10">
											<input disabled="" id="manageContactUserEmailInput"
												type="text" name="email" class="form-control" value=""
												placeholder="请输入您同事的Email"> <span
												class="glyphicon form-control-feedback"></span>
										</div>
									</div>
								</div>
								<div class="col-md-4" style="padding-left: 0px;">
									<div class="form-group">
										<div name="email" class="alert alert-danger p7 f12"
											role="alert" style="display: none;"></div>
									</div>
								</div>
								<!---->
								<div class="col-md-12">
									<div class="divider_line"></div>
								</div>
								<!---->
								<div class="col-md-12 mt10">
									<div class="form-group">
										<label class="ml10">分配岗位 <!-- <a href="javascript:void(0);" id="gangweijieshao"><span class="blue iconfont icon-play ml20" style="font-size:16px;"></span> 岗位介绍</a> --></label>
										<!---->
										<div class="row mt10">
											<div class="col-md-12 selectblock">
												<ul id="manageContactUserFunctionList">
												</ul>
											</div>
										</div>
										<!---->
									</div>
								</div>
								<!---->
							</form>
						</div>
						<!--1 end-->
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary updatePackUser">修改</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>

		<div style="width: 300px; height: 80px; display: none;" class="modal"
			id="keepsuccessModal" tabindex="-1" role="dialog"
			aria-labelledby="logisticsModalLabel" aria-hidden="false">
			<div class="modal-dialog" style="width: 300px; margin: 52px 0 0 0;">
				<div style="background: #61be44; border-radius: 0px; border: none"
					class="modal-content">
					<div style="padding: 5px;" class="modal-body">
						<!--part one-->
						<div style="color: #ffffff;" class="c6 tc" id="showTempDiv">保存成功！</div>
						<!--part one end-->
					</div>
				</div>
			</div>
		</div>
		<div style="width: 300px; height: 80px; display: none;" class="modal"
			id="keeperrorModal" tabindex="-1" role="dialog"
			aria-labelledby="logisticsModalLabel" aria-hidden="false">
			<div class="modal-dialog" style="width: 300px; margin: 52px 0 0 0;">
				<div style="background: #ff5831; border-radius: 0px; border: none"
					class="modal-content">
					<div style="padding: 5px;" class="modal-body">
						<!--part one-->
						<div style="color: #ffffff;" class="c6 tc" id="showErrorTempDiv">保存失败！</div>
						<!--part one end-->
					</div>
				</div>
			</div>
		</div>
		<div id="modal"></div>


		<div id="addModel" class="bootbox modal fade bootbox-alert in"
			id="myModal" tabindex="-1" role="dialog" aria-hidden="false"
			style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<button onclick="okBye()" type="button"
							class="bootbox-close-button close" data-dismiss="modal"
							aria-hidden="true" style="margin-top: -10px;">×</button>
						<div class="bootbox-body" id="existName">无效参数:</div>
					</div>
					<div class="modal-footer">
						<button data-bb-handler="ok" onclick="okBye()" type="button"
							id="okByeBye" class="btn btn-primary">OK</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--  -->
	<!--代码结束-->
</body>
</html>