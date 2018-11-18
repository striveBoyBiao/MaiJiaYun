<%@page import="mjy.caigou.po.PageInfo"%>
<%@page import="mjy.caigou.po.PurchasePO"%>
<%@page import="mjy.caigou.dao.impl.PurchaseDaoImpl"%>
<%@page import="mjy.caigou.dao.PurchaseDao"%>
<%@page import="mjy.caigou.vo.PurchaseVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		
		<div class="container">
			<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
		</div>
		
		<div class="content" id="content">

			<!--titletab star-->
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0;">
				<div class="navbar-header">
					<a href="#" class="navbar-brand ml20">采购单</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<li id="li-caigouwait" class="ml20 tab"><a
						href="/MaiJiaYun/caigou/servlet/DcgServlet" class="c6">待采购审核 <span></span></a>
					</li>
					<li id="li-caiwuwait" class="tab active"><a href="" class="">待财务审核<span></span></a>
					</li>
					<li id="li-auticomplete" class="tab"><a
						href="/MaiJiaYun/caigou/servlet/ShywcServlet" class="c6">审核已完成</a>
					</li>
					<li class="pull-right" id="li-query" style="padding-top: 12px;">
						<div class="w340">
							<form class="form-inline" role="form" method="get">

								<div class="input-group">
									<input name="q" type="text" class="form-control"
										placeholder="采购单编号/制单人/供应商/仓库"> <span
										class="input-group-btn">
										<button type="submit" class="btn btn-primary query">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
								</div>
							</form>
						</div>
					</li>
				</ul>
			</div>
			<!--titletab end-->
			<!--panel star-->
			<div class="prl10auto" id="panel">
				<div class="btn-group-block">
					<div class="btn-group mr5" id="divImport">
						<!-- 按钮触发模态框 -->
						<!-- 按钮触发模态框 -->
						<form action="/MaiJiaYun/caigou/servlet/DcServlet" >
						<button class="btn btn-default " data-toggle="modal"
							data-target="#myModal" type="submit">导出</button>
					
						<button id="importOrderListButton" type="button"
							style="height: 34px" class="btn btn-default dropdown-toggle"
							data-toggle="dropdown">
							<span class="glyphicon glyphicon-save mr5"></span><span
								class="f10" id="taskCount" style="display: none;"></span>
						</button>
						<ul id="importOrderUl" aria-labelledby="importOrderListButton"
							style="width: 340px; height: 200px;" role="menu"
							class="dropdown-menu scrollspy-example">
							<li>
								<div class="mr20 ml20 "
									style="border-bottom: 1px solid #eeeeee;">
									<div style="line-height: 60px; text-align: center">
										<span class="c6" style="display: inline;">当前没有进行中的任务</span>

									</div>

								</div>


							</li>
						</ul>
					</div>

				</div>
				<div class="panel mt15">

					<%
						PageInfo<PurchaseVO> pageInfo = (PageInfo<PurchaseVO>) request.getAttribute("pageInfo");
					%>
					<%
						List<PurchaseVO> purchases = pageInfo.getPageData();
					%>
					<%
						if (purchases != null && purchases.size() > 0) {
					%>


					<table class="table table-striped table-hover">
						<thead class=" table-bordered">
							<tr>
								<th><input type="checkbox"></th>
								<th>采购单编号</th>
								<th>供应商</th>
								<th>仓库</th>
								<th>采购数量</th>
								<th>已入库数量</th>
								<th>采购总额</th>
								<th>创建时间</th>
								<th>制单人</th>
								<th>采购审核人</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>



						<%
							for (PurchaseVO purchaseVo : purchases) {
						%>

						<tbody>
							<%-- 	<%
								List<PurchaseVO> list = (List<PurchaseVO>) request.getAttribute("list");
								for (PurchaseVO purchaseVo : list) {
							%>
 --%>
							<tr>
							<td><input type="checkbox"  name="checkOrder"  value="<%=purchaseVo.getPurchaseCode()%>"/>
								</td>
								<td><%=purchaseVo.getPurchaseCode()%></td>
								<td><%=purchaseVo.getSupplierCName()%></td>
								<td><%=purchaseVo.getWareHouseName()%></td>
								<td><%=purchaseVo.getPurchaseNumber()%></td>
								<td><%=purchaseVo.getStorageQuantity()%></td>
								<td><%=purchaseVo.getPurchaseSum()%></td>
								<td><%=purchaseVo.getCreatTime()%></td>
								<td><%=purchaseVo.getUserType()%></td>
								<td><%=purchaseVo.getUserType()%></td>
								<td><%=purchaseVo.getRemark()%></td>
							<td><a
										href="/MaiJiaYun/caigou/servlet/XqServlet?PurchaseCode=<%=purchaseVo.getPurchaseCode()%> "
										class="mr5 operate-purchase-order-edit">详情</a></td>
							</tr>
							<%
								}
							%>


						</tbody>
					</table>
					<%
						}
					%>
					</form>
				</div>
			</div>
			<!--panel end-->
			<!--分页 star-->
			<jsp:include page="pagination.jsp">
				<jsp:param value="/MaiJiaYun/caigou/servlet/DcwServlet" name="url" />
			</jsp:include>

			<!--分页 end-->
		</div>
	</div>
</body>
</html>