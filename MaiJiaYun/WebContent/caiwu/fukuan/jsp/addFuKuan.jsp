<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.collections.map.HashedMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/caiwu/fukuan/css/them.css" />
<script type="text/javascript">
       var isRead=false;
       var isExit=true;
       var isEmpty=true;
       var isNumOk=false;
	window.onload = function name() {
		$("#accountNumber").val(""); 
		readMethod();
	};
	
	function readMethod(){
		if(isRead==false){
			$("#accountNumber").attr("readonly","readonly")//将input元素设置为readonly
		}else{
			$("#accountNumber").removeAttr("readonly")//将input元素设置为readonly
		}
	}
	
	
	//提交
	function submit() {
		if(checkEmpty()){
			$("#form1").submit();
		}
	}
	//收支类型选择
	function clickChBox(i){
		var b="#"+i;
		var str=$(b).html();
		$("#checked").html(str);
		$("#copyshouzhi").val(str);
		var copyshouzhiv=$("#copyshouzhi").val();
	}
	
    function check(m){
    var n="#"+m;
	 var i=$(n).val();
	  if ( isNaN(i) ) {
		  $(n).val(""); 
		  } 
	  } 
	
	//银行checkbox
	function clickBank(i){
		isRead=true;
		var b="#"+i;
		var c=i+"s";
		var d="#"+c;
		var e=$(d).val();
		var str=$(b).html();
		$("#yinhang").html(str);
		$("#copyYinhang").val(str);
		var copyyinhang=$("#copyYinhang").val();
		$("#accountNumber").val(e);
		readMethod();
	}
	
	//非空验证
	function checkEmpty(){
		var payerName=$("#payerName").val()
		var receivableAmount=$("#receivableAmount").val()
		var receivedAmount=$("#receivedAmount").val()
		var relatedCode=$("#relatedCode").val()
		var copyYinhang=$("#copyYinhang").val()
		var copyshouzhi=$("#copyshouzhi").val()
		var message=$("#message").html()
		if(payerName==""|| payerName==null){
			$("#showErrorTempDiv").html("收款人不能为空");
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
		}else if(copyYinhang==""||copyYinhang==null){
			$("#showErrorTempDiv").html("银行账号不能为空");
			$("#modal-button").click();
			return false;
		}else if(copyshouzhi==""||copyshouzhi==null){
			$("#showErrorTempDiv").html("收支类型不能为空");
			$("#modal-button").click();
			return false;
		}else if(relatedCode==""||relatedCode==null){
			$("#showErrorTempDiv").html("相关单据不能为空");
			$("#modal-button").click();
			return false;
		}else if(message=="账户不存在!"){
			$("#showErrorTempDiv").html("账户ID输入有误");
			$("#modal-button").click();
			return false;
		}else{
			return true;
		}
	}
	
	//检查id是否存在
	function checkBankId(){
		var accountNumber=$("#accountNumber").val();
		var yinhang=$("#yinhang").html();
		$.ajax({
			url :"${pageContext.request.contextPath}/mjy/caiwu/fukuan/servlet/AddServlet?method=bankidCheck",
			type: "post",
			data:{
				yinhang:yinhang,
				accountNumber:accountNumber
			},
			datatype:"json",
			success :function(data){
				var message = data.message;
				if(message=="账户不存在!"){
					if(isRead==false){
						$("#message").html("*");
						isExit=false;
					}else{
						$("#message").css("color","red");
						$("#message").html(message);
						isExit=false;
					}
				}else{
					$("#message").css("color","green");
					$("#message").html(message);
					isExit=true;
				}
			}
		});
		
	}
</script>
</head>
<body class="" style="padding-right: 0px;">
	<!--代码开始-->
	<div class="container" id="container">

		<!--header 开始-->
		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
		<!--header 结束-->
		<div class="content" id="content">
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0;">
				<div class="navbar-header">
					<a href="http://maijiayun.cn/#" class="navbar-brand ml20">添加应付单</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<!--<li class="active ml20 tab"><a href="javascript:void(0);"  style="background:#f1f1f1;">添加应收单</a></li>-->
				</ul>
			</div>
			<!--titletab end-->

			<div class="prl10auto">
				<form id="form1" method="post"
					action="${pageContext.request.contextPath}/mjy/caiwu/fukuan/servlet/AddServlet?method=addFuKuan">
					<!--panel star-->
					<div class="panel prl10auto mt15" style="padding: 20px 10px;">
						<h5>收款人</h5>
						<!--店铺名称 star-->
						<div class="row mt15 f14">
							<div class="col-md-3">
								<div role="form" class="form-inline">
									<div class="form-group">收款人姓名：</div>
									<div class="form-group">
										<input type="text" validate="" showname="收款人姓名" id="payerName"
											name="payerName" style="width: 150px;" placeholder="张三" id=""
											class="form-control"> <font id="payerNameMessage"
											color="red">*</font>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div role="form" class="form-inline">
									<div class="form-group">收款人昵称：</div>
									<div class="form-group">
										<input type="text" validate="" showname="付款人昵称"
											name="payerNickName" style="width: 150px;" placeholder="李四"
											id="" class="form-control">
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div role="form" class="form-inline">
									<div class="form-group">应付款：</div>
									<div class="form-group">
									<input type='text' showname="应付款" id="receivableAmount"
											name="receivableAmount" style="width: 150px;"
											placeholder="0.00"  class="form-control float" onkeyup="check('receivableAmount')" onblur="check('receivableAmount')" />
										<!-- <input type="text" validate="" showname="应付款" id="receivableAmount"
											name="receivableAmount" style="width: 150px;"
											placeholder="0.00" id="" class="form-control float"> -->
									</div>
									<div class="form-group">元</div>
								 <font id="receivableAmountMessage" color="red">*</font>                                                                      
								</div>
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
								<div role="form" class="form-inline">
									<div class="form-group">开户机构：</div>
									<div class="form-group">
										<input type="hidden" name="accountBank" value=""> <input
											type="hidden" validate="" showname="开户机构" name="accountId"
											value=""> <input type="hidden" name="status"
											value="未收款">
										<div class="btn-group select" name="accountBank"
											id="accountBank" val="">
											<button class="btn btn-default" id="yinhang" type="button">选择银行</button>
											<input style="display: none" type="text" id="copyYinhang" value="" name="copyYinhang">
											<button style="height: 34px;" data-toggle="dropdown"
												class="btn btn-default dropdown-toggle" type="button">
												<span class="caret"></span>
											</button>
											<ul style="min-width: 100px;" role="menu"
												class="dropdown-menu" val="">
												<%
													Map<String, String> map1 = new HashedMap();
													map1 = (HashMap) request.getAttribute("accountBank");
													List<String> list1 = new ArrayList();
													for (String str : map1.keySet()) {
														list1.add(str);
													}
													for (int i = 0; i < map1.keySet().size(); i++) {
												%>
												<li value="<%=list1.get(i)%>"><a id="<%=i%>"
													href="javascript:void(0)" onclick="clickBank(<%=i%>)"
													code=""><%=list1.get(i)%></a></li>
												<li style="display: none"><input type="text "
													id="<%=i + "s"%>" value="<%=map1.get(list1.get(i))%>"></li>
												<%
													}
												%>
											</ul>
										</div>
										<font id="shouzhiTypeMessage" color="red">*</font>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div role="form" class="form-inline">
									<div class="form-group">账号：</div>
									<div class="form-group">
										<input type="text" validate="" showname="银行帐号"
											name="accountNumber" style="width: 150px;" placeholder="银行帐号"
											id="accountNumber" onblur="checkBankId()"
											class="form-control" value=""> <font id="message"
											color="red">*</font>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div role="form" class="form-inline">
									<div class="form-group">付款额：</div>
									<div class="form-group">
										<input type="text" validate="" showname="付款额"
											name="receivedAmount" style="width: 150px;" 
											placeholder="0.00" id="receivedAmount" class="form-control float"
											onkeyup="check('receivedAmount')" onblur="check('receivedAmount')">
									</div>
									<div class="form-group">元</div>
									<font id="yinhangMessage" color="red">*</font>
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
								<div role="form" class="form-inline">
									<div class="form-group">收支类型：</div>
									<div class="form-group">
										<div class="btn-group select" name="frType" id="frType" val="">
											<button class="btn btn-default" type="button" id="checked">选择类型</button>
											<input style="display: none" type="text" id="copyshouzhi" value="" name="copyshouzhi">
											<button style="height: 34px;" data-toggle="dropdown"
												class="btn btn-default dropdown-toggle" type="button">
												<span class="caret"></span>
											</button>
											<ul style="min-width: 100px;" role="menu"
												class="dropdown-menu">
												<%
													List<String> list = new ArrayList<>();
													list = (ArrayList) request.getAttribute("shouzhilxType");
													for (int i = 0; i < list.size(); i++) {
												%>

												<li value="<%=list.get(i)%>"><a id="<%=i * 31 + 31%>"
													href="javascript:void(0)"
													onclick="clickChBox(<%=i * 31 + 31%>)" code=""><%=list.get(i)%></a></li>
												<%
													}
												%>

											</ul>
										</div>
										<font id="shouzhiTypeMessage" color="red">*</font>
									</div>
									<input type="hidden" name="type" validate="" showname="收支类型">
								</div>
							</div>
							<div class="col-md-3">
								<div role="form" class="form-inline">
									<div class="form-group">相关单据号：</div>
									<div class="form-group">
										<input type="text" validate="" showname="相关单据号"
											name="relatedCode" style="width: 150px;" placeholder="100"
											id="relatedCode" class="form-control"> <font
											id="relatedCodeMessage" color="red">*</font>
									</div>
								</div>
							</div>
						</div>
						<div style="padding: 20px 15px;" role="form"
							class="form-horizontal">
							<div class="form-group">
								<div class="w50 left lh30 f14">备注</div>
								<div class="col-sm-5">
									<textarea name="memo" class="form-control" rows="5"></textarea>
								</div>
							</div>
						</div>
						<!---店铺名称 end-->
					</div>
				</form>
				<!--panle end-->
				<!--分页 star-->
				<div style="padding: 20px 10px 40px 10px">
					<button id="btnSave" type="button" class="btn btn-primary mr5"
						onclick="submit()">保存</button>

					<a href="${pageContext.request.contextPath }/servlet/cw/fukuan/ShouldPayServlet?method=showAllData">
					<button id="btnReturn" type="button" class="btn btn-default">返回</button></a>
				</div>
				<!--分页 end-->
			</div>
		</div>

		<button type="button" style="display: none"  class="btn btn-primary" data-toggle="modal"
			data-target=".bs-example-modal-sm" id="modal-button">Small modal</button>

		<div class="modal fade bs-example-modal-sm" tabindex="-1"
			role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
			<div style="background:#ff5831;" class="modal-dialog modal-sm" >
				<div style="color:#ffffff;" class="c6 tc" id="showErrorTempDiv">收款人姓名不能为空</div>
			</div>
		</div>

	</div>
	<!--代码结束-->
</body>
</html>