<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- 将供应商页面自己所用到的js写在这里 -->
<script>
	//采购退货单Id
	var returnId = getQueryString("returnId");
	//采购退货单仓库Id
	var warehouseId = "";
	var t;
	function init() {
		query();

		//保存点击事件
		$("#save").click(function() {
			if (check()) {
				updateReturn();
			}
		});

		//取消点击事件
		$("#cancel")
				.click(
						function() {
							window.location.href = "${pageContext.request.contextPath}/servlet/caigou/cgthdServlet?method=0";
						});
	}
	
	//更新采购退货单
	function updateReturn() {
		var quantitys = "";
		var goodIds = "";
		//获取商品Id和输入框中的值，并且拼接成字符串
		$.each($("input[name='quantity']"), function(index, element) {
			quantitys += $(element).val() + "q";
			goodIds += $(element).parent().parent().parent().attr("modelid")
					+ "g";
		});

		var prices = "";
		$.each($("input[name='quantity']"), function(index, element) {
			prices += $(element).val() + "p";
		});

		$
				.ajax({
					url : "${pageContext.request.contextPath}/servlet/caigou/ReturnServlet",
					data : {
						returnId : returnId,
						warehouseId : warehouseId,
						returnNumber : $("#returnSkuTotalQuantity").html(),
						returnMoney : $("#returnSkuTotalFee").html(),
						returnRemark : $("#memo").val(),
						quantitys : quantitys,
						prices : prices,
						goodIds : goodIds,
						action : 1
					},
					type : "post",
					datatype : "xml",
					success : function() {
						window.location.href = "${pageContext.request.contextPath}/servlet/caigou/cgthdServlet?method=0";
					}
				});

	}

	//获取地址栏中参数的值
	function getQueryString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		var r = window.location.search.substr(1).match(reg);
		if (r != null) {
			return unescape(r[2]);
		}
		return null;
	}

	//查询仓库
	function queryWarehouse() {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/servlet/caigou/ReturnServlet",
					data : {
						action : 0,
						warehouse : "ture"
					},
					type : "post",
					datatype : "xml",
					success : function(data) {
						if ($(data)) {
							var resultHtml = "";
							$
									.each(
											data,
											function(index, element) {
												resultHtml += "<li val=\""+element.wareHouseId+"\" name=\"warehouses\"><a href=\"javascript:void(0);\">"
														+ element.wareHouseName
														+ "</a></li>"
											});
							$("#warehouseNames").html(resultHtml);
						}
						;

						$("li[name='warehouses']").click(function() {
							warehouseId = $(this).attr("val");
							$("#warehouse").html($(this).children().html());
						});
					}
				});
	}

	function query() {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/servlet/caigou/ReturnServlet",
					data : {
						returnId : returnId,
						action : 0
					},
					type : "post",
					datatype : "xml",
					success : function(data) {
						var returnInfos = $(data.returnInfo);
						var returnInfo = returnInfos[0];
						$("#purchaseCode").html(returnInfo.purchaseCode);
						$("#supplierCName").html(returnInfo.supplierCName);
						$("#purchaseWarehouseName").html(
								returnInfo.purchaseWarehouseName);
						$("#returnSkuTotalFee").html(returnInfo.returnMoney);
						$("#memo").val(returnInfo.returnRemark);

						if ($(data)) {
							var resultHtml = "";
							resultHtml += "<h4>退货商品 <span class=\"badge\">共<span id=\"returnSkuTotalQuantity\" name=\"returnSkuTotalQuantity\">"
									+ returnInfo.returnNumber
									+ "</span>件</span>";
							resultHtml += "<div class=\"btn-group select\" style=\" margin-left:20px;\" name=\"returnWarehouseId\" title=\"选择退货仓库\" val=\"\">"
							resultHtml += "<button class=\"btn btn-default\" id=\"warehouse\" type=\"button\">"
									+ returnInfo.returnWarehouseName
									+ "</button>";
							resultHtml += "<button data-toggle=\"dropdown\" style=\"margin-right:0\" id=\"warehouseName\" class=\"btn btn-default dropdown-toggle\" type=\"button\">";
							resultHtml += "<span class=\"caret\"></span>";
							resultHtml += "</button>";
							resultHtml += "<ul style=\"min-width:94px;\" role=\"menu\" id=\"warehouseNames\" class=\"dropdown-menu\">";
							resultHtml += "</ul>";
							resultHtml += "</div>";
							resultHtml += "</h4>";

							resultHtml += "<table class=\"table table-striped table-hover\">";
							resultHtml += "<thead class=\" table-bordered\">";
							resultHtml += "<tr>";
							resultHtml += "<th>商品图</th>";
							resultHtml += "<th>SKU编码</th>";
							resultHtml += "<th>商品名称</th>";
							resultHtml += "<th>属性</th>";
							resultHtml += "<th>实付</th>";
							resultHtml += "<th>数量</th>";
							resultHtml += "<th>退货数量</th>";
							resultHtml += "<th>已出库数量</th>";
							resultHtml += "<th>退款金额</th>";
							resultHtml += "</tr>";
							resultHtml += "</thead>";
							resultHtml += "<tbody>";

							$
									.each(
											data.purchaseInfos,
											function(index, element) {

												resultHtml += "<tr modelid=\""+element.goodId+"\">";
												resultHtml += "<td><img src=\""+element.goodPicture+"\" style=\"height: 50px; width: 50px;\" class=\"img-thumbnail\" alt=\"50x50\"></td>";
												resultHtml += "<td class=\"fb\">"
														+ element.sku + "</td>";
												resultHtml += "<td>"
														+ element.goodName
														+ "</td>";
												resultHtml += "<td>"
														+ element.properties
														+ "</td>";
												resultHtml += "<td>"
														+ element.purchaseSum
																.toFixed(2)
														+ "元</td>";
												resultHtml += "<td>"
														+ element.purchaseNumber
														+ "</td>";
												resultHtml += "<td><div class=\"form-group\" style=\"width:100px;\"><input type=\"text\" onblur=\"checkNum(this)\" max=\""
														+ element.purchaseNumber
														+ "\" showname=\"退货数量\" class=\"form-control interger\" placeholder=\"输入数量\" name=\"quantity\" value=\""
														+ element.quantity
														+ "\" min=\"0\"></div></td>";
												resultHtml += "<td>0</td>";
												resultHtml += "<td><div class=\"form-group\" style=\"width:100px;\"><input type=\"text\" onblur=\"checkNum(this)\" max=\""
														+ element.purchaseSum
														+ "\" showname=\"退款金额\" class=\"form-control interger\" placeholder=\"输入金额\" name=\"price\" value=\""
														+ element.price
														+ "\"></div></td>";
												resultHtml += "</tr>";

											});
							resultHtml += "</tbody>";
							resultHtml += "</table>";
							$("#skuPanel").html(resultHtml);
						}
						//退货数量输入框的按键松开事件
						$("input[name='quantity']").keyup(function() {
							var quantitys = $("input[name='quantity']");
							var number = 0;
							$.each(quantitys, function(index, element) {
								if (isNum($(element).val())) {
									number += parseInt($(element).val());
								}
							});
							//将总退货数量显示出来
							$("#returnSkuTotalQuantity").html(number);
						});

						//退货总额输入框的按键松开事件
						$("input[name='price']").keyup(function() {
							var prices = $("input[name='price']");
							var number = 0.00;
							$.each(prices, function(index, element) {
								if (isNum($(element).val())) {
									number += parseFloat($(element).val());
								}
							});
							//将总退货金额显示出来
							$("#returnSkuTotalFee").html(number.toFixed(2));
						});

						//选择仓库
						$("#warehouseName").click(function() {
							queryWarehouse();
						});
					}
				});

	}
</script>