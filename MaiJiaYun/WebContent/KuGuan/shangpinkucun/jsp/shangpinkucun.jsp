<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>

</head>

<body>
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
					<li class="ml20 tab active" id="li-goodshouse"><a
						href="${pageContext.request.contextPath}/CangKuXinxiMethodServlet?method=requestDis">商品库存</a></li>
					<li class="ml20 tab" id="li-houseinfo"><a class="c6"
						href="${pageContext.request.contextPath}/CangKuXinxiMethodServlet?method=requestDisp">仓库信息
					</a></li>
				</ul>
			</div>

			<!-- context start -->
			<div id="panel" class="prl10auto">
				<!--功能按钮 star-->
				<div class="btn-group-block">
					<!--search star-->
					<div class="form-inline">
						<div class="form-group fb" style="margin-right: 10px;">
							<select id="warehouseId" class="selectpicker"
								style="display: none;">
							</select>
							<div class="btn-group bootstrap-select">
								<button type="button" style="width: 220px"
									class="btn dropdown-toggle selectpicker btn-default"
									title="请选择">
									<span class="filter-option pull-left"
										style="width: 181px; text-align: left">请选择</span>&nbsp;<span
										class="caret"></span>
								</button>
								<div class="dropdown-menu open">
									<ul id="wareHouseNames" style="width: 220px"
										class="dropdown-menu inner selectpicker" role="menu">
									</ul>
								</div>
							</div>

						</div>
						<div class="form-group" style="width: 200px;" id="li-query">
							<div class="input-group">
								<input type="text" name="q" class="form-control"
									placeholder="商品编号/SKU编号/商品名称"> <span
									class="input-group-btn">
									<button type="button" class="btn btn-primary query">
										<span class="glyphicon glyphicon-search" style="height: 19px"></span>
									</button>
								</span>
							</div>
						</div>
						<div class="btn-group mr5" id="divImport">
							<button class="btn btn-default" type="button" id="importButton"
								data-target="#modal1" data-toggle="modal">导出</button>
							<button id="importOrderListButton" style="width:44px;height:34px;" type="button"
								class="btn btn-default dropdown-toggle" data-toggle="dropdown">
								<span class="glyphicon glyphicon-save mr5"></span><span
									class="f10" id="taskCount" style="display: none;">1</span>
							</button>
							<ul id="importOrderUl" aria-labelledby="importOrderListButton"
								style="width: 340px; height: 200px;" role="menu"
								class="dropdown-menu scrollspy-example">

								<li>
									<div class=" mr20 ml20"
										style="border-bottom: 1px solid #eeeeee;">
										<div style="line-height: 60px; text-align: center;">
											<span class="c6" style="display: inline;">当前没有进行中的任务</span>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<!--search end-->
				</div>

				<!-- modal1 -->
				<div id="modal1" ; class="bootbox modal fade bootbox-alert in"
					tabindex="-1" role="dialog" aria-hidden="false"
					style="display: none;">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<button type="button" class="bootbox-close-button close"
									data-dismiss="modal" aria-hidden="true"
									style="margin-top: -10px;">×</button>
								<div class="bootbox-body">请选择您要导出的商品库存单</div>
							</div>
							<div class="modal-footer">
								<button data-bb-handler="ok" type="button"
									class="btn btn-primary" data-dismiss="modal">OK</button>
							</div>

						</div>
					</div>
				</div>

				<!-- modal2 -->
				<div id="modal2" class="bootbox modal fade bootbox-confirm in"
					tabindex="-1" role="dialog" aria-hidden="false" style="">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<button type="button" class="bootbox-close-button close"
									data-dismiss="modal" aria-hidden="true"
									style="margin-top: -10px;">×</button>
								<div class="bootbox-body">您将导出选择的1条商品库存单</div>
							</div>
							<div class="modal-footer">
								<button data-bb-handler="cancel" type="button"
									class="btn btn-default">取消</button>
								<button data-bb-handler="confirm" type="button"
									class="btn btn-primary">确认</button>
							</div>
						</div>
					</div>
				</div>
				<!--功能按钮 end-->
				<!-- Table -->
				<table class="table table-striped table-hover">
					<thead class=" table-bordered">
						<tr>
							<th>
								<div class="btn-group">
									<div class="left" style="margin-right: 5px;">
										<input type="checkbox">
									</div>
								</div>
							</th>
							<th>商品货号</th>
							<th>SKU编码</th>
							<th>商品名称</th>
							<th>商品属性</th>
							<th>仓库数量</th>
							<th>拍下占货</th>
							<th>付款占货</th>
							<th>仓库</th>
							<th>库区/库位</th>
							<th>操作</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<!--修改 star-->
				<div aria-hidden="true" aria-labelledby="warehouse_modifyModalLabel"
					role="dialog" tabindex="-1" id="warehouse_modifyModal"
					class="modal fade" style="display: none;">
					<div style="width: 1000px;" class="modal-dialog">
						<input type="hidden" id="skuId" value="2182698"> <input
							type="hidden" id="addWarehouseId" value="18065"> <input
							type="hidden" id="locationId" value="">
						<div class="modal-content">
							<div class="modal-header">
								<button aria-hidden="true" data-dismiss="modal" class="close"
									type="button">×</button>
								<h4 id="warehouse_modifyModalLabel" class="modal-title">添加库位</h4>
							</div>
							<div class="modal-body" style="padding-top: 0px;">
								<!--part2 star-->
								<div class="row mt15">
									<!--parttwo star-->
									<div
										style="margin-top: 0px; background: #f7f7f7; height: 415px;; padding: 0;"
										class="col-md-4">
										<h5 style="padding: 0px 10px;">
											<strong class="lh30">仓库</strong>
										</h5>
										<div style="height: 350px;"
											class="list-group scrollspy-example">
											<a class="list-group-item active" href="javascript:void(0)">
												<h5 class="list-group-item-heading" warehouseid="18065">
												</h5>
											</a>
										</div>
									</div>
									<!--parttwo end-->
									<!--partthree star-->
									<div id="warehouseZoneDiv"
										style="margin-top: 0px; background: #f7f7f7; height: 415px;; padding: 0;"
										class="col-md-4">
										<h5 style="padding: 0px 10px;">
											<strong class="lh30">库区</strong>
										</h5>
										<div style="height: 350px;"
											class="list-group scrollspy-example"></div>
									</div>
									<div id="warehouseLocationDiv"
										style="margin-top: 0px; background: #f7f7f7; height: 415px; padding: 0;"
										class="col-md-4">
										<h5 style="padding: 0px 10px;">
											<strong class="lh30">库位</strong>
										</h5>
										<div style="height: 350px;"
											class="list-group scrollspy-example"></div>
									</div>
									<!--partthree end-->
								</div>
								<!--part2 end-->
							</div>
							<div class="modal-footer">
								<button class="btn btn-primary" id="saveGoodsWarehouse"
									type="button">确定</button>
								<button data-dismiss="modal" class="btn btn-default"
									type="button">取消</button>
								<span id="errorSpan" class="c6 ml20" style="color: red">
								</span>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
				</div>
				<!--修改 end-->
				<!--table end-->
				<!--panel end-->
				<!--分页 star-->
				<div class="row" style="margin: 0; -moz-user-select: none;"
					onselectstart="return false;" id="paging">
					<div style="float: right;">
						<div style="margin-right: 10px; float: left;">
							<ul class="pagination">
								<li class="dropup">
									<div class="lh30 left">共</div>
									<div class="btn-group" style="margin: 0 5px;">
										<span class="lh30 left fb red" id="totalRecords">4</span>
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
											<span id="currentPageSize">10</span> <span class="caret"></span>
										</button>
										<div class="lh30 left" style="margin-left: 5px;">个</div>
										<ul role="menu" class="dropdown-menu" id="pageSizes">
											<li><a href="javascript:void(0);">10</a></li>
											<li><a href="javascript:void(0);">20</a></li>
											<li><a href="javascript:void(0);">50</a></li>
											<li><a href="javascript:void(0);">100</a></li>
											<li><a href="javascript:void(0);">200</a></li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
						<div style="width: 350px; float: left;" id="pagingPages">
							<ul class="pagination">
								<li id="last" class="fb fmsun"><a
									href="javascript:void(0);">&lt;</a></li>

								<li class="page active" page="1"><a
									href="javascript:void(0);">1</a></li>

								<li id="next" class="fb fmsun"><a
									href="javascript:void(0);">&gt;</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!--分页 end-->
			</div>

		</div>
	</div>
	<!--代码结束-->
	<script type="text/javascript">
		function listGoods(result) {
			if (result) {
				var resultHtml = "";
				$
						.each(
								result,
								function(index, element) {
									resultHtml += "<tr value="+element.userId+">";
									resultHtml += "<td><input type=\"checkbox\" name=\"checkOrder\" value="+index+"></td>";
									resultHtml += "<td>" + element.goodId
											+ "</td>";
									resultHtml += "<td>" + element.sku
											+ "</td>";
									resultHtml += "<td>" + element.goodName
											+ "</td>";
									resultHtml += "<td>"
											+ element.goodAttribute + "</td>";
									resultHtml += "<td>" + element.goodCount
											+ "</td>";
									resultHtml += "<td>0</td>";
									resultHtml += "<td>0</td>";
									resultHtml += "<td>"
											+ element.wareHouseName + "</td>";
									resultHtml += "<td colspan=\"3\"> <div class=\"btn-group\">"
									resultHtml += "<button class=\"btn btn-default\" type=\"button\" onclick=\"locationBtn(this)\">所在库位</button>";
									resultHtml += "<button onclick=\"reservoirInfo(this)\" data-toggle=\"dropdown\" class=\"btn btn-default dropdown-toggle\" type=\"button\" style=\"height: 34px\">";
									resultHtml += "<span class=\"caret\"></span></button><ul role=\"menu\" class=\"dropdown-menu\"></ul></div>";
									resultHtml += "<button onclick=\"addWareHouse(this)\" class=\"btn btn-default operate-warehousegoods-add\" warehousename="
											+ element.wareHouseName
											+ " warehouseid="
											+ element.wareHouseId
											+ " type=\"button\" data-target=\"#warehouse_modifyModal\" data-toggle=\"modal\">添加库位</button></td>";
								});
				$("tbody").html(resultHtml);
			}
		}

		$("document").ready(
				function() {
					$.ajax({
						type : "get",
						url : window.document.location.pathname.substring(0,
								window.document.location.pathname.substr(1)
										.indexOf('/') + 1)
								+ "/CangKuXinxiMethodServlet",
						data : {
							method : "initGoodKuGuan"
						},
						dataType : "json",
						success : function(result) {
							listGoods(result);
						}
					});
				});
	</script>
	<script type="text/javascript">
		var flag = 0;
		$("#warehouseId")
				.next()
				.click(
						function() {
							$
									.ajax({
										type : "get",
										url : window.document.location.pathname
												.substring(
														0,
														window.document.location.pathname
																.substr(1)
																.indexOf('/') + 1)
												+ "/CangKuXinxiMethodServlet",
										data : {
											method : "wareHouseList",
											userId : "10001"
										},
										dataType : "json",
										success : function(result) {
											if (result) {
												var resultHtml = "<li class=\"hide is-hidden selected\"><a tabindex=\"0\"></a></li>";
												$
														.each(
																result,
																function(index,
																		element) {
																	resultHtml += "<li id=l"
																			+ element.wareHouseId
																			+ " onclick=\"wareHouseSelects(this.id,this.innerText)\"><a tabindex=\"0\"><span class=\"text\"><span>"
																			+ element.wareHouseName
																			+ "</span></a></li>";
																});
											}
											if (flag == 0) {
												$("#warehouseId").next()
														.addClass("open");
												flag = 1;
											} else {
												$("#warehouseId").next()
														.removeClass("open");
												flag = 0;
											}
											$("#wareHouseNames").html(
													resultHtml);
											$("#wareHouseNames").css(
													"max-height", "539px");
											$("#wareHouseNames").css(
													"overflow-y", "auto");
											$("#wareHouseNames").css(
													"min-height", "20px");
										}
									});
						});

		$("thead").find("input[type=checkbox]").click(function() {
			if ($("thead").find("input[type=checkbox]").prop("checked")) {
				$("tbody").find("input[type=checkbox]").prop("checked", true);
			} else {
				$("tbody").find("input[type=checkbox]").prop("checked", false);
			}
		});

		function locationBtn(btn) {
			var checkBox = $(btn).parents("td").siblings().find(
					"input[type=checkbox]");
			if (checkBox.prop("checked")) {
				checkBox.prop("checked", false);
			} else {
				checkBox.prop("checked", true);
			}

		}
	</script>
	<script type="text/javascript">
		function wareHouseSelects(id, text) {
			var wareHouseSelect = $("#wareHouseNames").parent().prev()
					.children().first();
			wareHouseSelect.text(text);
			wareHouseSelect.val(id.substr(1));
			$.ajax({
				type : "get",
				url : window.document.location.pathname.substring(0,
						window.document.location.pathname.substr(1)
								.indexOf('/') + 1)
						+ "/CangKuXinxiMethodServlet",
				data : {
					method : "wareHouseListById",
					wareHouseId : wareHouseSelect.val()
				},
				dataType : "json",
				success : function(result) {
					listGoods(result);
				}
			});
		}

		function reservoirInfo(reservoirBtn) {
			var wareHouseId = $(reservoirBtn).parent().next().attr(
					"warehouseid");
			$
					.ajax({
						type : "get",
						url : window.document.location.pathname.substring(0,
								window.document.location.pathname.substr(1)
										.indexOf('/') + 1)
								+ "/CangKuXinxiMethodServlet",
						data : {
							method : "reservoirAndLocation",
							wareHouseId : wareHouseId
						},
						dataType : "json",
						success : function(result) {
							if (result) {
								var resultHtml = "";
								$
										.each(
												result,
												function(index, element) {
													resultHtml += "<li><a onclick=\"reservoirNameDelete(this)\" warehouseid="
															+ element.wareHouseId
															+ " reservoirid="
															+ element.reservoirId
															+ " locationid="
															+ element.locationId
															+ " class=\"operate-goodslocation-delete\">"
															+ element.reservoirName
															+ "-"
															+ element.locationName
															+ "<span class=\"glyphicon glyphicon-remove ml20\"></span></a></li>";
												});
								$(reservoirBtn).next().html(resultHtml);
							}
						}
					});
		}

		function reservoirNameDelete(reservoirName) {
			if (confirm("确认删除库位吗？")) {
				$(reservoirName).remove();
				var reservoirId = $(reservoirName).attr("reservoirid");
				var locationId = $(reservoirName).attr("locationid");
				var wareHouseId = $(reservoirName).attr("warehouseid");
				$
						.ajax({
							type : "get",
							url : window.document.location.pathname.substring(
									0, window.document.location.pathname
											.substr(1).indexOf('/') + 1)
									+ "/CangKuXinxiMethodServlet",
							data : {
								method : "reservoirAndLocation" ,
								wareHouseId : wareHouseId,
								reservoirId : reservoirId,
								locationId : locationId,
								flag : "1"
							},
							dataType : "json",
							success : function(result) {
								if (result) {
									var resultHtml = "";
									$
											.each(
													result,
													function(index, element) {
														resultHtml += "<li><a onclick=\"reservoirNameDelete(this)\" warehouseid="
																+ element.wareHouseId
																+ " reservoirid="
																+ element.reservoirId
																+ " locationid="
																+ element.locationId
																+ " class=\"operate-goodslocation-delete\">"
																+ element.reservoirName
																+ "-"
																+ element.locationName
																+ "<span class=\"glyphicon glyphicon-remove ml20\"></span></a></li>";
													});
									$(reservoirName).parents("ul").html(
											resultHtml);
								}
							}
						});
			}
		}

		function addWareHouse(wareHouse) {
			$("#warehouse_modifyModal").attr("aria-hidden", true);
			$("#warehouse_modifyModal").addClass("in");
			$("#warehouse_modifyModal").css("display", "block");
			$("#warehouseZoneDiv").prev().find("a").children().text(
					$(wareHouse).attr("warehousename"));
			$(wareHouse).parents("td").siblings().find("input[type=checkbox]")
					.prop("checked", true);
			var wareHouseId = $(wareHouse).attr("warehouseid");
			$
					.ajax({
						type : "get",
						url : window.document.location.pathname.substring(0,
								window.document.location.pathname.substr(1)
										.indexOf('/') + 1)
								+ "/CangKuXinxiMethodServlet",
						data : {
							method : "reservoirInfo",
							wareHouseId : wareHouseId
						},
						dataType : "json",
						success : function(result) {
							if (result) {
								var resultHtml = "";
								$
										.each(
												result,
												function(index, element) {
													resultHtml += "<a onclick=\"reservoirSelect(this)\" warehouseid="
															+ wareHouseId
															+ " zoneid="
															+ element.reservoirId
															+ " class=\"list-group-item operate-warehousegoods-location \">";
													resultHtml += "<h5 class=\"list-group-item-heading\">"
															+ element.reservoirName
															+ "</h5></a>";
												});
								$("#warehouseZoneDiv").find("div").html(
										resultHtml);
							}
						}
					});
		}

		function reservoirSelect(reservoirName) {
			$(reservoirName).addClass("active");
			$(reservoirName).siblings().removeClass("active");
			$
					.ajax({
						type : "get",
						url : window.document.location.pathname.substring(0,
								window.document.location.pathname.substr(1)
										.indexOf('/') + 1)
								+ "/CangKuXinxiMethodServlet",
						data : {
							method : "locationNameList",
							wareHouseId : $(reservoirName).attr("warehouseid"),
							reservoirId : $(reservoirName).attr("zoneid")
						},
						dataType : "json",
						success : function(result) {
							if (result) {
								var resultHtml = "";
								$
										.each(
												result,
												function(index, element) {
													resultHtml += "<a onclick=\"locationSelect(this)\" locationid="
															+ element.locationId
															+ " class=\"list-group-item operate-goodslocation-choose\">";
													resultHtml += "<h5 class=\"list-group-item-heading\">"
															+ element.locationName
															+ "</h5></a>";
												});
								$("#warehouseLocationDiv").find("div").html(
										resultHtml);
							}
						}
					});
		}

		function locationSelect(locationName) {
			$(locationName).addClass("active");
			$(locationName).siblings().removeClass("active");
		}

		$("#saveGoodsWarehouse")
				.click(
						function() {
							var warehouseZoneDiv = $("#warehouseZoneDiv").find(
									"div").children(".active");
							var warehouseLocationDiv = $(
									"#warehouseLocationDiv").find("div")
									.children(".active");
							var reservoirId = warehouseZoneDiv.attr("zoneid");
							var reservoirName = warehouseZoneDiv.text();
							var locationId = warehouseLocationDiv
									.attr("locationid");
							var wareHouseId = warehouseZoneDiv
									.attr("warehouseid");
							var locationName = warehouseLocationDiv.text();
							$
									.ajax({
										type : "get",
										url : window.document.location.pathname
												.substring(
														0,
														window.document.location.pathname
																.substr(1)
																.indexOf('/') + 1)
												+ "/CangKuXinxiMethodServlet",
										data : {
											method : "reservoirAndLocation",
											reservoirId : reservoirId,
											reservoirName : reservoirName,
											locationId : locationId,
											locationName : locationName,
											wareHouseId : wareHouseId,
											flag : "0"
										},
										dataType : "json",
										success : function(result) {
											if (result) {
												var resultHtml = "";
												$
														.each(
																result,
																function(index,
																		element) {
																	resultHtml += "<li><a onclick=\"reservoirNameDelete(this)\" warehouseid="
																			+ element.wareHouseId
																			+ " reservoirid="
																			+ element.reservoirId
																			+ " locationid="
																			+ element.locationId
																			+ " class=\"operate-goodslocation-delete\">"
																			+ element.reservoirName
																			+ "-"
																			+ element.locationName
																			+ "<span class=\"glyphicon glyphicon-remove ml20\"></span></a></li>";
																});
												var checkBox = $("tbody")
														.find(
																"input[type=checkbox]:checked");
												$(checkBox).parent().siblings()
														.find("ul").html(
																resultHtml);
												$(checkBox).prop("checked",
														false);
												$("#warehouse_modifyModal")
														.modal("hide");
												$("#warehouseLocationDiv")
														.find("div").html("");
											}
										}
									});
						});

		$("input[name=q]").next().click(
				function() {
					$.ajax({
						type : "get",
						url : window.document.location.pathname.substring(0,
								window.document.location.pathname.substr(1)
										.indexOf('/') + 1)
								+ "/CangKuXinxiMethodServlet",
						data : {
							method : "initGoodKuGuan",
							selectText : $("input[name=q]").val()
						},
						dataType : "json",
						success : function(result) {
							listGoods(result);
						}
					});
				});
	</script>
	<script type="text/javascript">
		var exportInfo = new Array();
		$("#importButton").click(
				function() {
					$("tbody").find("input[type=checkbox]:checked").each(
							function(index, element) {
								var checkbox = $(element).parent().siblings();
								var exinfo = {
									goodId : checkbox.eq(0).text(),
									sku : checkbox.eq(1).text(),
									goodName : checkbox.eq(2).text(),
									goodAttribute : checkbox.eq(3).text(),
									goodCount : checkbox.eq(4).text(),
									goodPhotographed : checkbox.eq(5).text(),
									goodPayment : checkbox.eq(6).text(),
									wareHouseName : checkbox.eq(7).text()
								}
								exportInfo.push(exinfo);
							});
					if (exportInfo.length >= 1) {
						$("#importButton").attr("data-target", "#modal2");
						$("#modal2 div.bootbox-body").text(
								"您将导出选择的" + exportInfo.length + "条商品库存单");
					}
				});
		$("button[data-bb-handler=cancel]").click(function() {
			$("#modal2").modal("hide");
		});
		$("button[data-bb-handler=confirm]").click(function() {
			$("#modal2").modal("hide");
			$("#taskCount").text(exportInfo.length);
			$("#taskCount").css("display", "inline");
			$.ajax({
				type : "get",
				url : "/MaiJiaYun/ExportServlet",
				data : {
					goodInfo : exportInfo.toString()
				},
				dataType : "json",
				success : function(result) {
					exportInfo.length = 0;
				}
			});
		});
	</script>
</body>
</html>