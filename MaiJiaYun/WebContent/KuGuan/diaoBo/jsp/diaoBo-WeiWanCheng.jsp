<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>
<base href="/" />
<!-- <html style=""
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">
 -->
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta name="keywords"
	content="供销平台,分销平台,分销,供销,货源,分销推荐,货源推荐,供销系统,分销系统,ERP,免费ERP,ERP软件,免费ERP软件,进销存,进销存软件,免费进销存软件">
<meta name="description"
	content="禾唐卖家云独一无二的供销平台，开启供销双方合作的桥梁，无安装，免培训，极致用户体验 。包含寻找优质分销商，一键发布货源信息，一键代发、批发进货轻松接单！让您与分销商的订单业务无缝衔接，供销双方实时互动 ，沟通协作业务拓展不再是难事。">
<meta http-equiv="X-UA-Compatible" content="IE=8,9,chrome=1">
<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">

<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/global.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/KuGuan/diaoBo/js/weiwancheng.js"></script>

</head>

	<div class="container" id="container">

		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>

		<!--闪屏开始-->
		<div id="topad" class="all"></div>
		<!--闪屏结束-->

		<div class="content" id="content">

			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px;">
				<div class="navbar-header">
					<a href="#" class="navbar-brand ml20">调拨单</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<li id="li-uncomplete" class="ml20 tab active"><a href="#"
						class="">未完成 <span></span>
					</a></li>
					<li id="li-complete" class="tab"><a class="c6"
						href="${pageContext.request.contextPath}/servlet/kg/DiaoboYiWanChengServlet">已完成</a></li>
					<li class="pull-right" id="li-query" style="padding-top: 12px;">
						<div class="w340">
							<div class="input-group" id="query1">
								<input name="q" class="form-control" placeholder="调拨单号/调出仓/调入仓"
									value="" type="text"> <span class="input-group-btn">
									<button type="button" class="btn btn-primary query" onclick="querydiaobo()">
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
				<div class="btn-group-block">
					<a
						href="${pageContext.request.contextPath}/servlet/kg/DiaoboAddServlet"><button
							class="btn btn-default mr5" id="addDiaobo" type="button">添加调拨单</button></a>
					<button class="btn btn-default" id="batchDelete" type="button"
						data-target="#model1" data-toggle="" onclick="deletebatch()">批量删除</button>
					
					<!-- model -->
					<div class="bootbox modal fade bootbox-confirm in" tabindex="-1" id="model1"
						role="dialog" style="display: none;" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-body">
									<button type="button" class="bootbox-close-button close"
										data-dismiss="modal" aria-hidden="true"
										style="margin-top: -10px;">×</button>
									<div class="bootbox-body" id="pandiantext">确认删除盘点单么？</div>
								</div>
								<div class="modal-footer">
									<button data-bb-handler="cancel" type="button"
										class="btn btn-default" data-dismiss="modal">取消</button>
									<button data-bb-handler="confirm" type="button"
										class="btn btn-primary" data-dismiss="modal" id="sure1" data-toggle="" data-target="#model1" onclick="sure()">确认</button>
								</div>
							</div>
						</div>
					</div>

					<div class="btn-group mr5" id="divImport">
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-default" data-toggle="modal"
							data-target="#myModal1">导出</button>

						<!-- Modal -->
						<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h6 class="modal-title" id="myModalLabel">请选择您要导出的调拨单</h6>
									</div>
									<div class="modal-body">...</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">OK</button>
									</div>
								</div>
							</div>
						</div>

						<button id="importOrderListButton" type="button"
							class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							<span class="glyphicon glyphicon-save mr5"></span><span
								class="f10" id="taskCount" style="display: none;"></span>
						</button>
						<ul id="importOrderUl" aria-labelledby="importOrderListButton"
							style="width: 340px; height: 200px;" role="menu"
							class="dropdown-menu scrollspy-example">

						</ul>
					</div>
					<button type="button" class="btn btn-default " data-toggle="modal"
						data-target="#myModal2">导入</button>

					<!-- Modal -->
					<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">导入调拨单</h4>
								</div>

								<div class="modal-body">

									<h5 class="modal-title" id="myModalLabel">
										1. 请先下载“调拨单信息导入模板”<a href="#">点此下载;</a>
									</h5>
									<h6 class="modal-title" id="myModalLabel">2.第一行中，调出仓库“必填”;</h6>
									<h6 class="modal-title" id="myModalLabel">3.第一行中，调入仓库“必填”;</h6>
									<h6 class="modal-title" id="myModalLabel">4.商品列表中，sku编码，调出数量“必填”;</h6>
									<hr />

									<div class="form-group">
										<input type="file" id="exampleInputFile">
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">取消</button>
									<button type="button" class="btn btn-primary">导入</button>
								</div>
							</div>
						</div>
					</div>

					<div class="modal fade" id="importOrderModal" tabindex="-1"
						role="dialog" aria-labelledby="daoruModalLabel" aria-hidden="true"
						style="display: none;"></div>
					<!-- 调拨单文件上传等待提示框 start -->
					<div id="uploadWaitingModel" style="position: fixed;"></div>
				</div>
				<!--table star-->
				<div class="panel" id="diaobodanstate">
					<!-- Table -->
					<table class="table table-striped table-hover" id="allocationTable">
						<thead class=" table-bordered">
							<tr>
								<th><input type="checkbox" onclick="checkAll(this.checked)"></th>
								<th>调拨单编号</th>
								<th>创建时间</th>
								<th>创建人</th>
								<th>审核人</th>
								<th>审核时间</th>
								<th>调出仓库</th>
								<th>调入仓库</th>
								<th>调拨状态</th>
								<th>操作</th>

							</tr>
						</thead>
						<tbody id="tbody">
							<c:forEach var="diaobo" items="${pageInfo.pageData }" varStatus="st">
								<tr>
									<td><input type="checkbox" name="diaobodancheck"></td>
									<td id="diaobo_Code${st.index }">${diaobo.diaobodanCode }</td>
									<td>${diaobo.diaobodanSetTime }</td>
									<td>${diaobo.diaobodanCreater }</td>
									<td>${diaobo.diaobodanAuditor }</td>
									<td>${diaobo.diaobodanAudittime }</td>
									<td>${diaobo.diaobodanOutStore }</td>
									<td>${diaobo.diaobodanInStore }</td>
									<td id="diaobo_state${st.index }">${diaobo.diaoboState }</td>
				
									<td style="padding-left: -150px;">
										<button id="diaobo_btn${st.index }" type='button' class='btn btn-default mr5'
											data-toggle='modal' style='visibility: hidden;' onclick="diaoboSure(${st.index })">确认调拨</button>
										<a href="#" id="xiangqing${st.index }">详情</a>
									</td>
									<script type="text/javascript">
										var bb=document.getElementById("diaobo_state${st.index }");
										var code=document.getElementById("diaobo_Code${st.index }");
										var diaobocode=code.innerHTML;
										var diaobostate=bb.innerHTML;
										var cc=${pageInfo.pageSize};
										//for (var a = 0; a < cc; a++) {
											var aa=${st.index};
										if(diaobostate=="待审核"){
											
											//console.log(bb);
											var ss="#diaobo_btn"+aa;
											//console.log(ss);
											$(ss).css("visibility","visible");
											
											
										}
										//}
										var xingqing="#xiangqing"+aa;
										//console.log(ss);
										$(xingqing).attr("href","${pageContext.request.contextPath}/servlet/kg/DiaoboAddServlet?diaobocode="+diaobocode);
										
										
										//}
									</script>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<!--分页 -->
					<jsp:include page="/KuGuan/diaoBo/jsp/pagination.jsp">
						<jsp:param
							value="${pageContext.request.contextPath }/WeiwanchengServlet1"
							name="url" />
					</jsp:include>

				</div>

				<div class="contentbox" id="contentbox"
					style="background: rgb(241, 241, 241) none repeat scroll 0% 0%; display: none;"></div>
				<!--Layout right part end-->

				<div id="spinner" style="display: none;">
					<div class="modal fade" aria-hidden="false" role="dialog"
						tabindex="-1" style="display: block;">
						<div class="modal-dialog tc" style="margin-top: 300px;">
							<img src="loading3.gif">
						</div>
					</div>
					<div class="modal-backdrop fade"
						style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;"></div>
				</div>
			</div>

			<!--搜索 end-->
			<!--2-->
			<div class="box-row">
				<div class="box-cell">
					<div class="box-inner plate">
						<ul class="media-list m-userinfo scrollspy-example"
							style="margin-bottom: 0px; height: 100%; margin-top: 0px;"
							id="chatGroupSendingContactList">
						</ul>
					</div>
				</div>
			</div>



			<div style="width: 300px; height: 80px; display: none;" class="modal"
				id="keepsuccessModal" tabindex="-1" role="dialog"
				aria-labelledby="logisticsModalLabel" aria-hidden="false">
				<div class="modal-dialog"
					style="width: 300px; margin: 52px 0px 0px;">
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
				<div class="modal-dialog"
					style="width: 300px; margin: 52px 0px 0px;">
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
				role="dialog" tabindex="-1" id="edit_accountModal"
				class="modal fade" style="display: none;"></div>

			<div id="modal"></div>

		</div>
	</div>
</body>
</html>
