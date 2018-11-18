
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>shouKuanXiangQing</title>
<style>
	.shoukuans{
	height: 160px;overflow: auto;position: absolute;
	}
	
</style>
</head>
<body>

	<!--代码开始-->
	<div class="container" id="container">
		<!-- 加载头部页面 -->
		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
		<div class="content" id="content">
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0; background: #ffffff;">
				<div class="navbar-header">
					<a href="#" class="navbar-brand ml20">收款详情</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<li class="active ml20"><a id="collect_detailModalLabel"
						href="#" style="background: #f1f1f1;">付款详情</a></li>
				</ul>
			</div>
			<!--titletab end-->
			<div class="prl10auto">
				<!--panel star-->
				<div class="panel prl10auto mt15" style="padding: 20px 10px;">
					<h5>付款人</h5>
					<!--店铺名称 star-->
					<div class="row mt15 f14">
						<div class="col-md-3">
							付款人姓名：<span class="fb">${cwShouKuanVO.skPayerName }</span>
						</div>
						<div class="col-md-3">
							付款人昵称：<span class="fb">${cwShouKuanVO.skPayerNickname }</span>
						</div>
						<div class="col-md-3">
							应付款：<span class="fb">${cwShouKuanVO.skPayables }</span>
						</div>
					</div>
					<!---店铺名称 end-->
				</div>
				<!--panle end-->
				<!--panel star-->
				<div class="panel prl10auto" style="padding: 20px 10px;">
					<h5>收款人</h5>
					<div class="row mt15 f14">
						<c:choose>
							<c:when test="${cwShouKuanVO.skState==0 }">						
						<div class="col-md-3">
							开户机构：
							<div class="btn-group select necessary" name="accountId"
								id="accountId" val="158">
								<c:choose>
								<c:when test="${cwShouKuanVO.fkzhBankName!=null }">
								<button class="btn btn-default" id="accountBank" type="button">${cwShouKuanVO.fkzhBankName}</button>
								</c:when>
								<c:otherwise>
								<button class="btn btn-default" id="accountBank" type="button">选择银行</button>
								</c:otherwise>
								</c:choose>					
								<button data-toggle="dropdown" style="height: 34px"
									class="btn btn-default dropdown-toggle" type="button">
									<span class="caret" ></span>
								</button>
								<ul style="min-width: 100px;" role="menu" class="dropdown-menu shoukuans"
									val="1">
									<c:forEach var="fuKuanAccount" items="${fuKuanAccounts }">
									<li value="${fuKuanAccount.fkzhDafaultId }" accountnumber="${fuKuanAccount.fkzhBankId }" class=""><a
										href="javascript:void(0)" code="">${fuKuanAccount.fkzhBankName }</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="col-md-3">
							账号： <input type="text" id="accountNumber" name="accountNumber"
								disabled="true" style="width: 150px;" placeholder="银行帐号"
								validate="" showname="银行帐号" class="form-control"
								value="${cwShouKuanVO.fkzhBankCode }">
						</div>
						<div class="col-md-3">
							<div role="form" class="form-inline">
								<div class="form-group">收款额：</div>
								<div class="form-group">
									<input type="text" style="width: 150px;" value="${cwShouKuanVO.skReceivable }"
										placeholder="100" validate="" showname="收款额"
										id="receivedAmount" class="form-control float">
								</div>
								<div class="form-group">元</div>
							</div>
						</div>
						</c:when>
							<c:otherwise>
						<div class="col-md-3">
							开户机构： <span class="fb">${cwShouKuanVO.fkzhBankName }</span>
						</div>
						<div class="col-md-3">
							账号： <span class="fb">${cwShouKuanVO.fkzhBankCode }</span>

						</div>
						<div class="col-md-3">

							<div role="form" class="form-inline">
								<div class="form-group">收款额：</div>

								<span class="fb">${cwShouKuanVO.skReceivable }</span>

								<div class="form-group">元</div>
							</div>

						</div>
							</c:otherwise>
						</c:choose>
						
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
							收支类型：<span class="fb">${cwShouKuanVO.shouzhilxType }</span>
						</div>
						<div class="col-md-3">
							相关单据号：<span class="fb">${cwShouKuanVO.skReceiptsCode }</span>
						</div>
					</div>
					<div class="row mt15 f14">
						<div class="col-md-3">
							创建时间：<span class="fb">${cwShouKuanVO.skCreateDate }</span>
						</div>
						<div class="col-md-3">
							创建人：<span class="fb">${cwShouKuanVO.skCreator }</span>
						</div>
					</div>
					<form style="padding: 20px 15px;" role="form"
						class="form-horizontal">
						<div class="form-group">
							<div class="w50 left lh30 f14">备注</div>
							<div class="col-sm-5">
								<textarea id="memo" class="form-control" rows="5" >${cwShouKuanVO.skBeiZhu }</textarea>
							</div>
						</div>	
					</form>
					<!---店铺名称 end-->
				</div>
				<!--panle end-->
				<!--分页 star-->
				<div style="padding: 20px 10px 40px 10px">
					<c:if test="${cwShouKuanVO.skState==0 }">									
						<button id="btnSave" type="button" class="btn btn-primary mr5">保存</button>
					</c:if>
					<button id="btnReturn" type="button" class="btn btn-default">返回</button>
					<input type="hidden" id="shoukuanid" value="7578283">
				</div>
				<!--分页 end-->
			</div>
		</div>
		<div style="width: 300px; height: 80px; left: 533px; overflow: hidden; display: none;" class="modal" id="keeperrorModal" tabindex="-1" role="dialog" aria-labelledby="logisticsModalLabel" aria-hidden="false">
		    <div class="modal-dialog" style="width:300px; margin:52px 0 0 0;">
		      <div style="background:#ff5831; border-radius: 0px; border:none" class="modal-content">
		        <div style="padding:5px;" class="modal-body">
		          <!--part one-->
		          <div style="color:#ffffff;" class="c6 tc" id="showErrorTempDiv">请选择收款银行</div>
		          <!--part one end-->
		        </div>
		      </div>
		    </div>
 		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			var skState = ${cwShouKuanVO.skState};
			var defaultBankId = ${cwShouKuanVO.fkzhBankId};
			//获取当前页面的url地址
			var href = window.location.href;
			var skId = href.substring(href.indexOf("=")+1);
			//改变地址栏内容
			window.history.pushState(null, "", "${pageContext.request.contextPath}/servlet/cw/shouKuanXiangQing/"+skId);
			$("#btnReturn").click(function() {
				//返回上一步操作
				//window.history.back(-1);
				if(skState==0){
					location.href ="${pageContext.request.contextPath}/servlet/cw/shouKuan";
				}else if(skState==1){
					location.href ="${pageContext.request.contextPath}/servlet/cw/yiShou";
				}else{
					location.href ="${pageContext.request.contextPath}/servlet/cw/shouKuanHuaiZhang";
				}
			});
			
			var fkzhBankId=0;
			$(".dropdown-menu li a").click(function(){
				fkzhBankId =$(this).parent("li").val(); 
				var accountnumber = $(this).parents("li").attr("accountnumber");
			 	$("#accountNumber").val(accountnumber);
				$("#accountBank").text($(this).html());
			});
			var skReceivable=0;
			$(document).on('keyup','#receivedAmount',function(){
				skReceivable = $("#receivedAmount").val();
				if(isNaN(skReceivable)){
					$("#receivedAmount").val("");
				}			
			});		
			$("#btnSave").click(function(){			
				if(fkzhBankId!=0){
					fkzhBankId = fkzhBankId;
				}else{
					if(defaultBankId!=0){
						fkzhBankId = defaultBankId;
					}					
				}
				if(fkzhBankId==0){
					$("#keeperrorModal").modal();
					return;
				}
				var skBeiZhu = $("#memo").val() ;
				if(skReceivable==""){
					skReceivable = 0;
				}
				$.ajax({
					url : "${pageContext.request.contextPath}/servlet/cw/queryShouKuanByParams",
					type : "post",
					data : {
						method:"updateShouKuanXiangQing",
						skId:skId,
						skBeiZhu : skBeiZhu,
						skReceivable:skReceivable,
						fkzhBankId:fkzhBankId
					},
					datatype : "json",					
					success:function(data) {
						location.href ="${pageContext.request.contextPath}/servlet/cw/shouKuan";
					}
				});
			});
		});
	</script>
</body>
</html>