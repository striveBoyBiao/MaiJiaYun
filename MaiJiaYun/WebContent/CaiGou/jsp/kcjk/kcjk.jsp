<%@page import="mjy.caigou.vo.PurchaseVO"%>
<%@page import="mjy.caigou.po.PageInfo"%>
<%@page import="mjy.caigou.vo.GoodsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7">
<![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8">
<![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9">
<![endif]-->
<!--[if gt IE 8]>
<html class="no-js">
<![endif]-->
<html
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths"
	style="">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta name="keywords"
	content="供销平台,分销平台,分销,供销,货源,分销推荐,货源推荐,供销系统,分销系统,ERP,免费ERP,ERP软件,免费ERP软件,进销存,进销存软件,免费进销存软件">
<meta name="description"
	content="禾唐卖家云独一无二的供销平台，开启供销双方合作的桥梁，无安装，免培训，极致用户体验 。包含寻找优质分销商，一键发布货源信息，一键代发、批发进货轻松接单！让您与分销商的订单业务无缝衔接，供销双方实时互动 ，沟通协作业务拓展不再是难事。">
<meta http-equiv="X-UA-Compatible" content="IE=8,9,chrome=1">
<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>



</head>

<body style="padding-right: 0px;" class="">
	<!--代码开始-->
	<div class="container" id="container">
		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
		<!--header 开始-->

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
					<a href="#" class="navbar-brand ml20">库存监控</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<!--<li class="active ml20" id="li-kucunjiankong"><a href="javascript:void(0);">库存监控 <span class="badge"></span></a></li>-->
					<li class="pull-right" id="li-query" style="padding-top: 12px;">
						<div class="w340">
							<form class="form-inline" role="form" method="get">
								<div class="input-group">
									<input name="q" class="form-control" style="width: 300px;"
										placeholder="商品货号/SKU编码/商品名称" type="text"> <span
										class="input-group-btn">
										<button class="btn btn-primary query" type="submit">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
								</div>
							</form>
						</div>
					</li>
					<li class="pull-right mr15" style="padding-top: 12px;"><select
						style="display: none;" id="warehouseId" class="selectpicker">
							<option selected="selected" value="">仓库名称</option>
							<option value="18358">默认仓库</option>
					</select>
						<div class="btn-group bootstrap-select">
							<button title="仓库名称" data-id="warehouseId" type="button"
								class="btn dropdown-toggle selectpicker btn-default"
								data-toggle="dropdown">
								<span class="filter-option pull-left">仓库名称</span>&nbsp;<span
									class="caret"></span>
							</button>
							<div class="dropdown-menu open">
								<!-- <ul class="dropdown-menu inner selectpicker" role="menu">
									<li class="selected" rel="0"><a tabindex="0" class=""
										style=""><span class="text">仓库名称</span><i
											class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li>
									<li rel="1"><a tabindex="0" class="" style=""><span
											class="text">默认仓库</span><i
											class="glyphicon glyphicon-ok icon-ok check-mark"></i></a></li>
								</ul> -->

								 <%
									List list4 = (List) request.getAttribute("list4");
								%>
								<%int k=0;
									for (int i = 0; i < list4.size(); i++) {
										k++;
								%>

								<li rel=a><a tabindex="0" class="" style=""
									onclick="dropDownBoxr(this)"><span
										id=<%=k%> class="text"><%=list4.get(i)%>

									</span></a></li>

								<%
									}
								%> 

							</div>
						</div>
					</li>
				</ul>
			</div>
			<!--titletab end-->
			<!--panel star-->
			<div class="prl10auto">
				<!--table star-->
				<div class="panel mt15">
					<!-- Table -->
					<table class="table table-striped table-hover">
						<thead class=" table-bordered">
							<tr>
								<th><input type="checkbox"></th>
								<th class="select" title="报警提示" colname="alarmMark">
									<div class="dropdown">
										<button class="btn dropdown-toggle fb"
											style="padding: 0; box-shadow: none; background: none"
											type="button" id="dropdownMenu1" data-toggle="dropdown">
											报警提示 <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu"
											aria-labelledby="dropdownMenu1">
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="javascript:void(0);">全部</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="javascript:void(0);">高于库存上限</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="javascript:void(0);">低于库存下限</a></li>
										</ul>
									</div>
								</th>
								<th>商品图</th>
								<th>商品货号</th>
								<th>SKU编码</th>
								<th>商品名称</th>

								<th>库存数量</th>
								<th>仓库</th>
								<th style="width: 80px">库存上限</th>
								<th style="width: 80px">库存下限</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<GoodsVO> list3 = null;
								/* List list4 = (List) request.getAttribute("list4"); */
								List list5 = (List) request.getAttribute("list5");

								for (int j = 0; j < 1; j++) {
									list3 = (List<GoodsVO>) list5.get(j);
									for (GoodsVO goodVo : list3) {
							%>

							<tr>

								<td><input type="checkbox" name="chek" /></td>

								<td><td><img src="+<%goodVo.getGoodPicture();%>>+"
									style="height: 50px; width: 50px;" class="img-thumbnail"
									alt="50x50"></td></td>


								<td><%=goodVo.getGoodId()%></td>
								<td><%=goodVo.getSku()%></td>
								<td><%=goodVo.getGoodName()%></td>
								<td><%=goodVo.getGoodRepertory()%></td>

								<td><%=list4.get(j)%></td>

								<td><button style="background: none; border: none;"
										type="button" class="btn btn-default operate-edit" title="">
										<i upperlimit="" class="glyphicon glyphicon-pencil"></i>
									</button></td>
								<td><button style="background: none; border: none;"
										type="button" class="btn btn-default operate-edit" title="">
										<i upperlimit="" class="glyphicon glyphicon-pencil"></i>
									</button></td>
								<%-- <td><%=goodVo.%></td> --%>
							</tr>
							<%
								}
								}
							%>

						</tbody>
					</table>
					</table>
					<!--table end-->
				</div>
				<!--panel end-->
				<!--分页 star-->
				<%--  <jsp:include page="/CaiGou/jsp/cgd/pagination.jsp">
					<jsp:param value="/MaiJiaYun/caigou/servlet/KcjkServlet" name="url" />
				</jsp:include>  --%>


				<nav>

					<%
						PageInfo<PurchaseVO> pageInfo = (PageInfo<PurchaseVO>) request.getAttribute("pageInfo");
					%>
					<div class="row" style="margin: 0; -moz-user-select: none;"
						onselectstart="return false;" id="paging"></div>

					<div style="float: right">
						<div style="margin-right: 10px; float: left;">
							<ul class="pagination">
								<li class="dropup">
									<div class="lh30 left">共</div>
									<div class="btn-group" style="margin: 0 5px;">
										<span class="lh30 left fb red" id="totalRecords"> <%=list3.size()%>
										</span>
										<div class="lh30 left" style="margin-left: 5px;">条记录</div>

									</div>
								</li>
							</ul>
						</div>


						<div style="width: 150px; float: left;">
							<ul class="pagination">
								<li class="dropup">
									<div class="lh30 left">每页显示</div>
									<div class="btn-group" style="margin: 0 5px;">


										<button type="button"
											class="btn dropdown-toggle selectpicker btn-default"
											data-toggle="dropdown" title="10";">
											<span id="shuzi" class="filter-option pull-left" name="pSize">
												<%=pageInfo.getPageSize()%>
											</span>&nbsp; <span class="caret"></span>
										</button>


										<ul class="dropdown-menu inner selectpicker" role="menu"
											style="max-height: 449px; overflow-y: auto; min-height: 71px; cursor: pointer;">
											<li rel="0" class="selected"><a
												href="/MaiJiaYun/caigou/servlet/KcjkServlet?pSize=10 "
												tabindex="0"><span class="text">10</span></a></li>
											<li rel="1"><a
												href="/MaiJiaYun/caigou/servlet/KcjkServlet?pSize=20 "
												tabindex="0" class="" style=""><span class="text"
													onclick="dropDownBoxr(this)">20</span></a></li>
											<li rel="2"><a
												href="/MaiJiaYun/caigou/servlet/KcjkServlet?pSize=50 "
												tabindex="0" class="" style=""><span class="text"
													onclick="dropDownBoxr(this)">50</span></a></li>
											<li rel="3"><a
												href="/MaiJiaYun/caigou/servlet/KcjkServlet?pSize=100 "
												tabindex="0" class="" style=""><span class="text"
													onclick="dropDownBoxr(this)">100</span></a></li>
											<li rel="4"><a
												href="/MaiJiaYun/caigou/servlet/KcjkServlet?pSize=200 "
												tabindex="0" class="" style=""><span class="text"
													onclick="dropDownBoxr(this)">200</span></a></li>
										</ul>
									</div>
								</li>
							</ul>
						</div>

						<div style="width: 350px; float: left;" id="pagingPages">
							<ul class="pagination">
								<!-- 前一页 -->
								<%
									int pageNo = Integer.parseInt(pageInfo.getPageNum());

									if (pageNo == 1) {
								%>
								<li class="disabled"><a href="#">&laquo;</a></li>
								<%
									} else {
								%>
								<li class="active"><a
									href="/MaiJiaYun/caigou/servlet/KcjkServlet?pageNo=<%=pageNo - 1%><%=pageInfo.getQueryUrl()%>&pSize=<%=pageInfo.getPageSize()%>">&laquo;</a></li>
								<%
									}
								%>

								<!-- 计算显示的页码 -->
								<%
									int pageCount = pageInfo.getPageCount();
									int begin = 0, end = 0;

									if (pageCount <= 5) {
										begin = 1;
										end = pageCount;
									} else {
										begin = pageNo - 2;
										end = pageNo + 3;

										if (begin < 1) {
											begin = 1;
											end = 5;
										}

										if (end > pageCount) {
											begin = pageCount - 4;
											end = pageCount;
										}
									}
								%>

								<%
									for (int i = begin; i <= end; i++) {
										if (i == pageNo) {
								%>
								<li class="active"><a
									href="/MaiJiaYun/caigou/servlet/KcjkServlet?pageNo=<%=i%>&queryUrl=<%=pageInfo.getQueryUrl()%>&pSize=<%=pageInfo.getPageSize()%>"><%=i%></a></li>
								<%
									} else {
								%>
								<li><a
									href="/MaiJiaYun/caigou/servlet/KcjkServlet?pageNo=<%=i%>&queryUrl=<%=pageInfo.getQueryUrl()%>&pSize=<%=pageInfo.getPageSize()%>"><%=i%></a></li>
								<%
									}
									}
								%>

								<%
									if (end < pageCount) {
								%>
								<li><a href="#">....</a></li>
								<%
									}
								%>
								<%
									if (pageNo == pageCount) {
								%>
								<li class="disabled"><a href="#">&raquo;</a></li>
								<%
									} else {
								%>
								<li><a
									href="/MaiJiaYun/caigou/servlet/KcjkServlet?pageNo=<%=pageNo + 1%>&pSize=<%=pageInfo.getPageSize()%>">&raquo;</a></li>
								<%
									}
								%>
							</ul>
						</div>

					</div>
				</nav>




				<!--分页 end-->
				<!--Layout right part end-->
			</div>
		</div>









		<div class="contentbox" id="contentbox"
			style="background: rgb(241, 241, 241) none repeat scroll 0% 0%; display: none;"></div>
		<!--Layout right part end-->

		<div id="spinner" style="display: none;">
			<div class="modal fade" aria-hidden="false" role="dialog"
				tabindex="-1" style="display: block;">
				<div class="modal-dialog tc" style="margin-top: 300px;">
					<img src="img/loading3.gif">
				</div>
			</div>
			<div class="modal-backdrop fade" style="background: #ffffff;"></div>
		</div>

		<div data-backdrop="false" id="chatContactModal"
			class="modal fade ng-scope" aria-hidden="true">
			<div class="right w-xl bg-white md-whiteframe-z2 ng-scope">
				<div class="chatbox ng-scope">
					<!--1-->
					<div class="p-h-md">
						<a class="pull-right text-muted-lt text-2x m-t-n inline p-sm"
							data-dismiss="modal" href="#">×</a> <strong>联系人</strong>
					</div>
					<!--搜索-->
					<div class="row p-h-plr">
						<div class="has-feedback dropdown">
							<input data-toggle="dropdown" placeholder="查找公司/姓名/手机"
								class="form-control input-sm dropdown-toggle"
								id="chatContactSearchBox" type="text"> <span
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
								href="#chatContactHuihuaTab"> <input name="options"
									id="option1" autocomplete="off" type="radio"> 会话
							</a>
							</label> <label class="btn btn-default chattab" style="padding: 0px;">
								<a data-toggle="tab" href="#chatContactTongshiTab"> <input
									name="options" id="option2" autocomplete="off" type="radio">
									同事
							</a>
							</label> <label class="btn btn-default chattab" style="padding: 0px;">
								<a data-toggle="tab" href="#chatContactFenxiaoTab"> <input
									name="options" id="option3" autocomplete="off"
									checked="checked" type="radio"> 分销商

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

									<li style="margin-top: 0px;" class="media themebgcolor2">
										<div style="height: 315px;" class="row p15 tc f14 lh30 c9">
											<div class="row">暂时没有新的会话</div>
										</div>
									</li>


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

									<li style="margin-top: 0px;" class="media themebgcolor2">
										<div style="height: 315px;" class="row p15 tc f14 lh30 c9">
											<div class="row">
												还没有供应商,<br> 快邀请他们一起上卖家云
											</div>
											<button data-toggle="modal" data-target="#inviteContactModal"
												data-dismiss="modal" data-tab="fenxiao" type="button"
												class="btn btn-default mt20 inviteColleague">+邀请合作伙伴</button>
										</div>
									</li>


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
								href="#">+ 邀请</a> <a data-toggle="modal"
								data-target="#chatGroupSendingModal" data-dismiss="modal"
								role="button" class="btn btn-default" href="#">群发</a>
						</div>
					</div>
					<!--end-->
				</div>
			</div>
		</div>
		<div id="chatMessageModal" class="modal fade ng-scope"
			aria-hidden="true">
			<div class="right w-xxl bg-white md-whiteframe-z2 ng-scope" style="">
				<div class="chatbox ng-scope">
					<!---->
					<div class="p-h-md tc bgf1">
						<a class="pull-right text-muted-lt text-2x m-t-n inline p-sm"
							data-dismiss="modal" href="#">×</a> <a class="pull-left f18"
							data-toggle="modal" data-target="#chatContactModal"
							data-dismiss="modal" href="#"> <span
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
								<input placeholder="按回车发送消息" autocomplete="off"
									class="form-control" id="sendChatMessageInput" type="text">
								<span class="input-group-btn">
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
							data-dismiss="modal" href="#">×</a> <a class="pull-left f18"
							data-toggle="modal" data-target="#chatContactModal"
							data-dismiss="modal" href="#" id="chatGroupSendingBack"> <span
							class="glyphicon glyphicon-arrow-left"></span>
						</a> <strong>选择联系人</strong>
					</div>
					<!--搜索-->
					<div class="row p-h-plr">
						<div class="has-feedback dropdown">
							<input data-toggle="dropdown" placeholder="查找公司/姓名/手机"
								class="form-control input-sm dropdown-toggle"
								id="chatGroupSendingSearchBox" type="text"> <span
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
								<input placeholder="按回车发送消息" autocomplete="off"
									class="form-control" id="sendChatGroupMessageInput" type="text">
								<span class="input-group-btn">
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
								<a href="#tab1" role="tab" data-toggle="tab">邀请同事</a>
							</li>
							<li class="tab" role="presentation" id="inviter-tab2"><a
								href="#tab2" role="tab" data-toggle="tab">邀请合作伙伴</a></li>
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
												<input name="userName" class="form-control"
													placeholder="被邀请人的姓名(必填)" type="text"> <span
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
												<input name="userPhone" class="form-control"
													placeholder="被邀请人的手机号(必填)" type="text"> <span
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
												<input name="userEmail" class="form-control"
													placeholder="被邀请人的Email地址(非必填)" type="text"> <span
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
												<input name="companyName" class="form-control"
													placeholder="被邀请的企业名称(必填)" type="text"> <span
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
												<input name="companyUserName" class="form-control"
													placeholder="被邀请的联系人姓名(必填)" type="text"> <span
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
												<input name="companyUserPhone" class="form-control"
													placeholder="被邀请人的手机号(必填)" type="text"> <span
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
												<input name="companyUserEmail" class="form-control"
													placeholder="被邀请人的Email地址(非必填)" type="text"> <span
													class="glyphicon form-control-feedback"></span>
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
														<li class="active" id="companysupplier"><a href="#"><input
																checked="checked" value="option1" name="optionsRadios1"
																type="radio"> 供应商</a></li>
														<li class="" id="companydealer"><a href="#"><input
																value="option2" name="optionsRadios2" type="radio">
																分销商</a></li>
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
											<input disabled="disabled" id="manageContactUserNameInput"
												name="name" class="form-control" placeholder="请输入您同事的姓名"
												type="text"> <span
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
											<input disabled="disabled" id="manageContactUserPhoneInput"
												name="phone" class="form-control" placeholder="请输入您同事的手机号码"
												type="text"> <span
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
											<input disabled="disabled" id="manageContactUserEmailInput"
												name="email" class="form-control" placeholder="请输入您同事的Email"
												type="text"> <span
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

		<div aria-hidden="true" aria-labelledby="edit_accountModalLabel"
			role="dialog" tabindex="-1" id="edit_accountModal" class="modal fade"
			style="display: none;"></div>
		<div id="modal"></div>
	</div>
	<!--代码结束-->
</body>
</html>