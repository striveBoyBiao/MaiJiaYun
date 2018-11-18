<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- 将caigoutuihuoadd.jsp自己所用到的js写在这里 -->
<script>
	//储存页面选中的采购单的编号
	var purchaseOrderCode1 = "";
	//储存页面选中的采购单的Id
	var purchaseId;
	//储存页面选中的仓库的Id
	var warehouseId;

	function init() {
		//添加采购单按钮的鼠标按下事件
		$("#addPurchaseOrder").mousedown(
				function() {
					//将按钮和模态框绑定
					$("#addPurchaseOrder").attr("data-target",
							"#addPurchaseOrderModal");
					
					//将页面上填写采购单输入框的值传递给模态框中输入框中的值
					$("#purchaseOrderCode2")
							.val($("#purchaseOrderCode1").val());

					queryPurchase();
				});

		//模态框中的查询点击事件
		$("#purchaseCodeQuery").click(function() {
			queryPurchase();
		});

		//页面保存点击事件
		$("#save").click(function() {
			if (check()) {
				addReturn();
			}
		});

		//页面取消点击事件
		$("#cancel")
				.click(
						function() {//调转页面
							window.location.href = "${pageContext.request.contextPath}/servlet/caigou/cgthdServlet?method=0";
						});

		//模态框中确定的点击事件
		$("#chosePurchase").click(
				function() {
					var inputs = $("input[name='id']");
					//遍历所有单选框
					$.each(inputs,
							function(index, element) {
								//找到被选中的单选框
								if (element.checked) {
									//将选中的采购单编号赋值给purchaseCode
									var purchaseCode = $(element).parent()
											.parent().children(".fb").html();
									//隐藏模态框
									$('#addPurchaseOrderModal').modal('hide');
									//将选中的采购单编号显示在页面上的填写采购单编号框中
									$("#purchaseOrderCode1").val(purchaseCode);
									purchaseOrderCode1 = $(
											"#purchaseOrderCode1").val();
									//将选中的purchaseId赋值给purchaseId
									purchaseId = element.value;
									queryGoods(element.value);
								}
							});
				});
	}

	//新增采购退货单
	function addReturn() {
		var quantitys = "";
		var goodIds = "";
		//获取table中商品的Id和输入框中的值，并且拼装成字符串
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
						purchaseId : purchaseId,
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

	//根据采购单id查询商品信息
	function queryGoods(purchaseId) {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/servlet/caigou/ReturnServlet",
					data : {
						purchaseId : purchaseId,
						action : 0
					},
					type : "post",
					datatype : "xml",
					success : function(data) {
						if ($(data)) {
							var resultHtml = "";
							resultHtml += "<h4>退货商品 <span class=\"badge\">共<span id=\"returnSkuTotalQuantity\" name=\"returnSkuTotalQuantity\">0</span>件</span>";
							resultHtml += "<div class=\"btn-group select\" style=\" margin-left:20px;\" name=\"returnWarehouseId\" title=\"选择退货仓库\" val=\"\">"
							resultHtml += "<button class=\"btn btn-default\" id=\"warehouse\" type=\"button\">选择退货仓库</button>";
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
											data,
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
														+ "\" showname=\"退货数量\" class=\"form-control interger\" placeholder=\"输入数量\" name=\"quantity\" value=\"\" min=\"0\"></div></td>";
												resultHtml += "<td>0</td>";
												resultHtml += "<td><div class=\"form-group\" style=\"width:100px;\"><input type=\"text\" onblur=\"checkNum(this)\" max=\""
														+ element.purchaseSum
														+ "\" showname=\"退款金额\" class=\"form-control interger\" placeholder=\"输入金额\" name=\"price\" value=\"\"></div></td>";
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
					},
				});

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

	//查询采购单
	function queryPurchase() {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/servlet/caigou/ReturnServlet",
					data : {
						action : 0,
						storageState : "已入库",
						purchaseCode : $("#purchaseOrderCode2").val()
					},
					type : "post",
					datatype : "xml",
					success : function(data) {
						var length;
						var purchaseCode;
						if ($(data)) {
							var resultHtml = "";
							resultHtml += "<thead class=\" table-bordered\">";
							resultHtml += "<tr>";
							resultHtml += "<th></th>";
							resultHtml += "<th>采购单编号</th>";
							resultHtml += "<th>供应商</th>";
							resultHtml += "<th>仓库</th>";
							resultHtml += "<th>采购数量</th>";
							resultHtml += "<th>采购总额</th>";
							resultHtml += "</tr>";
							resultHtml += "</thead>";
							resultHtml += "<tbody style=\"font-weight: normal\">";
							$
									.each(
											data,
											function(index, element) {

												length = index;
												purchaseCode = element.purchaseCode;
												purchaseId = element.purchaseId;

												resultHtml += "<tr>";
												resultHtml += "<td><input type=\"radio\" name=\"id\" id=\"id\" value=\""+element.purchaseId+"\"></td>";
												resultHtml += "<td class=\"fb\">"
														+ element.purchaseCode
														+ "</td>";
												resultHtml += "<td>"
														+ element.supplierCName
														+ "</td>";
												resultHtml += "<td>"
														+ element.wareHouseName
														+ "</td>";
												resultHtml += "<td>"
														+ element.purchaseNumber
														+ "</td>";
												resultHtml += "<td>"
														+ element.purchaseSum
														+ "</td>";
												resultHtml += "</tr>";

											});
							resultHtml += "</tbody>";
							$("#purchaseResult").html(resultHtml);
						}

						if (length == 0
								&& purchaseCode == $("#purchaseOrderCode1")
										.val()
								&& purchaseOrderCode1 != $(
										"#purchaseOrderCode1").val()) {
							$("#addPurchaseOrder").attr("data-target", "");
							purchaseOrderCode1 = $("#purchaseOrderCode1").val();

							queryGoods(purchaseId);
						}

					}
				});
	}
</script>