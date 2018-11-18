<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function href() {
		location.href = "${pageContext.request.contextPath }/servlet/cw/fukuan/bad_pay?method=showAllData";
	}
</script>
<body>
	<div class="container" id="container">
		<jsp:include page="/Common/jsp/navigation.jsp" />
	</div>
	<div class="content" id="content">
		<div class="collapse navbar-collapse navbar-default navbar-titletab"
			style="padding: 0px 0 0 0; background: #ffffff;">
			<div class="navbar-header">
				<a href="#" class="navbar-brand ml20">付款详情</a>
			</div>
			<ul class="nav nav-tabs f14 fb">
			</ul>
		</div>
		<!--titletab end-->
		<div class="prl10auto">
			<!--panel star-->
			<div class="panel prl10auto mt15" style="padding: 20px 10px;">
				<h5>收款人</h5>
				<!--店铺名称 star-->
				<div class="row mt15 f14">
					<div class="col-md-3">
						收款人姓名：<span class="fb">${bad_pays[0].fkSkName }</span>
					</div>
					<div class="col-md-3">
						收款人昵称：<span class="fb">${bad_pays[0].fkSkNickName }</span>
					</div>
					<div class="col-md-3">
						应收款：<span class="fb">${bad_pays[0].fkShouldpayMoney }</span>
					</div>
				</div>
				<!---店铺名称 end-->
			</div>
			<!--panle end-->
			<!--panel star-->
			<div class="panel prl10auto" style="padding: 20px 10px;">
				<h5>付款人</h5>
				<!--仓库名称 star-->
				<div class="row mt15 f14">
					<div class="col-md-3">
						开户机构： <span class="fb">${bad_pays[0].other3 }</span>
					</div>
					<div class="col-md-3">
						账号： <span class="fb">${bad_pays[0].other5 }</span>
					</div>
					<div class="col-md-3">
					
					
					
						<div role="form" class="form-inline">
							<div class="form-group">付款额：</div>
							<span class="fb"></span> ${bad_pays[0].fkPayMoney }
							<div class="form-group">元</div>
						</div>

					</div>
				</div>
				<!---店铺名称 end-->
			</div>
			<!--panle end-->
			<!--panel star-->
			<div class="panel prl10auto mt15" style="padding: 20px 10px;">
				<h5>单据相关</h5>
				<!--店铺名称 star-->
				<div class="row mt15 f14">
					<div class="col-md-3">
						收支类型：<span class="fb">${bad_pays[0].other2 }</span>
					</div>
					<div class="col-md-3">
						相关单据号：<span class="fb">${bad_pays[0].fkNo }</span>
					</div>
				</div>
				<div class="row mt15 f14">
					<div class="col-md-3">
						创建时间：<span class="fb">${bad_pays[0].fkCreaterTime }</span>
					</div>
					<div class="col-md-3">
						创建人：<span class="fb">${bad_pays[0].other1 }</span>
					</div>
				</div>
				<form style="padding: 20px 15px;" role="form"
					class="form-horizontal">
					<div class="form-group">
						<div class="w50 left lh30 f14">备注</div>
						<div class="col-sm-5">
							<textarea id="memo" class="form-control" rows="5">${bad_pays[0].fkRemark }</textarea>
						</div>
					</div>
				</form>
				<!---店铺名称 end-->
			</div>
			<!--panle end-->
			<!--分页 star-->
			<div style="padding: 20px 10px 40px 10px">

				<button id="btnReturn" type="button" class="btn btn-default"
					onclick="href()">返回</button>
				<input type="hidden" id="fukuanid" value="100423">

			</div>
			<!--分页 end-->
		</div>
	</div>
</body>
</html>