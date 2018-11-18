<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/KeFu/ddcx/css/laydate.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/KeFu/ddcx/css/GreenStyle.css" />
<!--引入外部日期的js-->
<script type="text/javascript" src="${pageContext.request.contextPath}/KeFu/ddcx/js/Ydate.js" ></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/KeFu/ddcx/js/MyStrap.js" ></script>
<title>Insert title here</title>
</head>


			
					<a href="###" class="dropdown-toggle f12 blue c6" data-toggle="dropdown" style="padding:0px 15px 0; background:none; border:none; font-weight:normal;"><b id="advanced" >高级搜索 </b><b class="caret"></b></a>
					<ul class="dropdown-menu Adsearch-menu" style="width:700px;" id="search-pro">
						<li role="presentation" class="dropdown-header" data-stoppropagation="true" style="line-height:20px;">常用查询
							<button type="button" class="close" >×</button>
						</li>
						<li role="presentation" class="dropdown-header">
							<div class="navbar-form" role="input">
								<!-- Split button -->
								<div class="btn-group mr5">
									<div class="left btn-group-text" style="margin-left: 21px; margin-top: 6px">店铺</div>
									<select class="form-control input-sm" id="eShopName" style="width:95px;">
										<option>请选择</option>

										<option>卖家云分销</option>

										<!-- <option value="">线下店铺</option> -->
									</select>
									
								</div>
								<div class="btn-group mr5">
									<div class="left btn-group-text" style="margin-top: 6px;">物流公司</div>
									<select class="form-control input-sm" id="expressCompanyName" style="width:100px;">
										<option value="">请选择</option>

										<option>fsdf </option>

									</select>
									
								</div>
								<div class="btn-group mr5">
									<div class="left btn-group-text" style="margin-top:6px; margin-left:10px;">付款方式</div>
									<select class="form-control input-sm" style="width:100px;" id="paymentMethod">
										<option value="">全部</option>
										<option value="在线付款">在线付款</option>
										<option value="货到付款">货到付款</option>
									</select>
								</div>
								<div class="form-group mr5">
									<div class="left btn-group-text">订单号</div>
									<div class="form-group" style="width:95px;"><input id="b2cCode" type="text" class="form-control input-sm" placeholder="请输入订单号"></div>
								</div>
								<div class="form-group mr5">
									<div class="left btn-group-text">昵称</div>
									<div class="form-group" style="width:135px;"><input id="customerNickName" type="text" class="form-control input-sm" placeholder="请输入昵称"></div>
								</div>
								<div class="form-group mr5">
									<div class="left btn-group-text" style="margin-left:10px;">收货人</div>
									<div class="form-group" style="width:95px;"><input id="receiverName" type="text" class="form-control input-sm" placeholder="请输入收货人"></div>
								</div>
								<div class="form-group mr5">
									<div class="left btn-group-text" style="margin-left:11px;">手机号</div>
									<div class="form-group" style="width:100px;"><input id="receiverMobile" value="" type="text" class="form-control input-sm" onblur="phoneCheck()" placeholder="请输入手机号"></div>
								</div>
								<div class="form-group mr5">
									<div class="left btn-group-text" style="margin-left:11px;">电话</div>
									<div class="form-group" style="width:95px;"><input id="receiverPhone" type="text" class="form-control input-sm" onblur="checkTel()" placeholder="请输入电话"></div>
								</div>
								<div class="form-group">
									<div class="left btn-group-text">地址</div>
									<div class="form-group" style="width:135px;"><input id="receiverAddress" type="text" class="form-control input-sm" placeholder="请输入地址"></div>
								</div>
								
							</div>
						</li>
						<li role="presentation" class="dropdown-header" style="line-height:20px;">商品查询</li>
						<li class="dropdown-header" role="presentation">
							<div role="input" class="navbar-form">
								<div class="btn-group mr5">
									<select style="width:80px;" id="selIncludeGoods" class="form-control input-sm">
										<option value="包含">包含</option>
										<option value="仅包含">仅包含</option>
									</select>
								</div>
								<div class="form-group  mr5">
									<div class="left btn-group-text">商品货号</div>
									<div style="width:125px;" class="form-group"><input type="text" class="form-control input-sm" id="goodsCode"></div>
								</div>
								<div class="form-group mr5">
									<div class="left btn-group-text">sku编码</div>
									<div style="width:125px;" class="form-group"><input type="text" class="form-control input-sm" id="skuCode"></div>
								</div>
								<div class="form-group ">
									<div class="left btn-group-text">商品名称</div>
									<div style="width:125px;" class="form-group"><input type="text" class="form-control input-sm" id="goodsTitle"></div>
								</div>
								<div class="form-group  mr5">
									<div class="left btn-group-text">商品数量</div>
									<div style="width:80px;" class="form-group"><input type="text" class="form-control input-sm" id="goodsNum"></div>
								</div>
							</div>
						</li>

						<li role="presentation" class="dropdown-header" style="line-height:20px;">备注查询</li>
						<li role="presentation" class="dropdown-header">
							<div class="navbar-form" role="input">
								<!-- Split button -->
								<div>
									<div class="btn-group mr5">
										<div class="left btn-group-text" style="margin-top:5px;">买家备注</div>
										<select id="hasBuyerMemo" class="form-control input-sm" style="width:233px;">
											<option value="">请选择</option>
											<option>有买家备注</option>
											<option>无买家备注</option>
										</select>
										
									</div>
									<div class="form-group ">
										<div class="form-group" style="width:343px;"><input id="buyerMemo" type="text" class="form-control input-sm" placeholder="请输入关键字" style="display:none;"></div>
									</div>
								</div>
								<div>
									<div class="btn-group mr5">
										<div class="left btn-group-text" style="margin-top:5px;">卖家备注</div>
										<select id="hasSellerMemo" class="form-control input-sm" style="width:233px;">
											<option value="">请选择</option>
											<option>有卖家备注</option>
											<option>无卖家备注</option>
										</select>
										
									</div>
									<div class="form-group ">
										<div class="form-group" style="width:343px;"><input id="sellerMemo" type="text" class="form-control input-sm" placeholder="请输入关键字" style="display:none;"></div>
									</div>
								</div>
							</div>
						</li>
						<li role="presentation" class="dropdown-header">
							<div class="panel-group" id="accordion">
								<div class="panel">
									<div class="panel-heading" style="padding:0">
										<h4 class="panel-title" style="line-height:25px;">
        <a id="moreSearchBtn" class="f14 fb" data-toggle="collapse" data-parent="#accordion" href="javascript: void(0);">
          <b id="moreSearchIcon" class="caret"></b> 更多查询条件
        </a>
        </h4>
									</div>
									<div id="collapseOne" class="panel-collapse collapse in" style="" show="true">
										<div class="navbar-form" role="input">
											<!-- Split button -->
											<div style="padding:3px 0px;">
												<div>
													<div role="search" class="form-group mr20">
														<!--时间控件 star-->
														<div class="left btn-group-text">下单时间</div>
														<div class="form-group w170">
															<div class="input-prepend input-group input-sm date form_date" style="width:200px;" data-date="" data-date-format="yyyy-mm-dd hh:00:00" data-link-field="createTime_s" data-link-format="yyyy-mm-dd hh:00:00">
																<!--<input type="text" readonly="" value="" size="16" class="form-control input-sm">
																<span class="add-on input-group-addon"><span class="glyphicon glyphicon-calendar fa fa-calendar"></span></span>-->
																<input type="text" readonly="" class="inline laydate-icon" id="start" style="width:200px; margin-right:10px;" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"  />
																
															</div>
															<input type="hidden" value="" id="createTime_s">
														</div>
														<div class="form-group"> — </div>
														<div class="form-group w170">
															<div class="input-prepend input-group input-sm date form_date" style="width:200px;" data-date="" data-date-format="yyyy-mm-dd hh:00:00" data-link-field="createTime_e" data-link-format="yyyy-mm-dd hh:00:00">
																<!--<input class="form-control input-sm" size="16" type="text" value="" readonly="">
																<span class="add-on input-group-addon"><span class="glyphicon glyphicon-calendar fa fa-calendar"></span></span>-->
																<input type="text" readonly="" class="inline laydate-icon" id="end" style="width:200px; margin-right:10px;" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"  />
															</div>
															<input type="hidden" id="createTime_e" value="">
														</div>
													</div>
												</div>
												<div>
													<div role="search" class="form-group mr20">
														<!--时间控件 star-->
														<div class="left btn-group-text">审单时间</div>
														<div class="form-group w170">
															<div class="input-prepend input-group input-sm date form_date" style="width:200px;" data-date="" data-date-format="yyyy-mm-dd hh:00:00" data-link-field="auditTime_s" data-link-format="yyyy-mm-dd hh:00:00">
																<!--<input type="text" readonly="" value="" size="16" class="form-control input-sm">
																<span class="add-on input-group-addon"><span class="glyphicon glyphicon-calendar fa fa-calendar"></span></span>-->
																<input type="text" readonly="" class="inline laydate-icon" id="start" style="width:200px; margin-right:10px;" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"  />
																
															</div>
															<input type="hidden" value="" id="auditTime_s">
														</div>
														<div class="form-group"> — </div>
														<div class="form-group w170">
															<div class="input-prepend input-group input-sm date form_date" style="width:200px;" data-date="" data-date-format="yyyy-mm-dd hh:00:00" data-link-field="auditTime_e" data-link-format="yyyy-mm-dd hh:00:00">
																<!--<input class="form-control input-sm" size="16" type="text" value="" readonly="">
																<span class="add-on input-group-addon"><span class="glyphicon glyphicon-calendar fa fa-calendar"></span></span>-->
																<input type="text" readonly="" class="inline laydate-icon" id="end" style="width:200px; margin-right:10px;" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"  />
															</div>
															<input type="hidden" id="auditTime_e" value="">
														</div>
													</div>
												</div>
												<div>
													<div role="search" class="form-group mr20">
														<!--时间控件 star-->
														<div class="left btn-group-text">发货时间</div>
														<div class="form-group w170">
															<div class="input-prepend input-group input-sm date form_date" style="width:200px;" data-date="" data-date-format="yyyy-mm-dd hh:00:00" data-link-field="deliveryTime_s" data-link-format="yyyy-mm-dd hh:00:00">
																<!--<input type="text" readonly="" value="" size="16" class="form-control input-sm">
																<span class="add-on input-group-addon"><span class="glyphicon glyphicon-calendar fa fa-calendar"></span></span>-->
																<input type="text" readonly="" class="inline laydate-icon" id="start" style="width:200px; margin-right:10px;" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"  />
																
															</div>
															<input type="hidden" value="" id="deliveryTime_s">
														</div>
														<div class="form-group"> — </div>
														<div class="form-group w170">
															<div class="input-prepend input-group input-sm date form_date" style="width:200px;" data-date="" data-date-format="yyyy-mm-dd hh:00:00" data-link-field="deliveryTime_e" data-link-format="yyyy-mm-dd hh:00:00">
																<!--<input class="form-control input-sm" size="16" type="text" value="2016-10-22" readonly="">
																<span class="add-on input-group-addon"><span class="glyphicon glyphicon-calendar fa fa-calendar"></span></span>-->
																<input type="text" readonly="" class="inline laydate-icon" id="end" style="width:200px; margin-right:10px;" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"  />
															</div>
															<input type="hidden" id="deliveryTime_e" value="">
														</div>
													</div>
												</div>
												
											</div>
										</div>
									</div>
								</div>
							</div>
						</li>
						<!---->
						<li role="presentation" class="dropdown-header"><button type="submit" class="btn btn-primary search">查询订单</button></li>
						<!---->
					</ul>
				