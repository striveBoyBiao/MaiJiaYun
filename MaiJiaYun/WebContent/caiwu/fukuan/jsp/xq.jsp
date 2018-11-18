<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--详情  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title></title>
<script type="text/javascript" src="${pageContext.request.contextPath}/caiwu/fukuan/js/jquery.min.js"></script>
<script type="text/javascript">
	//返回按钮
	$(function(){
		
		$("button#but").click(function(){
			
			location.href="${pageContext.request.contextPath}/servlet/cw/Wait_checkServlet?method=zhujiemian&mohu=${mohu}" ;
		});
		
		
		<%--设置数据 --%>
		 shop();
		$("#gys").html("${ waitCheckCg[0].supplierCName}");
		$("#ck").html("${ waitCheckCg[0].wareHouseName}");
		$("#skuTotalQuantity").html("${ waitCheckCg[0].purchaseNumber}");
		$("#skuTotalFee").html("${ waitCheckCg[0].purchaseSum}");
		$("#beizhu").html("${waitCheckCg[0].remark}");
		
	});
	
	//生成表格 数据 
	function shop(){
		var resultHtml="";
		
		<c:forEach items="${waitCheckShop}" var="element">
			resultHtml+="<tr>";
			resultHtml+="<td><img src='${element.goodPicture}' style='height: 50px; width: 50px;' class='img-thumbnail' alt='50x50'></td>";
			resultHtml+="<td>${element.sku}</td>";	
			resultHtml+="<td>${element.goodName}</td>";	
			resultHtml+="<td>${element.goodAttribute}</td>";	
			resultHtml+="<td>${element.purchaseNum}</td>";	
			resultHtml+="<td>${element.quantity}</td>";	
			resultHtml+="<td>${element.purchasePrice}</td>";	
			resultHtml+="<td>${element.purchaseSum}</td>";	
			resultHtml+="<td>${element.remark_1}</td>";
			resultHtml+="</tr>";
		</c:forEach>
		resultHtml+="<tr style='background: #dcdcdc; border: 1px solid #dcdcdc;'>"
		resultHtml+="<td colspan='4' class='fb'>合计：</td>";
		resultHtml+="<td colspan='2' class='fb'>采购数量总计：<span class='red' id='skuTotalQuantity'></span></td>";
		resultHtml+="<td colspan='3' class='fb'>采购总价：<span class='red' id='skuTotalFee'></span></td></tr>";
		$("#body").html(resultHtml);
		
	}
	
	
	
	
	
	
</script>




</head>

<body>
	<!--代码开始-->
	<div class="container" id="container">
		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
		<!--header 开始-->

		<div class="content" id="content">
			<!--titletab star-->
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0; background-color: #FFFFFF">
				<div class="navbar-header">
					<a href="http://maijiayun.cn/#" class="navbar-brand ml20">采购单详情</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<!--<li class="active ml20"><a href="javascript:void(0)"  style="background:#f1f1f1;">采购单详情</a></li>-->
				</ul>
			</div>
			<!--titletab end-->
			<!--panel star-->
			<div class="prl10auto">
				<!--table star-->
				<div class="panel prl10auto mt15" style="padding: 20px 10px;">
					<h5>
						<form class="form-inline" role="form">
							<div class="form-group pr10">供应商:</div>
							<div class="form-group pr20">
								<div class="btn-group" id="gys">兴隆</div>
							</div>
							<div class="form-group pr10">仓库:</div>
							<div class="form-group pr20">
								<div class="btn-group" id="ck">默认仓库</div>
							</div>
						</form>
					</h5>
				</div>
				<!--panle star-->
				<div class="panel prl10auto" style="padding: 20px 10px;">
					<!-- Table -->
					<table class="table" style="margin-bottom: 20px;">
						<thead class=" table-bordered">
							<tr>
								<th>商品图片</th>
								<th>SKU编码</th>
								<th>商品名称</th>
								<th>商品属性</th>
								<th>采购数量</th>
								<th>已入库数量</th>
								<th>单价</th>
								<th>总价</th>
								<th>备注</th>
							</tr>
						</thead>
						<tbody id="body">
							

						
						</tbody>
					</table>
					<!--table end-->
					<!--备注star-->
					<form class="form-horizontal" role="form"
						style="padding: 10px 0px;">
						<div class="form-group">
							<div class="w50 left lh30 fb f14">备注</div>
							<div class="col-sm-5">
								<textarea id="beizhu" rows="3" class="form-control" disabled="disabled"></textarea>
							</div>
						</div>
					</form>
					<!--备注end-->
					<div style="padding: 20px 10px 40px 10px">
						<!-- <button class="btn btn-primary mr5" type="button">保存</button> -->
						<button class="btn btn-default" type="button" id="but" name="bb" >返回</button>
					</div>
					<!--panle end-->
				</div>
			</div>
		</div>
		<div class="contentbox" id="contentbox"
			style="display: none; background: rgb(241, 241, 241);"></div>
		<!--Layout right part end-->



	</div>
	<!--代码结束-->
</body>
</html>