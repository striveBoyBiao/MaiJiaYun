<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>shangpinduiying</title>
</head>
<body>

	<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>

	<div class="content" id="content">
		<!--star-->
		<!---->
		<div class="collapse navbar-collapse navbar-default navbar-titletab"
			style="padding: 0px 0 0 0; background: #ffffff;">
			<div class="navbar-header">
				<a href="javascript:history.back()" class="navbar-brand ml20"><span
					class="fb fmsun">&lt;&nbsp;</span>商品对应</a>
			</div>
			<ul class="nav nav-tabs f14 fb">
				<!--<li class="active ml20 tab"><a href="javascript:void(0);"  style="background:#f1f1f1;">商品对应</a></li>-->
			</ul>
		</div>
		<div class="prl10auto">
			<div class="btn-group-block">

				<div role="form" class="form-inline">
					<div class="form-group f14 fb mr10">店铺名称</div>
					<div class="form-group mr5">

						<select id="eShopId" class="selectpicker" style="display: none;">

						</select>
						<div class="btn-group bootstrap-select">
							<button type="button"
								class="btn dropdown-toggle selectpicker btn-default"
								data-toggle="dropdown" data-id="eShopId" id="myButton"
								title="Nothing Seleted">
								<span class="filter-option pull-left">请选择店铺</span>&nbsp;<span
									class="caret"></span>
							</button>
							<div class="dropdown-menu open">
								<ul class="dropdown-menu inner selectpicker" role="menu" id="caidan">
									<c:set var="index" value="1"></c:set>
									<c:forEach items="${shopNames}" var="names">
										<li rel="${index}"><c:set var="index" value="${index+1}" />
											<a tabindex="0" class="" style="cursor: pointer"
											onclick="changeShopNames(this)"><span class="text">${names}</span>
										</a></li>
									</c:forEach>
								</ul>

							</div>
						</div>
					</div>

					<div class="form-group mr5">
						<select id="selGoodsStatus" class="selectpicker"
							data-width="130px" style="display: none;">
							<option value="2">全部商品</option>
							<option value="1">上架的商品</option>
							<option value="0">下架的商品</option>
						</select>
						<div class="btn-group bootstrap-select" style="width: 130px;">
							<button type="button"
								class="btn dropdown-toggle selectpicker btn-default"
								data-toggle="dropdown" data-id="selGoodsStatus" title="上架的商品"
								id="selector">
								<span class="filter-option pull-left">全部商品</span>&nbsp;<span
									class="caret"></span>
							</button>
							<div class="dropdown-menu open">
								<ul class="dropdown-menu inner selectpicker" role="menu">
									<li rel="2"><a tabindex="0" class=""
										style="cursor: pointer"><span class="text"
											onclick="selectGoods(this)">全部商品</span></a></li>
									<li rel="1" class="selected"><a tabindex="0" class=""
										style="cursor: pointer"><span class="text"
											onclick="selectGoods(this)">上架的商品</span></a></li>
									<li rel="0"><a tabindex="0" class=""
										style="cursor: pointer"><span class="text"
											onclick="selectGoods(this)">下架的商品</span></a></li>
								</ul>
							</div>
						</div>
					</div>

					<script type="text/javascript">
					<!--ajax动态生成tbody-->
						var shop;
						function changeShopNames(obj) {
							//店铺下拉菜单 
							var str = $(obj).find("span").text();
							$("#myButton .pull-left").text(str);
							index=$(obj).parent().attr("rel");
							var shopGoodss = document.getElementById("shopGoodss");
							shopGoodss.innerHTML = "";
							
							$.ajax({
									url : "/MaiJiaYun/servlet/cg/spduiying?method=getShopGoodss&index="
											+ $(obj).parent().attr("rel"),
									type : "get",
									datatype : "json",
									success : function(data) {
										var context = "";
	
										$.each(data,function(index, element) {
											context += "<tr><td><input type=\"checkbox\"></td>"
													+ "<td><img src="+element.goodImage+" style=\"height: 50px; width: 50px;\" class=\"img-thumbnail\" alt=\"50x50\"></td>"
													+ "<td>"
													+ element.goodId
													+ "</td>"
													+ "<td>"
													+ element.goodName
												    + "</td>"
													+ "<td>"
													+ element.goodPrice
													+ "</td>"
													+ "<td>"
												    + element.goodWeight
													+ "</td>"
													+ "<td>"
													+ element.goodRepertory
													+ "</td>"
													+ "<td></td>"
													+ "</tr>"
										});
										shopGoodss.innerHTML = context;
										}
									});
							$("#goodsPage input").removeAttr("checked");
						}
					
						//上架下架下拉菜单
						function selectGoods(obj) {
							var str = $(obj).text();
							$("#selector .pull-left").text(str);
							isonshelf=$(obj).parent().parent().attr("rel");
							
							var shopGoodss = document.getElementById("shopGoodss");
							shopGoodss.innerHTML = "";
							$.ajax({
								url : "/MaiJiaYun/servlet/cg/spduiying?method=queryShopGoods&isOnSelf="
										+ $(obj).parent().parent().attr("rel"),
								type : "get",
								datatype : "json",
								success : function(data) {
									
									var context = "";
									$.each(data,function(index, element) {
										context += "<tr><td><input type=\"checkbox\"></td>"
												+ "<td><img src="+element.goodImage+" style=\"height: 50px; width: 50px;\" class=\"img-thumbnail\" alt=\"50x50\"></td>"
												+ "<td>"
												+ element.goodId
												+ "</td>"
												+ "<td>"
												+ element.goodName
											    + "</td>"
												+ "<td>"
												+ element.goodPrice
												+ "</td>"
												+ "<td>"
											    + element.goodWeight
												+ "</td>"
												+ "<td>"
												+ element.goodRepertory
												+ "</td>"
												+ "<td></td>"
												+ "</tr>"
									});
									shopGoodss.innerHTML = context;
									}
								});
						$("#goodsPage input").removeAttr("checked");
						}
						
						//全选全不选
						function checkAll(flag) {
							//选出大于0的所有的checkox
							var boxes = $(":checkbox:gt(0)");
							for (var i = 0; i < boxes.length; i++) {
								if (boxes[i].type = "checkbox") {
									boxes[i].checked = flag;	
								}
							}
						}
						//联合搜索框 
						function search(){
							var shopGoodss = document.getElementById("shopGoodss");
							shopGoodss.innerHTML = "";
							$.ajax({
								url : "/MaiJiaYun/servlet/cg/spduiying?method=searchGoods&goodParams="
									+ $("#myinput").val()+"&isOnShelf="+isonshelf+"&shopGoodsIdParam="+index,
							type : "get",
							datatype : "json",
							success : function(data) {
								
								var context = "";
								
								$.each(data,function(index, element) {
									context += "<tr><td><input type=\"checkbox\"></td>"
											+ "<td><img src=\""+element.goodImage+"\" style=\"height: 50px; width: 50px;\" class=\"img-thumbnail\" alt=\"50x50\"></td>"
											+ "<td>"
											+ element.goodId
											+ "</td>"
											+ "<td>"
											+ element.goodName
										    + "</td>"
											+ "<td>"
											+ element.goodPrice
											+ "</td>"
											+ "<td>"
										    + element.goodWeight
											+ "</td>" 
											+ "<td>"
											+ element.goodRepertory
											+ "</td>"
											+ "<td></td>"
											+ "</tr>";
								});
								
								shopGoodss.innerHTML = context;
								}
							});
							$("#goodsPage input").removeAttr("checked");
						}
						
						//商品已对应
						function duiYingGoods() {
							var shopGoodss = document.getElementById("shopGoodss");
							shopGoodss.innerHTML = "";
							$.ajax({
								url : "/MaiJiaYun/servlet/cg/spduiying?method=duiYing&isFlag=1&shopId="+index,
								type : "get",
								datatype : "json",
								success : function(data) {
									
									var context = "";
									$.each(data,function(index, element) {
										context += "<tr><td><input type=\"checkbox\"></td>"
												+ "<td><img src="+element.goodImage+" style=\"height: 50px; width: 50px;\" class=\"img-thumbnail\" alt=\"50x50\"></td>"
												+ "<td>"
												+ element.goodId
												+ "</td>"
												+ "<td>"
												+ element.goodName
											    + "</td>"
												+ "<td>"
												+ element.goodPrice
												+ "</td>"
												+ "<td>"
											    + element.goodWeight
												+ "</td>"
												+ "<td>"
												+ element.goodRepertory
												+ "</td>"
												+ "<td style=\"color:Blue\">已对应</td>"
												+ "</tr>"
									});
									shopGoodss.innerHTML = context;
									}
								});
								$("#goodsPage input").removeAttr("checked");
						}
						
						//商品未对应
						function unDuiYingGoods() {
							var shopGoodss = document.getElementById("shopGoodss");
							shopGoodss.innerHTML = "";
							$.ajax({
								url : "/MaiJiaYun/servlet/cg/spduiying?method=unDuiYing&isFalse=0&params="+index,
								type : "get",
								datatype : "json",
								success : function(data) {
									
									var context = "";
									$.each(data,function(index, element) {
										context += "<tr><td><input type=\"checkbox\"></td>"
												+ "<td><img src="+element.goodImage+" style=\"height: 50px; width: 50px;\" class=\"img-thumbnail\" alt=\"50x50\"></td>"
												+ "<td>"
												+ element.goodId
												+ "</td>"
												+ "<td>"
												+ element.goodName
											    + "</td>"
												+ "<td>"
												+ element.goodPrice
												+ "</td>"
												+ "<td>"
											    + element.goodWeight
												+ "</td>"
												+ "<td>"
												+ element.goodRepertory
												+ "</td>"   
												+ "<td>"+"<a style=\"cursor:pointer\" onclick=\"getRowShopId(this)\">对应</a></td>"
												+ "</tr>"
									});
									shopGoodss.innerHTML = context;
									}
								});
								$("#goodsPage input").removeAttr("checked");
						}
						function getRowShopId(obj){
							
							
							var goodId=$(obj).parent().prev().prev().prev().prev().prev().html() ;  
							$.post("/MaiJiaYun/servlet/cg/spduiying?method=updateGoods",{"goodId":goodId},function(){
								$(obj).parent().parent().remove();
							});
						 	
						 
						 	
						}
					</script>
					
					
					<!-- 搜索框开始 -->
					<div class="form-group mr10 w340" id="li-query">
						<div class="input-group">
							<input type="text" placeholder="网店商品名称/网店商品货号"
								class="form-control" name="q" id="myinput"><span
								class="input-group-btn">
								<button class="btn btn-primary query" type="button" onclick="search()">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</div>
					<!-- 搜索框结束 -->
				</div>
			</div>
			<!-- 对应 开始-->
			<div class="panel" style="margin-bottom: 0px; padding: 0">
				<div style="padding: 0; border-left: none; background: #ffffff;">
					<ul id="myTab" class="nav nav-tabs"
						style="background: #cccccc; border: none;" role="tablist">
						<li class="fb" style="margin-left: 10px" name="isbangding"
							iflag="false" onclick="unDuiYingGoods()"><a
							style="cursor: pointer; border-radius: 0; border: none;"
							class="f14">未对应 </a></li>
						<li name="isbangding" iflag="true" class="fb active" onclick="duiYingGoods()"><a
							style="cursor: pointer; border-radius: 0; border: none; color: #444444"
							class="f14" data-toggle="tab" role="tab">已对应</a></li>
					</ul>
				</div>
			</div>
			<!-- 对应结束 -->
		</div>
		<!-- table开始展示 -->
		<div id="goodsPage">
			<table class="table table-hover" style="background-color: #ffffff">
				<thead>
					<tr>
						<th><input type="checkbox" onclick="checkAll(this.checked)"></th>
						<th>商品图</th>
						<th>商品货号</th>
						<th>商品名称</th>
						<th>售价</th>
						<th>重量(kg)</th>
						<th>库存总量</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="shopGoodss">
					

				</tbody>
			</table>
		</div>
	</div>
	<!--table结束展示-->
	<div class="contentbox" id="contentbox"
		style="display: none; background: rgb(241, 241, 241);"></div>
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
						data-dismiss="modal" href="http://maijiayun.cn/#">×</a> <strong>联系人</strong>
				</div>
				<!--搜索-->
				<div class="row p-h-plr">
					<div class="has-feedback dropdown">
						<input type="text" data-toggle="dropdown" placeholder="查找公司/姓名/手机"
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
											还没有分销商,<br> 快邀请他们一起上卖家云
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
						role="tablist" data-toggle="buttons" id="chatContactBottomButtons">

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
						<input type="text" data-toggle="dropdown" placeholder="查找公司/姓名/手机"
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
				<div class="collapse navbar-collapse navbar-default navbar-titletab"
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
										<div name="companyUserPhone" class="alert alert-danger p7 f12"
											role="alert" style="display: none;"></div>
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
										<div name="companyUserEmail" class="alert alert-danger p7 f12"
											role="alert" style="display: none;"></div>
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
				<div role="tabpanel" class="modal-body" style="padding: 15px 0 0 0;">
					<!--1 star-->
					<div class="row f14">
						<form class="form-horizontal" role="form">
							<!---->
							<div class="col-md-8">
								<label for="inputEmail3" class="col-sm-2 control-label c6">姓名</label>
								<div class="form-group has-feedback">
									<div class="col-sm-10">
										<input disabled="" id="manageContactUserNameInput" type="text"
											name="name" value="" class="form-control"
											placeholder="请输入您同事的姓名"> <span
											class="glyphicon form-control-feedback"></span>
									</div>
								</div>
							</div>
							<div class="col-md-4" style="padding-left: 0px;">
								<div class="form-group">
									<div name="name" class="alert alert-danger p7 f12" role="alert"
										style="display: none;"></div>
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

	<div aria-hidden="true" aria-labelledby="edit_accountModalLabel"
		role="dialog" tabindex="-1" id="edit_accountModal" class="modal fade"
		style="display: none;"></div>
	<div id="modal"></div>
	</div>
	<!--代码结束-->



</body>
</html>