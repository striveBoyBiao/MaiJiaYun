<%@page import="mjy.caigou.vo.GoodsVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

	<script type="text/javascript" src="/MaiJiaYun/CaiGou/js/kucuncsh.js"></script>
	
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


</head>
<body onload="loading()">

		
	<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>


	<div id="content" class="content">
		<!--库存初始化块开始-->
		<div class="collapse navbar-collapse navbar-default navbar-titletab"
			style="padding: 0px 0 0 0; background: #ffffff;">
			<div class="navbar-header">
				<a href="javascript:history.back()" class="navbar-brand ml20"><span
					class="fb fmsun">&lt;&nbsp;</span>库存初始化</a>
			</div>
		</div>
		<!--库存初始化块结束-->

		<!--从选择   仓库开始到分页开始         中间部分-->
		<div class="prl10auto">
			<!--选择仓库大块开始-->
			<div class="panel prl10auto mt15" style="padding: 20px 10px;">
				<h5>
					<form class="form-inline" role="form">
						<div class="form-group pr10">选择仓库</div>
						<!--注意：此处由JS控制    生成 下面仓库xx生成,并且用来动态数据传输，该模块隐藏-->

						<%-- <select class="selectpicker" id="warehouseId"
							style="display: none;">
							<!-- <option value="17999" type="自有仓库">默认仓库</option> -->
							<c:forEach items="${warehouseNames}" var="warehouse">
								<option value="17999" type="自有仓库">${warehouse}</option>
							</c:forEach>
							
						</select> --%>

						<!--显示在页面的   由select控制生成-->
						<div class="btn-group bootstrap-select" >
							<!--注意：button中title和span中内容需通过JS改变-->
							<button type="button"
								class="btn dropdown-toggle selectpicker btn-default"
								data-toggle="dropdown" data-id="warehouseId" title="默认仓库"
								id="myButton">
								<span class="filter-option pull-left">默认仓库 </span>&nbsp; <span
									class="caret"></span>
							</button>
							<!--下拉框开始    id为自己加的  用于js控制 -->
							<div class="dropdown-menu open" id="myDropdown">
								<ul class="dropdown-menu inner selectpicker" role="menu">
								 <c:set var="index" value="0"></c:set> 
								<c:forEach items="${warehouseNames}" var="warehouse">
									<li rel="${index}">
										<c:set var="index" value="${index+1}" />
										<a tabindex="0" class="" style="" onclick="changeWarehouse(this)">
											<span class="text">${warehouse}</span>
											
										</a>
									</li>
								</c:forEach> 	 
								</ul>
							</div>
							<!--下拉框结束-->


						</div>
						<div class="form-group pr10 red" id="warehouseRemark"></div>

					</form>
				</h5>
			</div>
			<!--选择仓库大块结束-->

			<!--商品搜索框和商品列表块开始-->
			<div class="panel prl10auto" style="padding: 20px 10px;">

				<!--商品搜索框和完成初始化-->
				<div class="btn-group-block">
					<div class="form-inline">
						<div id="li-query" class="form-group">
							<div class="input-group" style="width: 237px;">
								<input class="form-control" type="text"
									placeholder="请输入商品货号,商品名称" style="width: 200px;" name="q" id="mySearch">
								<span class="input-group-btn">
									<button class="btn btn-primary query" type="button" style="height: 34px">
										<span class="glyphicon glyphicon-search" id="btnQuery" onclick="searchQuery()"></span>
									</button> 
									
								</span>
							</div>
						</div>
						<div class="form-group ml10">
							 <a>
								<button class="btn btn-default" type="button" id="printSku">打印商品去盘点</button>
							</a> 
							 
						</div>
						<div class="form-group mr5 pull-right">
							
							<a>
				                    <button class="btn btn-primary" type="button" id="btnBack"  data-toggle="modal" data-target="#shangpin" onclick="initComplete()">完成初始化</button>
				             </a>
						</div>
						<div class="form-group checkbox ml10 f14">
							<label> <input type="checkbox" id="showNullStock"
								checked="checked" onclick="stockStatusQuery()"> 只显示未设置数量的商品
							</label>
						</div>
					</div>

				</div>



				<!--商品块开始-->
				<div>
					<!--商品Table开始-->
					<table class="table table-striped table-hover">
						<thead class="table-bordered">
							<tr>
								<th>商家sku编码</th>
								<th>商品名称</th>
								<th>商品属性</th>
								<th>商品货号</th>
								<th>仓库名称</th>
								<th style="width: 210px;">库存数量</th>
							</tr>
						</thead>
						<tbody>

							
						</tbody>
					</table>
					<!--商品Table结束-->
				</div>
				<!--商品块结束-->
			</div>
			<!--商品搜索框和商品列表块结束-->

		</div>




		<!--分頁開始-->
		<div class="row" style="margin: 0; -moz-user-select: none;"
			onselectstart="return false;" id="paging">
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
								<button data-toggle="dropdown"
									class="btn btn-default dropdown-toggle" type="button">
									<span id="currentPageSize">10</span> <span class="caret"></span>
								</button>
								<div class="lh30 left" style="margin-left: 5px;">个</div>
								<ul role="menu" class="dropdown-menu" id="pageSizes">
									<li><a href="javascript:void(0);" onclick="changePageSize(this)">10</a></li>
									<li><a href="javascript:void(0);" onclick="changePageSize(this)">20</a></li>
									<li><a href="javascript:void(0);" onclick="changePageSize(this)">50</a></li>
									<li><a href="javascript:void(0);" onclick="changePageSize(this)">100</a></li>
									<li><a href="javascript:void(0);" onclick="changePageSize(this)">200</a></li>
									<!-- <li><a href="javascript:void(0);">20</a></li>
		                            <li><a href="javascript:void(0);">50</a></li> -->
								</ul>
							</div>
						</li>
					</ul>
				</div>
				<div style="width: 350px; float: left;" id="pagingPages">
					<ul class="pagination">
						<!-- <li id="last" class="fb fmsun"><a href="javascript:void(0);">&lt;</a></li>

						 <li class="page active" page="1"><a
							href="javascript:void(0);">1</a></li>

						<li class="page" page="2"><a href="javascript:void(0);">2</a></li> 

						<li id="next" class="fb fmsun"><a href="javascript:void(0);">&gt;</a></li> -->
					</ul>
				</div>
			</div>
		</div>

		<!--分頁結束-->






	</div>
	<!--content结束-->








	</div>






	<!--代码结束-->
	
	<!-- 本页模态框-->
	<div class="bootbox modal fade in" id="shangpin" tabindex="-1" role="dialog" aria-hidden="false">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header"><button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title">提示</h4></div>
					<div class="modal-body">
						<div class="bootbox-body"><span class="f14">商品库存已初始化，请联系财务由【财务-库存成本】中维护库存成本</span></div>
					</div>
					<div class="modal-footer"><a href="javascript:history.back()"><button data-bb-handler="success" type="button" class="btn btn-primary">知道了</button></a></div>
				
				</div>
			</div>
		</div>
	
	
	
	
	
	
</body>
</html>