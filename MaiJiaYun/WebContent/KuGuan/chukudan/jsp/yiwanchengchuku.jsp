<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths"
	style="">

<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta name="keywords"
	content="供销平台,分销平台,分销,供销,货源,分销推荐,货源推荐,供销系统,分销系统,ERP,免费ERP,ERP软件,免费ERP软件,进销存,进销存软件,免费进销存软件">
<meta name="description"
	content="禾唐卖家云独一无二的供销平台，开启供销双方合作的桥梁，无安装，免培训，极致用户体验 。包含寻找优质分销商，一键发布货源信息，一键代发、批发进货轻松接单！让您与分销商的订单业务无缝衔接，供销双方实时互动 ，沟通协作业务拓展不再是难事。">
<meta http-equiv="X-UA-Compatible" content="IE=8,9,chrome=1">
<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>




<script type="text/javascript" src="${pageContext.request.contextPath}/KuGuan/chukudan/js/jquery-1.7.min.js"></script>
<script type="text/javascript">	
 
function checkall(flag){
	var boxes=document.getElementsByName("checkOrder");
	for(var i=0;i<boxes.length;i++){
		if(boxes[i].type=="checkbox"){
			boxes[i].checked=flag;
		}
	}
}

	
</script> 

<script type="text/javascript">
 function changec(flag){
var x=document.getElementById(flag);
x.checked=!(x.checked);
} 
</script>

<script type="text/javascript">

function showdetail(id){
	
	$.ajax({
		url:"${pageContext.request.contextPath}/DetailServlet?id="+id,
		type:"get",
		datatype:"xml",
		success:function(data){
			var xmldoc=$(data);

			var resultHtml="";
			if(xmldoc){
				/* alert($(data).find("emp").text());*/
				document.getElementById("stock_upModalLabel").innerHTML=$(data).find("type").text();
				document.getElementById("xutotal").innerHTML=$(data).find("xuto").text();
				document.getElementById("yitotal").innerHTML=$(data).find("yito").text();
				document.getElementById("daitotal").innerHTML=$(data).find("daito").text();
				document.getElementById("chubei").innerHTML=$(data).find("chukubei").text();
				/* alert($(data).find("type").text()); 
				alert($(data).find("to").text());
				alert(xmldoc); */
				
				xmldoc.find("bianji").each(function(index,element){	
				//	alert($(element).children("name").text());
					
					resultHtml+="<td class=\"fb\">"+$(element).children("sku").text()+"</td>";
					resultHtml+="<td>"+$(element).children("name").text()+"</td>";
					resultHtml+="<td>"+$(element).children("pro").text()+"</td>";
					resultHtml+="<td>"+$(element).children("xu").text()+"</td>";
					resultHtml+="<td>"+$(element).children("yi").text()+"</td>";
					resultHtml+="<td>"+$(element).children("cang").text()+"</td>";
					resultHtml+="<td>"+$(element).children("bei").text()+"</td>";
 
					
				});
				//alert(resultHtml);
				var resultNO = document.getElementById("resultNO");
				//var resultNO = $("#resultNO");
				resultNO.innerHTML = resultHtml;
			//	alert("aaaa");
				
			}
		
		}
	});
	
}
</script>

<script type="text/javascript">
	var pageNum = ${ywcall.pageNum};//当前页码
	var maxPage = ${ywcall.maxPageNum};//最大页码
	var cangkuming = "";
	var pageSize = ${ywcall.pageSize};//页面大小
	var i=1;
	//封装的回调函数
	function get(sousuo,pageSize,pageNum){
		 $.get(
 			"${pageContext.request.contextPath }/getNum?op=yiwancheng&sousuo="+sousuo+"&pageSize="+pageSize+"&pageNum="+pageNum,
 			function(data){
 				$("#orderList").html("");//清空集合列表
 				if(data.isempty == "a"){
					maxPage = data.maxPageNum;//这里后台传来的数据都是字符串。并不能直接当成数字使用
					$("#totalRecords").html(data.maxNum);//设置显示的最大数据量
					var result = "";
					var pageData = data.pageData;
					var cangkus = data.cangkus;
					 $.each(pageData,function(index,item){
						result = getList(result,item);
					});  
					$("#pagingPages").html("");
					
					var yemame = "<ul class=\"pagination\"><li id=\"last\" class=\"fb fmsun\" onclick=\"fanye('a')\"><a href=\"javascript:void(0);\">&lt;</a></li>";
					
					if((pageNum-2) >=1){
						var lingshi = pageNum -2;
						yemame += "<li class=\""+"page active"+"\" page=\""+lingshi+"\" onclick=\"mouye("+lingshi+")\">";	 
						yemame += "<a href=\"javascript:void(0);\">"+lingshi+"</a></li> ";
					}
					if((pageNum-1) >=1){
						var lingshi = pageNum -1;
						yemame += "<li class=\""+"page active"+"\" page=\""+lingshi+"\" onclick=\"mouye("+lingshi+")\">";	 
						yemame += "<a href=\"javascript:void(0);\">"+lingshi+"</a></li> ";
					}
					yemame += "<li class=\""+"page active"+"\" page=\""+pageNum+"\" onclick=\"mouye("+pageNum+")\">";	 
					yemame += "<a href=\"javascript:void(0);\">"+pageNum+"</a></li> ";
					if(pageNum < maxPage){
						var lingshi = pageNum +1;
						yemame += "<li class=\""+"page active"+"\" page=\""+lingshi+"\" onclick=\"mouye("+lingshi+")\">";	 
						yemame += "<a href=\"javascript:void(0);\">"+lingshi+"</a></li> ";
						if(lingshi  < maxPage){
							var lingshi1 = lingshi + 1;
							yemame += "<li class=\""+"page active"+"\" page=\""+lingshi1+"\" onclick=\"mouye("+lingshi1+")\">";	 
							yemame += "<a href=\"javascript:void(0);\">"+lingshi1+"</a></li> ";
						}
					}
					yemame += "<li id=\"next\" class=\"fb fmsun\" onclick=\"fanye('c')\"><a href=\"javascript:void(0);\">&gt;</a></li></ul>";						
					
					$("#pagingPages").html(yemame); 
					$("#orderList").html(result);
					$("#cangkuanniu").html(str);
 				}
 			}	
 	 	);	  
	}
	
	
	//打印列表数据
	 function getList(result,item){
		
		result += "<tr class=\"order\" modelid=\"3422962\">";
		result += "<td style=\"backround-color:rgb(240, 248, 253);\" modelid=\"3407060\">";
		result += "<input id=\""+(i++)+"\" name=\"checkOrder\" value="+item.chukudanId+" style=\"margin-right: 5px;\" type=\"checkbox\"/></td>";
		result += "<td style=\"backround-color: rgb(240, 248, 253)\">";
		var y=i-1;
		result += "<a class=\"operate-look\" inputtype=\"调拨出库\" style=\"cursor: pointer;\" data-target=\"#stock_upModal\" ata-toggle=\"modal\" style=\"cursor: pointer;\" onclick=\"changec("+y+")\">"+item.chukudanCode+"</a></td>";
		result += "<td style=\"backround-color: rgb(240, 248, 253);\">"+item.chukuxiangguandanCode+"</td>";
		if(item.chukuType == 1){
			result += "<td style=\"background-color: rgb(240, 248, 253);\">采购退货出库</td>";
		}else{
			result += "<td style=\"background-color: rgb(240, 248, 253);\">调拨出库</td>";
		}
		result += "<td style=\"backround-color: rgb(240, 248, 253);\">"+item.chukuNum+"</td>";
		result += "<td style=\"backround-color: rgb(240, 248, 253);\">"+item.chukudanTime+"</td>";
		result += "<td style=\"backround-color: rgb(240, 248, 253);\">"+item.chukuPeople+"</td>";
		result += "<td style=\"backround-color: rgb(240, 248, 253);\">"+item.chukudanPeople+"</td>";
		result += "<td style=\"backround-color: rgb(240, 248, 253);\">"+item.chukudanTime+"</td>";
		result += "<td style=\"backround-color: rgb(240, 248, 253);\" colspan=\"2\">";
		result += "<a class=\"operate-look\" data-target=\"#stock_upinfoModal\" data-toggle=\"modal\" style=\"cursor: pointer;\" ";
		result += "inputtype=\"调拨出库\" >详情</a></td></tr>";
		return result;
	 }
	
 	//改变每页显示大小
 	function gaibian(note){
 		$("#currentPageSize").html(note);
 		pageSize = $("#currentPageSize").html();
 		var sousuo = $("#sousuokuang").val();
 		get(sousuo,pageSize,1);
 		
 	}
 	
	 // 搜索框
	 function anniu(){
		var sousuo = $("#sousuokuang").val();
		get(sousuo,10,1);
	}
	 //搜索框键盘监听
	 function enterr(){
		 var x;
		 if(window.event){ // IE8 以及更早版本
		 	x=event.keyCode;
		 }else if(event.which){ // IE9/Firefox/Chrome/Opera/Safari
		 	x=event.which;
		 }
		 if(x == 13){
			 anniu();
		 }
	 }
	 
	//翻页
	function fanye(note){
		var sousuo = $("#sousuokuang").val();
		if(note == 'a'){
			if(pageNum > 1){
				pageNum -= 1;
				get(sousuo,pageSize,pageNum); 
			}
		}
		if(note == "c"){
			if(pageNum < maxPage){
				pageNum += 1;
				get(sousuo,pageSize,pageNum); 
			}
		}
	}
	
	//页码按钮
	 function mouye(note){
		var sousuo = $("#sousuokuang").val();
		pageNum = note;
		get(sousuo,pageSize,pageNum);
	 }
	
</script>




</head>

<body style="padding-right: 0px;" class="">
	<!--代码开始-->
	<div class="container" id="container">

		<!--header 开始-->
		  <jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>  
		<!--header 结束-->

		<!--Layout right part star-->
		<div class="content" id="content">
			<!--titletab star-->
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0;">

				<div class="navbar-header">
					<a href="#" class="navbar-brand ml20">出库单</a>
				</div>

				<ul class="nav nav-tabs f14 fb">
					<li id="li-outpurchase" class="ml20 tab">
						<a class="" href="${pageContext.request.contextPath }/servlet/kuguan/chukudan/one?op=caigou">采购退货出库	<span>(${ywcall.total1 })</span></a>
							<!--  ${fn:length(chukudan) }这个方法可以获得一个集合的数量-->
					</li>

					<li id="li-outAllocation" class="tab">
						<a class="c6" href="${pageContext.request.contextPath }/servlet/kuguan/chukudan/one?op=diaobo">调拨出库<span> (${ywcall.total2 })</span></a>
					</li>

					<li id="li-chukuwancheng" class="tab active">
						<a class="c6" href="${pageContext.request.contextPath }/servlet/kuguan/chukudan/one?op=yiwancheng">已完成出库</a>	
					</li>

					<li class="pull-right" id="li-query" style="padding-top: 12px;">
						<div class="w340">
							<div class="input-group">
								<input name="q" id="sousuokuang" onkeydown="enterr()" class="form-control" placeholder="出库单编号/相关单据号" type="text"> 
								<span class="input-group-btn">
									<button type="button" class="btn btn-primary query" onclick="anniu()">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
					</li>

				</ul>
			</div>
			
			
			
			<!--titletab end-->
			<!--提交要导出的表单-->
			<form action="/MaiJiaYun/export">
						
			<div id="panel" class="prl10auto">
				
				<!--  下载按钮开始-->
				<div class="btn-group-block">
					<div class="btn-group mr5" id="divImport">
						<input class="btn btn-default" type="submit" id="importButton" value="导出">
					</div>
				</div>
				<!--  下载按钮结束-->
				
				
				<!--table star-->
				<div class="panel mt15">
					<!-- Table -->
					<table class="table table-striped table-hover">
					<!--  列表头开始-->
						<thead class=" table-bordered">
							<tr>
								<th>
									<div class="btn-group">
										<div class="left" style="margin-right: 5px;">
											<input type="checkbox" onclick="checkall(this.checked)">
										</div>
									</div>
								</th>
								<th>出库单编号</th>
								<th>相关单据</th>
								<th>出库类型</th>
								<th>出库数量</th>
								<th>制单时间</th>
								<th>制单人</th>
								<th>出库人</th>
								<th>出库时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<!--  列表头结束-->
						
						<!--  数据库数据循环开始-->
						<tbody id="orderList">
						<% int i=1;%>
							<c:forEach items="${ywcall.data }" var="ywca" varStatus="status">
							<tr class="order" modelid="3407060">
								<td style="background-color: rgb(240, 248, 253);" modelid="3407060">
									<input id=<%=i++%>  name="checkOrder" value="${ywca.chukudanId}" style="margin-right: 5px;" type="checkbox">
								<% int y=i-1; %></td>
								<td style="background-color: rgb(240, 248, 253);">
									<a class="operate-look" data-target="#stock_upModal" ata-toggle="modal" style="cursor: pointer;" inputtype="调拨出库" onclick="changec(<%=y%>)">${ywca.chukudanCode }</a>
								</td>
								<td style="background-color: rgb(240, 248, 253);">${ywca.chukuxiangguandanCode }</td>
								<td style="background-color: rgb(240, 248, 253);"><c:choose><c:when test="${ywca.chukuType==1 }">采购退货出库</c:when><c:otherwise>调拨出库</c:otherwise></c:choose></td>
								<td style="background-color: rgb(240, 248, 253);">${ywca.chukuNum }</td>
								<td style="background-color: rgb(240, 248, 253);">${ywca.chukudanTime }</td>
								<td style="background-color: rgb(240, 248, 253);">${ywca.chukuPeople }</td>
								<td style="background-color: rgb(240, 248, 253);">${ywca.chukudanPeople }</td>
								<td style="background-color: rgb(240, 248, 253);">${ywca.chukudanTime }</td>
								<td style="background-color: rgb(240, 248, 253);" colspan="2">
<a class="operate-look" data-target="#stock_upinfoModal" data-toggle="modal" style="cursor: pointer;" inputtype="调拨出库"  onclick=" showdetail(${ywca.chukudanId})">详情</a>
								</td>
							</tr>
							</c:forEach>
						
						</tbody>
						<!--  数据库数据循环结束-->
					</table>
                </form>
				</div>
				<!--panel end-->
				<!-- 详情start -->
				<div aria-hidden="true" aria-labelledby="stock_upinfoModalLabel"
					role="dialog" tabindex="-1" id="stock_upinfoModal"
					class="modal fade" style="display: none;">
					<!--采购入库 star-->
					<div id="result"></div>
				 <div style="width: 1000px;" class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button aria-hidden="true" data-dismiss="modal" class="close"
									type="button">×</button>
								<h4 id="stock_upModalLabel" class="modal-title"></h4>
							</div>
							<div class="modal-body" style="padding-top: 0px;">
								<!-- part2 star -->
								<div class="tl lh30 mt15 scrollspy-example"
									style="max-height: 300px">
									<table style="margin-bottom: 0"
										class="table table-striped table-hover">
										<thead class=" table-bordered">
											<tr>
												<th>SKU编码</th>
												<th>商品名称</th>
												<th>商品属性</th>
												<th>需出库数量</th>
												<th>已出库数量</th>
												<th>仓库</th>
												<th>备注</th>
											</tr>
										</thead>
										<tbody  style="font-weight: normal">
											 <tr id="resultNO" ></tr> 
											<tr style="background: #dcdcdc; border: 1px solid #dcdcdc;">
												<td colspan="3" class="fb">合计：</td>
												<td class="fb">需出库总数：<span id="xutotal" class="red"></span></td>
												<td class="fb">已出库数量：<span id="yitotal" class="red"></span></td>
												<td colspan="4" class="fb">待出库数量：<span id="daitotal" class="red"></span></td>
											</tr>
										</tbody>
									</table>
								</div>
							  <!-- part2 end
								part3 star-->
								<div class="tl lh30 pt10">
									<div class="row f14 fb mt20">
										<div class="col-sm-12">出库备注</div>
										<div class="col-sm-12">
											<textarea id="chubei" rows="3" class="form-control" disabled="disabled"></textarea>
										</div>
									</div>
								</div>
								<!--patr3 end  -->
							</div>
							<div class="modal-footer">
								<button data-dismiss="modal" class="btn btn-default"
									type="button">关闭</button>
							</div>
						</div>
					
					</div> 
					<!--  /.modal-dialog
					采购入库 end-->
				 </div> 
				<!-- 详情end -->
				<!--分页 star-->
				<div id="paging" class="row" style="margin: 0">
					<div style="float: right;">
						<div style="margin-right: 10px; float: left;">
							<ul class="pagination">
								<li class="dropup">
									<div class="lh30 left">共</div>
									<div class="btn-group" style="margin: 0 5px;">
										<span class="lh30 left fb red" id="totalRecords">${ywcall.maxNum }</span>
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
											<li><a href="javascript:void(0);" onclick="gaibian(10)">10</a></li>
											<li><a href="javascript:void(0);" onclick="gaibian(20)">20</a></li>
											<li><a href="javascript:void(0);" onclick="gaibian(50)">50</a></li>
											<li><a href="javascript:void(0);" onclick="gaibian(100)">100</a></li>
											<li><a href="javascript:void(0);" onclick="gaibian(200)">200</a></li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
						<div style="width: 350px; float: left;" id="pagingPages">
							<ul class="pagination">
								<li id="last" class="fb fmsun" onclick="fanye('a')"><a href="javascript:void(0);">&lt;</a></li>

								<c:forEach var="x" begin="1" end="${ywcall.maxPageNum}" step="1"> 
	         						<c:if test="${x < 5}" >
		         						<li class="page active" page="${x}  " onclick="mouye(${x})"><a href="javascript:void(0);">${x}</a></li>
									</c:if>
								</c:forEach>

								<li id="next" class="fb fmsun" onclick="fanye('c')"><a href="javascript:void(0);">&gt;</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!--分页 end-->
			</div>
		</div>



		<!-- ？？？一个不知道什么的DIV -->
		<div class="contentbox" id="contentbox"
			style="background: rgb(241, 241, 241) none repeat scroll 0% 0%; display: none;"></div>
		<!--Layout right part end-->

		<!--  微调-->
		<div id="spinner" style="display: none;">
			<div class="modal fade" aria-hidden="false" role="dialog"
				tabindex="-1" style="display: block;">
				<div class="modal-dialog tc" style="margin-top: 300px;">
					<img
						src="%E5%8D%96%E5%AE%B6%E4%BA%91-%E5%85%A8%E7%BD%91%E4%BE%9B%E9%94%80_%E5%88%86%E9%94%80%E8%B4%A7%E6%BA%90%E7%B3%BB%E7%BB%9F%E6%8E%A8%E8%8D%90_%E5%85%8D%E8%B4%B9ERP%E8%BF%9B%E9%94%80%E5%AD%98%E8%BD%AF%E4%BB%B6%E5%B9%B3%E5%8F%B0_files/loading3.gif">
				</div>
			</div>
			<div class="modal-backdrop fade" style="background: #ffffff;"></div>
		</div>
	</div>

	<!--代码结束-->
</body>
</html>