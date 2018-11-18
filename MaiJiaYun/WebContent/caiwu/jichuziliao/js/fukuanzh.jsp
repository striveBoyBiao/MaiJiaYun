<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7">
<![endif]-->
<html
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">

<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta name="keywords"
	content="供销平台,分销平台,分销,供销,货源,分销推荐,货源推荐,供销系统,分销系统,ERP,免费ERP,ERP软件,免费ERP软件,进销存,进销存软件,免费进销存软件">
<meta name="description"
	content="禾唐卖家云独一无二的供销平台，开启供销双方合作的桥梁，无安装，免培训，极致用户体验 。包含寻找优质分销商，一键发布货源信息，一键代发、批发进货轻松接单！让您与分销商的订单业务无缝衔接，供销双方实时互动 ，沟通协作业务拓展不再是难事。">
<meta http-equiv="X-UA-Compatible" content="IE=8,9,chrome=1">
<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>

</head>

<body>
	<!--代码开始-->
	<div class="container" id="container">
		<!--header 开始-->
		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
		<!--header 结束-->
		<!--Layout left part star-->
		<!-- style="position: fixed;left:0, top:0, z-index:1030; display:none;" -->
		<!--<div class="sidebar-nav navbar-fixed-top" id="menu" style="display:none;"></div>-->
		<!--Layout left part end-->

		<!--Layout right part star-->
		<div class="content" id="content">
			<!--titletab star-->
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0;">
				<div class="navbar-header">
					<a href="#" class="navbar-brand ml20">基础资料</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<li id="li-fukuantype" class="ml20 tab active"><a
						href="${pageContext.request.contextPath}/caiwu/jichuziliao/fukuanzh.jsp;" class="">付款账户</a></li>
					<li id="li-shouzhitype" class="ml20 tab"><a
						href="${pageContext.request.contextPath}/caiwu/jichuziliao/shouzhilx.jsp;" class="c6">收支类型</a></li>
					<!-- <li class="pull-right">
                    <form class="form-inline" role="search">
                    <div class="w340">
                        <div class="input-group">
                        <input type="text" placeholder="请输入收支类型" style="width:300px;" class="form-control">
                        <span class="input-group-btn">
                        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>
                        </span>
                        </div>
                    </div>

                    </form>
                  </li> -->
				</ul>
				<!--search end-->
			</div>
			<div class="prl10auto" id="panel">
				<div class="btn-group-block">
					<form role="search" class="form-inline">
						<div class="form-group mr5">
							<button class="btn btn-default" type="button"
								data-target="#add_accountModal" id="addAccount"
								data-toggle="modal">新增</button>
						</div>
						<div class="form-group mr5">
							<button class="btn btn-default" id="btnDel" type="button">删除</button>
						</div>
					</form>
					<!--新增付款账户 end-->
					<div style="display: none;" class="modal fade"
						id="add_accountModal" tabindex="-1" role="dialog"
						aria-labelledby="add_accountModalLabel" aria-hidden="true">
						<div style="width: 410px;" class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="add_accountModalLabel">新增付款账户</h4>
								</div>
								<div class="modal-body">
									<form id="saveAccountForm" method="post"
										style="padding: 10px 0px;" role="form" class="form-horizontal">
										<div class="form-group">
											<div class="w50 left lh30 fb">所属店铺</div>
											<div class="col-sm-10">
												<div class="btn-group" name="eshop">
													<input type="hidden" id="eShopId" validate=""
														showname="所属店铺" name="eShopId" value=""> 
														<input type="hidden" id="eShopName" name="eShopName" value="">
													<input type="hidden" id="isDefault" name="isDefault"
														value="false">
													<button class="btn btn-default" id="eshopVal" type="button">店铺名称</button>
													<button data-toggle="dropdown" style="margin-right: 0"
														class="btn btn-default dropdown-toggle" type="button">
														<span class="caret"></span>
													</button>
													<ul role="menu" class="dropdown-menu"  id = "caigou">
													</ul>
												</div>
											</div>
										</div>
										<!---->
										<div class="form-group">
											<div class="left lh30 fb">开户银行</div>
											<div class="col-sm-10">
												<input type="text" validate="" showname="开户银行" name="bank"
													class="form-control">
											</div>
										</div>
										<!---->
										<div class="form-group">
											<div class="w50 left lh30 fb">账号</div>
											<div class="col-sm-10">
												<input type="text" validate="" showname="账号" name="account"
													class="form-control fb">
											</div>
										</div>
										<!---->
										<div class="form-group">
											<div class="w50 left lh30 fb">备注</div>
											<div class="col-sm-10">
												<textarea class="form-control" name="memo" rows="3"></textarea>
											</div>
										</div>
										<!---->
									</form>
								</div>
								<div style="margin-top: 0px;" class="modal-footer">
									<button type="button" id="saveAccount" class="btn btn-primary" >确定</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">取消</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!--新增付款账户 end-->
				</div>
				<!--table star-->
				<div class="panel">
					<!-- Table -->
					<table class="table table-striped table-hover">
						<thead class=" table-bordered">
							<tr>
								<th><input type="checkbox"></th>
								<th>所属店铺</th>
								<th>开户行</th>
								<th>账号</th>
								<th>默认收款账号</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<!---->

							<tr modelid="181">
								<td style="background-color: rgb(240, 248, 253);"><input
									type="checkbox" ></td>
								<td style="background-color: rgb(240, 248, 253);">卖家云分销</td>
								<td style="background-color: rgb(240, 248, 253);">dca</td>
								<td class="fb" style="background-color: rgb(240, 248, 253);">acfa</td>
								<td style="background-color: rgb(240, 248, 253);">非默认付款帐号
									181</td>
								<td style="background-color: rgb(240, 248, 253);">fcafca</td>
								<td style="background-color: rgb(240, 248, 253);">

									<button type="button" isdefault="true"
										class="btn btn-default mr5 operate-account-set">设为默认</button>

									<a style="cursor: pointer;" data-target="#add_accountModal"
									data-toggle="modal" class="operate-account-edit">详情</a>
								</td>
							</tr>

							<tr modelid="180">
								<td><input type="checkbox"></td>
								<td>卖家云分销</td>
								<td>yi6ti</td>
								<td class="fb">6ti5i</td>
								<td>非默认付款帐号 180</td>
								<td>iiu5</td>
								<td>

									<button type="button" isdefault="true"
										class="btn btn-default mr5 operate-account-set">设为默认</button>

									<a style="cursor: pointer;" data-target="#add_accountModal"
									data-toggle="modal" class="operate-account-edit">详情</a>
								</td>
							</tr>

						</tbody>
					</table>

					<!--table end-->
				</div>
			</div>
			<!--titletab end-->
			<div class="row" style="margin: 0; -moz-user-select: none;"
				onselectstart="return false;" id="paging">
				<div style="float: right;">
					<div style="margin-right: 10px; float: left;">
						<ul class="pagination">
							<li class="dropup">
								<div class="lh30 left">共</div>
								<div class="btn-group" style="margin: 0 5px;">
									<span class="lh30 left fb red" id="totalRecords">2</span>
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
										<li><a href="javascript:void(0);">10</a></li>
										<li><a href="javascript:void(0);">20</a></li>
										<li><a href="javascript:void(0);">50</a></li>
										<li><a href="javascript:void(0);">100</a></li>
										<li><a href="javascript:void(0);">200</a></li>
										<!-- <li><a href="javascript:void(0);">20</a></li>
                            <li><a href="javascript:void(0);">50</a></li> -->
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<div style="width: 350px; float: left;" id="pagingPages">
						<ul class="pagination">
							<li id="last" class="fb fmsun"><a href="javascript:void(0);">&lt;</a>
							</li>

							<li class="page active" page="1"><a
								href="javascript:void(0);">1</a></li>

							<li id="next" class="fb fmsun"><a href="javascript:void(0);">&gt;</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="contentbox" id="contentbox"
			style="display: none; background: rgb(241, 241, 241);"></div>
	</div>
	
	 <script type="text/javascript">
	 		$("#eshopVal").next().click(function(){
	 			var params = null;
	 		 			$.ajax({
	 						type : "get",
	 						url : "/MaiJiaYun/FuKuanZhangHu",
	 						dataType : "json",
	 						success : function(data){
	 							var resultHtml = "";
	 							$.each(data,function(index,element){
	 								resultHtml +="<li id="+index+" onclick=getContent(this.id)><a>"+element.shopNameVo+"</a></li>";
	 							});
	 							$("#caigou").html(resultHtml);
	 						}
	 					});
	 		 		}		
	 		); 
	 		function getContent(id){
	 			var content = $("#"+id).text();
	 			$("#eshopVal").html(content);
	 		}
	 	  


	</script> 
	 <script type="text/javascript">
	$("#saveAccount").click(function(){
		var params = {
				dianpu : $("#eshopVal").text(),
				kaihu : $("input[name=bank]").val(),
				account : $("input[name=account]").val(),
				memo : $("textarea[name=memo]").val() 
		}
		$.ajax({
			type : "get",
			url : "/MaiJiaYun/FuKuanZhangHu",
			data : params,
			dataType : "json",
			success : function(re){
				$("#add_accountModal").css("display", "none");
				$("#add_accountModal").removeClass("in");
			}
		});
	}); 
	</script> 
	<script> </script> 
</body>

</html>