<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">
<head>
<meta name="renderer" content="webkit">
<meta name="keywords"
	content="供销平台,分销平台,分销,供销,货源,分销推荐,货源推荐,供销系统,分销系统,ERP,免费ERP,ERP软件,免费ERP软件,进销存,进销存软件,免费进销存软件">
<meta name="description"
	content="禾唐卖家云独一无二的供销平台，开启供销双方合作的桥梁，无安装，免培训，极致用户体验 。包含寻找优质分销商，一键发布货源信息，一键代发、批发进货轻松接单！让您与分销商的订单业务无缝衔接，供销双方实时互动 ，沟通协作业务拓展不再是难事。">
<meta http-equiv="X-UA-Compatible" content="IE=8,9,chrome=1">
<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>
<link type="text/css"
	href="${pageContext.request.contextPath}/caiwu/jichuziliao/css/them.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/caiwu/jichuziliao/css/normalize.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/caiwu/jichuziliao/css/main.css"
	rel="stylesheet">
</head>
<body class="" style="padding-right: 0px;">
	<div class="container" id="container">
		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
		<div class="content" id="content">
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0;">
				<div class="navbar-header">
					<a href="#" class="navbar-brand ml20">基础资料</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<li id="li-fukuantype" class="ml20 tab"><a href="${pageContext.request.contextPath }/ShouZhiTypeServlet?method=requestDisToFuKuanAccount"
						class="c6">付款账户</a></li>
					<li id="li-shouzhitype" class="ml20 tab active"><a
						href="${pageContext.request.contextPath }/ShouZhiTypeServlet?method=requestDisToShouZhitype" class="">收支类型</a></li>
				</ul>
			</div>
			<div class="prl10auto" id="panel">
				<div class="btn-group-block">
					<form role="search" class="form-inline">
						<div class="form-group mr5">
							<button class="btn btn-default" type="button"
								data-target="#add_typeModal" id="addType" data-toggle="modal">新增</button>
						</div>
					</form>
					<div style="display: none;" class="modal fade" id="add_typeModal"
						tabindex="-1" role="dialog" aria-labelledby="add_typeModalLabel"
						aria-hidden="true">
						<div style="width: 410px;" class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="add_typeModalLabel">新增收支类型</h4>
								</div>
								<div class="modal-body">
									<form id="saveTypeForm" method="post"
										style="padding: 10px 0px;" role="form" class="form-horizontal">
										<div class="form-group">
											<div class="w50 left lh30 fb">收支类型</div>
											<div class="col-sm-10">
												<input validate="" showname="收支类型" id="shouZhiType"
													name="name" type="text" class="form-control">
											</div>
										</div>
										<!---->
										<div class="form-group">
											<div class="w50 left lh30 fb">状态</div>
											<input name="status" id="status" type="hidden" validate=""
												showname="状态" class="form-control">
											<div class="col-sm-10">
												<div class="btn-group" name="divStatus">
													<button id="showStatus" class="btn btn-default"
														type="button">停用/启用</button>
													<button data-toggle="dropdown"
														style="margin-right: 0; height: 34px"
														class="btn btn-default dropdown-toggle" type="button">
														<span class="caret"></span>
													</button>
													<ul role="menu" class="dropdown-menu">
														<li><a onclick="statusLiClick(this.innerText)"
															href="javascript:void(0)">启用</a></li>
														<li><a onclick="statusLiClick(this.innerText)"
															href="javascript:void(0)">停用</a></li>
													</ul>
												</div>
											</div>
										</div>
										<!---->
										<div class="form-group">
											<div class="w50 left lh30 fb">备注</div>
											<div class="col-sm-10">
												<textarea name="memo" class="form-control" rows="3"></textarea>
											</div>
										</div>
										<!---->
										<div style="margin-top: 0px;" class="modal-footer">
											<button type="button" id="saveType" class="btn btn-primary">确定</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">取消</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style="display: none;" class="modal fade" id="add_typeModal"
					tabindex="-1" role="dialog" aria-labelledby="add_typeModalLabel"
					aria-hidden="true"></div>
			</div>
			<div class="panel">
				<table class="table table-striped table-hover">
					<thead class=" table-bordered">
						<tr>
							<th>收支类型</th>
							<th>状态</th>
							<th>备注</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
				<div style="display: none;" class="modal fade" id="edit_typeModal"
					tabindex="-1" role="dialog" aria-labelledby="edit_typeModalLabel"
					aria-hidden="true">
					<div style="width: 410px;" class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="edit_typeModalLabel">收支类型</h4>
							</div>
							<div class="modal-body">
								<form style="padding: 10px 0px;" role="form"
									class="form-horizontal">
									<div class="form-group">
										<div class="w50 left lh30 fb">收支类型</div>
										<div class="col-sm-10">
											<input id="updateShouZhiType" name="name" type="text"
												class="form-control">
										</div>
									</div>
									<!---->
									<div class="form-group">
										<div class="w50 left lh30 fb">状态</div>
										<input name="status" id="status" type="hidden"
											class="form-control">
										<div class="col-sm-10">
											<div class="btn-group" name="divStatus">
												<button id="updateShowStatus" class="btn btn-default"
													type="button"></button>
												<button data-toggle="dropdown"
													style="margin-right: 0; height: 34px"
													class="btn btn-default dropdown-toggle" type="button">
													<span class="caret"></span>
												</button>
												<ul role="menu" class="dropdown-menu">
													<li><a onclick="updateStatusLiClick(this.innerText)"
														href="javascript:void(0)">启用</a></li>
													<li><a onclick="updateStatusLiClick(this.innerText)"
														href="javascript:void(0)">停用</a></li>
												</ul>
											</div>
										</div>
									</div>
									<!---->
									<div class="form-group">
										<div class="w50 left lh30 fb">备注</div>
										<div class="col-sm-10">
											<textarea name="updatememo" class="form-control" rows="3"></textarea>
										</div>
									</div>
									<!---->
								</form>
							</div>
							<div style="margin-top: 0px;" class="modal-footer">
								<button type="button" id="editSave" class="btn btn-primary">确定</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
			</div>
		</div>
		<div class="row" style="margin: 0; -moz-user-select: none;"
			onselectstart="return false;" id="paging">
			<div style="float: right;">
				<div style="margin-right: 10px; float: left;">
					<ul class="pagination">
						<li class="dropup">
							<div class="lh30 left">共</div>
							<div class="btn-group" style="margin: 0 5px;">
								<span class="lh30 left fb red" id="totalRecords">${rowCount }</span>
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
									<li><a onclick="pageSizesCilck(this.innerText)"
										href="javascript:void(0);">10</a></li>
									<li><a onclick="pageSizesCilck(this.innerText)"
										href="javascript:void(0);">20</a></li>
									<li><a onclick="pageSizesCilck(this.innerText)"
										href="javascript:void(0);">50</a></li>
									<li><a onclick="pageSizesCilck(this.innerText)"
										href="javascript:void(0);">100</a></li>
									<li><a onclick="pageSizesCilck(this.innerText)"
										href="javascript:void(0);">200</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
				<div style="width: 350px; float: left;" id="pagingPages">
					<ul class="pagination">
						<li id="last" class="fb fmsun" onclick="pageClick(this.id)"><a
							href="javascript:void(0);">&lt;</a></li>

						<li class="page active" page="1"><a
							href="javascript:void(0);">1</a></li>

						<li id="next" class="fb fmsun" onclick="pageClick(this.id)"
							><a href="javascript:void(0);">&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="contentbox" id="contentbox"
		style="display: none; background: rgb(241, 241, 241);"></div>

	<script type="text/javascript">
		var trIndex;
		var page = $("#last").next().children();
		var pageValue = page.text();
		<!--动态创建表格-->
		function listShouZhiType(result) {
			if (result) {
				var resultHtml = "";
				$
						.each(
								result,
								function(index, element) {
									resultHtml += "<tr>";
									resultHtml += "<td>"
											+ element.shouzhilxType + "</td>";
									resultHtml += "<td>"
											+ element.shouzhilxStatus + "</td>";
									resultHtml += "<td>"
											+ element.shouzhilxComment
											+ "</td>";
									resultHtml += "<td><a id="
											+ element.shouzhilxId
											+ " style=\"cursor:pointer;\" class=\"operate-type-edit\" data-target=\"#edit_typeModal\" data-toggle=\"modal\" onclick=editType(this.id)>详情</a></td>";
									resultHtml += "</tr>";
								});
				$("table").children("tbody").html(resultHtml);
			}
		}

		$("document").ready(function() {
			$.ajax({
				type : "get",
				url : "/MaiJiaYun/ShouZhiTypeServlet",
				data : {
					method : "pageCountMethod",
					pageValue : pageValue,
					rowCount : $("#currentPageSize").text()
				},
				dataType : "json",
				success : function(result) {
					listShouZhiType(result);
				}
			});
		});
		<!--新增-->
		$("#saveType").click(function() {
			var param = {
				method : "addShouZhiTypeMethod",
				shouZhiType : $('#shouZhiType').val(),
				showStatus : $("#showStatus").text(),
				comment : $('textarea[name=memo]').val()
			};
			$.ajax({
				type : "get",
				url : "/MaiJiaYun/ShouZhiTypeServlet",
				data : param,
				dataType : "json",
				success : function(result) {
					$("#add_typeModal").modal("hide");
					listShouZhiType(result);
				}
			});
			$('#shouZhiType').val("");
			$("#showStatus").text("停用/启用");
			$('textarea[name=memo]').val("")
		});
		<!--修改收支类型的状态-->
		function statusLiClick(text) {
			$("#showStatus").text(text);
		}
	</script>
	<script type="text/javascript">
	<!--点击详情修,将信息显示到修改界面-->
		function editType(id) {
			var message = $("#" + id).parent().siblings();
			trIndex = id;
			$("#updateShouZhiType").val(message.eq(0).text());
			$("#updateShowStatus").text(message.eq(1).text());
			$('textarea[name=updatememo]').val(message.eq(2).text());
		};
		<!--修改信息-->
		$("#editSave").click(function() {
			var param = {
				method : "updateShouZhiTypeMethod",
				updateIndex : $("#" + trIndex).attr("id"),
				updateShouZhiType : $("#updateShouZhiType").val(),
				updateShowStatus : $("#updateShowStatus").text(),
				updateComment : $('textarea[name=updatememo]').val()
			};
			$.ajax({
				type : "get",
				url : "/MaiJiaYun/ShouZhiTypeServlet",
				data : param,
				dataType : "json",
				success : function(result) {
					$("#edit_typeModal").modal("hide");
					listShouZhiType(result);
				}
			});
		});
		<!--修改收支类型的状态-->
		function updateStatusLiClick(text) {
			$("#updateShowStatus").text(text);
		}
	</script>
	<script type="text/javascript">
	<!--选择页面显示数据的大小-->
		function pageSizesCilck(text) {
			var pageSizes = $("#pageSizes").children();
			$("#currentPageSize").text(text);
			$.ajax({
				type : "get",
				url : "/MaiJiaYun/ShouZhiTypeServlet",
				data : {
					method : "pageCountMethod",
					rowCount : $("#currentPageSize").text()
				},
				dataType : "json",
				success : function(result) {
					listShouZhiType(result);
				}
			});
		};
		<!--翻页-->
		function pageClick(id) {
			if (id == "next") {
				if (pageValue < "${pageCount}") {
					pageValue ++;
				}
				page.text(pageValue);
			} else {
				if (pageValue <= 1) {
					pageValue = 1;
				} else {
					pageValue--;
				}
				page.text(pageValue);
			}
			$.ajax({
				type : "get",
				url : "/MaiJiaYun/ShouZhiTypeServlet",
				data : {
					method : "pageCountMethod",
					pageValue : pageValue,
					rowCount : $("#currentPageSize").text()
				},
				dataType : "json",
				success : function(result) {
					listShouZhiType(result);
				}
			});
		}
	</script>
</body>
</html>