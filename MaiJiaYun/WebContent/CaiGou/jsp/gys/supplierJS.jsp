<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- 将供应商页面自己所用到的js写在这里 -->
<script>
	//详情所用的查询参数--供应商id
	var supplierId = "";
	//当前页数
	var pageNum = 1;
	//查询框中的查询条件
	var queryUrl = "";

	function init() {

		query();

		//查询的点击事件
		$("#chaxun").click(function() {
			//获取查询框中的查询条件
			queryUrl = $("#q").val();
			//每次查询，将当前页面重置成1
			pageNum = 1;
			query();
			//查询完成后，将查询框中的条件清空
			$("#q").val("");
		});

		//模态框中保存的点击事件
		$("#saveBut").click(function() {
			//获取表单验证函数返回的数据
			var message = checkForm();
			if (message == true) {
				//如果验证通过，隐藏模态框，对数据进行修改
				$('#addsupplierModal').modal('hide');
				saveAndUpdateSupplier();
			} else {
				//如果验证未通过，显示错误信息
				$("#errorSpan").html(message);
			}
		});

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

		//模态框隐藏后触发
		$('#addsupplierModal').on('hidden.bs.modal', function(e) {
			//清空模态框中的值
			$("#companyName").val("");
			$("#companyAddress").val("");
			$("#legalPerson").val("");
			$("#legalPhone").val("");
			$("#contactsName").val("");
			$("#contactsMobile").val("");
			$("#contactsEmail").val("");
			$("#contactsQq").val("");
			$("#errorSpan").html("");
			//清空详情参数
			supplierId = "";
		});

	}

	//全选
	function checkAll(chks) {
		var chk = document.getElementsByName("chk");
		for (var i = 0; i < chk.length; i++) {
			chk[i].checked = chks.checked;
		}
	}

	//验证模态框表单
	function checkForm() {
		if ($("#companyName").val() == "") {
			return "公司名称不能为空！";
		}
		var contactsMobile = $("#contactsMobile").val();
		if (!(/^1[34578]\d{9}$/.test(contactsMobile))) {
			return "请输入正确的手机号码！";
		}
		return true;
	}

	//详情的点击事件
	function showSupplier(xianqing) {
		//获取当前行的供应商id
		supplierId = $(xianqing).parent().parent().attr("modelid");
		$
				.ajax({
					//url : "${pageContext.request.contextPath}/servlet/caigou/SupplierQueryServlet",
					url : "${pageContext.request.contextPath}/servlet/caigou/SupplierServlet",
					data : {
						supplierId : supplierId,
						action : 0
					},
					type : "post",
					datatype : "xml",
					success : function(data) {
						if ($(data)) {
							$.each(data.datas, function(index, element) {
								//将选中行的数据显示在模态框中
								$("#companyName").val(element.supplierCName);
								$("#companyAddress").val(
										element.supplierCAddress);
								$("#legalPerson").val(element.supplierLPerson);
								$("#legalPhone").val(element.supplierLPhone);
								$("#contactsName").val(element.supplierLMName);
								$("#contactsMobile").val(
										element.supplierLMMobile);
								$("#contactsEmail")
										.val(element.supplierLMEmail);
								$("#contactsQq").val(element.supplierLMQq);
							});
						}
					}
				});
	}

	//删除当前行
	function deleteSupplier(shangchu) {
		$
				.ajax({
					//url : "${pageContext.request.contextPath}/servlet/caigou/SupplierChangeServlet",
					url : "${pageContext.request.contextPath}/servlet/caigou/SupplierServlet",
					data : {
						deleteSupplierId : $(shangchu).parent().parent().attr(
								"modelid"),
						action : 1
					},
					type : "post",
					datatype : "xml",
					success : function(data) {
						query();
					}
				});
	}

	//对数据进行修改（增，删，改）
	function saveAndUpdateSupplier() {
		//将表单数据转换成字符串（name=value&name=value）的形式
		var datas = $("#formAddSupplier").serialize();
		datas = datas + "&supplierId=" + supplierId;
		datas = datas + "&action=1";
		$
				.ajax({
					//url : "${pageContext.request.contextPath}/servlet/caigou/SupplierChangeServlet",
					url : "${pageContext.request.contextPath}/servlet/caigou/SupplierServlet",
					data : datas,
					type : "post",
					datatype : "xml",
					success : function(data) {
						query();
					}
				});
	}

	//对数据进行查询
	function query() {
		$
				.ajax({
					//url : "${pageContext.request.contextPath}/servlet/caigou/SupplierQueryServlet",
					url : "${pageContext.request.contextPath}/servlet/caigou/SupplierServlet",
					data : {
						supplierCName : queryUrl,
						action : 0,
						pageNum : pageNum,
						pageSize : $("#currentPageSize").html()
					},
					type : "post",
					datatype : "xml",
					success : function(data) {
						$("#totalRecords").html(data.totalRecords);
						$("#pageNum").html(data.pageNum);
						pageNum = parseInt(data.pageNum);
						var resultHtml = "";
						if ($(data)) {//遍历查询数据，并生成到页面上

							resultHtml += "<table class=\"table table-striped table-hover\">";
							resultHtml += "<thead class=\" table-bordered\">";
							resultHtml += "<tr>";
							resultHtml += "<th><input type=\"checkbox\" name=\"chks\" onclick=\"checkAll(this)\"></th>";
							resultHtml += "<th>公司名称</th>";
							resultHtml += "<th>法人</th>";
							resultHtml += "<th>法人联系信息</th>";
							resultHtml += "<th>联系人</th>";
							resultHtml += "<th>联系人手机</th>";
							resultHtml += "<th>操作</th>";
							resultHtml += "</tr>";
							resultHtml += "</thead>";
							resultHtml += "<tbody>";
							$
									.each(
											data.datas,
											function(index, element) {
												resultHtml += "<tr modelid=\""+element.supplierId+"\">";
												resultHtml += "<td><input name=\"chk\" type=\"checkbox\"></td>";
												resultHtml += "<td>"
														+ element.supplierCName
														+ "</td>";
												resultHtml += "<td>"
														+ element.supplierLPerson
														+ "</td>";
												resultHtml += "<td>"
														+ element.supplierLPhone
														+ "</td>";
												resultHtml += "<td>"
														+ element.supplierLMName
														+ "</td>";
												resultHtml += "<td>"
														+ element.supplierLMMobile
														+ "</td>";
												resultHtml += "<td><a style=\"cursor: pointer;\" onclick=\"showSupplier(this)\" data-target=\"#addsupplierModal\" data-toggle=\"modal\" class=\"mr5 operate-supplier-edit\">详情</a> <a href=\"javascript:void(0);\" onclick=\"deleteSupplier(this)\" class=\"operate-supplier-delete\">删除</a></td>";
												resultHtml += "</tr>";
											});
							resultHtml += "</tbody>";
							//resultHtml += "</table>"
							$("#result").html(resultHtml);
						}
					}
				});
	}
</script>