<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- 将caigoutuihuoshow.jsp自己所用到的js写在这里 -->
<script>
	//采购退货单Id
	var returnId = getQueryString("returnId");
	//采购退货单仓库Id	
	var warehouseId = "";
	var t;
	function init() {
		query();

		//取消点击事件
		$("#cancel")
				.click(
						function() {
							window.location.href = "${pageContext.request.contextPath}/servlet/caigou/cgthdServlet?method=0";
						});
	}

	//获取地址栏中参数值
	function getQueryString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		var r = window.location.search.substr(1).match(reg);
		if (r != null) {
			return unescape(r[2]);
		}
		return null;
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
						$("#memo").html(returnInfo.returnRemark);

						if ($(data)) {
							var resultHtml = "";
							resultHtml += "<h4>退货商品 <span class=\"badge\">共<span id=\"returnSkuTotalQuantity\" name=\"returnSkuTotalQuantity\">"
									+ returnInfo.returnNumber
									+ "</span>件</span>";
							resultHtml += "</span>退货仓库:</span>"
									+ returnInfo.returnWarehouseName
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
												resultHtml += "<td>"
														+ element.quantity
														+ "</td>";
												resultHtml += "<td>0</td>";
												resultHtml += "<td>"
														+ element.price
														+ "</td>";
												resultHtml += "</tr>";

											});
							resultHtml += "</tbody>";
							resultHtml += "</table>";
							$("#skuPanel").html(resultHtml);
						}
					}
				});

	}
</script>