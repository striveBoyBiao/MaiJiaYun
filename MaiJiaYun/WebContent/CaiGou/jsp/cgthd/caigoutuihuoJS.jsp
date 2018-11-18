<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- 将caigoutuihuo.jsp自己所用到的js写在这里 -->
<script>
	//当前页数
	var pageNum = 1;
	//页面大小
	var pageSize = $("#currentPageSize").html();
	//退货单状态(是否审核通过)
	var returnState = 0;

	function init() {

		query();

		//页面大小的点击事件
		$("#pageSizes").click(function(pageSize) {
			//获取选中的页面大小
			var pageSize = pageSize.target.innerHTML;
			//将现在的页面大小显示在页面上
			$("#currentPageSize").html(pageSize);
			pageNum = 1;
			query();
		});

		//显示上一页
		$("#last").click(function() {
			//当前页面-1
			pageNum = pageNum - 1;
			query();
		});

		//显示下一页
		$("#next").click(function() {
			//当前页面+1
			pageNum = pageNum + 1;
			query();
		});
	}

	//删除采购单
	function deleteReturn(element) {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/servlet/caigou/ReturnServlet",
					data : {
						action : 1,
						deleteReturnId : $(element).parent().parent().attr(
								"modelid")
					},
					type : "post",
					datatype : "xml",
					success : function() {
						query();
					}

				});
	}

	//全选
	function checkAll(chks) {
		var chk = document.getElementsByName("chk");
		for (var i = 0; i < chk.length; i++) {
			chk[i].checked = chks.checked;
		}
	}

	//查询采购退货单(根据returnState的值来区分待审核和已审核)
	function query() {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/servlet/caigou/ReturnServlet",
					data : {
						returnState : returnState,
						pageNum : pageNum,
						pageSize : pageSize,
						action : 0
					},
					type : "post",
					datatype : "xml",
					success : function(data) {
						$("#totalRecords").html(data.totalRecords);
						if (returnState == 0) {
							$("#waitAudit").html("(" + data.totalRecords + ")");
						}
						$("#pageNum").html(data.pageNum);
						pageNum = parseInt(data.pageNum);
						var resultHtml = "";
						if (returnState == 0) {
							resultHtml += "<div class=\"btn-group-block\">";
							resultHtml += "<a href=\"${pageContext.request.contextPath}/servlet/caigou/cgthdServlet?method=1\"><button class=\"btn btn-default mr5\" type=\"button\">新增采购退货单</button></a>";
							resultHtml += "</div>";
						} else {
							resultHtml += "<div class=\"panel mt15\">";
						}

						if ($(data)) {//遍历查询数据，并生成到页面上

							resultHtml += "<table class=\"table table-striped table-hover\">";
							resultHtml += "<thead class=\" table-bordered\">";
							resultHtml += "<tr>";
							resultHtml += "<th><input type=\"checkbox\" name=\"chks\" onclick=\"checkAll(this)\"></th>";
							resultHtml += "<th>采购单退货编号</th>";
							resultHtml += "<th>供应商</th>";
							resultHtml += "<th>仓库</th>";
							resultHtml += "<th>退货数量</th>";
							resultHtml += "<th>已出库数量</th>";
							resultHtml += "<th>退货总额</th>";
							resultHtml += "<th>创建时间</th>";
							resultHtml += "<th>制单人</th>";
							if (returnState == 1) {
								resultHtml += "<th>审单人</th>";
							}
							resultHtml += "<th>备注</th>";
							resultHtml += "<th>操作</th>";
							resultHtml += "</tr>";
							resultHtml += "</thead>";
							resultHtml += "<tbody>";

							$
									.each(
											data.datas,
											function(index, element) {
												resultHtml += "<tr modelid="+element.returnId +">";
												resultHtml += "<td><input name=\"chk\" type=\"checkbox\"></td>";
												resultHtml += "<td>"
														+ element.returnCode
														+ "</td>";
												resultHtml += "<td>"
														+ element.supplierCName
														+ "</td>";
												resultHtml += "<td>"
														+ element.purchaseWarehouseName
														+ "</td>";
												resultHtml += "<td>"
														+ element.returnNumber
														+ "</td>";
												resultHtml += "<td>"
														+ element.returnOutNum
														+ "</td>";
												resultHtml += "<td>"
														+ element.purchaseSum
														+ "</td>";
												resultHtml += "<td>"
														+ element.returnTime
														+ "</td>";
												resultHtml += "<td>"
														+ element.returnMakerName
														+ "</td>";
												if (returnState == 1) {
													resultHtml += "<td>"
															+ element.retrunCheckerName
															+ "</td>";
												}
												resultHtml += "<td>"
														+ element.returnRemark
														+ "</td>";
												if (returnState == 0) {
													resultHtml += "<td><button type=\"button\" name=\"audit\" class=\"btn btn-default mr5 operate-purchase-return-audit\">审核通过</button> <a href=\"${pageContext.request.contextPath}/servlet/caigou/cgthdServlet?method=2&returnId="
															+ element.returnId
															+ "\" class=\"mr5\">详情</a> <a href=\"javascript:void(0);\" onclick=\"deleteReturn(this)\" class=\"operate-purchase-return-delete\">删除</a></td>";
												} else {
													resultHtml += "<td><a href=\"${pageContext.request.contextPath}/servlet/caigou/cgthdServlet?method=3&returnId="
															+ element.returnId
															+ "\" class=\"mr5\">详情</a>";
												}
												resultHtml += "</tr>";

											});

							resultHtml += "</tbody>";
							resultHtml += "</table>";

						}
						if (returnState == 1) {
							resultHtml += "</div>";
						}
						$("#panel").html(resultHtml);
						if (returnState == 0) {
							//审核通过的点击事件
							$("button[name='audit']")
									.click(
											function() {
												//alert("xx");
												var modelid = $(this).parent()
														.parent().attr(
																"modelid");

												$
														.ajax({
															url : "${pageContext.request.contextPath}/servlet/caigou/ReturnServlet",
															data : {
																returnId : modelid,
																audit : "审核通过",
																action : 1
															},
															type : "post",
															datatype : "xml",
															success : function(
																	data) {
																query();
															}

														});
											});
						}
					}

				});

	}

	//待审核的点击事件
	function queryWaitAudit() {
		returnState = 0;
		pageNum = 1;
		pageSize = 10;
		$("#currentPageSize").html(pageSize);
		query();
		//改变样式
		$("#li-caigouwaitauditwait").attr("class", "ml20 tab active");
		$("#li-caigouwaitauditwait").children("a").attr("class", "c6")
		$("#li-caigouaudit").attr("class", "ml20 tab");
		$("#li-caigouaudit").children("a").attr("class", "")
	}

	//已审核的点击事件
	function queryComplete() {
		returnState = 1;
		pageNum = 1;
		pageSize = 10;
		$("#currentPageSize").html(pageSize);
		query();
		//改变样式
		$("#li-caigouaudit").attr("class", "ml20 tab active");
		$("#li-caigouaudit").children("a").attr("class", "c6")
		$("#li-caigouwaitauditwait").attr("class", "ml20 tab");
		$("#li-caigouwaitauditwait").children("a").attr("class", "")
	}
</script>
