
<%@page
	import="mjy.caiwu.jichuziliao.service.impl.FuKuanAccountServiceImpl"%>
<%@page import="mjy.caiwu.jichuziliao.service.FuKuanAccountService"%>
<%@page import="mjy.caiwu.jichuziliao.vo.FuKuanAccountVO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="mjy.caiwu.jichuziliao.po.ShouZhiTypePO"%>
<%@page
	import="mjy.caiwu.jichuziliao.service.impl.ShouZhiTypeServiceImpl"%>
<%@page import="mjy.caiwu.jichuziliao.vo.ShouZhiTypeVO"%>
<%@page import="mjy.caiwu.jichuziliao.service.ShouZhiTypeService"%>
<%@page import="java.util.List"%>

<%@page import="mjy.caiwu.shoukuan.service.impl.CwShouKuanServiceImpl"%>
<%@page import="mjy.caiwu.shoukuan.service.CwShouKuanService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
	.shoukuans{
	height: 160px;overflow: auto;position: absolute;
	}
	
</style>
</head>
<body>
	<!--代码开始-->
	<div class="container" id="container">
		<!--header 开始-->

		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>

		<div class="content" id="content">
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0;">
				<div class="navbar-header">
					<a href="#" class="navbar-brand ml20">添加应收单</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<!--<li class="active ml20 tab"><a href="javascript:void(0);"  style="background:#f1f1f1;">添加应收单</a></li>-->
				</ul>
			</div>
			<!--titletab end-->


			<div class="prl10auto">

				<form id="form1" action="">
					<!--panel star-->
					<div class="panel prl10auto mt15" style="padding: 20px 10px;">
						<h5>付款人</h5>
						<!--店铺名称 star-->
						<div class="row mt15 f14">
							<div class="col-md-3">
								<div role="form" class="form-inline">
									<div class="form-group">付款人姓名：</div>
									<div class="form-group">
										<input type="text" validate="" showname="付款人姓名"
											name="payerName" style="width: 150px;" placeholder="张三"
											id="payerName" class="form-control" value="">
									</div>

								</div>
							</div>
							<div class="col-md-3">
								<div role="form" class="form-inline">
									<div class="form-group">付款人昵称：</div>
									<div class="form-group">
										<input type="text" validate="" showname="付款人昵称"
											name="payerNickName" style="width: 150px;" placeholder="李四"
											id="payerNickName" class="form-control">
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div role="form" class="form-inline">
									<div class="form-group">应收款：</div>
									<div class="form-group">
										<input type="text" validate="" showname="应收款"
											name="receivableAmount" style="width: 150px;"
											placeholder="0.00" id="receivableAmount"
											class="form-control float" onkeyup="check('receivableAmount')" onblur="check('receivableAmount')">
											<!-- 只能输入数字和小数点 -->
											<!-- onkeyup="value=value.replace(/[^\d.]/g,'')" -->
											<!-- 出数字外不可输入其他字符 -->
											<!-- onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" -->
									</div>
									<div class="form-group">元</div>
								</div>
							</div>
						</div>
						<!---店铺名称 end-->
					</div>
					<!--panle end-->
					<!--panel star-->
					<div class="panel prl10auto" style="padding: 20px 10px;">
						<h5>收款人</h5>
						<!--仓库名称 star-->
						<div class="row mt15 f14">
							<div class="col-md-3">
								<div role="form" class="form-inline">
									<div class="form-group">开户机构：</div>
									<div class="form-group">
										<input type="hidden" name="accountBank" value="农业"> <input
											type="hidden" validate="" showname="开户机构" name="accountId"
											value="155"> <input type="hidden" name="status"
											value="未收款">
										<div class="btn-group select" name="accountBank"
											id="accountBank" val="">
											<button class="btn btn-default" id="yinhang" type="button">选择账户</button>
											<button style="height: 34px;" data-toggle="dropdown"
												class="btn btn-default dropdown-toggle" type="button">
												<span class="caret"></span>
											</button>
											<ul style="min-width: 100px;" role="menu"
												class="dropdown-menu shoukuans" value="" id="fukuanzhanghu">
												
												<c:forEach var="fkAccount" items="${fkAccount}">
												<li name="${fkAccount.fkzhDafaultId}" value="${fkAccount.fkzhBankId}"><a href="javascript:void(0)" code="">${fkAccount.fkzhBankName}</a></li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div role="form" class="form-inline">
									<div class="form-group">账号：</div>
									<div class="form-group">
										<input type="text" validate="" showname="银行帐号" disabled="true"
											name="accountNumber" style="width: 150px;" placeholder="银行帐号"
											id="accountNumber" class="form-control" value="">
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div role="form" class="form-inline">
									<div class="form-group">收款额：</div>
									<div class="form-group">
										<input type="text" validate="" showname="收款额"
											name="receivedAmount" style="width: 150px;"
											placeholder="0.00" id="receivedAmount"
											class="form-control float"  onkeyup="check('receivedAmount')" onblur="check('receivedAmount')" >
											
									</div>
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

						<div class="row mt15 f14">
							<div class="col-md-3">
								<div role="form" class="form-inline">
									<div class="form-group">收支类型：</div>
									<div class="form-group">
										<div class="btn-group select" name="frType" id="frType"
											value="">
											<button class="btn btn-default" type="text" id="shouzhilx1">选择类型</button>
											<button style="height: 34px;" data-toggle="dropdown"
												class="btn btn-default dropdown-toggle" type="button">
												<span class="caret"></span>
											</button>
										
											<ul style="min-width: 100px;" role="menu"
												class="dropdown-menu shoukuans" id="shouzhilx2">
											
											<c:forEach var="shouzhilxs" items="${shouzhilxs}">
												<li value="${shouzhilxs.shouzhilxId}" id="test1"><a
													href="javascript:void(0)" code="">${shouzhilxs.shouzhilxType}</a></li>
											</c:forEach>
											
											</ul>
											
										</div>
									</div>
									<input type="hidden" name="type1" value="2" showname="收支类型">
								</div>
							</div>
							<div class="col-md-3">
								<div role="form" class="form-inline">
									<div class="form-group">相关单据号：</div>
									<div class="form-group">
										<input type="text" validate="" showname="相关单据号"
											name="relatedCode" style="width: 150px;" placeholder="100"
											id="relatedCode" class="form-control">
									</div>
								</div>
							</div>
						</div>
						<div style="padding: 20px 15px;" role="form"
							class="form-horizontal">
							<div class="form-group">
								<div class="w50 left lh30 f14">备注</div>
								<div class="col-sm-5">
									<textarea name="memo" id="memo" class="form-control" rows="5"></textarea>
								</div>
							</div>
						</div>

					</div>
				</form>
				<!--分页 star-->
				<div style="padding: 20px 10px 40px 10px">
					<button id="btnSave" type="submit" class="btn btn-primary mr5">保存</button>
					<button id="btnReturn" type="button" class="btn btn-default">返回</button>
				</div>

				<!--分页 end-->

				<!--panle end-->

				<!--分页 end-->
			</div>

		</div>
		<script type="text/javascript">
			$(document).ready(function() {													
		
				var accountnumber;//收款人开户银行
																		
				var shouzhilxID;//收支类型ID														
				
				//点击收支类型
				$("#shouzhilx2 li a").click(function() {
					$("#shouzhilx1").html($(this).html());
					shouzhilxID = $(this).parents("li").attr("value");
					});
				//点击银行
				$("#fukuanzhanghu li a").click(function(){
					$("#yinhang").html($(this).html());
					$("#accountNumber").val($(this).parents("li").attr("value"));
					//$("#fukuanzhanghu").val($(this).parents("li").attr("name"));
					accountnumber=$(this).parents("li").attr("name");
					});
				//点击返回
				$("#btnReturn").click(function() {
					location.href = "${pageContext.request.contextPath}/servlet/cw/shouKuan";
					});
				//点击保存
				$("#btnSave").click(function() {
					var payerName = $("#payerName").val();//付款人
					var payerNickName = $("#payerNickName").val();//付款人昵称					
					var receivableAmount = $("#receivableAmount").val();//应付款
					var receivedAmount = $("#receivedAmount").val();//应收款
					var relatedCode = $("#relatedCode").val();//相关单据号														
					var memo = $("#memo").val();//备注
					/* if(payerName!=null&&payerNickName!=null&&receivableAmount!=null&&receivedAmount!=null&&relatedCode!=null&&accountnumber!=null&&shouzhilxID!=null){
						
					}else{ */
						if(payerName==""|| payerName==null){
							$("#showErrorTempDiv").html("付款人不能为空");
							$("#modal-button").click();
							return false;
						}else if(payerNickName==""||payerNickName==null){
							$("#showErrorTempDiv").html("付款人昵称不能为空");
							$("#modal-button").click();
							return false;
						}else if(receivableAmount==""||receivableAmount==null){
							$("#showErrorTempDiv").html("应付款不能为空");
							$("#modal-button").click();
							return false;
						}else if(receivedAmount==""||receivedAmount==null){
							$("#showErrorTempDiv").html("付款额不能为空");
							$("#modal-button").click();
							return false;
						}else if(accountnumber==""||accountnumber==null){
							$("#showErrorTempDiv").html("银行账号不能为空");
							$("#modal-button").click();
							return false;
						}else if(shouzhilxID==""||shouzhilxID==null){
							$("#showErrorTempDiv").html("收支类型不能为空");
							$("#modal-button").click();
							return false;
						}else if(relatedCode==""||relatedCode==null){
							$("#showErrorTempDiv").html("相关单据不能为空");
							$("#modal-button").click();
							return false;
						}else{
							location.href = "${pageContext.request.contextPath}/servlet/cw/queryShouKuanByParams?payerName="
								+ payerName
								+ "&payerNickName="
								+ payerNickName
								+ "&receivableAmount="
								+ receivableAmount
								+ "&accountnumber="
								+ accountnumber
								+ "&receivedAmount="
								+ receivedAmount
								+ "&shouzhilxID="
								+shouzhilxID
								+"&relatedCode="
								+ relatedCode
								+ "&memo="
								+ memo
								+"&method=addShouKuan";
						}
					/* } */
					});
				 
				});
			//只准输入数字和一个小数点
			function check(m){
			    var n="#"+m;
				 var i=$(n).val();
				  if ( isNaN(i) ) {
					  $(n).val(""); 
					  } 
				  }
			
		</script>
		<div class="contentbox" id="contentbox"
			style="display: none; background: rgb(241, 241, 241);"></div>
		<!--Layout right part end-->
		
		<button type="button" style="display: none"  class="btn btn-primary" data-toggle="modal"
			data-target=".bs-example-modal-sm" id="modal-button">Small modal</button>

		<div class="modal fade bs-example-modal-sm" tabindex="-1"
			role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
			<div style="background:#ff5831;" class="modal-dialog modal-sm" >
				<div style="color:#ffffff;" class="c6 tc" id="showErrorTempDiv">收款人姓名不能为空</div>
			</div>
		</div>
		
		
		
		<div id="spinner" style="display: none;">
			<div class="modal fade" aria-hidden="false" role="dialog"
				tabindex="-1" style="display: block;">
				<div class="modal-dialog tc" style="margin-top: 300px;">
					<img src="img/loading3.gif">
				</div>
			</div>
			<div class="modal-backdrop fade" style="background: #ffffff;"></div>
		</div>


	</div>
</body>
</html>