<%@page import="mjy.caigou.vo.PurchaseVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- saved from url=(0033)http://maijiayun.cn/cg/caigouwait -->
<html
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="renderer" content="webkit">
<meta name="keywords"
	content="供销平台,分销平台,分销,供销,货源,分销推荐,货源推荐,供销系统,分销系统,ERP,免费ERP,ERP软件,免费ERP软件,进销存,进销存软件,免费进销存软件">
<meta name="description"
	content="禾唐卖家云独一无二的供销平台，开启供销双方合作的桥梁，无安装，免培训，极致用户体验 。包含寻找优质分销商，一键发布货源信息，一键代发、批发进货轻松接单！让您与分销商的订单业务无缝衔接，供销双方实时互动 ，沟通协作业务拓展不再是难事。">
<meta http-equiv="X-UA-Compatible" content="IE=8,9,chrome=1">
<title></title>
<link href="/MaiJiaYun/CaiGou/css/purchase.css">
<script type="text/javascript" src="/MaiJiaYun/Common/js/jquery.min.js"></script>
<script type="text/javascript" src="/MaiJiaYun/CaiGou/js/purchase.js"></script>
<script type="text/javascript" src="/MaiJiaYun/CaiGou/js/purchase_2.js"></script>
</head>


<body class="" style="padding-right: 0px;">





	<!--代码开始-->
	<div class="container" id="container">
	<!--header 开始-->
	<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
	
	
		
		<!--header 结束-->
		<!--Layout left part star-->
		<!-- style="position: fixed;left:0, top:0, z-index:1030; display:none;" -->
		<!--<div class="sidebar-nav navbar-fixed-top" id="menu" style="display:none;"></div>-->
		<!--Layout left part end-->
		<!--Layout right part star-->
		<div class="content" id="content">
			<!--titletab star-->
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0;">
				<div class="navbar-header">
					<a href="#" class="navbar-brand ml20">采购单</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<li id="li-caigouwait" class="ml20 tab active"><a
						href="" class="">待采购审核 <span></span></a></li>
					<li id="li-caiwuwait" class="tab"><a href="/MaiJiaYun/caigou/servlet/DcwServlet" class="c6">待财务审核<span></span></a></li>
					<li id="li-auticomplete" class="tab"><a href="/MaiJiaYun/caigou/servlet/ShywcServlet" 
						class="c6">审核已完成</a></li>
					<li class="pull-right" id="li-query" style="padding-top: 12px;">
						<div class="w340">
						<form class="form-inline" role="form" method="get">
							<div class="input-group">
							
								<input name="q" type="text" class="form-control"
									placeholder="采购单编号/制单人/供应商/仓库"> <span
									class="input-group-btn">
									<button type="submit" class="btn btn-primary query">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
								
							</div>
							</form>
						</div>
					</li>
				</ul>
			</div>
			<!--titletab end-->
			<!--panel star-->
			<form action="/MaiJiaYun/caigou/servlet/DcServlet" >
			<div class="prl10auto" id="panel">
				<div class="btn-group-block">
					<a href="/MaiJiaYun/caigou/servlet/XzcgServlet"><button id="addPurchase"
							class="btn btn-default mr5" type="button">新增采购单</button></a>
					<div class="btn-group mr5" id="divImport">
						
						<button class="btn btn-default " data-toggle="modal"
							data-target="#myModal" type="submit">导出</button>
					
						<!-- <button class="btn btn-default" type="button" id="importButton">导出</button> -->
				

						<!-- <button id="importOrderListButton" type="button"
							class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							<span class="glyphicon glyphicon-save mr5"></span><span
								class="f10" id="taskCount" style="display: none;"> </span>
						</button> -->
						
						<button id="importOrderListButton" style="height: 34px"
							type="submit" class="btn btn-default dropdown-toggle"
							data-toggle="dropdown">
							<span class="glyphicon glyphicon-save mr5"></span> <span
								class="f10" id="taskCount" style="display: none;"></span>
						</button>
						
						
						<ul id="importOrderUl" aria-labelledby="importOrderListButton"
							style="width: 340px; height: 200px;" role="menu"
							class="dropdown-menu scrollspy-example">
							<li>aaaa</li>
						</ul>
					</div>
					<button type="button" class="btn btn-default" data-toggle="modal"
						data-target="#myModal">导入</button>

					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true"
						style="margin-top: 30px">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header" ><!-- style="margin-top: 30px" -->
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h2 class="modal-title">导入采购单商品</h2>

									<div class="modal-body" style="padding: 10px 20px;">
										<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content">
				<div class="modal-header" >
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h2>导入采购单</h2>  </div>
					<div class="modal-body" style="padding:10px 20px;"> -->

										<p class="f14">采购单导入说明，导入前请仔细阅读</p>
						<p class="lh27">
							1. 请先下载“采购单信息导入模板”<a id="downloadCaigouTemplateBtn" href="/MaiJiaYun/caigou/servlet/Dr_xiazai;" target="_self">点此下载</a><br> 
							2. 导入模板内的所有字段都是"必填"项<br> 
							3. "仓库"在一行内只能填写一个，且仓库列表里存在该仓库<br>
							4. "供应商"在一行内只能填写一个，且供应商列表里存在该供应商<br>
							5. "商品SKU编码"，在一行内只能填写一个，且商品信息内存在该商品<br>
							6."采购单信息导入模板"请放入D盘存放<br>
						</p>
										<div>
											<form  method="POST" enctype="multipart/form-data">
												<input type="file" name="pimage" style="height: 30px" id="rimage" /><br />
											</form>
										</div>
									</div>
									<div class="modal-footer"
										style="margin-top: 0px; background: #ebebeb; padding: 5px 20px">
										<button type="button" id="goToNext" class="btn btn-primary" 
											>确定</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">取消</button>

									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- 采购单导入提示框 -->
					<div class="modal fade" id="importCaigouModal" tabindex="-1"
						role="dialog" aria-labelledby="daoruModalLabel" aria-hidden="true"
						style="display: none;"></div>
					<!-- 调拨单文件上传等待提示框 start -->
					<div id="uploadWaitingModel" style="position: fixed;"></div>
				</div>
				<div class="panel">
					<table class="table table-striped table-hover" id="caigoutable">
						<thead class=" table-bordered">
							<tr>
								<th><input type="checkbox" id="check" onclick="getChecks()"></th>
								<th>采购单编号</th>
								<th>供应商</th>
								<th>仓库</th>
								<th>采购数量</th>
								<th>已入库数量</th>
								<th>采购总额</th>
								<th>创建时间</th>
								<th>制单人</th>
								<th>备注</th>
								<th>操作</th>
							</tr>





						</thead>
						<tbody id="catgoubody">
								<% 
									List<PurchaseVO> list=(List<PurchaseVO>)request.getAttribute("list");
									for(PurchaseVO purchaseVo:list) {%>
										<tr>
											<td><input type="checkbox"  name="checkOrder"  value="<%=purchaseVo.getPurchaseCode() %>"/>
								</td>
											<td><%=purchaseVo.getPurchaseCode() %></td>
											<td><%=purchaseVo.getSupplierCName()%></td>
											<td><%=purchaseVo.getWareHouseName()%></td> 
											<td><%=purchaseVo.getPurchaseNumber()%></td>
											<td><%=purchaseVo.getStorageQuantity()%></td>
											<td><%=purchaseVo.getPurchaseSum()%></td>
											<td><%=purchaseVo.getCreatTime()%></td>
											<td><%=purchaseVo.getUserType()%></td>
											
											<td><%=purchaseVo.getRemark()%></td>
											<td><a id="shtgtd" href="/MaiJiaYun/caigou/servlet/DcgServlet?purchaseCode=<%=purchaseVo.getPurchaseCode()%>&state=2"  class="chaolian"><button type="button" id="shtg" class="btn btn-default mr5 operate-purchase-audit" >审核通过</button></a>
					<a href="/MaiJiaYun/caigou/servlet/EditcgServlet?purchaseId=<%=purchaseVo.getPurchaseId()%>" class="mr5 operate-purchase-order-edit" >详情</a>
					<%-- <a href="/MaiJiaYun/caigou/servlet/DcgServlet?purchaseCode=<%=purchaseVo.getPurchaseCode()%>" class="operate-purchase-delete" >删除</a></td> --%>
					<a id="<%=purchaseVo.getPurchaseCode()%>" class="operate-purchase-delete" onclick="deleteDate()" >删除</a></td>
										</tr>	
								<%} %>	
									
						</tbody>
					</table>
				</div>
			</div>
			</form>
			<!--panel end-->
			<!--分页 star-->
			<div class="row" style="margin: 0; -moz-user-select: none;"
				onselectstart="return false;" id="paging"></div>
			<!--分页 end-->
			<!--Layout right part end-->
		</div>
		<div class="contentbox" id="contentbox"
			style="display: none; background: rgb(241, 241, 241);"></div>
		<!--Layout right part end-->

		<div id="spinner" style="display: none;">
			<div class="modal fade" aria-hidden="false" role="dialog"
				tabindex="-1" style="display: block;">
				<div class="modal-dialog tc" style="margin-top: 300px;">
					<img src="js/loading3.gif">
				</div>
			</div>
			<div class="modal-backdrop fade" style="background: #ffffff;"></div>
		</div>

		
		<div id="chatMessageModal" class="modal fade ng-scope"
			aria-hidden="true">
			<div class="right w-xxl bg-white md-whiteframe-z2 ng-scope" style="">
				<div class="chatbox ng-scope">
					<!---->
					<div class="p-h-md tc bgf1">
						<a class="pull-right text-muted-lt text-2x m-t-n inline p-sm"
							data-dismiss="modal" href="http://maijiayun.cn/#">×</a> <a
							class="pull-left f18" data-toggle="modal"
							data-target="#chatContactModal" data-dismiss="modal"
							href="http://maijiayun.cn/#"> <span
							class="glyphicon glyphicon-arrow-left"></span>
						</a> <strong><span id="chatUserName">&nbsp;</span></strong>
					</div>
					<!---->
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
					<!---->
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
					<!---->
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
		<div id="inviteContactModal" class="modal fade" tabindex="-1"
			role="dialog" aria-labelledby="inviteContactModalLabel"
			aria-hidden="true">
			<div style="width: 795px;" class="modal-dialog">
				<div class="modal-content">
					<div
						class="collapse navbar-collapse navbar-default navbar-titletab"
						style="padding: 0px 0 0 0;">
						<button type="button" class="close p10" data-dismiss="modal"
							aria-hidden="true">×</button>
						<ul role="tablist" class="nav nav-tabs f14 fb" id="myTab">
							<li class="ml20 tab active" role="presentation" id="inviter-tab1">
								<a href="http://maijiayun.cn/#tab1" role="tab" data-toggle="tab">邀请同事</a>
							</li>
							<li class="tab" role="presentation" id="inviter-tab2"><a
								href="http://maijiayun.cn/#tab2" role="tab" data-toggle="tab">邀请合作伙伴</a>
							</li>
						</ul>
					</div>

					<div role="tabpanel" class="modal-body row"
						style="padding: 15px 0 0 0;">
						<div class="tab-content">
							<div id="tab1" class="tab-pane fade active in" role="tabpanel">
								<form class="form-horizontal" role="form">
									<div class="col-md-8">
										<label for="inputEmail3" class="col-sm-2 control-label c6">姓名</label>
										<div class="form-group has-feedback">
											<div class="col-sm-10">
												<input type="text" name="userName" class="form-control"
													placeholder="被邀请人的姓名(必填)"> <span
													class="glyphicon form-control-feedback"></span>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-left: 0px;">
										<div class="form-group">
											<div name="userName" class="alert alert-danger p7 f12"
												role="alert" style="display: none;"></div>
										</div>
									</div>
									<!---->
									<div class="col-md-8">
										<label for="inputEmail3" class="col-sm-2 control-label c6">手机</label>
										<div class="form-group has-feedback">
											<div class="col-sm-10">
												<input type="text" name="userPhone" class="form-control"
													placeholder="被邀请人的手机号(必填)"> <span
													class="glyphicon form-control-feedback"></span>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-left: 0px;">
										<div class="form-group">
											<div name="userPhone" class="alert alert-danger p7 f12"
												role="alert" style="display: none;"></div>
										</div>
									</div>
									<div class="col-md-8">
										<label for="inputEmail3" class="col-sm-2 control-label c6">Email</label>
										<div class="form-group has-feedback">
											<div class="col-sm-10">
												<input type="text" name="userEmail" class="form-control"
													placeholder="被邀请人的Email地址(非必填)"> <span
													class="glyphicon form-control-feedback"></span>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-left: 0px;">
										<div class="form-group">
											<div name="userEmail" class="alert alert-danger p7 f12"
												role="alert" style="display: none;"></div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="divider_line"></div>
									</div>
									<!---->
									<div class="col-md-12 mt10">
										<div class="form-group">
											<label class="ml20">分配岗位</label>
											<div class="row mt10">
												<div class="col-md-12 selectblock">
													<ul>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="19"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	管理员
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="10"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	客服
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="11"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	订单处理
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="15"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	库管
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="16"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	采购
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="17"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	运营
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="18"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	财务
															</span>
														</a></li>

													</ul>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>

							<div id="tab2" class="tab-pane fade" role="tabpanel">
								<form class="form-horizontal" role="form">
									<div class="col-md-8">
										<label for="inputEmail3" class="col-sm-2 control-label c6">企业名称</label>
										<div class="form-group has-feedback">
											<div class="col-sm-10">
												<input type="text" name="companyName" class="form-control"
													placeholder="被邀请的企业名称(必填)"> <span
													class="glyphicon form-control-feedback"></span>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-left: 0px;">
										<div class="form-group">
											<div name="companyName" class="alert alert-danger p7 f12"
												role="alert" style="display: none;"></div>
										</div>
									</div>
									<div class="col-md-8">
										<label for="inputEmail3" class="col-sm-2 control-label c6">联系人</label>
										<div class="form-group has-feedback">
											<div class="col-sm-10">
												<input type="text" name="companyUserName"
													class="form-control" placeholder="被邀请的联系人姓名(必填)"> <span
													class="glyphicon form-control-feedback"></span>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-left: 0px;">
										<div class="form-group">
											<div name="companyUserName" class="alert alert-danger p7 f12"
												role="alert" style="display: none;"></div>
										</div>
									</div>
									<div class="col-md-8">
										<label for="inputEmail3" class="col-sm-2 control-label c6">手机</label>
										<div class="form-group has-feedback">
											<div class="col-sm-10">
												<input type="text" name="companyUserPhone"
													class="form-control" placeholder="被邀请人的手机号(必填)"> <span
													class="glyphicon form-control-feedback"></span>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-left: 0px;">
										<div class="form-group">
											<div name="companyUserPhone"
												class="alert alert-danger p7 f12" role="alert"
												style="display: none;"></div>
										</div>
									</div>
									<div class="col-md-8">
										<label for="inputEmail3" class="col-sm-2 control-label c6">Email</label>
										<div class="form-group has-feedback">
											<div class="col-sm-10">
												<input type="text" name="companyUserEmail"
													class="form-control" placeholder="被邀请人的Email地址(非必填)">
												<span class="glyphicon form-control-feedback"></span>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-left: 0px;">
										<div class="form-group">
											<div name="companyUserEmail"
												class="alert alert-danger p7 f12" role="alert"
												style="display: none;"></div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="divider_line"></div>
									</div>
									<div class="col-md-12 mt10">
										<div class="form-group">
											<label class="ml20">您邀请的合作伙伴身份是</label>
											<div class="row mt10">

												<div class="col-md-12 selectblock">
													<ul>
														<li class="active" id="companysupplier"><a
															href="http://maijiayun.cn/#"><input type="radio"
																checked="true" value="option1" name="optionsRadios1">
																供应商</a></li>
														<li class="" id="companydealer"><a
															href="http://maijiayun.cn/#"><input type="radio"
																value="option2" name="optionsRadios2"> 分销商</a></li>
													</ul>
												</div>

											</div>
										</div>
									</div>
								</form>

							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary invite">邀请</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
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

		<!--panel end-->
			<!--分页 star-->
			<jsp:include page="pagination.jsp">
				<jsp:param value="/MaiJiaYun/caigou/servlet/DcgServlet" name="url"/>			
			</jsp:include>

			<!--分页 end-->
		<div id="modal"></div>
	</div>
	<!--代码结束-->
</body>
</html>