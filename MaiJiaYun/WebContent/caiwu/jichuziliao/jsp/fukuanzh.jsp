<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7">
<![endif]-->
<html
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">

<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta name="keywords"
	content="供销平台,分销平台,分销,供销,货源,分销推荐,货源推荐,供销系统,分销系统,ERP,免费ERP,ERP软件,免费ERP软件,进销存,进销存软件,免费进销存软件">
<meta name="description"
	content="禾唐卖家云独一无二的供销平台，开启供销双方合作的桥梁，无安装，免培训，极致用户体验 。包含寻找优质分销商，一键发布货源信息，一键代发、批发进货轻松接单！让您与分销商的订单业务无缝衔接，供销双方实时互动 ，沟通协作业务拓展不再是难事。">
<meta http-equiv="X-UA-Compatible" content="IE=8,9,chrome=1">
<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>

</head>

<body onload="init()">
	<!--代码开始-->
	<div class="container" id="container">
		<!--header 开始-->
		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
		<!--header 结束-->
		<!--Layout left part star-->
		<!-- style="position: fixed;left:0, top:0, z-index:1030; display:none;" -->
		<!--<div class="sidebar-nav navbar-fixed-top" id="menu" style="display:none;"></div>-->
		<!--Layout left part end-->

		<!--Layout right part star-->
		<div class="content" id="content">
			<!--titletab star-->
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0;">
				<div class="navbar-header">
					<a href="#" class="navbar-brand ml20">基础资料</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<li id="li-fukuantype" class="ml20 tab active"><a
						href="${pageContext.request.contextPath}/caiwu/jichuziliao/jsp/fukuanzh.jsp;"
						class="">付款账户</a></li>
					<li id="li-shouzhitype" class="ml20 tab"><a
						href="${pageContext.request.contextPath}/caiwu/jichuziliao/jsp/shouzhilx.jsp;"
						class="c6">收支类型</a></li>
					<!-- <li class="pull-right">
                    <form class="form-inline" role="search">
                    <div class="w340">
                        <div class="input-group">
                        <input type="text" placeholder="请输入收支类型" style="width:300px;" class="form-control">
                        <span class="input-group-btn">
                        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>
                        </span>
                        </div>
                    </div>

                    </form>
                  </li> -->
				</ul>
				<!--search end-->
			</div>
			<div class="prl10auto" id="panel">
				<div class="btn-group-block">
					<form role="search" class="form-inline">
						<div class="form-group mr5">
							<button class="btn btn-default" type="button"
								data-target="#add_accountModal" id="addAccount"
								data-toggle="modal">新增</button>
						</div>
						<div class="form-group mr5">
							<button class="btn btn-default" id="btnDel" type="button">删除</button>
						</div>
					</form>

					<!--新增付款账户 end-->
					<div style="display: none;" class="modal fade"
						id="add_accountModal" tabindex="-1" role="dialog"
						aria-labelledby="add_accountModalLabel" aria-hidden="false">
						<div style="width: 410px;" class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="add_accountModalLabel">新增付款账户</h4>
								</div>
								<div class="modal-body">
									<form id="saveAccountForm" method="post"
										style="padding: 10px 0px;" role="form" class="form-horizontal">
										<div class="form-group">
											<div class="w50 left lh30 fb">所属店铺</div>
											<div class="col-sm-10">
												<div class="btn-group" name="eshop">
													<input type="hidden" id="eShopId" validate=""
														showname="所属店铺" name="eShopId" value=""> <input
														type="hidden" id="eShopName" name="eShopName" value="">
													<input type="hidden" id="isDefault" name="isDefault"
														value="false">
													<button class="btn btn-default" id="eshopVal" type="button">店铺名称</button>
													<button data-toggle="dropdown" style="margin-right: 0"
														class="btn btn-default dropdown-toggle" type="button">
														<span class="caret"></span>
													</button>
													<ul role="menu" class="dropdown-menu" id="caigou">
													</ul>
												</div>
											</div>
										</div>
										<!---->
										<div class="form-group">
											<div class="left lh30 fb">开户银行</div>
											<div class="col-sm-10">
												<input type="text" validate="" showname="开户银行" name="bank"
													class="form-control">
											</div>
										</div>
										<!---->
										<div class="form-group">
											<div class="w50 left lh30 fb">账号</div>
											<div class="col-sm-10">
												<input type="text" validate="" showname="账号" name="account"
													class="form-control fb">
											</div>
										</div>
										<!---->
										<div class="form-group">
											<div class="w50 left lh30 fb">备注</div>
											<div class="col-sm-10">
												<textarea class="form-control" name="memo" rows="3"></textarea>
											</div>
										</div>
										<!---->
									</form>
								</div>
								<div style="margin-top: 0px;" class="modal-footer">
									<button type="button" id="editSave" class="btn btn-primary">确定</button>
									<button type="button" id="saveAccount" class="btn btn-primary">确定</button>
									<button id="cancel" type="button" class="btn btn-default"
										data-dismiss="modal">取消</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!--新增付款账户 end-->
				</div>
				<!--table star-->
				<div class="panel">
					<!-- Table -->
					<table class="table table-striped table-hover">
						<thead class=" table-bordered">
							<tr>
								<th><input value=0 type="checkbox"></th>
								<th>所属店铺</th>
								<th>开户行</th>
								<th>账号</th>
								<th>默认收款账号</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>

					<!--table end-->
				</div>
			</div>
			<!--titletab end-->
			<jsp:include page="pagination.jsp">
				<jsp:param value="123" name="url" />
			</jsp:include>
		</div>
		<div class="contentbox" id="contentbox"
			style="display: none; background: rgb(241, 241, 241);"></div>

		<script type="text/javascript">
			var shopId = null;
			$("#eshopVal")
					.next()
					.click(
							function() {
								var params = {
										method : "xiala"
								};
								$
										.ajax({
											type : "get",
											url : "/MaiJiaYun/FukuanzhServlet",
											data : params,
											dataType : "json",
											success : function(data) {
												if (data != null) {
													var resultHtml = "";
													$
															.each(
																	data,
																	function(
																			index,
																			element) {
																		resultHtml += "<li id="
																				+ element.shopId
																				+ " onclick=getContent(this.innerText,this.id)><a>"
																				+ element.shopName
																				+ "</a></li>";
																	});
													$("#caigou").html(
															resultHtml);
												}

											}
										});
							});
			function getContent(text, shopId) {
				$("#eshopVal").html(text);
				$("#eshopVal").val(shopId);
			}
		</script>
		<script type="text/javascript">
			//确认按钮事件
			$("#saveAccount").click(function() {
				var params = {
					method : "ok",
					shopId : $("#eshopVal").val(),//店铺id
					shopName : $("#eshopVal").text(),//店铺名
					fkzhBankName : $("input[name=bank]").val(),//银行名
					fkzhBankId : $("input[name=account]").val(),//账号
					fkzhRemark : $("textarea[name=memo]").val(),//备注
				}
				$.ajax({
					type : "get",
					url : "/MaiJiaYun/FukuanzhServlet",
					data : params,
					dataType : "json",
					success : function(result) {
						$("#add_accountModal").modal("hide");
						fkzhFormDeal();
						init(1,pageSiz);
					}
				});
			});
			//付款账户模态框表单处理
			function fkzhFormDeal() {
				$("#eshopVal").text("所属店铺");
				$("input[name=bank]").val("");
				$("input[name=account]").val("");
				$("textarea[name=memo]").val("");
			}
		</script>
		<div aria-hidden="false" style="display: none;"
			class="bootbox modal fade bootbox-confirm in" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<button style="margin-top: -10px;" type="button"
							class="bootbox-close-button close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<div class="bootbox-body">您是否确认删除，确认后无法恢复！</div>
					</div>
					<div class="modal-footer">
						<button data-bb-handl er="cancel" type="button"
							class="btn btn-default">取消</button>
						<button id="isDelete" data-bb-handler="confirm" type="button"
							class="btn btn-primary">确认</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div aria-hidden="false" style="display: none;"
		class="bootbox modal fade bootbox-alert in" tabindex="-1"
		role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button style="margin-top: -10px;" type="button"
						class="bootbox-close-button close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<div class="bootbox-body">至少选择一个账号</div>
				</div>
				<div class="modal-footer">
					<button id="leastOne" data-bb-handler="ok" type="button"
						class="btn btn-primary">OK</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//至少选中一个选项模态框
		var leastOneMotai = $("#leastOne").parent().parent().parent().parent();
		var leastOneExit = $("#leastOne").parent().siblings().eq(0).find(
				"button");
		$("#leastOne").click(function() {
			leastOneMotai.css("display", "none");
		});
		leastOneExit.click(function() {
			leastOneMotai.css("display", "none");
		});
	</script>
	<script>
	//分页数据
	var pageData = null;
	var rowCount = null;
	var pageCount = null;
		//数组下标
		var index = 0;
		//页面加载
		function init(pageNo,pageSize) {
			var pageN = pageNo;
			var pageS = pageSize;
			if(pageN == null){
				pageN = 1;
			}
			if(pageS == null){
				pageS = 10;
			}
			var params = {
				method : "init",
				"pageNo" : pageN,
				"pageSize" : pageS
			}
			$
					.ajax({
						type : "get",
						url : "/MaiJiaYun/FukuanzhServlet",
						data : params,
						datatype : "json",
						success : function(result) {
							pageData = result[0].pageDate;
							rowCount = result[0].rowCount;
							pageCount = result[0].pageCount;
							var resultHtml = "";
							var fkzhId = null;
							$
									.each(
											pageData,
											function(index, element) {
												fkzhId = element.fkzhDafaultId;
												firstIsMoren = element.dafaultBankId;
												var shopName = element.shopName;
												if (element.isExist == 1) {
													if (firstIsMoren == 0) {
														setfkzhDafaultId = "非默认付款账号 "
																+ fkzhId;
														buttonColor = "btn-default";
														moRenText = "设置默认";
													} else {
														setfkzhDafaultId = "默认付款账号 "
																+ fkzhId;
														buttonColor = "btn-primary";
														moRenText = "取消默认";
													}
													resultHtml += "<tr id=t"
															+ fkzhId
															+ " onclick=getLine(this.id)>";
													resultHtml += "<td><input type=\"checkbox\"></td>";
													resultHtml += "<td>"
															+ shopName
															+ "</td>";
													resultHtml += "<td>"
															+ element.fkzhBankName
															+ "</td>";
													resultHtml += "<td class=\"fb\">"
															+ element.fkzhBankId
															+ "</td>";
													resultHtml += "<td>"
															+ setfkzhDafaultId
															+ "</td>";
													resultHtml += "<td>"
															+ element.fkzhRemark
															+ "</td>";
													resultHtml += "<td>";
													resultHtml += "<button id="
															+ fkzhId
															+ " type=\"button\" isdefault=\"true\" class=\"btn "
															+ buttonColor
															+ " mr5 operate-account-set\" onclick=\"moRenClick(this.innerText,this.id)\">"
															+ moRenText
															+ "</button>";
													resultHtml += "<a onclick=\"clickDetail(this)\" style=\"cursor: pointer;\" data-target=\"#add_accountModal\" data-toggle=\"modal\" class=\"operate-account-edit\">详情</a>";
													resultHtml += "</td>";
													resultHtml += "</tr>";
												}
												
											});
							$("tbody").html(resultHtml);
							//刷新重置勾选按钮
							$("table").find("input").prop("checked", false);
							$("table").find("input").removeAttr("checked");
							pageDeal();	
							addPageButton();
						}
					});
		};
		function pageDeal() {
			$("#totalRecords").text(rowCount);
		};
		//新增-详情模态框事件处理
		//点击详情事件获取标签text值，给详情模态框赋初始值
		function clickDetail(a) {
			//设置详情确定按钮的value值
			
			$("#editSave").val($(a).prev().attr("id"));
			$("#saveAccount").hide();
			$("#editSave").show();
			var targetTexts = $(a).parent().siblings();
			var shopName = targetTexts.eq(1).text();
			var fkzhBankName = targetTexts.eq(2).text();
			var fkzhBankId = targetTexts.eq(3).text();
			var fkzhRemark = targetTexts.eq(5).text();
			$("#eshopVal").text(shopName);//店铺名
			var targetInput = $("#saveAccountForm").find("input");
			targetInput.filter("[name=bank]").val(fkzhBankName);//开户行
			targetInput.filter("[name=account]").val(fkzhBankId);//账号
			$("#saveAccountForm").find("textarea").val(fkzhRemark)//备注
		}
		//详情确定按钮事件,修改数据
		$("#editSave").click(function() {
			var fkzhDafaultId = $(this).val();
			var shopId = $("#eshopVal").val();
			var shopName = $("#eshopVal").text();
			var fkzhBankName = $("input[name=bank]").val();
			var fkzhBankId = $("input[name=account]").val();
			var fkzhRemark = $("textarea[name=memo]").val();
			var params = {
				method : "editSave",
				"shopId" : shopId,
				"fkzhDafaultId" : fkzhDafaultId,
				"shopName" : shopName,
				"fkzhBankName" : fkzhBankName,
				"fkzhBankId" : fkzhBankId,
				"fkzhRemark" : fkzhRemark,
			};
			$.ajax({
				type : "get",
				url : "/MaiJiaYun/FukuanzhServlet",
				data : params,
				datatype : "json",
				success : function(result) {
					init(pageNo,pageSiz);
					$("#add_accountModal").modal("hide");
				}

			});
		});
		//点击新增事件
		$("#addAccount").click(function() {
			$("#editSave").hide();
			$("#saveAccount").show();
			fkzhFormDeal();
		});
		//选中指定行
		function getLine(tfkzhId) {
			//一行数据
			var trLine = $("#" + tfkzhId);
			//行内所有直接子类(td)
			var trLineChildens = trLine.children();
			//行内的checkedbox
			var input = trLine.find("input");
			if (input.attr("checked") == "checked") {
				input.prop("checked", false);
				input.removeAttr("checked");
				trLineChildens.removeAttr("style");
			} else {
				input.prop("checked", true);
				input.attr("checked", "checked");
				trLineChildens.css("background-color", "rgb(240, 248, 253)");
			}

		}
		//全选设置
		var checkAll = $("thead").find("input");
		checkAll
				.click(function() {
					if (checkAll.attr("checked") == "checked") {
						$("thead").siblings().eq(0).find("input").prop(
								"checked", false);
						$("tbody").find("td").removeAttr("style");
						checkAll.prop("checked", false);
						checkAll.removeAttr("checked");
					} else {
						$("thead").siblings().eq(0).find("input").prop(
								"checked", true);
						$("tbody").find("td").css("background-color",
								"rgb(240, 248, 253)");
						checkAll.prop("checked", true);
						checkAll.attr("checked", "checked");
					}

				});

		//删除勾选
		$("#btnDel").click(function() {
			deleteMotai.css("display", "block");
		});
		function deleteChose(deleteById) {
			var params = {
				choseIds : deleteById.toString(),
				method : "delete"
			}
			$.ajax({
				type : "get",
				url : "/MaiJiaYun/FukuanzhServlet",
				data : params,
				datatype : "json",
				success : function(result) {
					init(pageNo,pageSiz);
				}
			});
		}
	</script>

	<script type="text/javascript">
		//删除模态框操作
		var deleteMotai = $("#isDelete").parent().parent().parent().parent();
		$("#isDelete").siblings().eq(0).click(function() {
			deleteMotai.css("display", "none");

		});
		$("#isDelete").parent().siblings().eq(0).find("button").click(
				function() {

					deleteMotai.css("display", "none");
				});
		$("#isDelete").click(function() {
			//勾选需要删除的元素id（数组）
			var deleteById = new Array();
			$("tbody").find(":checked").each(function(index, element) {
				var deleteId = $(element).parent().parent().attr("id");
				deleteById[index] = deleteId.replace(/t/, "");
			});
			if (deleteById.length != 0) {
				deleteChose(deleteById);
			} else {
				leastOneMotai.css("display", "block");
			}
			deleteMotai.css("display", "none");
		});
	</script>

	<script type="text/javascript">
		var MorenFlag = 1;
		//设置默认-非默认按钮事件
		function moRenClick(innerText, fkzhId) {
			var moren = $("#" + fkzhId);
			var moRenData = moren.parent().siblings().eq(4);
			var shopName = moren.parent().siblings().eq(1).text();
			if (innerText == "设置默认") {
				sendRequestForMoren(fkzhId, 1, shopName, moren, moRenData);
			} else {
				sendRequestForMoren(fkzhId, 0, shopName, moren, moRenData);
			}
		}
		function sendRequestForMoren(fkzhId, flag, shopName, moren, moRenData) {
			var params = {
				method : "setDefault",
				"shopName" : shopName,
				"fkzhId" : fkzhId,
				"isMoren" : flag
			}
			$
					.ajax({
						type : "get",
						url : "/MaiJiaYun/FukuanzhServlet",
						data : params,
						datatype : "json",
						success : function(result) {
							if (flag == 1) {
								if (result.isChangeId == 1) {
									var targetElement = $("#"
											+ result.fkzhDafaultId);
									var targetMoRen = targetElement.parent()
											.siblings().eq(4);
									targetElement.text("设置默认");
									targetElement.removeClass("btn-primary");
									targetElement.addClass("btn-default");
									targetMoRen.text("非默认付款账号 "
											+ result.fkzhDafaultId);

								}
								moren.text("取消默认");
								moren.removeClass("btn-default");
								moren.addClass("btn-primary");
								moRenData.text("默认付款账号 " + fkzhId);
								init(pageNo,pageSiz);
							} else {
								moren.text("设置默认");
								moren.removeClass("btn-primary");
								moren.addClass("btn-default");
								moRenData.text("非默认付款账号 " + fkzhId);
								init(pageNo,pageSiz);
							}
						}
					});
		}
	</script>
</body>

</html>