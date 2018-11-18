<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="icon" href="${pageContext.request.contextPath}/Login_/img/favicon.ico">
<script type="text/javascript" src="${pageContext.request.contextPath }/Order/js/xiangqing.js"></script>
<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>
</head>
<body >
	<!--代码开始-->
	<div class="container" id="container">
		<!--header 开始-->
		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
		<!--header 结束-->

		<!--Layout right part star-->
		<div class="content" id="content">
			<!--代码开始-->
			<!--Layout right part star-->
			<!--titletab star-->
			<div class="collapse navbar-collapse navbar-default navbar-titletab" style="padding: 0px 0 0 0;">
				<div class="navbar-header">
					<a href="${pageContext.request.contextPath}/servlet/DdcxMethodServlet?method=ddcx" class="navbar-brand ml20">订单查询</a>
				</div>
				
				<ul class="nav nav-tabs f14 fb">
					<!--<li class="active ml20"><a href="javascript:void(0);">订单查询</a></li>-->


					<li class="pull-right" id="li-query" style="padding-top: 12px;">
						<div style="width: 380px;">
							<div class="input-group">
								<input name="q" type="text" class="form-control" placeholder="店铺名/物流公司名/订单号/快递单号/买家姓名/买家旺旺号/发货单号"> <span class="input-group-btn">
									<button type="button" class="btn btn-primary query" style="height: 34px;" onclick="query()">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
					</li>
<%-- 					<jsp:include page="/Order/jsp/gaojisousuo.jsp"></jsp:include> --%>
				</ul>
			</div>
			<!--titletab end-->
			<!--panel star-->
			<div class="prl10auto">
				<div class="btn-group-block">
					<a href="${pageContext.request.contextPath}/servlet/MethodServlet?method=addOrderMethod">
						<button type="button" class="btn btn-default mr5">
							<span class="glyphicon glyphicon-plus"></span> 新增订单
						</button>
					</a>
					<div class="btn-group mr5 dropdown" id="divImport">
						<!-- <button data-target="#daochuModal" data-toggle="modal" class="btn btn-default" type="button">导出</button> -->
						<button id="importButton" class="btn btn-default" type="button">导出</button>
						<button id="importOrderListButton" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="height: 34px;">
							<span class="glyphicon glyphicon-save mr5"></span><span class="f10" id="taskCount" style="display: none;"></span>
						</button>
						<ul id="importOrderUl" aria-labelledby="importOrderListButton" style="width: 340px; height: 200px;" role="menu" class="dropdown-menu scrollspy-example">
						</ul>
					</div>
					<!-- 订单导入功能 start -->
					<button class="btn btn-default" type="button" data-target="#daoruModal" data-toggle="modal" id="importOrderBtn">导入</button>
					<!-- 订单导入提示框 -->
					<div class="modal fade" id="daoruModal" tabindex="-1" role="dialog" aria-labelledby="daoruModalLabel" aria-hidden="true" style="display: none;">
						<div class="modal-dialog" style="width: 500px;">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 class="modal-title" id="daoruModalLabel">导入</h4>
								</div>
								<div class="modal-body">
									<!--part one-->
									<div class="row scrollspy-example" style="margin-top: 0px; max-height: 400px;">
										<p class="f14">订单导入说明，导入前请仔细阅读</p>
										<p class="lh27">
											1. 请先下载"订单信息导入模板" <a id="downloadOrderTemplateBtn" href="javascript: void(0);" target="_self">点此下载</a><br> 2. 导入的文件内容第一行必须与模板内容 <span class="red">完全一致</span>，用以区分订单属性<br> 3. 第一行内容中带有“ <span class="red">必填</span>”字样，表示该订单属性一定要填写<br> 4. <span class="red">订单号为必填项</span>，但同笔订单有多个商品明细行，只需第一个填写订单信息即可<br> 5. <span class="red">订单的固话与手机至少要填写一个</span><br> 6.导入后的订单全部为<span class="red">已付款待审核</span>状态
										</p>

										<form action="/order/uploadOrdersFile.ht" method="post" id="uploadForm" enctype="multipart/form-data">
											<input type="file" name="ordersXmlFile" id="ordersXmlFile" placeholder="添加本地图片" class="form-control" style="border: none; padding: 0;">
										</form>
									</div>
								</div>
								<div class="modal-footer" style="margin-top: 0px; background: #ebebeb; padding: 5px 20px">
									<button type="button" class="btn btn-primary" id="importBtn">导入</button>
									<button type="button" class="btn btn-default" data-dismiss="modal" id="daoruModalCannel">取消</button>
									<!-- <span id="showMessage" style="margin-left: 8px;"></span> -->
								</div>
							</div>
						</div>
					</div>
					<!-- 订单导入功能 end -->
					<!-- 订单文件上传等待提示框 start -->
					<div id="uploadWaitingModel" style="position: fixed;"></div>
					<!-- 订单文件上传等待提示框 end -->

					<div class="pull-right">
						<div>
							<span class=" mr10">系统每隔5分钟更新订单</span>
							<button id="stopManualRefurbish" class="btn btn-default btn-xs" type="button" style="display: none" disabled="disabled">
								<img src="${pageContext.request.contextPath}/KeFu/ddcx/img/loading.gif" width="14" height="14"> 正在更新
							</button>
							<button id="manualRefurbish" class="btn btn-default btn-xs" type="button" style="" onclick="myrefresh();">
								<img src="${pageContext.request.contextPath}/KeFu/ddcx/img/loading2.png" width="14" height="14"> 手动更新
							</button>
						</div>
						<div style="color: #999;" id="refurbishDiv"></div>
					</div>
				</div>
			</div>
			<!-- 功能按钮 star-->
			<!-- <div class="btn-group-block">
<input type="checkbox" id="quanbuzhankai"/>展开全部
</div> -->
			<!--功能按钮 end-->
			<!--table star-->
			<div class="panel">

				<jsp:include page="/KeFu/ddcx/lsz.jsp"></jsp:include>
			</div>

			<!--panel end-->
			<!--分页 star-->
			<div class="row" style="margin: 0; -moz-user-select: none;" onselectstart="return false;" id="paging">
				<div style="float: right;">
					<div style="margin-right: 10px; float: left;">
						<ul class="pagination">
							<li class="dropup">
								<div class="lh30 left">共</div>
								<div class="btn-group" style="margin: 0 5px;">
									<span class="lh30 left fb red" id="totalRecords"></span>
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
									<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
										<span id="currentPageSize">10</span> <span class="caret"></span>
									</button>
									<div class="lh30 left" style="margin-left: 5px;">个</div>
									<ul role="menu" class="dropdown-menu" id="pageSizes">
										<li><a onclick="shoucount(this)">5</a></li>
										<li><a onclick="shoucount(this)">10</a></li>
										<li><a onclick="shoucount(this)">20</a></li>
										<li><a onclick="shoucount(this)">50</a></li>
										<li><a onclick="shoucount(this)">100</a></li>
										<li><a onclick="shoucount(this)">200</a></li>
										<!-- <li><a href="javascript:void(0);">20</a></li>
                            <li><a href="javascript:void(0);">50</a></li> -->
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<div style="width: 350px; float: left;" id="pagingPages">
						<ul class="pagination">
							
							

							
						</ul>
					</div>
				</div>
			</div>
			<!--分页 end-->
		</div>
	</div>
	<div class="bootbox modal fade bootbox-confirm in" tabindex="-1" role="dialog" aria-hidden="false" style="display: none;" id="qrmk">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true" style="margin-top: -10px;">×</button>
					<div class="bootbox-body">确定要删除订单吗？</div>
				</div>
				<div class="modal-footer">
					<button data-bb-handler="cancel" type="button" class="btn btn-default">取消</button>
					<button data-bb-handler="confirm" type="button" class="btn btn-primary">确认</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/Order/jsp/xiangQing.jsp"></jsp:include>
</body>

</html>