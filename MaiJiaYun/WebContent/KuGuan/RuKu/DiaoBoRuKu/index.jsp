<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="keywords" content="卖家云网络销售在线管理系统">
<meta name="description" content="NIIT-IGEEKHOME 17营第三小组">
<meta http-equiv="X-UA-Compatible" content="IE=8,9,chrome=1">



<script type="text/javascript">
	//初始化函数
	//执行任务：设置调拨单数据
	function initData(pageNumber){
		//判断是否存在查询条件
		var searchKey = $("#li-query input").val();
		var pageSize = $("#currentPageSize").html();
		var searchWarehouse = $("#dropdownMenu1").text();
		var diaoboSelectNumber = 0;

	 	$.ajax({
			url:"${pageContext.request.contextPath}/servlet/DiaoborukudanServlet",
			type:"post",
			data:{
				"pageNumber":pageNumber,
				"pageSize":pageSize,
				"searchKey":searchKey,
				"searchWarehouse":searchWarehouse
			},
			datatype:"xml",
			success:function(data){
 				var innerHtml = "";
  				var i = 0;
				var backgroundColor = "";
				
				if($(data).find("diaobodan")[0]){
					
					while($(data).find("diaobodan")[i]){
						
						innerHtml +=
						  "<tr modelid=\"0\" id=\"dataRow" + i + "\" onclick=\"clickData(" + i + ")\">"
						+ "<td><input type=\"checkbox\" name=\"checkOrder\" value=\"0\" id=\"dataCheckbox" + i + "\" onmouseover=\"removeDivClick(" + i + ")\" onmouseout=\"addDivClick(" + i + ")\"></td>" 	
						+ "<td id=\"codeTd\"><a data-target=\"#stock_upModal\" data-toggle=\"modal\" class=\"operate-ruku-edit\">" + $(data).find("diaoboCode")[i].childNodes[0].nodeValue + "</a></td>"
						+ "<td>" + $(data).find("diaoboDiaobodanCode")[i].childNodes[0].nodeValue + "</td>"
						+ "<td>" + $(data).find("diaoboWarehouse")[i].childNodes[0].nodeValue + "</td>"
						+ "<td>" + $(data).find("diaoboInCount")[i].childNodes[0].nodeValue + "</td>"
						+ "<td>" + $(data).find("diaoboInFinish")[i].childNodes[0].nodeValue + "</td>"
						+ "<td>" + $(data).find("diaoboSetTime")[i].childNodes[0].nodeValue + "</td>"
						+ "<td>" + $(data).find("diaoboAuthor")[i].childNodes[0].nodeValue + "</td>"
						+ "<td colspan=\"2\">"
						+ "<button data-target=\"#stock_upModal\" data-toggle=\"modal\" class=\"btn btn-default mr5 operate-ruku-edit\" type=\"button\" onclick=\"bianjiruku(" + i + ")\">编辑入库</button>"
						+ "</td></tr>"
				
						i++;
					}
					
				}else{
					innerHtml += "<tr><td colspan=\"9\"><div class=\"tc c6\">暂无数据</div></td></tr>";
				}
				
				//设置页面数据
				$("#tbody").html(innerHtml);
				
				//设置表格背景色
				setBackgroundColor(i);

				//设置次级导航栏数据总量显示
				$("#li-diaobo span").html("(" + $(data).find("diaoboTotalNumber")[0].childNodes[0].nodeValue + ")");
				
				//获取&设置搜索数据条数
				diaoboSelectNumber = $(data).find("diaoboSelectNumber")[0].childNodes[0].nodeValue
				$("#totalRecords").html(diaoboSelectNumber);
								
				//设置分页数
				setPageList(parseInt((diaoboSelectNumber-1)/pageSize + 1), pageNumber);

				//设置入库单号编辑方法链接
				setCodeLink(i);
				
				//设置仓库列表
				setWarehouseList($(data).find("diaoboWarehouseName"));
			}
		});  
	}
	
	//初始化错落背景色
	function setBackgroundColor(thisPageDataNumber){
		var backgroundColor;
		
		for (var i = 0; i < thisPageDataNumber; i++) {
			//为奇数行设置背景色
			i % 2 == 0 ? backgroundColor = "rgb(249, 249, 249)" : backgroundColor = "rgb(256, 256, 256)";
			//修改行的背景色时应修改所在tr的所有td，否则当css背景色属性已存在时修改将失效
			$("#dataRow" + i + " td").css("background-color", backgroundColor);
		}
	}
	
	//设置每行数据点击触发行首CheckBox, 改变行背景色
	function clickData(row){
		//使用prop而不是attr设置checked属性
		//修改行的背景色时应修改所在tr的所有td，否则当css背景色属性已存在时修改将失效
		if($("#dataCheckbox" + row).is(":checked")){
			$("#dataCheckbox" + row).prop("checked", false);
			$("#dataRow" + row + " td").css("background-color", ((row % 2 == 0) ? "rgb(249, 249, 249)" : "rgb(256, 256, 256)"));
		}else{
			$("#dataCheckbox" + row).prop("checked", true);
			$("#dataRow" + row + " td").css("background-color", "rgb(240, 248, 253)");
		}
	}

	//设置下方每页显示数据数量
	function setPageSize(pageSize){
		$("#currentPageSize").html(pageSize);
		initData(1);
	}
	
	//设置下方页数列表
	function setPageList(pageCount, pageNumber){
		var innerHtml = "";
		var lastPageNumber = 0;
		var nextPageNumber = 0;
		//传参页数为0无操作
		
		if(pageNumber > 1){
			lastPageNumber = pageNumber - 1; 
		}
		if(pageNumber < pageCount){
			nextPageNumber = pageNumber + 1;
		}
		
		var pageFrom = 1;
		var pageTo = pageCount;
		
		if(pageCount > 5){
			
			pageFrom = pageNumber - 2 > 1 ? pageNumber - 2 : 1;
			pageTo = pageNumber + 2 < pageCount ? pageNumber + 2 : pageCount;
			
		}
		
		//设置向前翻页
		innerHtml +=
			  "<ul class=\"pagination\">"
			+ "<li id=\"last\" class=\"fb fmsun\"><a href=\"javascript:changePage(" + lastPageNumber + ");\">&lt;</a></li>";
		
		//设置前页码省略
		if(pageCount > 5){
			if(pageNumber - 2 > 1){
				innerHtml +=
					"<li class=\"fb fmsun\" page=\"1\"><a href=\"javascript:changePage(1);\" id=\"pageNum\">…</a></li>";
			}
		}
			
		//设置中间页码
		for(i = pageFrom; i <= pageTo; i++){
			var pageClass = "";
			
			//设置当前页按钮常亮
			if(i == pageNumber){
				pageClass = "page active";
			}else{
				pageClass = "fb fmsun";
			}
			
			innerHtml +=
				"<li class=\"" + pageClass +"\" page=\"" + i + "\"><a href=\"javascript:changePage(" + i + ");\" id=\"pageNum\">" + i + "</a></li>";
		}
		
		//设置后页码省略
		if(pageCount > 5){
			if(pageNumber + 2 < pageCount){
				innerHtml +=
					"<li class=\"fb fmsun\" page=\"" + pageCount + "\"><a href=\"javascript:changePage(" + pageCount + ");\" id=\"pageNum\">…</a></li>";
			}
		}
		
		//设置向后翻页
		innerHtml +=
			  "<li id=\"next\" class=\"fb fmsun\"><a href=\"javascript:changePage(" + nextPageNumber + ");\">&gt;</a></li>"
			+ "</ul>";
			
		$("#pagingPages").html(innerHtml);
	}
	
	//换页方法
 	function changePage(pageNumber){
		//如果定向页码不为零则进行翻页
		if(pageNumber != 0){
			initData(pageNumber);
		}
	}
	
	//设置表格头全选Checkbox
	function setAllCheckbox(){
		//Checkbox首先对Click事件作出反应，设置完成反应状态后，再调用onclick方法
		if($("#mainCheckbox").is(":checked")){
			$("#tbody input").prop("checked", true);
			$("#tbody td").css("background-color", "rgb(240, 248, 253)");;
		}else{
			$("#tbody input").prop("checked", false);
			//初始化表格背景色
			setBackgroundColor($("#tbody tr").length);
		}
	}
	
	//设置入库单号编辑方法链接
	function setCodeLink(rowCount){
		for (var i = 0; i < rowCount; i++) {
			$("#dataRow" + i).find("#codeTd a").attr("href", "javascript:bianjiruku(" + i + ")");
		}
	}
	
	//初始化仓库列表
	function setWarehouseList(warehouseList){
		var warehouseInnerHtml = "";
		
		if(warehouseList[0]){
			var i = 0;
			
			while(warehouseList[i]){
				warehouseInnerHtml += "<li role=\"presentation\">"
					+ "<a href=\"javascript:selectByWarehouse(" + i + ")\" tabindex=\"-1\" role=\"menuitem\" warehouseid=\"0\" type=\"自有仓库\">" + warehouseList[i].childNodes[0].nodeValue + "</a>"
					+ "</li>";
				i++;
			}

			warehouseInnerHtml += "<li role=\"presentation\">"
				+ "<a href=\"javascript:selectByWarehouse(" + i + ")\" tabindex=\"-1\" role=\"menuitem\" warehouseid=\"0\" type=\"自有仓库\">所有仓库</a>"
				+ "</li>"; 
			
		}else{
			warehouseInnerHtml += "<li role=\"presentation\">"
				+ "<a href=\"#\" tabindex=\"-1\" role=\"menuitem\" warehouseid=\"0\" type=\"自有仓库\">默认仓库</a>"
				+ "</li>";
		}
		
		$("#dropdownMenu1").next().html(warehouseInnerHtml);
	}
	
	//依据仓库名筛选数据
	function selectByWarehouse(warehouseIndex){
		//设置表格头筛选仓库名
		var warehouseName = $("#dropdownMenu1").next().find("a")[warehouseIndex].childNodes[0].nodeValue;
		$("#dropdownMenu1").html(warehouseName + "<span class=\"caret\"></span>");
		//初始化该仓库数据
		initData(1);
	}
	
	//当鼠标移至checkbox上时移除该行div的onClick事件,防止重复信息
	function removeDivClick(row){
		$("#dataRow" + row).removeAttr("onClick");
	}
	function addDivClick(row){
		$("#dataRow" + row).attr("onClick","clickData(" + row + ")");
	}
	
	//编辑入库Ajax
	function bianjiruku(row){
		//获取点击行数据的入库单号
		var diaoboxiangqingCode = $("#dataRow" + row).find("#codeTd").text();
		
		$.ajax({
			url:"${pageContext.request.contextPath}/servlet/DiaoboxiangqingServlet",
			type:"post",
			data:{"diaoboxiangqingCode":diaoboxiangqingCode},
			datatype:"json",
			success:function(data){
				var innerHtml = "";
				var inNeedTotal = 0;
				var inFinishTotal = 0;
				var i = 0;
				
				$.each(data.json, function(index, value){
					
					innerHtml += "<tr>";
					
					innerHtml += "<td class=\"fb\">" + value.diaoboxiangqingSku + "<input type=\"hidden\" name=\"voucherSkuIds\" value=\"0\"></td>";
					innerHtml += "<td><a title=\"\" rel=\"tooltip\" href=\"javascript:void(0);\" style=\"color: #333333; text-decoration: none;\" data-original-title=\"" + value.diaoboxiangqingName + "\">" + value.diaoboxiangqingName + "</a></td>";
					innerHtml += "<td><a title=\"\" rel=\"tooltip\" href=\"javascript:void(0);\" style=\"color: #333333; text-decoration: none;\" data-original-title=\"" + value.diaoboxiangqingAttribute + "\">" + value.diaoboxiangqingAttribute + "</a></td>";
					innerHtml += "<td>" + value.diaoboxiangqingInNeed + "</td><td>" + value.diaoboxiangqingInFinish + "</td>";
					innerHtml += "<td><div class=\"form-group form-group-input\" style=\"width: 70px;\">";
					innerHtml += "<input skucode=\"" + value.diaoboxiangqingSku + "\" value=\"" + (value.diaoboxiangqingInNeed - value.diaoboxiangqingInFinish) + "\" name=\"actualQuantities\" type=\"text\" class=\"form-control input-operate integer\" max=\"10\" style=\"width: 100%;\" oninput=\"checkInLimit(" + i + ")\">";
					innerHtml += "</div><input type=\"hidden\" name=\"lostQuantity\" value=\"0\"><input type=\"hidden\" name=\"brokenQuantity\" value=\"0\"></td>";
					innerHtml += "<td><input type=\"text\" name=\"memos\" class=\"form-control\" value=\"" + value.diaoboxiangqingNote + "\"></td>";
					
					innerHtml += "</tr>";
					
					inNeedTotal += parseInt(value.diaoboxiangqingInNeed);
					inFinishTotal += parseInt(value.diaoboxiangqingInFinish);
					                    
					i++;
				});
				
				innerHtml += "<tr style=\"background: #dcdcdc; border: 1px solid #dcdcdc;\">";
				innerHtml += "<td colspan=\"3\" class=\"fb\">合计：</td>";
				innerHtml += "<td class=\"fb\">需入库合计：<span id=\"total\" class=\"red\">" + inNeedTotal + "</span></td>";
				innerHtml += "<td class=\"fb\">已入库合计：<span id=\"changetotal\" spantotal=\"0\" class=\"red\">" + inFinishTotal + "</span></td>";
				innerHtml += "<td colspan=\"4\" class=\"fb\">未入库：<span id=\"untotal\" class=\"red\">" + (inNeedTotal -inFinishTotal)  + "</span></td></tr>";
				
				//设置主要数据
				$("#form1 tbody").html(innerHtml);
				//设置框头仓库
				$("#modal_warehouseName").html("选择仓库：" + data.json[0].diaoboxiangqingWarehouse);
				//设置完成入库按钮事件
				$("#save").attr("onclick", "checkInWarehouse(\"" + diaoboxiangqingCode + "\")");
				//设置入库备注
				$("#form1 div div div textarea").val(data.note);
			}
		});
	}
	
	//确认入库
	function checkInWarehouse(diaoboxiangqingCode){
		
		var inSku = 0;
		var inNumber = 0;
		var inGoodsNote = "";
		var inCodeNote = "";
		var inNeedTotal = 0;
		var inFinishTotal = 0;
		
		//存储入库数、商品备注、本单备注
		for(var i = 0; i < $("#form1 tbody tr").size() - 1; i++){
			
			inSku = $("#form1 tbody tr:eq(" + i + ") td:first").text();
			inFinish = Number($("#form1 tbody tr:eq(" + i + ") td:eq(4)").text());
			inNumber = Number($("#form1 tbody tr:eq(" + i + ") td div :text").val());
			inNumber += inFinish;
			inGoodsNote = $("#form1 tbody tr:eq(" + i + ") td:eq(6) :text").val();
			if(i == 0){
				inCodeNote = $("#form1 div div div textarea").val();
			}
			inNeedTotal += Number($("#form1 tbody tr:eq(" + i + ") td:eq(3)").text());
			inFinishTotal += inNumber;
			
			$.ajax({
				url:"${pageContext.request.contextPath}/servlet/DiaoboxiangqingServlet",
				type:"post",
				data:{
					"inCode": diaoboxiangqingCode,
					"inSku": inSku,
					"inNumber":inNumber,
					"inGoodsNote":inGoodsNote,
					"inCodeNote":inCodeNote
					}
			});
		}

		//如果数据对应，完成入库
		if(inNeedTotal == inFinishTotal){
			$.ajax({
				url:"${pageContext.request.contextPath}/servlet/DiaoboxiangqingServlet",
				type:"post",
				data:{
					"inWarehouseCode": diaoboxiangqingCode
				}
			});
		}
		
		//刷新页面//插入&查询操作0.5延迟
		setTimeout("initData(1);", 500)
	}
	
	//检查输入的入库数量是否正常
	function checkInLimit(row){
		
		//获取输入值
		var inValue = $("#form1 tbody tr:eq(" + row + ") td div :text");
		
		//获取当前int值
		var inNumber = Number(inValue.val());
		//如果输入了非数字则删除
		if(isNaN(inNumber)){
			inValue.val("");
			
		//判断入库大小是否超过限制	
		}else{
			var inNeed = Number($("#form1 tbody tr:eq(" + row + ") td:eq(3)").text());
			var inFinish = Number($("#form1 tbody tr:eq(" + row + ") td:eq(4)").text());
			//如果输入数字过大则换成最大值
			if(inNumber > (inNeed - inFinish)){
				inValue.val(inNeed - inFinish);
			}
		}
	}
	
	//将选中入库单号发送至Servlet，导出Excel
	function exportExcel(){
		var checkedCodeList = [];
		var listIndex = 0;

		if($("#mainCheckbox").is(":checked")){
			checkedCodeList[0] = "all";
		}else{
			for (var i = 0; i < $("#tbody").children("tr").length; i++) {
				if($("#dataCheckbox" + i).prop("checked")){
					checkedCodeList[listIndex] = $("#dataRow" + i).find("#codeTd a").text();
					listIndex ++;
				}
			}
		}
		
		if(checkedCodeList.length > 0){
			$("#exportButton").removeAttr("data-toggle");
			
			$.ajax({
				url:"${pageContext.request.contextPath}/servlet/ExportExcelServlet",
				type:"post",
				data:{
					"exportType":"diaobo",
					"codeList":checkedCodeList
					}
			});
			
		}else{
			$("#exportButton").attr("data-toggle","modal");
		}
	}

</script>

</head>
<body style="padding-right: 0px;" class="" onload="initData(1)">
	<!--代码开始-->
	<div class="container" id="container">
		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
		
	</div>
	<!--header 结束-->
	<!--Layout left part star-->
	<!-- style="position: fixed;left:0, top:0, z-index:1030; display:none;" -->
	<!--<div class="sidebar-nav navbar-fixed-top" id="menu" style="display:none;"></div>-->
	<!--Layout left part end-->
	<!--Layout right part star-->
	<div class="content" id="content">
		<!--titletab star-->
		<div class="collapse navbar-collapse navbar-default navbar-titletab"
			style="padding: 0px;">
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
				<li id="li-diaobo" class="ml20 tab active" style="margin-left: 0px">
					<a class="" href="${pageContext.request.contextPath}/servlet/DiaoborukudanServlet">调拨入库 <span><%="(" + request.getAttribute("diaoboDataCount") + ")"%></span></a>
				</li>
				<li id="li-conplete" class="tab">
					<a class="c6" href="${pageContext.request.contextPath}/servlet/WanchengServlet">已完成入库</a>
				</li>
				<li class="pull-right" id="li-query" style="padding-top: 12px;">
					<div class="w340">
						<div class="input-group">
							<input value="" name="q" class="form-control" placeholder="入库单编号/相关单据号/制单人" type="text"> 
							<span class="input-group-btn">
								<button type="button" class="btn btn-primary query" onclick="initData(1)" style="height: 33px">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<!--titletab end-->
		
		<div id="panel" class="prl10auto">
			<!-- 导出按钮 -->
			<div class="btn-group-block">
				<div class="btn-group mr5" id="divImport">
					<button class="btn btn-default" type="button" id="exportButton" data-toggle="modal" data-target="#daochu" onclick="exportExcel()">导出</button>
					<button id="importOrderListButton" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="height: 34px">
						<span class="glyphicon glyphicon-save mr5"></span><span style="display: none;" class="f10" id="taskCount"></span>
					</button>
					<ul id="importOrderUl" aria-labelledby="importOrderListButton"
						style="width: 340px; height: 200px;" role="menu"
						class="dropdown-menu scrollspy-example">
						<li>
							<div class=" mr20 ml20" style="border-bottom: 1px solid #eeeeee;">
								<div style="line-height: 60px; text-align: center;">
									<span class="c6" style="display: inline;">当前没有进行中的任务</span>
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
							<th width="50"><input type="checkbox" id="mainCheckbox" onclick="setAllCheckbox()"></th>
							<th>入库单编号</th>
							<th>相关调拨单</th>
							<th width="130">
								<div class="dropdown">
									<button data-toggle="dropdown" 
										id="dropdownMenu1" 
										type="button"
										style="padding: 0px; box-shadow: none; background: transparent none repeat scroll 0% 0%;"
										class="btn dropdown-toggle fb">
											入库仓库
											<span class="caret"></span>
									</button>
									<ul aria-labelledby="dropdownMenu1" role="menu" class="dropdown-menu">
										<!-- 仓库列表 -->
									</ul>
								</div>
							</th>
							<th>入库数量</th>
							<th>已入库数量</th>
							<th>制单时间</th>
							<th>制单人</th>
							<th width="220">操作</th>

						</tr>
					</thead>
					<!-- 页面主要数据 -->						
					<tbody id="tbody">
						<tr><td colspan="9"><div class="tc c6">加载中，请稍后......</div></td></tr>
					</tbody>
				</table>

				<!--table end-->
				<!--分页 star-->
				<div class="row" style="margin: 0px; -moz-user-select: none;" onselectstart="return false;" id="paging">
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
											<button data-toggle="dropdown"
												class="btn btn-default dropdown-toggle" type="button">
												<span id="currentPageSize">10</span> <span class="caret"></span>
											</button>
											<div class="lh30 left" style="margin-left: 5px;">个</div>
											<ul role="menu" class="dropdown-menu" id="pageSizes">
												<li><a href="javascript:setPageSize(10);">10</a></li>
												<li><a href="javascript:setPageSize(20);">20</a></li>
												<li><a href="javascript:setPageSize(50);">50</a></li>
												<li><a href="javascript:setPageSize(100);">100</a></li>
												<li><a href="javascript:setPageSize(200);">200</a></li>
												<!-- <li><a href="javascript:void(0);">20</a></li>
	                            <li><a href="javascript:void(0);">50</a></li> -->
											</ul>
										</div>
									</li>
								</ul>
							</div>
							<div style="width: 400px; float: left;" id="pagingPages">
								<!-- js -->
							</div>
						</div>
					</div>
				</div>
				<!--分页 end-->
				
				<!--编辑入库 star-->
				<div aria-hidden="true" aria-labelledby="stock_upModalLabel"
					role="dialog" tabindex="-1" id="stock_upModal" class="modal fade"
					style="display: none;">
					<div style="width: 1000px;" class="modal-dialog">
						<!-- 模态框 -->
						<div class="modal-content">
							<div class="modal-header">
								<button aria-hidden="true" data-dismiss="modal" class="close"
									type="button">×</button>
								<h4 id="stock_upModalLabel" class="modal-title">编辑入库</h4>
							</div>
							<div class="modal-body" style="padding-top: 0px;">
								<form class="form-inline" role="search" id="form1" method="post">
									<input type="hidden" name="warehouseVoucherId" value="36784">
									<!--part1 star-->
									<div class="btn-group-block">
										<!--search star-->
										<div class="form-group">商品扫描：</div>
										<!--search end-->
										<!--search star-->
										<div class="form-group mr20">
											<div class="input-group">
												<input id="goodsSku" type="text" class="form-control">
											</div>
										</div>
										<div class="form-group" id="modal_warehouseName">选择仓库：</div>
										<!--search end-->
									</div>
									<!--part1 end-->
									<!--part2 star-->
									<div class="tl lh30 scrollspy-example"
										style="max-height: 230px">
										<table style="margin-bottom: 0"
											class="table table-striped table-hover">
											<thead class=" table-bordered">
												<tr>
													<th>SKU编码</th>
													<th>商品名称</th>
													<th>商品属性</th>
													<th>需入库数量</th>
													<th>已入库数量</th>
													<th>本次入库数量</th>
													<th>备注</th>
												</tr>
											</thead>
											<tbody style="font-weight: normal">
												<!-- insert data here -->
											</tbody>
										</table>
									</div>
									<!--part2 end-->
									<!--part3 star-->
									<div class="tl lh30 pt10">
										<div class="row f14 fb mt20">
											<div class="col-sm-12">入库备注</div>
											<div class="col-sm-12">
												<textarea name="memo" rows="3" class="form-control" style="width: 100%;"></textarea>
											</div>
										</div>
									</div>
									<!--patr3 end-->
								</form>
							</div>
							<div class="modal-footer">
								<!-- <button class="btn btn-primary" id="progress" type="button">保存进度</button> -->
								<button data-dismiss="modal" class="btn btn-primary once" id="save" type="button">确认入库</button>
								<button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
								<span id="errorSpan" style="color: red"></span>
							</div>
						</div>
					</div>

				</div>
				<div aria-hidden="true" aria-labelledby="stock_upinfoModalLabel"
					role="dialog" tabindex="-1" id="stock_upinfoModal"
					class="modal fade" style="display: none;"></div>
				<!--编辑入库 end-->
			</div>
		</div>
	</div>
	<div class="contentbox" id="contentbox"
		style="background: rgb(241, 241, 241) none repeat scroll 0% 0%; display: none;"></div>
	<!--Layout right part end-->


	<div style="width: 300px; height: 80px; display: none;" class="modal"
		id="keepsuccessModal" tabindex="-1" role="dialog"
		aria-labelledby="logisticsModalLabel" aria-hidden="false">
		<div class="modal-dialog" style="width: 300px; margin: 52px 0px 0px;">
			<div
				style="background: rgb(97, 190, 68) none repeat scroll 0% 0%; border-radius: 0px; border: medium none;"
				class="modal-content">
				<div style="padding: 5px;" class="modal-body">
					<!--part one-->
					<div style="color: rgb(255, 255, 255);" class="c6 tc"
						id="showTempDiv">保存成功！</div>
					<!--part one end-->
				</div>
			</div>
		</div>
	</div>
	<div style="width: 300px; height: 80px; display: none;" class="modal"
		id="keeperrorModal" tabindex="-1" role="dialog"
		aria-labelledby="logisticsModalLabel" aria-hidden="false">
		<div class="modal-dialog" style="width: 300px; margin: 52px 0px 0px;">
			<div
				style="background: rgb(255, 88, 49) none repeat scroll 0% 0%; border-radius: 0px; border: medium none;"
				class="modal-content">
				<div style="padding: 5px;" class="modal-body">
					<!--part one-->
					<div style="color: rgb(255, 255, 255);" class="c6 tc"
						id="showErrorTempDiv">保存失败！</div>
					<!--part one end-->
				</div>
			</div>
		</div>
	</div>

	<div aria-hidden="true" aria-labelledby="edit_accountModalLabel"
		role="dialog" tabindex="-1" id="edit_accountModal" class="modal fade"
		style="display: none;"></div>
	<div id="modal"></div>
	</div>
	<!--代码结束-->

	<!-- 导出选择提示框 -->
	<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"
		id="daochu">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="bootbox-close-button close"
						data-dismiss="modal" aria-hidden="true" style="margin-top: -10px;">×</button>
					<div class="bootbox-body">请选择您要导出的入库单</div>
				</div>
				<div class="modal-footer">
					<button data-bb-handler="ok" type="button" class="btn btn-primary"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 模态框背景 -->
	<div id="modal_background" class=""></div>

</body>

</html>