<%@page import="mjy.caigou.dao.impl.WarehouseDaoImpl"%>
<%@page import="mjy.caigou.dao.WarehouseDao"%>
<%@page import="mjy.caigou.po.GoodsPO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/MaiJiaYun/CaiGou/css/jqtree.css">



<script type="text/javascript">

function init() {
	
		
		var data = [ {
				name : "全部",
				id : 123
			} ];

			$(function() {

				$('#categorysTree').tree({
					data : data
				});
			});
						
						
						var parent_node = $('#categorysTree').tree(
								'getNodeById', 123);
					
						<%List<String> goodGroupNames = (List<String>) request.getAttribute("goodGroupNames");

			for (int i = 0; i < goodGroupNames.size(); i++) {%>
						var nodeName='<%=goodGroupNames.get(i)%>';
		$('#categorysTree').tree('appendNode', {
			name : nodeName,
		}, parent_node);
<%}%>
	}
</script>






</head>
<body onload="init()">


	<div class="container" id="container">
		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>

		<script src="/MaiJiaYun/CaiGou/js/tree.jquery.js"></script>

		<script src="/MaiJiaYun/CaiGou/js/jquery.cookie.js"></script>

		<script type="text/javascript">
			
		</script>


		<div class="content" id="content">



			<script type="text/javascript">
				function addgoods() {
					var buttonbin = document.getElementById("divbindeshopsku");
					buttonbin.style.display = "block";
				}

				function addgoods1() {
					var buttonbin = document.getElementById("divbindeshopsku");
					buttonbin.style.display = "none";
				}

				function goodsname(obj) {
					$(obj).hide();
					$(obj).prev("span").css("display", "none");
					$(obj).next("input").css("display", "block");
					$(obj).next("input").css("backgroundColor", "white");
					$(obj).next("input").val($(obj).prev("span").text());
					$(obj).next("input").focus();

				}

				function goodsname1(obj) {
					$(obj).prev("button").css("display", "inline-block");
					$(obj).prev("button").prev("span").css("display",
							"inline-block");
					$(obj).css("display", "none");
					$(obj).css("backgroundColor", "white");
					var updateVal = $(obj).val();
					$(obj).prev("button").prev("span").text(updateVal);
					var updateGoodId = $(obj).parent("div").parent("td").prev(
							".tdd").find("a").html();
					$.post("/MaiJiaYun/servlet/cg/sp", {
						"method":"ini",
						"updateVal" : updateVal,
						"updateGoodId" : updateGoodId
					}, function(message) {

					})

					/* var buttonbin = document.getElementById("buttonbin");
					var spanbin = document.getElementById("spanbin");
					var inputbin = document.getElementById("inputbin");
					var divbin = document.getElementById("divbin");

					buttonbin.style.display = "inline-block";

					spanbin.style.display = "inline-block";

					inputbin.style.display = "none";

					inputbin.style.backgroundColor = "white";

					spanbin.innerText = inputbin.value; */

				}
				$(function() {
					$("[data-toggle='popover']").popover();
				});
			</script>



			<!--titletab star-->
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0;">
				<div class="navbar-header">
					<a href="#" class="navbar-brand ml20">商品</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<li class="ml20 tab active" id="li-goods"><a class=""
						href="yy/goods">仓库商品</a></li>
					<li class="ml20 tab" id="li-eshopgoods"><a class="c6"
						href="yy/eshopgoods">网店商品 </a></li>
				</ul>
			</div>
			<div class="prl10auto" id="panel">
				<div class="prl10auto mt20 " style="">
					<div class="mt15 f18">仓库商品使用流程</div>

					<div class="  mt15 tc h5 " style="padding: 0px 0; margin-bottom: 0">
						<div class="row">
							<div class="col-md-3" style="padding-left: 0;">
								<div class="row  wz-active">
									<a class="c3" style="text-decoration: none"
										href="${pageContext.request.contextPath}/servlet/cg/importgoods?method=getShopNames">
										<div style="display: block;">
											<span class="f20 lh40">1 从网店导入</span><br> <span
												class="f12 lh30">从网店快速导入商品到仓库，请保证没有重复商品</span>
										</div>
									</a>
								</div>
							</div>
							<div class="col-md-3" style="padding-left: 0; padding-right: 0;">
								<div class="row  wz-active">
									<a class="c3"
										href="${pageContext.request.contextPath}/servlet/cg/spduiying?method=getShopNames"
										style="text-decoration: none" data-original-title=""
										rel="tooltip" title="" id="aisbingding">
										<div style="display: block;">
											<span class="f20 lh40">2 商品对应 <span id="isbingding"
												style="display: none;"
												class="glyphicon glyphicon-exclamation-sign red f12"></span>
											</span><br> <span class="f12 lh30">商品对应之后，店铺商品有订单产生，将扣除仓库库存</span>
										</div>
									</a>
								</div>
							</div>
							<div class="col-md-3" style="padding-right: 0">
								<div class="row  wz-active">
									<a class="c3"
										href="${pageContext.request.contextPath}/servlet/cg/kucuncsh"
										style="text-decoration: none">
										<div style="display: block;">
											<span class="f20 lh40">3 库存初始化</span><br> <span
												class="f12 lh30">初始化仓库商品库存量</span>
										</div>
									</a>
								</div>
							</div>
							<div class="col-md-3" style="padding-right: 0">
								<div class="row wz-active">
									<a class="c3"
										href="${pageContext.request.contextPath}/servlet/cg/kucuntongbu"
										style="text-decoration: none">
										<div style="display: block;">
											<span class="f20 lh40">4 库存实时同步</span><br> <span
												class="f12 lh30">是否实时同步仓库库存到网店，保证不超卖</span>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>

				</div>

				<!--star-->
				<div class="mt15">
					<div class="row">
						<!--left part star-->
						<div
							style="padding: 0px; margin-top: 0px; background: #f7f7f7; height: 467px;"
							class="col-md-2" onselectstart="return false;">
							<!---->
							<h5 style="padding: 0px 10px; border-bottom: 1px solid #cccccc">
								<strong class="lh30">商品分类</strong>
							</h5>
							<!---->
							<div class="prl10auto mb10">
								<button class="btn btn-default" id="btnAddCategory"
									type="button" data-toggle="modal" data-target="#myModal">新增分类</button>
							</div>
							<div class="tab-content">
								<div class="tab-pane active" id="home">
									<!-- <div class="btn-group-block prl10auto">
              <form role="search" class="form-inline">
                <div class="form-group mr5">
                  <button class="btn btn-default" type="button" data-target="#addstoreModal" data-toggle="modal">新增</button>
                </div>
              </form>
            </div> -->
									<!--part one star-->
									<!--jqtree star-->

									<div id="scroll-container">
										<div id="categorysTree"></div>
									</div>




									<!--jqtree end-->
									<!--part one end-->
								</div>
							</div>
							<!---->
						</div>
						<!--left part end-->
						<!--right part star-->
						<div style="padding-right: 0px;" class="col-md-10">
							<!---->
							<table class="table" style="margin-bottom: 0; border: none;">
								<thead>
									<tr>
										<th style="border: none;">
											<form class="form-inline" role="form">
												<div class="form-group">
													商品列表<span class="ml20">共 <span id="goodsNum"
														class="red" id="goodsTotalNum"><%=request.getAttribute("goodsNum")%></span>
														件商品
													</span>
													<!--<span class="mr5 ml10" id="comboNum">(包含<span class="red" id="goodsComboNum"></span> 件组合商品)</span><a data-original-title="
商品可编辑为组合商品，组合商品发货后会减相应子商品的库存" style="color:#333333;text-decoration:none;" href="#" rel="tooltip" title=""><span class="glyphicon glyphicon-question-sign blue"></span></a>-->
												</div>
											</form>
										</th>
									</tr>
								</thead>
							</table>
							<!---->
							<div class="btn-group-block">
								<div class="form-inline">
									<div class="form-group mr5">
										<a
											href="${pageContext.request.contextPath}/servlet/cg/xinzengsp?method=toXZSP"><button
												type="button" class="btn btn-default">新增</button></a>
									</div>
									<div class="form-group mr5">
										<button type="button" class="btn btn-default" id="delete"
											data-toggle="modal" data-target="#myModaldelete">删除</button>
										<div class="modal fade" id="myModaldelete" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">

											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-body">
														<button style="margin-top: -10px;" type="button"
															class="bootbox-close-button close" data-dismiss="modal"
															aria-hidden="true">×</button>
														<div class="bootbox-body">确认删除？</div>
													</div>
													<div class="modal-footer">
														<button data-bb-handler="cancel" type="button"
															class="btn btn-default" data-dismiss="modal">取消</button>
														<button data-bb-handler="confirm" type="button"
															class="btn btn-primary" data-dismiss="modal"
															onclick="deleteGoods()">确认</button>
													</div>
												</div>

											</div>

										</div>

										<script type="text/javascript">
											function deleteGoods() {

												var table = document
														.getElementById("tbody");
												var checkbooks = table
														.getElementsByTagName("input");
												//得到全选checkbook
												var selectAll = document
														.getElementById("selectAll");
												
												/* if (selectAll.checked) {
													table.remove();
													$
															.post(
																	"/MaiJiaYun/servlet/cg/sp",
																	{
																		"selectAll" : selectAll.checked
																	},
																	function(
																			message) {
																		
																		document
																				.getElementById("goodsNum").innerHTML = "0";
																		document
																				.getElementById("goodsNum2").innerHTML = "0";

																	})

												} else { */

													for (var i = 0; i < checkbooks.length; i++) {
														if (checkbooks[i].type == "checkbox") {
															if (checkbooks[i].checked) {

																/* checkbooks[i].parentNode.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.innerHTML */
																var goodId = $(checkbooks[i]).parent("td").next("td").next("td").children("a").html();
																
																var trNode = checkbooks[i].parentNode.parentNode;//得到父tr元素
																
																$(trNode).next("tr").remove();//移除下一个tr
																trNode.remove();
															
																 $
																		.post(
																				"/MaiJiaYun/servlet/cg/sp",
																				{
																					"method":"ini",
																					"goodId" : goodId
																				},
																				function(
																						message) {
																					var inputs = table
																							.getElementsByTagName("input");
																					var num = 0;
																					for (var i = 0; i < checkbooks.length; i++) {
																						if (inputs[i].type == "checkbox") {
																							num = num + 1;
																						}
																					}
																					document
																							.getElementById("goodsNum").innerHTML = num;
																					document
																							.getElementById("goodsNum2").innerHTML = num;

																				}) 
																i=i-1;
															}
														}
													
													}
												}

											/* } */
										</script>



										<!--<div class="form-group mr5">
              <a href="yy/importgoods"><button type="button" class="btn btn-primary">从网店导入</button></a>
            </div>-->
										<!-- <div class="form-group" style="display:none;">
              <button id="editCustomPropertyBtn" type="button" class="btn btn-default" data-target="#editCustomPropertyModal" data-toggle="modal">自定义属性维护</button>
            </div> -->
										<div class="form-group pull-right" id="li-query">
											<form action="/MaiJiaYun/servlet/cg/sp?method=ini">
												<div class="input-group" style="width: 237px;">
													
													<input  id="q" name="q" class="form-control" style="width: 200px;"
														placeholder="请输入商品名称" type="text"> <span
														class="input-group-btn">
														<input type="hidden" name="method" value="ini">
														 <input class="btn btn-primary query " type="submit"
															value="搜索" >
															
														

													</span>
												</div>

											</form>

										</div>

									</div>
								</div>
								<script type="text/javascript">
									/* function searchGoods() {
										var searchInfo = $("#q").val();
										
										$
												.ajax({
													url : "/MaiJiaYun/servlet/cg/sp",
													type : "post",
													data : {
														"pageNo":"1",
														"method":"queryLike",
														"searchInfo" : searchInfo
													},
													datatype : "json",
													success : function(data) {
														
														var tr = document
																.getElementById("tbody");

														var table = document
																.getElementById("goodsTable");

														var resultHtml = "";
														resultHtml += "<table class=\"table\" id=\"goodsTable\">";
														resultHtml += "<thead class=\" table-bordered\">";
														resultHtml += "<tr>";
														resultHtml += "	<th><input type=\"checkbox\" id=\"selectAll\"";
														resultHtml += "		onchange=\"selectAll()\"></th>";
														resultHtml += "<th>商品图</th>";
														resultHtml += "	<th>商品货号</th>";
														resultHtml += "	<th>商品名称</th>";
														resultHtml += "	<th>售价</th>";
														resultHtml += "	<th>重量(kg)</th>";
														resultHtml += "	<th>库存总量</th>";
														resultHtml += "	<th>系统分类</th>";
														resultHtml += "	<th>操作</th>";
														resultHtml += "</tr>";
														resultHtml += "</thead>";

														resultHtml += "<tbody id=\"tbody\">";
														var goodIndex = 0;
														$
																.each(
																		data,
																		function(
																				index,
																				element) {
																			goodIndex++;
																			resultHtml += "<tr modelid=\"346579\" class=\"goods\">";
																			resultHtml += "<td><input type=\"checkbox\" value=\"346579\"class=\"goodSelect\"></td>";
																			resultHtml += "<td><img src=\""+element.goodPicture+"\"style=\"height: 50px; width: 50px;\" class=\"img-thumbnail\"alt=\"50x50\"></td>";
																			resultHtml += "<td class=\"tdd\"><a style=\"cursor: pointer;\" class=\"show-skus\">"
																					+ element.goodId
																					+ "</a></td>";
																			resultHtml += "<td class=\"tddd\">";
																			resultHtml += "<div>";
																			resultHtml += "<span id=\"spanbin\" style=\"display: inline;\">"
																					+ element.goodName
																					+ "</span>";
																			resultHtml += "<button id=\"buttonbin\" name=\"btnTitle\"";
																			resultHtml += "class=\"btn btn-default\"  type=\"button\"";
																			resultHtml += "style=\"background: transparent none repeat scroll 0% 0%; border: medium none; display: inline-block;\"";
																			resultHtml += "onclick=\"goodsname(this)\">";
																			resultHtml += "<i class=\"glyphicon glyphicon-pencil\"></i>";
																			resultHtml += "</button>";
																			resultHtml += "<input id=\"inputbin\" onblur=\"goodsname1(this)\" name=\"txtTitle\"";
																			resultHtml += "class=\"form-control\" value=\"3001\" style=\"display: none;\"";
																			resultHtml += "type=\"text\">";
																			resultHtml += "</div>";
																			resultHtml += "</td>";
																			resultHtml += "<td>"
																					+ element.goodPrice
																					+ "</td>";
																			resultHtml += "<td>"
																					+ element.goodWeight
																					+ "</td>";
																			resultHtml += "<td>"
																					+ element.goodRepertory
																					+ "</td>";
																			resultHtml += "		<td>"
																					+ element.goodGroupName
																					+ "</td>";
																			resultHtml += "		<td><a";
																			resultHtml+="	href=\"${pageContext.request.contextPath}/servlet/cg/xinzengsp\">编辑</a>";
																			resultHtml += "	</td>";
																			resultHtml += "</tr>";
																			
																			resultHtml += "<tr style=\"background: #f7f7f7;\" skuid=\"1399886\" modelid=\"346579\" class=\"sku\">";
																			resultHtml += "	<td>";
																			resultHtml += "	<div>";
																			resultHtml += "	<a";
																			resultHtml += "		data-original-title=\"(1)3001  属性：  数量：1; (2)3002  属性：  数量：1; \"";
																			resultHtml += "		style=\"color: #333333; text-decoration: none;\"";
																			resultHtml += "		href=\"javascript:void(0);\" rel=\"tooltip\" > <span";
									resultHtml+="		 style=\"padding: 0 1px;\"></span>";
																			resultHtml += "		</a>";
																			resultHtml += "		</div>";

																			resultHtml += "	</td>";
																			resultHtml += "	<td colspan=\"2\">SKU编码：<strong>"
																					+ element.sku
																					+ "</strong></td>";
																			resultHtml += "	<td colspan=\"1\">属性：<strong></strong></td>";
																			resultHtml += "	<td colspan=\"1\">售价：<strong>"
																					+ element.goodPrice
																					+ "</strong></td>";
																			resultHtml += "	<td colspan=\"1\">重量：<strong>"
																					+ element.goodWeight
																					+ "</strong></td>";

																			resultHtml += "	<td colspan=\"1\">库存总量：<strong>"
																					+ element.goodRepertory
																					+ "</strong>";
																			resultHtml += "	<a  style=\"cursor: pointer;\" href=\"javascript:void(0)\"	name=\"example\" tabindex=\"0\" data-placement=\"left\"	data-content=\"";
																					 $
																							.each(
																									element.goodwarehouse,
																									function(
																											index,
																											element2) {
																										
																										resultHtml +=  element2.warehouseName;
																										resultHtml +=  "   ";
																											resultHtml +=  element2.goodCount;
																											resultHtml +=  "<br>" ;
																									}) 
																					resultHtml += " \" data-html=\"true\" data-trigger=\"focus\" data-toggle=\"popover\" data-original-title=\"仓库信息\"> <span class=\"glyphicon glyphicon-list\">	</span></a>";
																			resultHtml += "		<div id=\"popover_content_wrapper\" style=\"display: none\"></div>";
																			resultHtml += "	</td>";

																			resultHtml += "	<td colspan=\"1\">未与网店商品对应 <a href=\"javascript:void(0)\"";
																			resultHtml += "	style=\"margin-left: 20px;\" name=\"btnBindingEShopSkus\"";
																			resultHtml += "	data-toggle=\"modal\" data-target=\"#myModalzhang\">对应设置</a>";
																			resultHtml += "	<div class=\"modal fade\" id=\"myModalzhang\" tabindex=\"-1\"";
					resultHtml+="		role=\"dialog\" aria-labelledby=\"myModalLabel\"";
					resultHtml+="		aria-hidden=\"true\">";
																			resultHtml += "		<div class=\"modal-dialog\" style=\"width: 900px;\">";
																			resultHtml += "		<div class=\"modal-content\">";
																			resultHtml += "		<div class=\"modal-header\">";
																			resultHtml += "			<button type=\"button\" class=\"close\" data-dismiss=\"modal\"";
																			resultHtml += "				aria-hidden=\"true\" onclick=\"addgoods1()\">×</button>";
																			resultHtml += "			<h4 class=\"modal-title\" id=\"detailsModalLabel\">对应设置</h4>";
																			resultHtml += "		</div>";
																			resultHtml += "		<div class=\"modal-body\">";

																			resultHtml += "		<div class=\"row scrollspy-example\" style=\"height: 200px\">";
																			resultHtml += "			<table class=\"table table-striped table-hover\"";
							resultHtml+="			style=\"margin-bottom: 0\">";
																			resultHtml += "			<thead class=\" table-bordered\">";
																			resultHtml += "				<tr>";
																			resultHtml += "				<th>店铺名称</th>";
																			resultHtml += "					<th>商家SKU编码</th>";
																			resultHtml += "					<th>商品名称</th>";
																			resultHtml += "					<th>商品属性</th>";
																			resultHtml += "				<th>店铺数量</th>";
																			resultHtml += "				<th>操作</th>";
																			resultHtml += "			</tr>";
																			resultHtml += "			</thead>"
																			resultHtml += "			<tbody style=\"font-weight: normal\"";
																resultHtml+="				id=\"bindingEshopSkuTable\">";

																			resultHtml += "			</tbody>";

																			resultHtml += "		</table>";
																			resultHtml += "		</div>";

																			resultHtml += "		<div class=\"row mt15\">";
																			resultHtml += "			<button class=\"btn btn-primary mr5\" type=\"button\"";
																			resultHtml += "			id=\"btnAddEshopSku\" onclick=\"addgoods()\">";
																			resultHtml += "			<span class=\"glyphicon glyphicon-plus\"></span>新增网店商品对应";
																			resultHtml += "		</button>";
																			resultHtml += "	</div>";
																			resultHtml += "	<div class=\"row mt15\" id=\"divbindeshopsku\"";
								resultHtml+="		style=\"display: none\">";
																			resultHtml += "		<div class=\"dropdown\">";
																			resultHtml += "	<input id=\"inputSuccess2\"";
								resultHtml+="	class=\"form-control input-sm dropdown-toggle\"";
								resultHtml+="	data-toggle=\"dropdown\""
								resultHtml+="	placeholder=\"回车确认,请输入商品货号/sku编码\" type=\"text\">";
																			resultHtml += "<div style=\"padding-top: 0; position: relative\"";
								resultHtml+="	role=\"menu\" class=\"row scrollspy-example\"";
								resultHtml+="	id=\"showaddeshopsku\"></div>";
																			resultHtml += "	</div>";
																			resultHtml += "	</div>";
																			resultHtml += "	</div>";
																			resultHtml += "	</div>";

																			resultHtml += "	</div>";
																			resultHtml += "	</div>";

																			resultHtml += "	</td>";
																			resultHtml += "<td></td>";
																			resultHtml += "</tr>";

																		})

														resultHtml += "</tbody>";
														resultHtml += "</table>";
														table.innerHTML = resultHtml;

														document
																.getElementById("goodsNum").innerHTML = goodIndex;
														document
																.getElementById("goodsNum2").innerHTML = goodIndex;
														
														
														$("#pagingPages ul").empty();
														$("#pagingPages ul").html($("#pagehidden").html());
														
														fun();
														
														
														
														
														
														
														
														
														
														
														
														
														
														
														
														
														
														
														
														
														$(function() {
															$(
																	"[data-toggle='popover']")
																	.popover();

														});
													}
												})
											
									}
									
									
									//<a>点击事件
									 function fun(){
									        $("#pagecount span a").on('click',function(){ 
									            var rel = $(this).attr("rel"); 
									            alert(rel)
									            if(rel){ 
									                getData(rel); 
									            } 
									        });  
									    } */
									
									
									
									
								</script>
								<!---->

								<script type="text/javascript">
									function selectAll() {
										var checkall = document
												.getElementById("selectAll");
										var table = document
												.getElementById("goodsTable");
										var checkbooks = table
												.getElementsByTagName("input");

										if (checkall.checked) {
											for (var i = 0; i < checkbooks.length; i++) {
												if (checkbooks[i].type == "checkbox") {
													checkbooks[i].checked = true;
												}

											}
										} else {
											for (var i = 0; i < checkbooks.length; i++) {
												if (checkbooks[i].type == "checkbox") {
													checkbooks[i].checked = false;
												}

											}
										}
									}
								</script>
								<table class="table" id="goodsTable">
									<thead class=" table-bordered">
										<tr>
											<th><input type="checkbox" id="selectAll"
												onchange="selectAll()"></th>
											<th>商品图</th>
											<th>商品货号</th>
											<th>商品名称</th>
											<th>售价</th>
											<th>重量(kg)</th>
											<th>库存总量</th>
											<th>系统分类</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="tbody">
										<%
											List<GoodsPO> goods = (List<GoodsPO>) request.getAttribute("goodsInfo");

											for (GoodsPO goodpo : goods) {
										%>
										<tr modelid="346579" class="goods">
											<td><input type="checkbox" value="346579"
												class="goodSelect"></td>
											<td><img src="<%=goodpo.getGoodPicture()%>"
												style="height: 50px; width: 50px;" class="img-thumbnail"
												alt="50x50"></td>
											<td class="tdd"><a style="cursor: pointer;"
												class="show-skus"> <%=goodpo.getGoodId()%>
											</a></td>
											<td class="tddd">

												<div>
													<span id="spanbin" style="display: inline;"><%=goodpo.getGoodName()%></span>
													<button id="buttonbin" name="btnTitle"
														class="btn btn-default" title="" type="button"
														style="background: transparent none repeat scroll 0% 0%; border: medium none; display: inline-block;"
														onclick="goodsname(this)">
														<i class="glyphicon glyphicon-pencil"></i>
													</button>
													<input id="inputbin" onblur="goodsname1(this)"
														name="txtTitle" class="form-control" value="3001"
														style="display: none;" type="text">
												</div>

											</td>
											<td><%=goodpo.getGoodPrice()%></td>

											<td><%=goodpo.getGoodWeight()%></td>
											<td><%=goodpo.getGoodRepertory()%></td>
											<td><%=goodpo.getGoodGroupName()%></td>
											<td><a href="${pageContext.request.contextPath}/servlet/cg/xinzengsp?method=goodedit1&goodId=<%=goodpo.getGoodId()%>">编辑</a>
											
											
												
												
												
												
											</td>
											
											
											
										</tr>

										<tr style="background: #f7f7f7;" skuid="1399886"
											modelid="346579" class="sku">
											<td>

												<div>
													<a
														data-original-title="(1)3001  属性：  数量：1; (2)3002  属性：  数量：1; "
														style="color: #333333; text-decoration: none;"
														href="javascript:void(0);" rel="tooltip" title=""> <span
														class=" " style="padding: 0 1px;"></span>
													</a>
												</div>

											</td>
											<td colspan="2">SKU编码：<strong><%=goodpo.getSku()%></strong></td>
											<td colspan="1">属性：<strong></strong></td>
											<td colspan="1">售价：<strong><%=goodpo.getGoodPrice()%></strong></td>
											<td colspan="1">重量：<strong><%=goodpo.getGoodWeight()%></strong></td>

											<%
												WarehouseDao warehousedao = new WarehouseDaoImpl();
											%>
											<td colspan="1">库存总量：<strong><%=goodpo.getGoodRepertory()%></strong>
												<a style="cursor: pointer;" href="javascript:void(0)"
												name="example" tabindex="0" data-placement="left"
												data-content="<%for (int i = 0; i < goodpo.getGoodwarehouse().size(); i++) {%><%=warehousedao.queryNameById(goodpo.getGoodwarehouse().get(i).getWarehouseId()) + "  "%><%=goodpo.getGoodwarehouse().get(i).getGoodCount()%><br><%}%>"
												data-html="true" data-trigger="focus" data-toggle="popover"
												data-original-title="仓库信息"> <span
													class="glyphicon glyphicon-list"> </span>
											</a>

												<div id="popover_content_wrapper" style="display: none"></div>

											</td>
											<td colspan="1">未与网店商品对应 <a href="javascript:void(0)"
												style="margin-left: 20px;" name="btnBindingEShopSkus"
												data-toggle="modal" data-target="#myModalzhang">对应设置</a>
												<div class="modal fade" id="myModalzhang" tabindex="-1"
													role="dialog" aria-labelledby="myModalLabel"
													aria-hidden="true">
													<div class="modal-dialog" style="width: 900px;">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal"
																	aria-hidden="true" onclick="addgoods1()">×</button>
																<h4 class="modal-title" id="detailsModalLabel">对应设置</h4>
															</div>
															<div class="modal-body">
																<!--part two-->
																<div class="row scrollspy-example" style="height: 200px">
																	<table class="table table-striped table-hover"
																		style="margin-bottom: 0">
																		<thead class=" table-bordered">
																			<tr>
																				<th>店铺名称</th>
																				<th>商家SKU编码</th>
																				<th>商品名称</th>
																				<th>商品属性</th>
																				<th>店铺数量</th>
																				<th>操作</th>
																			</tr>
																		</thead>
																		<tbody style="font-weight: normal"
																			id="bindingEshopSkuTable">

																		</tbody>




																	</table>
																</div>
																<!--part two end-->
																<div class="row mt15">
																	<button class="btn btn-primary mr5" type="button"
																		id="btnAddEshopSku" onclick="addgoods()">
																		<span class="glyphicon glyphicon-plus"></span>新增网店商品对应
																	</button>
																</div>
																<div class="row mt15" id="divbindeshopsku"
																	style="display: none">
																	<div class="dropdown">
																		<input id="inputSuccess2"
																			class="form-control input-sm dropdown-toggle"
																			data-toggle="dropdown"
																			placeholder="回车确认,请输入商品货号/sku编码" type="text">
																		<div style="padding-top: 0; position: relative"
																			role="menu" class="row scrollspy-example"
																			id="showaddeshopsku"></div>
																	</div>
																</div>
															</div>
														</div>
														<!-- /.modal-content -->
													</div>
												</div>

											</td>
											<td></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
								<!---->
								
								<div style="margin: 0" class="row" id="paging">
									<div style="float: right;">
										<div style="margin-right: 10px; float: left;">
											<ul class="pagination">
												<li class="dropup">
													<div class="lh30 left">共</div>
													<div class="btn-group" style="margin: 0 5px;">
														<span id="goodsNum2" class="lh30 left fb red"
															id="totalRecords"><%=request.getAttribute("goodsNum")%></span>
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
														<button data-toggle="dropdown"
															class="btn btn-default dropdown-toggle" type="button">
															<span id="currentPageSize">${pageInfo.pageSize}</span> <span class="caret"></span>
														</button>
														<div class="lh30 left" style="margin-left: 5px;">个</div>
														<ul role="menu" class="dropdown-menu" id="pageSizes">
															<li><a href="/MaiJiaYun/servlet/cg/sp?method=ini&pageSize=10" >10</a></li>
															<li><a href="/MaiJiaYun/servlet/cg/sp?method=ini&pageSize=20">20</a></li>
															<li><a href="/MaiJiaYun/servlet/cg/sp?method=ini&pageSize=50">50</a></li>
															<li><a href="/MaiJiaYun/servlet/cg/sp?method=ini&pageSize=100">100</a></li>
															<li><a href="/MaiJiaYun/servlet/cg/sp?method=ini&pageSize=200">200</a></li>
															<!-- <li><a href="javascript:void(0);">20</a></li>
                            <li><a href="javascript:void(0);">50</a></li> -->
														</ul>
													</div>
												</li>
											</ul>
										</div>
										
										
										
										
										<div style="width: 350px; float: left;" id="pagingPages">
											<ul class="pagination">
		<!-- 前一页 -->
		<c:choose>
			<c:when test="${pageInfo.pageNo==1}">
				<li class="disabled"><a href="#">&laquo;</a></li>
			</c:when>
			<c:otherwise>
				<li><a
					href="/MaiJiaYun/servlet/cg/sp?method=ini&pageNo=${pageInfo.pageNo-1}&q=${pageInfo.queryParam}">&laquo;</a></li>
			</c:otherwise>
		</c:choose>

		<!-- 计算显示的页码 -->
		<c:choose>
			<c:when test="${pageInfo.pageCount<=5}">
				<c:set var="begin" value="1"></c:set>
				<c:set var="end" value="${pageInfo.pageCount }"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="begin" value="${pageInfo.pageNo-1 }"></c:set>
				<c:set var="end" value="${pageInfo.pageNo+2 }"></c:set>

				<c:if test="${begin<=1}">
					<c:set var="begin" value="1"></c:set>
					<c:set var="end" value="3"></c:set>
				</c:if>
				<c:if test="${end > pageInfo.pageCount}">
					<c:set var="begin" value="${pageInfo.pageCount-2 }"></c:set>
					<c:set var="end" value="${pageInfo.pageCount}"></c:set>
				</c:if>

			</c:otherwise>


		</c:choose>

		<c:forEach begin="${begin }" end="${end }" var="i">

			<c:choose>
				<c:when test="${i==pageInfo.pageNo }">
					<li class="active"><a
						href="/MaiJiaYun/servlet/cg/sp?method=ini&pageNo=${i}&q=${pageInfo.queryParam}">${i }</a></li>
				</c:when>
				<c:otherwise>
					<li><a
						href="/MaiJiaYun/servlet/cg/sp?method=ini&pageNo=${i}&q=${pageInfo.queryParam}">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:if test="${end<pageInfo.pageCount }">
			<li><a href="#">....</a></li>
		</c:if>

		<c:choose>
			<c:when test="${pageInfo.pageNo==pageInfo.pageCount }">
				<li class="disabled"><a href="#">&raquo;</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/MaiJiaYun/servlet/cg/sp?method=ini&pageNo=${pageInfo.pageNo+1}&q=${pageInfo.queryParam}">&raquo;</a></li>
			</c:otherwise>
		</c:choose>

	</ul>
										</div>
									</div>
								</div>
								<!---->
								<!-- Modal -->
								<div class="modal fade" id="detailsModal" tabindex="-1"
									role="dialog" aria-labelledby="detailsModalLabel"
									aria-hidden="true"></div>
								<!-- /.modal -->
							</div>
							<!--right part end-->
						</div>
						<!--end-->
						<!--panel end-->
					</div>
					<!--Layout right part end-->
					<!--新增分类 star-->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div style="width: 800px;" class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="add_classifyModalLabel">新增分类</h4>
								</div>
								<div class="modal-body"
									style="background: #f7f7f7; overflow: scroll; height: 400px">
									<div class="row">
										<!--left part-->
										<!-- <div class="input-group mb10">
          <input type="text" placeholder="" class="form-control">
          <span class="input-group-btn">
          <button class="btn btn-primary" type="button">查询分类</button>
          </span>
          </div> -->
										<!---->
										<div class=" mb10">
											<input placeholder="" id="fullName" class="form-control"
												disabled="" type="input">
										</div>
										<!---->
										<div class="list-group" style="background: #ffffff;">
											<!--jqtree star-->
											<div id="scroll-container">
												<div id="Tree2" style="padding: 10px 0;"></div>
											</div>
											<!--jqtree end-->

										</div>
										<!---->
										<!--left part end-->
										<!--right part-->

									</div>
								</div>
								<div class="modal-footer">


									<button type="button" class="btn btn-primary ok"
										data-dismiss="modal" onclick="permit()">确定</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">取消</button>





								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!--新增分类 end-->
					<!--自定义属性维护 star-->
					<div aria-hidden="true" aria-labelledby="nature_infoModalLabel"
						role="dialog" tabindex="-1" id="editCustomPropertyModal"
						class="modal fade" style="display: none;"></div>
					<!--自定义属性新增 end-->


					<script>
						var data1 = [ {
							name : '淘女郎',
							children : [ {
								name : '网店模特'
							} ]
						}, {
							name : '淘宝同城（测试，勿发商品）'

						}, {
							name : '服务市场',
							children : [ {
								name : '文字类服务',
								children : [ {
									name : '写作/文字需求工作',
									children : [ {
										name : '起名取名'
									}, {
										name : '宣传文案'
									}, {
										name : '文章写作'
									}, {
										name : '方案策划'
									} ]
								}, {
									name : 'office办公操作'
								}, {
									name : '翻译服务',
									children : [ {
										name : '口译服务'
									}, {
										name : '笔译服务'
									}, {
										name : '其他翻译'
									} ]
								} ]
							}, {
								name : '开发/建设服务',
								children : [ {
									name : '开发'
								}, {
									name : '建站一体服务'
								}, {
									name : '数据库服务'
								}, {
									name : '网络软硬件维护'
								} ]
							}, {
								name : '网店装修服务',
								children : [ {
									name : '网店装修定制'
								} ]
							}, {
								name : '多媒体服务',
								children : [ {
									name : '图片设计处理',
									children : [ {
										name : '图片设计'
									}, {
										name : '图片处理'
									} ]
								}, {
									name : '视频/音频/电子相册制作',
									children : [ {
										name : '音频制作处理'
									}, {
										name : '广告/多媒体配音'
									}, {
										name : '摄像服务'
									}, {
										name : '专题配音'
									}, {
										name : '视频剪辑制作'
									}, {
										name : '产品课件配音'
									} ]
								} ]
							}, {
								name : '摄影服务',
								children : [ {
									name : '拍照摄影'
								}, {
									name : '实物摄影'
								} ]
							}, {
								name : '生活服务',
								children : [ {
									name : '钟点工'
								}, {
									name : '跑腿'
								}, {
									name : '保姆'
								}, {
									name : '搬家'
								}, {
									name : '租车服务'
								}, {
									name : '装饰布置'
								}, {
									name : '化妆造型'
								} ]
							}, {
								name : '网店模特（待废弃）'
							}, {
								name : '代购',
								children : [ {
									name : '海外代购',
									children : [ {
										name : '线下代购'
									}, {
										name : '网站代购'
									} ]
								}, {
									name : '国内代购'
								} ]
							}, {
								name : '3C数码家电服务',
								children : [ {
									name : '硬件维修',
									children : [ {
										name : '硬盘更换'
									}, {
										name : '遥控保'
									}, {
										name : '电池维修'
									}, {
										name : '故障检修'
									} ]
								}, {
									name : '延保服务',
									children : [ {
										name : '意外保'
									}, {
										name : '全国联保'
									} ]
								}, {
									name : '软件服务',
									children : [ {
										name : '软件知道'
									}, {
										name : '数据恢复'
									}, {
										name : '刷机'
									}, {
										name : '软件升级'
									} ]
								}, {
									name : '配送安装',
									children : [ {
										name : '移机'
									} ]
								} ]
							}, {
								name : '其他'
							}, {
								name : '特色服务',
								children : [ {
									name : '策划'
								}, {
									name : '演出服饰'
								}, {
									name : '搭配师'
								}, {
									name : '砍价师'
								} ]
							} ]
						}, {
							name : '数字阅读',
							children : [ {
								name : '电子书出版物'
							}, {
								name : '数字漫画'
							}, {
								name : '数字杂志'
							}, {
								name : '其他阅读'
							}, {
								name : '原创文学'
							}, {
								name : '淘出版'
							} ]
						}, {
							name : '天猫点券',
							children : [ {
								name : '品牌卡'
							}, {
								name : '类目卡'
							}, {
								name : '店铺卡'
							}, {
								name : '通用卡'
							} ]
						}, {
							name : '公益',
							children : [ {
								name : '义卖'
							}, {
								name : '捐赠'
							} ]
						}, {
							name : '保险分销',
							children : [ {
								name : '意外险'
							}, {
								name : '医疗疾病保险'
							}, {
								name : '财产险'
							}, {
								name : '少儿险'
							}, {
								name : '两全保险'
							}, {
								name : '旅游保险'
							}, {
								name : '众筹'
							} ]
						}, {
							name : '众筹'
						}, {
							name : '包装'
						}, {
							name : '购物提款券',
							children : [ {
								name : '购物券/礼品卡'
							}, {
								name : '食品提货券'
							}, {
								name : '面包/月饼/蛋糕'
							}, {
								name : '美容美体卡'
							}, {
								name : 'KTV卡券'
							}, {
								name : '足浴按摩卡'
							}, {
								name : '运动健身卡'
							}, {
								name : '美食代金卡'
							}, {
								name : '自助餐券'
							} ]
						}, {
							name : '休闲娱乐',
							children : [ {
								name : '酒吧/俱乐部/私人会所'
							}, {
								name : '足浴/按摩/洗浴'
							}, {
								name : '美容美发/美体美甲'
							}, {
								name : '户外休闲娱乐'
							}, {
								name : '运动健身'
							}, {
								name : '室内休闲玩乐'
							}, {
								name : '其他休闲娱乐'
							}, {
								name : '茶馆/棋牌/咖啡馆'
							}, {
								name : '景点观光'
							}, {
								name : 'KTV'
							} ]
						}, {
							name : '餐饮美食',
							children : [ {
								name : '中餐'
							}, {
								name : '日韩料理'
							}, {
								name : '西餐'
							}, {
								name : '自助餐'
							}, {
								name : '甜品冰淇淋咖啡冷饮'
							}, {
								name : '快餐小吃'
							}, {
								name : '其他美食折扣券'
							}, {
								name : '茶火锅干锅豆捞'
							}, {
								name : '烧烤烤肉'
							}, {
								name : '茶馆'
							} ]
						}

						];

						$(function() {

							$('#Tree2').tree({
								data : data1
							});
						});

						function permit() {

							var node1 = $('#Tree2').tree('getSelectedNode');

							var parent_node = $('#categorysTree').tree(
									'getNodeById', 123);

							$.get("/MaiJiaYun/servlet/cg/sp?method=ini&addNode="
									+ node1.name, function(message) {
								$('#categorysTree').tree('appendNode', {
									name : node1.name,
								}, parent_node);

							})

						}

						/*	$.getJSON(
								'',
								function(data) {
									$('#tree1').tree({
										data: data
									});
								}
							);*/
					</script>

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
								<div style="padding-top: 0" role="menu"
									class="dropdown-menu row">
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
								class="btn-group btn-group-justified btn-group-sm"
								role="tablist" id="chatContactTabHeader">
								<label class="btn btn-default chattab active"
									style="padding: 0px;"> <a data-toggle="tab"
									href="#chatContactHuihuaTab"> <input name="options"
										id="option1" autocomplete="off" checked="" type="radio">
										会话
								</a>
								</label> <label class="btn btn-default chattab" style="padding: 0px;">
									<a data-toggle="tab" href="#chatContactTongshiTab"> <input
										name="options" id="option2" autocomplete="off" checked=""
										type="radio"> 同事
								</a>
								</label> <label class="btn btn-default chattab" style="padding: 0px;">
									<a data-toggle="tab" href="#chatContactFenxiaoTab"> <input
										name="options" id="option3" autocomplete="off" checked=""
										type="radio"> 分销商

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

												<button data-toggle="modal"
													data-target="#inviteContactModal" data-dismiss="modal"
													data-tab="tongshi" type="button"
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
												<button data-toggle="modal"
													data-target="#inviteContactModal" data-dismiss="modal"
													data-tab="fenxiao" type="button"
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
								<div style="padding-top: 0" role="menu"
									class="dropdown-menu row">
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
										class="form-control" id="sendChatGroupMessageInput"
										type="text"> <span class="input-group-btn">
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
								<li class="ml20 tab active" role="presentation"
									id="inviter-tab1"><a href="#tab1" role="tab"
									data-toggle="tab">邀请同事</a></li>
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
												<div name="companyUserName"
													class="alert alert-danger p7 f12" role="alert"
													style="display: none;"></div>
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
																	checked="true" value="option1" name="optionsRadios1"
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
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
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
													name="name" value="" class="form-control"
													placeholder="请输入您同事的姓名" type="text"> <span
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
													name="phone" class="form-control" value=""
													placeholder="请输入您同事的手机号码" type="text"> <span
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
													name="email" class="form-control" value=""
													placeholder="请输入您同事的Email" type="text"> <span
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
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
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
				role="dialog" tabindex="-1" id="edit_accountModal"
				class="modal fade" style="display: none;"></div>
			<div id="modal"></div>
		</div>
		<!--代码结束-->
		<%-- <div  id =pagehidden aria-hidden="true">
		<c:choose>
			<c:when test="${pageInfo.pageNo==1}">
				<li class="disabled"><a href="#">&laquo;</a></li>
			</c:when>
			<c:otherwise>
				<li><a
					href="">&laquo;</a></li>
			</c:otherwise>
		</c:choose>

		<!-- 计算显示的页码 -->
		<c:choose>
			<c:when test="${pageInfo.pageCount<=5}">
				<c:set var="begin" value="1"></c:set>
				<c:set var="end" value="${pageInfo.pageCount }"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="begin" value="${pageInfo.pageNo-1 }"></c:set>
				<c:set var="end" value="${pageInfo.pageNo+2 }"></c:set>

				<c:if test="${begin<=1}">
					<c:set var="begin" value="1"></c:set>
					<c:set var="end" value="3"></c:set>
				</c:if>
				<c:if test="${end > pageInfo.pageCount}">
					<c:set var="begin" value="${pageInfo.pageCount-2 }"></c:set>
					<c:set var="end" value="${pageInfo.pageCount}"></c:set>
				</c:if>

			</c:otherwise>


		</c:choose>

		<c:forEach begin="${begin }" end="${end }" var="i">

			<c:choose>
				<c:when test="${i==pageInfo.pageNo }">
					<li class="active"><a
						href="">${i }</a></li>
				</c:when>
				<c:otherwise>
					<li><a
						href="">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:if test="${end<pageInfo.pageCount }">
			<li><a href="#">....</a></li>
		</c:if>

		<c:choose>
			<c:when test="${pageInfo.pageNo==pageInfo.pageCount }">
				<li class="disabled"><a href="#">&raquo;</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="">&raquo;</a></li>
			</c:otherwise>
		</c:choose>
		
		</div> --%>


	</div>

</body>
</html>