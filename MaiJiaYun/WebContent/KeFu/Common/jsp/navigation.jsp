<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
		<!--heard开始 -->
		<div class="navbar-fixed-top">
			
			<div id="topad" class="all"></div>
		
			<div class="navbar navbar-inverse" role="navigation" id="header">
				<div class="navbar-header">
					<a class="navbar-brand" href="javascript:void(0);"><img
						src="${pageContext.request.contextPath}/Common/img/logo.png" width="120" height="33" alt="logo"></a>
				</div>

				<div class="navbar-collapse collapse" style="padding-right: 15px;">
					<ul class="nav navbar-nav f18" id="headerMenu">
						<li><span class="pos1"></span><a href="javascript:void(0);"
							data-target="gzt">工作台</a></li>



						<li functionid="20" functionname="供销" functionuri="fxs">
							<!--<button class="btn btn-linknav dropdown-toggle btn-lgest" type="button" data-toggle="dropdown">供销 <b class="caret"></b></button>-->
							<a class="dropdown-toggle" data-toggle="dropdown"
							href="javascript:void(0);">供销 <b class="caret"></b></a>
							<div class="dropdown-menu row" role="menu" style="width: 160px;">
								<div class="col-md-12 meaulist">
									<ul class="submenu">


										<li><a href="javascript:void(0);" class="c0"
											data-target="fxs/mySupplier"> <span
												class="iconfont icon-wdgongyingshang"
												style="font-size: 14px;"></span> 我的供应商
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="fxs/jxGoods"> <span
												class="iconfont icon-jingxiaoshangpin"
												style="font-size: 14px;"></span> 经销商品
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="fxs/jxOrder/notpay"> <span
												class="iconfont icon-jingxiaodingdan"
												style="font-size: 14px;"></span> 经销订单
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="fxs/dxGoods"> <span
												class="iconfont icon-spth" style="font-size: 14px;"></span>
												代销商品
										</a></li>
										<li><a href="javascript:void(0);" class="c0"
											data-target="fxs/dxOrder/notpay"> <span
												class="iconfont icon-daixiaodingdan"
												style="font-size: 14px;"></span> 代销订单
										</a></li>
										<li><a href="javascript:void(0);" class="c0"
											data-target="fxs/searchGoods"> <span
												class="iconfont icon-pandiandan" style="font-size: 14px;"></span>
												寻找货源
										</a></li>


									</ul>
								</div>
								<div class="row" style="height: 12px;"></div>
							</div>
						</li>
						<li><span class="pos1"></span><a href="javascript:void(0);"
							data-target="delegation/delegationSchedule">一对一服务</a></li>
						<li>
							<!--<button class="btn btn-linknav dropdown-toggle btn-lgest" type="button" data-toggle="dropdown">ERP <b class="caret"></b></button>-->
							<a class="dropdown-toggle" data-toggle="dropdown"
							href="javascript:void(0);">ERP <b class="caret"></b></a>

							<div class="dropdown-menu row" row="menu"
								style="width: 952px; left: -286px;">

								<div class="col-md-2 meaulist"
									style="padding-right: 0; width: 130px;">
									<ul class="submenu">
										<li>
											<div class="c9 f14 lh30 fb">KBQ</div>
										</li>


										<li><a href="javascript:void(0);" class="c0"
											data-target="gly/dianpu"> <span
												class="iconfont icon-dianpushouquan"
												style="font-size: 14px;"></span> 店铺
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="gly/wuliucompany"> <span
												class="iconfont icon-wuliupeisong" style="font-size: 14px;"></span>
												物流
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="yy/goods"> <span
												class="iconfont icon-shangpin" style="font-size: 14px;"></span>
												商品
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="kg/cangkuguanli"> <span
												class="iconfont icon-cangkuguanli" style="font-size: 14px;"></span>
												仓库管理
										</a></li>


									</ul>
								</div>

								<div class="col-md-2 meaulist"
									style="padding-right: 0; width: 130px;">
									<ul class="submenu">
										<li>
											<div class="c9 f14 lh30 fb">客服</div>
										</li>


										<li><a href="javascript:void(0);" class="c0"
											data-target="kf/ordersearch"> <span
												class="iconfont icon-dingdanchaxun" style="font-size: 14px;"></span>
												订单查询
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="kf/orderurging"> <span
												class="iconfont icon-dingdancuikuan"
												style="font-size: 14px;"></span> 待付款订单
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="kf/returnbill/retrunBillNotDeliver"> <span
												class="iconfont icon-tuihuanhuo" style="font-size: 14px;"></span>
												退款售后
										</a></li>




									</ul>
								</div>

								<div class="col-md-2 meaulist"
									style="padding-right: 0; width: 130px;">
									<ul class="submenu">
										<li>
											<div class="c9 f14 lh30 fb">订单处理</div>
										</li>


										<li><a href="javascript:void(0);" class="c0"
											data-target="login"> <span
												class="iconfont icon-daishenhe" style="font-size: 14px;"></span>
												审单
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="sd/audit"> <span
												class="iconfont icon-yishenhe" style="font-size: 14px;"></span>
												反审
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="dd/printdelivery"> <span
												class="iconfont icon-dadanfahuo" style="font-size: 14px;"></span>
												打单发货
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="dd/printDeliverGoodsModel"> <span
												class="iconfont icon-dayinshezhi" style="font-size: 14px;"></span>
												打印设置
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="yh"> <span class="iconfont icon-yanhuo"
												style="font-size: 14px;"></span> 验货
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="cz"> <span class="iconfont icon-chengzhong"
												style="font-size: 14px;"></span> 称重
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="yy/goods"> <span
												class="iconfont icon-shangpin" style="font-size: 14px;"></span>
												商品
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="gly/wuliucompany"> <span
												class="iconfont icon-wuliupeisong" style="font-size: 14px;"></span>
												物流
										</a></li>


									</ul>
								</div>

								<div class="col-md-2 meaulist"
									style="padding-right: 0; width: 130px;">
									<ul class="submenu">
										<li>
											<div class="c9 f14 lh30 fb">库管</div>
										</li>


										<li><a href="javascript:void(0);" class="c0"
											data-target="kg/rukudan"> <span
												class="iconfont icon-rukudan" style="font-size: 14px;"></span>
												入库单
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="kg/chukudan"> <span
												class="iconfont icon-chukudan" style="font-size: 14px;"></span>
												出库单
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="kg/diaobodan"> <span
												class="iconfont icon-diaobodan" style="font-size: 14px;"></span>
												调拨单
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="kg/pandiandan"> <span
												class="iconfont icon-pandiandan" style="font-size: 14px;"></span>
												盘点单
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="kg/cangkuguanli"> <span
												class="iconfont icon-cangkuguanli" style="font-size: 14px;"></span>
												仓库管理
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="cg/kucunjiankong"> <span
												class="iconfont icon-cangkujiankong"
												style="font-size: 14px;"></span> 库存监控
										</a></li>


									</ul>
								</div>

								<div class="col-md-2 meaulist"
									style="padding-right: 0; width: 130px;">
									<ul class="submenu">
										<li>
											<div class="c9 f14 lh30 fb">采购</div>
										</li>


										<li><a href="javascript:void(0);" class="c0"
											data-target="cg/caigouwait"> <span
												class="iconfont icon-caigoudan" style="font-size: 14px;"></span>
												采购单
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="cg/retruncaigoutuihuo"> <span
												class="iconfont icon-caigoutuihuodan"
												style="font-size: 14px;"></span> 采购退货单
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="cg/kucunjiankong"> <span
												class="iconfont icon-cangkujiankong"
												style="font-size: 14px;"></span> 库存监控
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="cg/gongyingshang"> <span
												class="iconfont icon-gongyingshangxinxi"
												style="font-size: 14px;"></span> 供应商信息
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="yy/goods"> <span
												class="iconfont icon-shangpin" style="font-size: 14px;"></span>
												商品
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="cw/kucunchengben"> <span
												class="iconfont icon-kucunchengben" style="font-size: 14px;"></span>
												库存成本
										</a></li>


									</ul>
								</div>

								<div class="col-md-2 meaulist"
									style="padding-right: 0; width: 130px;">
									<ul class="submenu">
										<li>
											<div class="c9 f14 lh30 fb">运营</div>
										</li>


										<li><a href="javascript:void(0);" class="c0"
											data-target="yy/goods"> <span
												class="iconfont icon-shangpin" style="font-size: 14px;"></span>
												商品
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="yy/kucuntongbu"> <span
												class="iconfont icon-kucuntongbu" style="font-size: 14px;"></span>
												库存同步
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="yy/zengpin"> <span
												class="iconfont icon-zengpincelue" style="font-size: 14px;"></span>
												赠品策略
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="kf/ordersearch"> <span
												class="iconfont icon-dingdanchaxun" style="font-size: 14px;"></span>
												订单查询
										</a></li>


									</ul>
								</div>

								<div class="col-md-2 meaulist"
									style="padding-right: 0; width: 130px;">
									<ul class="submenu">
										<li>
											<div class="c9 f14 lh30 fb">财务</div>
										</li>


										<li><a href="javascript:void(0);" class="c0"
											data-target="cw/shoukuan"> <span
												class="iconfont icon-shoukuan" style="font-size: 14px;"></span>
												收款
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="cw/auditwaitcaiwu"> <span
												class="iconfont icon-fukuan" style="font-size: 14px;"></span>
												付款
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="cw/kucunchengben"> <span
												class="iconfont icon-kucunchengben" style="font-size: 14px;"></span>
												库存成本
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="cw/fukuantype"> <span
												class="iconfont icon-jichuziliao" style="font-size: 14px;"></span>
												基础资料
										</a></li>



										<li><a href="javascript:void(0);" class="c0"
											data-target="kf/ordersearch"> <span
												class="iconfont icon-dingdanchaxun" style="font-size: 14px;"></span>
												订单查询
										</a></li>


									</ul>
								</div>

								<div class="row" style="height: 12px;"></div>
							</div>
						</li>
					</ul>

					<ul class="nav navbar-nav navbar-right f18">
						<li><a id="showChatBtn" href="http://maijiayun.cn/#"
							data-toggle="modal" data-target="#chatContactModal"
							data-init="true"> <span style="font-size: 22px;"
								class="iconfont icon-duihua"></span> <span id="showChatCount"
								class="badge" style="display: none">0</span>
						</a></li>
						<li class="dropdown"><a id="showAlarmBtn"
							href="http://maijiayun.cn/#" class="dropdown-toggle"
							data-toggle="dropdown"> <span
								class="glyphicon glyphicon-bell"></span> <span
								id="showAlarmCount" class="badge" style="">1</span>
						</a>
							<div style="width: 270px;" role="menu" class="dropdown-menu row">
								<ul id="alarmShowUl"
									style="margin-bottom: 0px; max-height: 295px; margin-top: 0px;"
									class="media-list m-userinfo scrollspy-example">
									<li name="alarmRow" style="margin-top: 0px;"
										class="media themebgcolor2" userfeedid="174462"
										targeturi="ALARM_10043"><a href="javascript: void(0);"
										name="alarmToTargetBtn" class="block">
											<div class="s-avatar pull-left mr10">
												<!-- ${pageContext.request.contextPath}/Common/img/portrait_little.png -->
												<img width="45" height="45" class="media-object"
													src="${pageContext.request.contextPath}/Common/img/usermaster.jpg"> <span class="s-round-mask"></span>
											</div>
											<div class="media-body pt5">
												<div class="media-heading">供应商"新世界手机"同意了贵公司的分销合作</div>
											</div>
									</a></li>

								</ul>
							</div></li>
						<li class="dropdown"><a href="http://maijiayun.cn/#"
							class="dropdown-toggle" data-toggle="dropdown"> <!-- <span class="glyphicon glyphicon-user" id="userSpan"> 管理员</span> <b class="caret"></b> -->
								<span class="glyphicon glyphicon-user"></span>
						</a>
							<div style="width: 140px;" role="menu" class="dropdown-menu row">
								<div class="col-md-12 meaulist">
									<ul class="submenu">
										<li><a style="cursor: pointer"  data-toggle="modal" data-target="#edit_accountModal" > <span class="iconfont icon-laoban"
												style="font-size: 14px;"></span> 个人信息
										</a>
										</li>
										<li><a href="javascript:void(0);" id="logout"> <span
												class="iconfont icon-play" style="font-size: 14px;"></span>
												退出
										</a> <script>
											$("#logout")
													.click(
															function() {
																window.location.href = "Logout";
															});
										</script></li>
									</ul>
								</div>
								<div class="row" style="height: 12px;"></div>
							</div></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
		<!--header 结束-->
		
		<!--编辑个人信息模态框-->
		<div aria-hidden="true" aria-labelledby="edit_accountModalLabel"
			role="dialog" tabindex="-1" id="edit_accountModal" class="modal fade"
			style="display: none;">
			<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button aria-hidden="true" data-dismiss="modal" class="close"
						type="button">×</button>
					<h4 id="edit_accountModalLabel" class="modal-title">资料修改</h4>
				</div>
				<div class="modal-body">
					<!---->
					<!-- Nav tabs -->
					<ul class="nav nav-tabs fb" role="tablist">

						<li id="personalinfo-li" class="active"><a
							style="cursor: pointer;" data-target="#personalinfo" role="tab"
							data-toggle="tab">个人资料</a></li>
						<li><a style="cursor: pointer;" data-target="#passwordDiv"
							role="tab" data-toggle="tab">修改密码</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">

						<div class="tab-pane active" id="personalinfo">
							<div class="row">
								<div class="bs-callout" style="border: none">
									<!--star-->
									<form class="form-horizontal" role="form" id="userForm">

										<div class="form-group">
											<label for="" class="col-sm-3 control-label">昵称</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="name"
													id="name" value="blue">
											</div>
										</div>

										<!---->
										<div class="divider"></div>
										<!---->
										<div class="form-group" style="margin-top: 20px;">
											<label class="col-sm-3 control-label" for="">上传头像</label>
											<div class="col-sm-6 control-label">
												<!-- Display filename inside the button instead of its label -->
												<input type="file" data-filename-placement="inside"
													name="picUrlUser" id="picUrlUser" title="update pic">
											</div>
										</div>
										<div class="form-group" id="userPicDiv"
											style="margin-bottom: 0px;">
											<label class="col-sm-3 control-label" for=""></label>
											<div class="col-sm-6">
												<div class="form-group" style="margin-bottom: 0px;">
													<div class="media m-userinfo">
														<a class="s-avatar_big pull-left" target="_blank"
															href=""> <span
															class="s-edit-mask">上传头像</span> <img
															src=""
															id="userPic" width="80" height="80" class="media-object">
															<span class="s-round-mask" id="uploadClick"></span>
														</a>
													</div>
												</div>
											</div>
										</div>
										<!-- 上传图像 转圈层-->
										<div class="form-group ptb15" id="userLoadDiv"
											style="margin-bottom: 0px; display: none;">
											<label class="col-sm-3 control-label" for=""></label>
											<div class="col-sm-6">
												<div class="form-group" style="margin-bottom: 0px;">
													<div style="padding-left: 25px;">
														<a class="s-avatar_big pull-left" target="_blank"
															href="http://maijiayun.cn/#"> <img
															src="./卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台_files/loading3.gif"
															width="30" height="30" class="media-object">

														</a>
													</div>
												</div>
											</div>
										</div>
										<!---->
										<div class="divider"></div>
										<!---->
										<div class="form-group" style="margin-top: 20px;">
											<label for="" class="col-sm-3 control-label">邮箱地址</label>
											<div class="col-sm-6">
												<input type="" class="form-control" id="email" value="${user.u_email}">
											</div>
											<div class="col-sm-2 lh30">
												<a href="http://maijiayun.cn/#"></a>
											</div>
										</div>
										<!---->
										<div class="divider"></div>
										<!---->
										<div class="form-group" style="margin-top: 20px;">
											<label for="" class="col-sm-3 control-label">手机号码</label>
											<div class="col-sm-6">
												<input type="" class="form-control" id="phone"
													value="18207160472" disabled="">


											</div>
											<div class="col-sm-3 lh30">
												<a href="http://maijiayun.cn/#"></a>
											</div>
										</div>

										<!---->
									</form>
									<!--end-->
								</div>
							</div>
							<div class="modal-footer">
								<button class="btn btn-primary" id="saveUser" type="button">确定</button>
								<button data-dismiss="modal" class="btn btn-default"
									type="button">取消</button>
							</div>
						</div>
						<!---->
						<div class="tab-pane" id="passwordDiv">
							<div class="row" style="height: 300px;">
								<div class="bs-callout" style="border: none">
									<!--star-->
									<form class="form-horizontal" id="passwordForm" role="form">
										<!---->
										<div class="form-group" style="margin-top: 20px;">
											<label for="" class="col-sm-3 control-label">当前密码</label>
											<div class="col-sm-6">
												<input type="password" id="passwordOld" class="form-control">
												<span class="glyphicon"></span>
											</div>
											<div class="col-sm-3">
												<span class="red lh30"></span>
											</div>
										</div>
										<div class="form-group">
											<label for="" class="col-sm-3 control-label">新密码</label>
											<div class="col-sm-6">
												<input type="password" class="form-control" name="password"
													id="password" placeholder="">
											</div>
										</div>

										<div class="form-group" style="margin-bottom: 20px;">
											<label for="" class="col-sm-3 control-label">确认新密码</label>
											<div class="col-sm-6">
												<input type="password" name="passwordNew"
													class="form-control" id="passwordNew"> <span
													class="glyphicon"></span>
											</div>
										</div>
										<!---->

									</form>
									<!--end-->
								</div>

							</div>
							<div class="modal-footer">
								<button class="btn btn-primary" id="savePassword" type="button">确定</button>
								<button data-dismiss="modal" class="btn btn-default"
									type="button">取消</button>
							</div>
						</div>
						<!---->
					</div>

				</div>
				<!---->
			</div>
		</div>
			
		<div id="modal"></div>
	</div>
	    <!--编辑个人信息模态框结束-->
		
		
		<!-- 聊天模态框 -->
		<div data-backdrop="false" id="chatContactModal"
			class="modal fade ng-scope" aria-hidden="true">
			<div class="right w-xl bg-white md-whiteframe-z2 ng-scope">
				<div class="chatbox ng-scope">
					<!--1-->
					<div class="p-h-md">
						<a class="pull-right text-muted-lt text-2x m-t-n inline p-sm"
							data-dismiss="modal" href="http://maijiayun.cn/#">×</a> <strong>联系人</strong>
					</div>
					<!--搜索-->
					<div class="row p-h-plr">
						<div class="has-feedback dropdown">
							<input type="text" data-toggle="dropdown"
								placeholder="查找公司/姓名/手机"
								class="form-control input-sm dropdown-toggle"
								id="chatContactSearchBox"> <span
								style="width: 30px; height: 30px; line-height: 30px;"
								class="glyphicon glyphicon-search form-control-feedback c9"></span>
							<!---->
							<div style="padding-top: 0" role="menu" class="dropdown-menu row">
								<ul class="media-list m-userinfo scrollspy-example "
									style="margin-bottom: 0px; max-height: 470px; margin-top: 0px;"
									id="chatContactSearchResult">
								</ul>
							</div>
							<!---->
						</div>
					</div>
					<!--搜索 end-->
					<div class="row p-h-plr mt10">
						<div data-toggle="buttons"
							class="btn-group btn-group-justified btn-group-sm" role="tablist"
							id="chatContactTabHeader">
							<label class="btn btn-default chattab active"
								style="padding: 0px;"> <a data-toggle="tab"
								href="http://maijiayun.cn/#chatContactHuihuaTab"> <input
									type="radio" name="options" id="option1" autocomplete="off"
									checked=""> 会话
							</a>
							</label> <label class="btn btn-default chattab" style="padding: 0px;">
								<a data-toggle="tab"
								href="http://maijiayun.cn/#chatContactTongshiTab"> <input
									type="radio" name="options" id="option2" autocomplete="off"
									checked=""> 同事
							</a>
							</label> <label class="btn btn-default chattab" style="padding: 0px;">
								<a data-toggle="tab"
								href="http://maijiayun.cn/#chatContactFenxiaoTab"> <input
									type="radio" name="options" id="option3" autocomplete="off"
									checked=""> 供应商

							</a>
							</label>

						</div>
					</div>
					<!--2-->
					<div class="box-row">
						<div class="box-cell tab-content mt5" id="chatContactTabContent">
							<div class="box-inner tab-pane fade plate active in"
								id="chatContactHuihuaTab" role="tabpanel">
								<ul class="media-list m-userinfo scrollspy-example "
									style="margin-bottom: 0px; height: 100%; margin-top: 0px;">


									<li class="media themebgcolor2" style="margin-top: 0px;"
										id="recent_chatid_3941"><a class="block"
										href="http://maijiayun.cn/#" data-toggle="modal"
										data-target="#chatMessageModal" data-dismiss="modal"
										data-tid="70235" data-uid="18038" style="border-bottom: 0">
											<div class="s-avatar pull-left mr10">
												<img width="45" height="45"
													src="../img/1479387540867u=827755154,1215765185&amp;fm=21&amp;gp=0.jpg"
													class="media-object"> <span class="s-round-mask"></span>
											</div>
											<div class="media-body pt5">
												<div class="media-heading">
													<div class="c0">汪老板</div>
													<div class="c9">新世界手机</div>
												</div>
											</div>
									</a></li>

								</ul>
							</div>
							<div class="box-inner tab-pane fade plate"
								id="chatContactTongshiTab" role="tabpanel">
								<ul class="media-list m-userinfo scrollspy-example "
									style="margin-bottom: 0px; height: 100%; margin-top: 0px;">

									<li style="margin-top: 0px;" class="media themebgcolor2">
										<div style="height: 315px;" class="row p15 tc f14 lh30 c9">
											<div class="row">
												还没有同事,<br> 快邀请他们一起工作吧
											</div>

											<button data-toggle="modal" data-target="#inviteContactModal"
												data-dismiss="modal" data-tab="tongshi" type="button"
												class="btn btn-default mt20 inviteColleague">+邀请同事</button>

										</div>
									</li>


								</ul>
							</div>
							<div class="box-inner tab-pane fade plate"
								id="chatContactFenxiaoTab" role="tabpanel">
								<ul class="media-list m-userinfo scrollspy-example "
									style="margin-bottom: 0px; height: 100%; margin-top: 0px;">


									<li class="media themebgcolor2" style="margin-top: 0px;"
										id="contact_tuId_7023518038"><a class="block"
										href="http://maijiayun.cn/#" data-toggle="modal"
										data-target="#chatMessageModal" data-dismiss="modal"
										data-tid="70235" data-uid="18038" style="border-bottom: 0">
											<div class="s-avatar pull-left mr10">
												<img width="45" height="45"
													src="../img/1479387540867u=827755154,1215765185&amp;fm=21&amp;gp=0.jpg"
													class="media-object"> <span class="s-round-mask"></span>
											</div>
											<div class="media-body pt5">
												<div class="media-heading">
													<div class="c0">
														汪老板 <span id="unreadMsgCnt_tuId_7023518038"
															class="badge ml10" style="font-size: 10px; display: none">0</span>
													</div>
													<div class="c9">新世界手机</div>
												</div>
											</div>
									</a></li>

								</ul>
							</div>
						</div>
					</div>
					<!--3-->
					<div class="p-h-md bgf1">
						<div class="btn-group btn-group-justified btn-group-sm"
							role="tablist" data-toggle="buttons"
							id="chatContactBottomButtons">

							<a data-toggle="modal" data-target="#inviteContactModal"
								data-dismiss="modal" role="button" class="btn btn-default"
								href="http://maijiayun.cn/#">+ 邀请</a> <a data-toggle="modal"
								data-target="#chatGroupSendingModal" data-dismiss="modal"
								role="button" class="btn btn-default"
								href="http://maijiayun.cn/#">群发</a>
						</div>
					</div>
					<!--end-->
				</div>
			</div>
		</div>
		<!-- 聊天模态框结束 -->
		
		
		
		
		