
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="mjy.kuguan.ruku.po.WanchengPO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date" %>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<meta name="keywords" content="卖家云网络销售在线管理系统">
		<meta name="description" content="NIIT-IGEEKHOME 17营第三小组">
		
		<script type="text/javascript">
		function xiangqing(j) {
			
			var code = $("#tr_"+j).find("td:eq(1) a").text();
			var type = $("#tr_"+j).find("td:eq(3)").text();
			
			$.ajax({
				url:"${pageContext.request.contextPath}/servlet/RuKuXiangqingServlet",
				type:"post",
				data:{
					"code":code,
					"type":type
				},
				
				datatype:"json",
				success:function(data){
					var innerHtml="";
					var inNeedNumber=0;
					var inFinishNumber=0;
					
					$.each(data.json, function(index, value){
						innerHtml+="<tr><td class=\"fb\">"+value.xiangqingSku+"</td>";
						innerHtml+="<td>"+value.xiangqingName+"</td>";
						innerHtml+="<td>"+value.xiangqingAttribute+"</td>";
						innerHtml+="<td>"+value.xiangqingInNeed+"</td>";
						innerHtml+="<td>"+value.xiangqingInFinish+"</td>";
						innerHtml+="<td>"+value.xiangqingWarehouse+"</td>";
						innerHtml+="<td>"+value.xiangqingNote+"</td></tr>"
						inNeedNumber+=Number(value.xiangqingInNeed);
						inFinishNumber+=Number(value.xiangqingInFinish);
					}); 
					innerHtml+="<tr style=\"background:#dcdcdc; border:1px solid #dcdcdc; \">";
					innerHtml+="<td colspan=\"3\" class=\"fb\">合计：</td>";
					innerHtml+="<td class=\"fb\">需入库总数：<span class=\"red\">"+inNeedNumber+"</span></td>";
					innerHtml+="<td class=\"fb\">已入库总数：<span class=\"red\">"+inFinishNumber+"</span></td>";
					innerHtml+="<td colspan=\"4\" class=\"fb\">待入库数量：<span class=\"red\">"+(inNeedNumber-inFinishNumber)+"</span></td></tr>";
					
					$("#stock_upinfoModal tbody").html(innerHtml); 
					$("textarea").text(data.note);
				} 
				
			});
		}

	function changePageSize(pageSize){
		$("#currentPageSize").text(pageSize);
		
		
	}
	function clickPageNumber(pageNumber){
		for(var i=1;i<=$("#pagingPages ul li").children().length-2;i++){
			$("#pagingPages ul li:eq("+ i +") ").prop("class" ,  "fb fmsun");
			
		}
		$("#pagingPages ul li:eq("+pageNumber+") ").prop("class" ,  "page active");
	}
	function init(){
		clickPageNumber(<%=request.getAttribute("pageNo")%>)
	}
	</script>	
	
	</head>
	
	<body style="padding-right: 0px;" class="" onload ="init()">
		<!--代码开始-->
		<div class="container" id="container">
		<!--header 开始-->
			<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
	
			<!--header 结束-->
			
			<div class="content" id="content">
				<!--titletab star-->
				<div class="collapse navbar-collapse navbar-default navbar-titletab" style="padding: 0px;">
					<div class="navbar-header">
						<a href="#" class="navbar-brand ml20">入库单</a>
					</div>
					<ul class="nav nav-tabs f14 fb">

						<li id="li-caigou" class="tab" style="margin-left: 20px">
							<a class="c6" href="${pageContext.request.contextPath}/servlet/Purchase">采购入库 <span><%="(" + request.getAttribute("caigouDataCount") + ")"%></span></a>
						</li>
						<li id="li-xiaoshou" class="tab">
							<a class="c6" href="${pageContext.request.contextPath}/servlet/ReturnSales">销售退货入库 <span><%="(" + request.getAttribute("tuihuoDataCount") + ")"%></span></a>
						</li>
						<li id="li-diaobo" class="tab" style="margin-left: 0px">
							<a class="" href="${pageContext.request.contextPath}/servlet/DiaoborukudanServlet">调拨入库 <span><%="(" + request.getAttribute("diaoboDataCount") + ")"%></span></a>
						</li>
						<li id="li-conplete" class="ml20 tab active">
							<a class="" href="${pageContext.request.contextPath}/servlet/WanchengServlet">已完成入库</a>
						</li>
						<li class="pull-right" id="li-query" style="padding-top: 12px;">
							<form class="form-inline"  action="${pageContext.request.contextPath}/servlet/WanchengServlet" role="form" method="post">
							<div class="w340">
								<div class="input-group">
								
									<input value="" name="queryInfo" id="queryInfo"  class="form-control" placeholder="入库单编号/相关单据号/制单人" type="text" >
									<span class="input-group-btn" >
                   					 <button type="submit" class="btn btn-primary query" style="height: 33px"><span class="glyphicon glyphicon-search" ></span></button>
									</span>
								</form>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<!--titletab end-->
				<div id="panel" class="prl10auto">
					<div class="btn-group-block">
						<div class="btn-group mr5" id="divImport">
							<button class="btn btn-default" type="button" id="importButton" data-toggle="modal" data-target="#daochu">导出</button>
							<button id="importOrderListButton" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="height: 34px">
      <span class="glyphicon glyphicon-save mr5"></span><span style="display: none;" class="f10" id="taskCount"></span>
      </button>
							<ul id="importOrderUl" aria-labelledby="importOrderListButton" style=" width:340px; height:200px;" role="menu" class="dropdown-menu scrollspy-example">
								<li>
									<div class=" mr20 ml20" style="border-bottom:1px solid #eeeeee;">
										<div style="line-height:60px; text-align:center;">
											<span class="c6" style="display:inline;">当前没有进行中的任务</span>
										</div>
									</div>
								</li>
							</ul>
						</div>

					</div>
					<!--table star-->
					<div class="panel mt15">
						<!-- Table -->
						<table class="table table-striped table-hover">
							<thead class=" table-bordered">
								<tr>
									<th><input type="checkbox"></th>
									<th>入库单编号</th>
									<th>相关单据</th>
									<th>入库类型</th>
									<th>入库数量</th>
									<th>制单时间</th>
									<th>制单人</th>
									<th>入库确认人</th>
									<th>入库确认时间</th>
									<th>操作</th>
									<th>
									</th>
								</tr>
							</thead>

							<!-- 模拟数据 -->
							<tbody>
								<%
									List<WanchengPO> list =(List<WanchengPO>)request.getAttribute("wanchengPO");
									int j =0;
										for(WanchengPO wanchengPO : list){
									
									%>
								

								<tr modelid="36661" id="tr_<%=j%>">
									<td><input type="checkbox" name="checkOrder" value="36661"></td>
									<td>
										<a data-target="#stock_upinfoModal" data-toggle="modal" style="cursor:pointer;" class="operate-look" inputtype="销售退货入库"><%=wanchengPO.getWanchengCode()%></a>
									</td>
									<td><%=wanchengPO.getWanchengXiangguanCode() %></td>
									<td><%=wanchengPO.getWanchengType() %></td>
									<td><%=wanchengPO.getWanchengInCount() %></td>
									<td><%=wanchengPO.getWanchengSetTime() %></td>
									<td><%=wanchengPO.getWanchengAuthor() %></td>
									<td><%=wanchengPO.getWanchengChecker() %></td>
									<td><%=wanchengPO.getWanchengCheckTime() %></td>
									<td colspan="2">
										<a data-target="#stock_upinfoModal" data-toggle="modal" style="cursor:pointer;" class="operate-look" inputtype="入库" onclick="xiangqing(<%=j++%>)" >详情</a>
									</td>
										
									
								</tr>
									<%} %>
								</tbody>

						</table>

						<!--table end-->
						<!--分页 star-->
						<!-- 加了一些float:left 的 style属性 -->
						<%
						   int pageCount = Integer.parseInt(String.valueOf(request.getAttribute("pageCount")));
						%>
						<div class="row" style="margin:0; -moz-user-select:none;" onselectstart="return false;" id="paging">
							<div style=" float:right;">
								<div style="margin-right: 10px; float: left;">
									<ul class="pagination">
										<li class="dropup">
											<div class="lh30 left" style="float: left;">共 </div>
											<div class="btn-group" style="margin:0 5px; float: left;">
												<span class="lh30 left fb red" id="totalRecords" style="float: left;"><%=request.getAttribute("pageCount")%></span>
												<div class="lh30 left" style="margin-left:5px; float: left;">条记录</div>
											</div>
										</li>
									</ul>
								</div>
								<div style="width: 150px; float: left;">
									<ul class="pagination">
										<li class="dropup">
											<div class="lh30 left" style="float: left;">每页显示 </div>
											<!-- class="btn-group open" -->
											<div class="btn-group" style="margin:0 5px; float: left;" id="page_size">
												<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
								<span id="currentPageSize"><%=request.getAttribute("pageSize") %></span> 
								<span class="caret"></span>
							  </button>
												<div class="lh30 left" style="margin-left:5px; float: left;">个</div>
												<ul role="menu" class="dropdown-menu" id="pageSizes">
													<li onclick="changePageSize(10)">
														<a href="${pageContext.request.contextPath}/servlet/WanchengServlet?pageSize=10">10</a>
													</li>
													<li onclick="changePageSize(20)">
														<a href="${pageContext.request.contextPath}/servlet/WanchengServlet?pageSize=20">20</a>
													</li>
													<li onclick="changePageSize(50)">
														<a href="${pageContext.request.contextPath}/servlet/WanchengServlet?pageSize=50">50</a>
													</li>
													<li onclick="changePageSize(100)">
														<a href="${pageContext.request.contextPath}/servlet/WanchengServlet?pageSize=100">100</a>
													</li>
													<li onclick="changePageSize(200)">
														<a href="${pageContext.request.contextPath}/servlet/WanchengServlet?pageSize=200">200</a>
													</li>
													
												</ul>
											</div>
										</li>
									</ul>
								</div>

								<div style="width:350px; float: left;" id="pagingPages">
									<ul class="pagination">
										<li id="last" class="fb fmsun">
											<a href="${pageContext.request.contextPath}/servlet/WanchengServlet?pageNo=<%=request.getAttribute("pageNo").equals("1")?"1":(Integer.parseInt(String.valueOf(request.getAttribute("pageNo")))-1)%>&pageSize=<%=request.getAttribute("pageSize")%>">&lt;</a>
										</li>
										<%
										if(pageCount % Integer.parseInt(String.valueOf(request.getAttribute("pageSize")))==0){
											pageCount = pageCount /Integer.parseInt(String.valueOf(request.getAttribute("pageSize")));
										}else{
											pageCount = pageCount / Integer.parseInt(String.valueOf(request.getAttribute("pageSize"))) +1;
										}
										for(int i = 0; i <pageCount; i++){
										%>
										<li class ="<%=i+1==1?"page active" : "fb fmsun" %>" page="1" onclick="clickPageNumber(<%=i+1%>)">
										<a href="${pageContext.request.contextPath}/servlet/WanchengServlet?pageNo=<%=i+1%>&pageSize=<%=request.getAttribute("pageSize")%>"><%=i+1 %></a>
										</li>
										<%} %>
										<li id="next" class="fb fmsun">
											<a href="${pageContext.request.contextPath}/servlet/WanchengServlet?pageNo=<%=request.getAttribute("pageNo").equals(pageCount+"")?pageCount:(Integer.parseInt(String.valueOf(request.getAttribute("pageNo")))+1)%>">&gt;</a>
										</li>
									</ul>
								</div>
							</div>
						</div>

						<!--分页 end-->
						<!-- 详情 模态框 -->
						<div aria-hidden="true" aria-labelledby="stock_upinfoModalLabel" role="dialog" tabindex="-1" id="stock_upinfoModal" class="modal fade" style="display: none;">
							<!-- 采购入库 -->
							<div style="width:1000px;" class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
										<h4 id="stock_upModalLabel" class="modal-title">完成入库</h4>
									</div>
									<div class="modal-body" style="padding-top:0px;">
										<!--part2 star-->
										<div class="tl lh30 mt15 scrollspy-example" style="max-height:300px">
											<table style="margin-bottom:0" class="table table-striped table-hover">
												<thead class=" table-bordered">
													<tr>
														<th>SKU编码</th>
														<th>商品名称</th>
														<th>商品属性</th>
														<th>需入库数量</th>
														<th>已入库数量</th>
														<th>仓库</th>
														<th>备注</th>
													</tr>
												</thead>
												<tbody style="font-weight:normal">

													
												</tbody>
											</table>
										</div>
										<!--part2 end-->
										<!--part3 star-->
										<div class="tl lh30 pt10">
											<div class="row f14 fb mt20">
												<div class="col-sm-12">入库备注</div>
												<div class="col-sm-12">
													<textarea rows="3" class="form-control" disabled="disabled"></textarea>
												</div>
											</div>
										</div>
										<!--patr3 end-->
									</div>
									<div class="modal-footer">
										<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>

						</div>
						<!-- 详情end -->
					</div>
				</div>
			</div>
			<div class="contentbox" id="contentbox" style="background: rgb(241, 241, 241) none repeat scroll 0% 0%; display: none;"></div>
			<!--Layout right part end-->

			<div id="spinner" style="display: none;">
				<div class="modal fade" aria-hidden="false" role="dialog" tabindex="-1" style="display: block;">
					<div class="modal-dialog tc" style="margin-top: 300px;">
						<img src="img/loading3.gif">
					</div>
				</div>
				<div class="modal-backdrop fade" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;"></div>
			</div>

			
			
		</div>
	</body>

</html>