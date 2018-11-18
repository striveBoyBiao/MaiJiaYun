<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta name="keywords"
	content="供销平台,分销平台,分销,供销,货源,分销推荐,货源推荐,供销系统,分销系统,ERP,免费ERP,ERP软件,免费ERP软件,进销存,进销存软件,免费进销存软件">
<meta name="description"
	content="禾唐卖家云独一无二的供销平台，开启供销双方合作的桥梁，无安装，免培训，极致用户体验 。包含寻找优质分销商，一键发布货源信息，一键代发、批发进货轻松接单！让您与分销商的订单业务无缝衔接，供销双方实时互动 ，沟通协作业务拓展不再是难事。">
<meta http-equiv="X-UA-Compatible" content="IE=8,9,chrome=1">
<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>
<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
</head>
<body>

	<div class="container" id="container">
		<!-- 导航  -->
		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
		<!-- 导航   end -->

		<div class="content" id="content">
			<!-- 菜单 -->
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0;">
				<div class="navbar-header">
					<a href="http://maijiayun.cn/#" class="navbar-brand ml20">调拨单</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<li id="li-uncomplete" class="ml20 tab"><a
						href="${pageContext.request.contextPath}/servlet/kg/WeiwanchengServlet1"
						class="c6">未完成 <span></span>
					</a></li>
					<li id="li-complete" class="tab active"><a class="" href="#">已完成</a></li>
					<!-- 搜索 -->
					<li class="pull-right" id="li-query" style="padding-top: 12px;">
						<div class="w340">
							<div class="input-group">
								<input name="q" type="text" class="form-control"
									placeholder="调拨单号/调出仓/调入仓" onfocus="cleanmsg()"> <span
									class="input-group-btn">
									<button type="button" class="btn btn-primary query"
										onclick="checkmsg()">
										<span class="glyphicon glyphicon-search" style="height: 20px"></span>
									</button>
								</span>
							</div>
						</div>
					</li>
					<!-- 搜索  end -->
				</ul>
			</div>
			<!-- 菜单  end -->
			<!-- 按键  -->
			<div id="panel" class="prl10auto">
				<div class="btn-group-block">
					<div class="btn-group mr5" id="divImport">
						<button type="button" class="btn btn-default" data-toggle="modal"
							data-target="#myModal" id="importButton">导出</button>

						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">
											<font size=2>请选择您要导出的调拨单</font>
										</h4>
									</div>
									<div class="modal-body">...</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">OK</button>
									</div>
								</div>
							</div>
						</div>

						<button id="importOrderListButton" type="button"
							class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							<span class="glyphicon glyphicon-save mr5" style="height: 20px"></span><span
								class="f10" id="taskCount" style="display: none;"></span>
						</button>
						<ul id="importOrderUl" aria-labelledby="importOrderListButton"
							style="width: 340px; height: 200px;" role="menu"
							class="dropdown-menu scrollspy-example">
						</ul>
					</div>
				</div>
			</div>
			<!-- 按键  end -->
			<!--table star-->
			<div class="panel" style="margin-left: 15px; margin-right: 15px;">
				<!-- Table -->
				<table class="table table-striped table-hover">
					<thead class=" table-bordered">
						<tr>
							<th><input type="checkbox" name='diaobodancheck'
								onclick="checkAll(this.checked)"></th>
							<th>调拨单编号</th>
							<th>创建时间</th>
							<th>创建人</th>
							<th>审核人</th>
							<th>审核时间</th>
							<th>调出仓库</th>
							<th>调入仓库</th>
							<th>调拨状态</th>
							<th>操作</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:forEach var="diaobo" items="${pageInfo.pageData }" varStatus="st">
								<tr>
									<td><input type="checkbox" name="diaobodancheck"></td>
									<td>${diaobo.diaobodanCode }</td>
									<td>${diaobo.diaobodanSetTime }</td>
									<td>${diaobo.diaobodanCreater }</td>
									<td>${diaobo.diaobodanAuditor }</td>
									<td>${diaobo.diaobodanAudittime }</td>
									<td>${diaobo.diaobodanOutStore }</td>
									<td>${diaobo.diaobodanInStore }</td>
									<td>${diaobo.diaoboState }</td>
									<td><a href="#" id="xiangqing${st.index }">详情</a></td>
									<td></td>
								</tr>
							</c:forEach>
					</tbody>
				</table>
				<!--分页 -->
				<jsp:include page="/Common/jsp/pagination.jsp">
					<jsp:param
						value="${pageContext.request.contextPath }/servlet/kg/DiaoboYiWanChengServlet"
						name="url" />
				</jsp:include>
				<!--分页 end-->
			</div>
			<!--table end-->
		</div>
	</div>

	<script type="text/javascript">
		

		function cleanmsg() {
			var $input = $("input[name=q]");
			$input.val("");
		}

		//全选
		function checkAll(flag) {
			var diaobodans = document.getElementsByName("diaobodancheck");
			for (var i = 0; i < diaobodans.length; i++) {

				diaobodans[i].checked = flag;
			}
		}
	</script>
</body>
</html>