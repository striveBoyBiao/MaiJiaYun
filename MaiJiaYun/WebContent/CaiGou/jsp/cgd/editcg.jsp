<%@page import="mjy.caigou.vo.GoodsVO"%>
<%@page import="mjy.caigou.vo.PurchaseVO"%>
<%@page import="mjy.caigou.vo.PurchaseGoodVO"%>
<%@page import="mjy.caigou.po.GoodsPO"%>
<%@page import="mjy.caigou.vo.WarehouseVO"%>
<%@page import="mjy.caigou.vo.SupplierVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	
<!DOCTYPE html>
<!-- saved from url=(0036)http://maijiayun.cn/cg/caigoudan/add -->
<html class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="renderer" content="webkit">
<meta name="keywords"
	content="供销平台,分销平台,分销,供销,货源,分销推荐,货源推荐,供销系统,分销系统,ERP,免费ERP,ERP软件,免费ERP软件,进销存,进销存软件,免费进销存软件">
<meta name="description"
	content="禾唐卖家云独一无二的供销平台，开启供销双方合作的桥梁，无安装，免培训，极致用户体验 。包含寻找优质分销商，一键发布货源信息，一键代发、批发进货轻松接单！让您与分销商的订单业务无缝衔接，供销双方实时互动 ，沟通协作业务拓展不再是难事。">
<meta http-equiv="X-UA-Compatible" content="IE=8,9,chrome=1">
<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>
<link rel="stylesheet" href="/MaiJiaYun/CaiGou/css/purchase.css">

<script type="text/javascript" src="/MaiJiaYun/Common/js/jquery.min.js"></script>
<script type="text/javascript" src="/MaiJiaYun/CaiGou/js/purchase.js"></script>
<script type="text/javascript" src="/MaiJiaYun/CaiGou/js/purchase_2.js"></script>
  
  
</head>
<body class="" style="padding-right: 0px;" >
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
			<div style="background: #f1f1f1">
				<!--titletab star-->
				<div class="collapse navbar-collapse navbar-default navbar-titletab" style="padding:0px 0 0 0; background-color:#FFFFFF">
    <div class="navbar-header">
      <a href="http://maijiayun.cn/#" class="navbar-brand ml20">编辑采购单</a>
    </div>
    <ul class="nav nav-tabs f14 fb">
      <!--<li class="active ml20"><a href="javascript:void(0)" style="background:#f1f1f1;">新增采购单</a></li>-->
    </ul>
  </div>
				
				<!--titletab end-->
				<!--panel star-->
				<div class="prl10auto">
					<!--table star-->
					<div class="panel prl10auto mt15" style="padding: 20px 10px;">
						<h5>
						<%PurchaseVO PurchaseVo=(PurchaseVO)request.getAttribute("PurchaseVo");%>
							<form class="form-inline" role="form">
								<div class="form-group pr10">选择供应商</div>
								<div class="form-group pr20">
								
								
								
									<!-- <select name="supplierId" class="selectpicker"
										data-width="auto" style="display: none;">
										<option value="">请选择</option>

										<option value="1370">aaaa</option>

										<option value="1369">阿里巴巴</option>

									</select> -->
									
									
									<div class="btn-group">
    <!-- <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" id="xuzhegongyinshang">
      请选择
      <span class="caret"></span>
    </button> -->
    									<button type="button"
											class="btn dropdown-toggle selectpicker btn-default"
											data-toggle="dropdown" title="请选择" ;">
											<span class="filter-option pull-left" id="xuzhegongyinshang"><%=PurchaseVo.getSupplierCName() %></span>&nbsp;<span
												class="caret"></span></span><span class="text" style="display: none;" id="qingxuanzhe_1"><%=PurchaseVo.getSupplierId() %></span>
										</button>
   <!--  <ul class="dropdown-menu" role="menu">
      <li><a href="#">Dropdown link</a></li>
      <li><a href="#">Dropdown link</a></li>
    </ul> -->
							
									
									<!-- <div class="btn-group " style="width: 88px;"> -->
										<!-- <button type="button"
											class="btn dropdown-toggle selectpicker btn-default"
											data-toggle="dropdown" title="请选择">
											<span class="filter-option pull-left">请选择</span>&nbsp;<span
												class="caret"></span>
										</button>-->
										 
											<ul class="dropdown-menu inner selectpicker" role="menu"
												style="max-height: 405px; overflow-y: auto; min-height: 0px; width:80px;cursor:pointer;" >
												<li rel="0" class="selected"><a tabindex="0" class=""
													style=""><span class="text"></span></a></li>
													
													<%	
														 int i=0;
														List<SupplierVO> listSupplier=(List<SupplierVO>)request.getAttribute("listSuplierVo");
															for(SupplierVO supplierVO:listSupplier){ 
															i++;
															String a=""+i;
															%>
															
												<li rel=a><a tabindex="0" class="" style="" onclick="dropDownBoxx(this)"><span id=<%=supplierVO.getSupplierId() %>
														class="text" ><%=supplierVO.getSupplierCName() %></span></a></li>
												<%} %>
											</ul>
										  
									</div>
									<!-- <div class="btn-group select necessary" name="supplierId">
            <button class="btn btn-default" type="button">供应商名称</button>
            <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
            <span class="caret"></span>
            </button>
            <ul style="min-width:100px;height:200px;" role="menu" class="dropdown-menu scrollspy-example">
              
              <li val="1370"><a href="javascript:void(0);">aaaa</a></li>
              
              <li val="1369"><a href="javascript:void(0);">阿里巴巴</a></li>
              
            </ul>
          </div> -->
								</div>
								<div class="form-group pr10">入库仓库</div>
								<div class="form-group pr20">
									<!-- <select name="warehouseId" class="selectpicker"
										data-width="auto" style="display: none;">
										<option value="">请选择</option>

										<option value="18130">默认仓库</option>

										<option value="18355">食物</option>

										<option value="18356">汽车</option>

										<option value="18357">手机</option>

									</select> -->
									
									
									
									<div class="btn-group bootstrap-select" style="width: 88px;">
										<button type="button"
											class="btn dropdown-toggle selectpicker btn-default"
											data-toggle="dropdown" title="请选择" ;">
											<span class="filter-option pull-left" id="rukucangku"><%=PurchaseVo.getWareHouseName() %></span>&nbsp;<span
												class="caret"></span><span class="text" style="display: none;" id="qingxuanzhe_2"><%=PurchaseVo.getWareHouseId() %></span>
										</button>
										<!-- <div class="dropdown-menu open"
											style="min-width: 0px; max-height: 461px; overflow: hidden; min-height: 83px;"> -->
											<ul class="dropdown-menu inner selectpicker" role="menu"
												style="max-height: 449px; overflow-y: auto; min-height: 71px;cursor: pointer;" >
												<li rel="0" class="selected"><a tabindex="0" class=""
													style=""><span class="text"></span></a></li>
												<!-- <li rel="1"><a tabindex="0" class="" style=""><span
														class="text" onclick="dropDownBoxr(this)">默认仓库</span></a></li>
												<li rel="2"><a tabindex="0" class="" style=""><span
														class="text" onclick="dropDownBoxr(this)">食物</span></a></li>
												<li rel="3"><a tabindex="0" class="" style=""><span
														class="text" onclick="dropDownBoxr(this)">汽车</span></a></li>
												<li rel="4"><a tabindex="0" class="" style=""><span
														class="text" onclick="dropDownBoxr(this)">手机</span></a></li> -->
														<%	
														 int j=0;
														List<WarehouseVO> listWarehouseVO=(List<WarehouseVO>)request.getAttribute("listWarehouseVO");
															for(WarehouseVO warehouseVo:listWarehouseVO){ 
															i++;
															String b=""+i;
															%>
															
												<li rel=a><a tabindex="0" class="" style="" onclick="dropDownBoxr(this)"><span id=<%=warehouseVo.getWareHouseId() %>
														class="text" ><%=warehouseVo.getWareHouseName() %></span></a></li>
												<%} %>
											</ul>
										<!-- </div> -->
									</div>
									<!-- <div class="btn-group select necessary" name="warehouseId">
            <button class="btn btn-default" type="button">仓库名称</button>
            <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
            <span class="caret"></span>
            </button>
            <ul style="min-width:100px;height:200px;" role="menu" class="dropdown-menu scrollspy-example">
              
              <li val="18130"><a href="javascript:void(0);">默认仓库</a></li>
              
              <li val="18355"><a href="javascript:void(0);">食物</a></li>
              
              <li val="18356"><a href="javascript:void(0);">汽车</a></li>
              
              <li val="18357"><a href="javascript:void(0);">手机</a></li>
              
            </ul>
          </div> -->
								</div>
								<!--         <button id="addSku" class="btn btn-primary" data-toggle="modal"><span class="glyphicon glyphicon-plus"></span> 添加采购商品</button>
 -->
								<button type="button" class="btn btn-primary "
									data-toggle="modal" data-target="#myModal" >添加采购商品</button>
								
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true" style="width: auto;">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">×</button>
												<h4 class="modal-title" id="addTacticsItemModalLabel">添加商品</h4>
											</div>
											<div class="modal-body" style="padding: 10px 20px;">
												<!--part one-->
												<div style="width: 250px;" class="input-group">
													<input name="q" value="" type="text"
														placeholder="请输入SKU编码/商品名称" class="form-control">
													<span class="input-group-btn">
														<button class="btn btn-primary query" type="button">
															<span class="glyphicon glyphicon-search"></span>
														</button>
													</span>
												</div>
												<!--part one end-->
												<!--part two-->
												<div class="tl lh30 scrollspy-example"
													style="height: 400px; overflow: scroll;">
													<table class="table table-striped table-hover"
														style="margin-bottom: 0; text-align: center;">
														<thead class=" table-bordered" >
															<tr>
																<th><input type="checkbox"></th>
																<th>商品图</th>
																<th>SKU编码</th>
																<th>商品名称</th>
																
																<th>库存</th>
																<th style="display: none;">价格</th>
															</tr>
														</thead>
														<tbody style="font-weight: normal">
															
															
															<%	
														 int k=0;
														List<GoodsPO> listGoodsPO=(List<GoodsPO>)request.getAttribute("goodsPo");
															for(GoodsPO goodsPO:listGoodsPO){ 
															
															k++;
															String gs="goodSku"+k;
															String gn="goodName"+k;
															String gr="goodRepertory"+k;
															String gp="goodPrice"+k;
															String gpi="goodPicture"+k;
															%>
															<tr >
																<td><input type="checkbox" name="goodsSku" ></td>
																<td id=<%=gpi %>><img src="<%=goodsPO.getGoodPicture()%>"  style="height: 40px;width:50px" alt="50x50" class="img-thumbnail"></td>
																<td class="fb" id=<%=gs %>><%=goodsPO.getSku() %></td>
																<td id=<%=gn %>><%=goodsPO.getGoodName()%></td>
																<td id=<%=gr %>><%=goodsPO.getGoodRepertory()%></td>
																<td style="display: none;" id=<%=gp %>><%=goodsPO.getGoodPrice()%></td>
															</tr>
												
												<%} %>
															

															
														</tbody>
													</table>
												</div>
												<!--part two end-->
											</div>
											<div class="modal-footer"
												style="margin-top: 0px; background: #ebebeb; padding: 5px 20px">
												<button type="button" class="btn btn-primary ok" onclick="getCheckAll()" data-dismiss="modal">确定</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">取消</button>
											</div>
										</div>
									</div>
									<!--新增采购商品 end-->
								</div>
					</div>
				</div>
			</form>
				</h5>
			</div>

			<!--panle star-->
			<div class="panel prl10auto" style="padding: 20px 10px ;margin: 10px 10px 0px 10px;" id="caigou">
				<!-- Table -->
				  <div id="skuPanel">              <!-- Table -->
                <table id="mytable" class="table" style="margin-bottom:20px;">
                <!--   <thead class=" table-bordered"> -->
                    <tr>
                      <th>商品图片</th>
                      <th>SKU编码</th>
                      <th>商品名称</th>
                      
                      <th>采购数量</th>
                      <th>已入库数量</th>
                      <th>采购价</th>
                      <th>总价</th>
                      <th>备注</th>
                      <th>操作</th>
                    </tr>
               <!--    </thead>
                  <tbody id="mytable"> -->
                    <!---->
                     <% List<PurchaseGoodVO> purchaseGoodVo=PurchaseVo.getPurchaseGoodsVO();
                     	/* int list2=(int)request.getAttribute("list2"); */
                     	
                        /* List<PurchaseGoodVO> purchaseGoodVo=(List<PurchaseGoodVO>) request.getAttribute("purchaseGoodVo");
                        List<PurchaseVO> PurchaseVo=( List<PurchaseVO>)request.getAttribute("PurchaseVo"); */
                        for(int m=0;m<purchaseGoodVo.size();m++){
                     %>
                      <tr>
                        <td ><img src="<%=purchaseGoodVo.get(m).getGoodPicture() %>" style="height: 40px;width:50px" alt="50x50" class="img-thumbnail"></td>
                        <td class="fb"><%=purchaseGoodVo.get(m).getSku() %> </td>
                        <td><%=purchaseGoodVo.get(m).getGoodName() %></td>
                      
                        <td><div class="form-group" style="width:100px;"><input type="text" min="1" showname="采购数量" indexnum="0" id="num:<%=m+1 %>" name="goodNum" value=<%=purchaseGoodVo.get(m).getPurchaseNum() %> class="form-control integer operate-caigou-blur" placeholder="" onblur="getPrice(this)"></div></td>
                        <td id="warehouseQuantity0">0</td>
                        <td><div class="form-group" style="width:100px;"><input type="text" min="0" showname="采购单价" indexnum="0" id="price:<%=m+1 %>" name="price" value=<%=purchaseGoodVo.get(m).getPurchasePrice() %> class="form-control operate-caigou-blur" placeholder="0.00" onblur="getPrice(this)"></div></td>
                        
                        <td id="priceSum:<%=m+1 %>" name="priceSum"><%=purchaseGoodVo.get(m).getPurchaseSum() %></td>
                        <td><div class="form-group"><input type="text" name="beizu" id="beizu:<%=m+1 %>" value="<%=purchaseGoodVo.get(m).getRemark_1() %>" class="form-control" placeholder="输入备注"></div></td>
                        
                        <td><a class="delete" href="javascript:void(0)" id=<%=m+1 %> onclick="deleteTr(this)">删除</a></td>
                      </tr>
                    
                     
                    
                    <!---->
                    <%if(m==purchaseGoodVo.size()-1) {%>
                   <tr style="background:#dcdcdc;border:1px solid #dcdcdc; ">
                        <td colspan="4" class="fb">合计：</td>
                        <td colspan="2" class="fb">采购数量总计：<span class="red" id="skuTotalQuantity"><%=PurchaseVo.getPurchaseNumber() %></span></td>
                        <td colspan="3" class="fb">采购总价：<span class="red" id="skuTotalFee"><%=PurchaseVo.getPurchaseSum()%></span></td>
                    </tr>
                    <%}} %>
                 <!--  </tbody> -->
                </table>
                <!--table end-->
</div>
				
				
				
				<!--备注star-->
				<form class="form-horizontal" role="form" style="padding: 10px 0px;">
					<div class="form-group">
						<div class="w50 left lh30 fb f14">备注</div>
						<div class="col-sm-5">
							<textarea rows="3" class="form-control" name="memo" id="memo"></textarea>
						</div>
					</div>
				</form>
				<!--备注end-->
				<div style="padding: 20px 10px 40px 10px">
					<button class="btn btn-primary mr5 save" type="button" onclick="updatePurchaseGood()" >
						保存
						<!-- /MaiJiaYun/caigou/servlet/DcgServlet -->
					</button>
					<button class="btn btn-default cancel" type="button">
						<a href="1.jsp">取消</a>
					</button>
				</div>
				<!--panle end-->
				<!--新增采购商品 star-->
				<div style="display: none;" aria-hidden="true"
					aria-labelledby="addpurchaseModalLabel" role="dialog" tabindex="-1"
					id="addSkuModal" class="modal fade"></div>
				<!--新增采购商品 end-->
			</div>
			<!--Layout right part end-->
		</div>
		<!-- /container -->
		<!--代码结束-->
	
	
	<div class="contentbox" id="contentbox"
		style="display: none; background: rgb(241, 241, 241);"></div>
	<!--Layout right part end-->

	<div id="spinner" style="display: none;">
		<div class="modal fade" aria-hidden="false" role="dialog"
			tabindex="-1" style="display: block;">
			<div class="modal-dialog tc" style="margin-top: 300px;">
				<img src="js_cg_js/loading3.gif">
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

	
	<!--代码结束-->
</body>
</html>