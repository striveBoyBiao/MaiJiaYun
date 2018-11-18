<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
</head>

<body cz-shortcut-listen="true">

	<%-- <c_rt:if test="${requestScope.pageInfo.pageNum==null }">
		<jsp:forward page="../../../KucunCostServlet"></jsp:forward>
	</c_rt:if> --%>
	<!--代码开始-->
	<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
	<script type="text/javascript">
		/* 高亮显示当前页 */
		$(function() {
			$("li#${requestScope.pageInfo.pageNum}").addClass("active");
		});
		/*
		 * 搜索框
		 */
		function search() {
			window.location.href = "/MaiJiaYun/KucunCostServlet?pageNum=${requestScope.pageInfo.firstpage}&pageSize=${requestScope.pageInfo.pageSize }&searchCondition="
					+ $("#searchs").val();
		}
		/*
		 *分页处理
		 *此处El表达式提示错误
		 */
		$(document)
				.ready(
						function disuse() {
							if ("${requestScope.pageInfo.pageNum+1}" > "${requestScope.pageInfo.maxPageNum }") {
								$("li#${requestScope.pageInfo.pageNum+1}")
										.empty();
								$("li#${requestScope.pageInfo.pageNum+2}")
										.empty();
							}
							if ("${requestScope.pageInfo.pageNum}" == "${requestScope.pageInfo.maxPageNum-1}") {
								$("li#${requestScope.pageInfo.pageNum+2}")
										.empty();
							}
							for (var i = 1; i < 5; i++) {
								if ("${requestScope.pageInfo.maxPageNum}" == i) {
									for (var j = 5; j > i; j--) {
										$("li#" + j).empty();
									}
								}
							}
						});
	</script>
	<script type="text/javascript"
		src="/MaiJiaYun/caiwu/kucunchengben/js/Kucuncb.js"></script>
	<div class="content" id="content">
		<!--titletab star-->
		<div class="collapse navbar-collapse navbar-default navbar-titletab"
			style="padding: 0px 0 0 0;">
			<div class="navbar-header">
				<a href="#" class="navbar-brand ml20">库存成本</a>
			</div>
			<!--part one-->
			<div
				style="display: none; color: red; margin-left: 50%; position: absolute; font-weight: bold"
				class="" id="showErrorTempDiv">库存成本取值不合法</div>
			<!--part one end-->


			<ul class="nav nav-tabs f14 fb">

				<li class="pull-right" id="li-query" style="padding-top: 12px;">
					<div class="form-inline">
						<div class="form-group">
							<div class="w340">
								<div class="input-group">
									<input id="searchs" type="text" name="q"
										placeholder="商品名称/商品货号" style="width: 300px;"
										class="form-control"> <span class="input-group-btn">
										<button type="button" class="btn btn-primary query"
											onclick="search()">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
			<!--搜索框结束-->
		</div>
		<!--titletab end-->
		<!--panel star-->
		<div class="prl10auto">
			<!--table star-->
			<div class="panel mt15">
				<!-- Table -->
				<table class="table table-striped table-hover" id="tableList"
					style="boder: 3px solid">
					<thead class="table-bordered">
						<tr>
							<th><input type="checkbox" name="checkOrder"
								onclick="checkall(this.checked)"></th>
							<th>商品图</th>
							<th>商品名称</th>
							<th>商品货号</th>
							<th>SKU编码</th>
							<th>属性</th>
							<th>仓库</th>
							<th style="text-align: center;">总库存</th>
							<th style="text-align: center;">库存成本</th>
							<th>操作</th>
						</tr>
					</thead>
					<!-- 库存成本表格开始 -->
					<tbody>
						<c_rt:if test="${requestScope.pageInfo.pageNum !=null }">
							<c_rt:forEach items="${requestScope.list }" var="res1"
								varStatus="status">
								<tr>
									<td><input type="checkbox" name="checkOrder" value=""></td>
									<td><img src="" style="height: 50px; width: 50px;"
										class="img-thumbnail" alt="50x50"></td>
									<td>${res1.goodName }</td>
									<td>${res1.goodId }</td>
									<td>${res1.sku }</td>
									<td>${res1.goodAttribute }</td>
									<td>${res1.wareHouseName }</td>
									<!-- **************** -->
									<td>
										<div style="text-align: right; display: block; float: right;">
											<span>${res1.goodNum }</span>
										</div>
									</td>
									<!-- **************** -->
									<td>
										<div id="a${res1.goodId}z${res1.wareHouseName }"
											style="text-align: right; display: block; float: right; width: 80px;">
											<span>${res1.kucunCost }</span>
											<button style="background: none; border: none;" type="button"
												value="${res1.goodId}z${res1.wareHouseName }"
												class=" btn btn-default operate-edit" title=""
												onclick="showOrHide(this.value)">
												<i class="glyphicon glyphicon-pencil"></i>
											</button>
										</div>
										<div id="b${res1.goodId}z${res1.wareHouseName }"
											style="text-align: right; float: right; width: 80px; display: none">
											<div style="display: none">${res1.wareHouseName }</div>
											<input class="shuru" type="text" value="0.00"
												name="${res1.goodId}z${res1.wareHouseName }"
												id="c${res1.goodId}z${res1.wareHouseName }"
												style="width: 80px" onblur="textBlur(this.name)">
										</div> <!-- 输入库存成本的文本框失去焦点时隐藏 -->
									</td>
									<td><div style="display: none">${res1.wareHouseName }</div>
										<a id="${res1.goodId}z${res1.wareHouseName }" warehouseid=""
										name="edit" onclick="showDedatil(this.id)" data-toggle="modal"
										data-target="#stock_detailModal">明细</a></td>
								</tr>

							</c_rt:forEach>
						</c_rt:if>

					</tbody>
					<!-- 库存成本表格结束 -->

				</table>

				<!--库存明细开始-->
				<div aria-hidden="true" aria-labelledby="stock_detailModalLabel"
					role="dialog" tabindex="-1" id="stock_detailModal"
					class="modal fade" style="display: none;">

					<div style="width: 800px;" class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button aria-hidden="true" data-dismiss="modal" class="close"
									type="button">×</button>
								<h4 id="stock_detailModalLabel" class="modal-title">库存明细</h4>
							</div>
							<div class="modal-body">
								<!--part 1-->
								<div style="height: 400px" class="tl lh30 scrollspy-example"
									id="xiangqing">
									<table style="margin-bottom: 0" class="table table-bordered">
										<thead>
											<tr>
												<th>变动时间</th>
												<th>业务</th>
												<th>相关单据号</th>
												<th>变动<br>数量
												</th>
												<th>变动<br>单价
												</th>
												<th>期初<br>库存
												</th>
												<th>期初<br>成本
												</th>
												<th>期末<br>库存
												</th>
												<th>期末<br>成本
												</th>
												<th>成本<br>结余
												</th>
											</tr>
										</thead>
										<tbody style="font-weight: normal" class="kucunmx">

										</tbody>
									</table>
								</div>
								<!--part 1 end-->
							</div>
							<div class="modal-footer">
								<button data-dismiss="modal" class="btn btn-default"
									type="button">关闭</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->

				</div>
				<!--库存明细 结束-->
				<!--table end-->
			</div>
			<!--panel end-->


			<!--分页 star-->
			<div style="margin-right: 10px; float: left; margin-left: 30%">
				<ul class="pagination">
					<li class="dropup">
						<div class="lh30 left">共</div>
						<div class="btn-group" style="margin: 0 5px;">
							<span class="lh30 left fb red" id="totalRecords">${requestScope.pageInfo.total }</span>
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
								<span id="currentPageSize">${requestScope.pageInfo.pageSize }</span>
								<span class="caret"></span>
							</button>
							<div class="lh30 left" style="margin-left: 5px;">个</div>
							<ul role="menu" class="dropdown-menu" id="pageSizes">
								<li><a href="/MaiJiaYun/KucunCostServlet?pageSize=10">10
								</a></li>
								<li><a href="/MaiJiaYun/KucunCostServlet?pageSize=20">20
								</a></li>
								<li><a href="/MaiJiaYun/KucunCostServlet?pageSize=50">50
								</a></li>
								<li><a href="/MaiJiaYun/KucunCostServlet?pageSize=100">100
								</a></li>
								<li><a href="/MaiJiaYun/KucunCostServlet?pageSize=200">200
								</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>

			<nav style="margin-left: 30%">
			<ul class="pagination">
				<c_rt:choose>
					<c_rt:when test="${requestScope.pageInfo.pageNum-1!=0}">
						<li><a
							href="/MaiJiaYun/KucunCostServlet?pageNum=${requestScope.pageInfo.pageNum-1}&pageSize=${requestScope.pageInfo.pageSize }&searchCondition=${requestScope.pageInfo.searchCondition}">&laquo;</a></li>
					</c_rt:when>
					<c_rt:otherwise>
						<li><a
							href="/MaiJiaYun/KucunCostServlet?pageNum=1&pageSize=${requestScope.pageInfo.pageSize }&searchCondition=${requestScope.pageInfo.searchCondition}">&laquo;</a></li>
					</c_rt:otherwise>
				</c_rt:choose>
				<li id="${requestScope.pageInfo.firstpage}"><a
					href="/MaiJiaYun/KucunCostServlet?pageNum=${requestScope.pageInfo.firstpage}&pageSize=${requestScope.pageInfo.pageSize }&searchCondition=${requestScope.pageInfo.searchCondition}">${requestScope.pageInfo.firstpage}</a></li>
				<li id="${requestScope.pageInfo.firstpage+1}"><a
					href="/MaiJiaYun/KucunCostServlet?pageNum=${requestScope.pageInfo.firstpage+1}&pageSize=${requestScope.pageInfo.pageSize }&searchCondition=${requestScope.pageInfo.searchCondition}">${requestScope.pageInfo.firstpage+1}</a></li>
				<li id="${requestScope.pageInfo.firstpage+2}"><a
					href="/MaiJiaYun/KucunCostServlet?pageNum=${requestScope.pageInfo.firstpage+2}&pageSize=${requestScope.pageInfo.pageSize }&searchCondition=${requestScope.pageInfo.searchCondition}">${requestScope.pageInfo.firstpage+2}</a></li>
				<li id="${requestScope.pageInfo.firstpage+3}"><a
					href="/MaiJiaYun/KucunCostServlet?pageNum=${requestScope.pageInfo.firstpage+3}&pageSize=${requestScope.pageInfo.pageSize }&searchCondition=${requestScope.pageInfo.searchCondition}">${requestScope.pageInfo.firstpage+3}</a></li>
				<li id="${requestScope.pageInfo.firstpage+4}"><a
					href="/MaiJiaYun/KucunCostServlet?pageNum=${requestScope.pageInfo.firstpage+4}&pageSize=${requestScope.pageInfo.pageSize }&searchCondition=${requestScope.pageInfo.searchCondition}">${requestScope.pageInfo.firstpage+4}</a></li>
				<c_rt:choose>
					<c_rt:when
						test="${requestScope.pageInfo.pageNum+1<=requestScope.pageInfo.maxPageNum}">
						<li><a
							href="/MaiJiaYun/KucunCostServlet?pageNum=${requestScope.pageInfo.pageNum+1}&pageSize=${requestScope.pageInfo.pageSize }&searchCondition=${requestScope.pageInfo.searchCondition}">&raquo;</a></li>
					</c_rt:when>
					<c_rt:otherwise>
						<li><a
							href="/MaiJiaYun/KucunCostServlet?pageNum=${requestScope.pageInfo.maxPageNum}&pageSize=${requestScope.pageInfo.pageSize }&searchCondition=${requestScope.pageInfo.searchCondition}">&raquo;</a></li>
					</c_rt:otherwise>
				</c_rt:choose>
			</ul>
			</nav>
			<!--分页 end-->
		</div>
	</div>

	<!--代码结束-->
</body>
</html>