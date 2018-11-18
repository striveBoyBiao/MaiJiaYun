<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<!-- saved from url=(0028)http://maijiayun.cn/sd/merge -->
<html
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
					<a href="http://maijiayun.cn/#" class="navbar-brand ml20">审单</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<li id="li-wait" class="ml20 tab"><a
						href="${pageContext.request.contextPath }/servlet/order/orderServlet?method=shenHe"
						class="c6">待审核 <span></span></a></li>
					<li id="li-merge" class="tab active"><a class=""
						href="${pageContext.request.contextPath }/servlet/order/orderServlet?method=heBing">待合并
							<span></span>
					</a></li>
					<li id="li-split" class="tab"><a class="c6"
						href="${pageContext.request.contextPath }/servlet/order/orderServlet?method=chaiFen">待拆分
							<span></span>
					</a></li>

					<li class="dropdown pull-right" id="li-searchpro"
						style="display: none;"><a href="javascript:void(0);"
						class="dropdown-toggle f12 blue c6" data-toggle="dropdown"
						style="padding: 0px 15px 0; background: none; border: none; font-weight: normal;">高级搜索
							<b class="caret"></b>
					</a>
						<ul class="dropdown-menu Adsearch-menu" style="width: 700px;"
							id="search-pro"></ul></li>

					<li class="pull-right" id="li-query"
						style="padding-top: 12px; display: none;">
						<div class="w340">
							<div class="input-group">
								<input name="q" type="text" class="form-control"
									placeholder="店铺名/物流公司名/订单号/买家姓名/买家旺旺号"> <span
									class="input-group-btn">
									<button type="button" class="btn btn-primary query">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
					</li>
				</ul>
				<!--search end-->
			</div>
			<!--titletab end-->
			<!--panel star-->
			<div class="prl10auto white" id="panel">
				<!-- 功能按钮 star-->
				<div class="btn-group-block">
					<!--手动合单 star-->
					<button type="button" class="btn btn-default mr5"
						data-toggle="modal" id="manualMerge">手动合单</button>
					<!-- Modal -->
					<div class="modal fade" id="mergeModal" tabindex="-1" role="dialog"
						aria-labelledby="mergeModalLabel" aria-hidden="true"></div>
					<!-- /.modal -->
					<!--手动合单 end-->
				</div>
				<!--功能按钮 end-->
				<!--table star-->
				<div class="panel">
					<!--<div class="panel mt15">
       	Table -->
					<table class="table table-striped table-hover" id="orderTable">
						<jsp:include page="/Order/jsp/shenHeLsz.jsp"></jsp:include>
						<tbody>
							<!-- 此处写所有从数据库查出来的订单信息（） -->
						</tbody>
					</table>
					<jsp:include page="/Order/jsp/lieshezhi.jsp"></jsp:include>
					<!-- table end-->
				</div>
				<!-- </div>
				<!--分页 star-->
				<div class="row" style="margin: 0; -moz-user-select: none;"
					onselectstart="return false;" id="paging"></div>
				<!--分页 end-->
				<!-- Modal -->
				<div class="modal fade" id="tableModal" tabindex="-1" role="dialog"
					aria-labelledby="tableModalLabel" aria-hidden="true"></div>
				<!-- /.modal-->
			</div>
			<!--panel end-->
		</div>
		<div class="contentbox" id="contentbox"
			style="display: none; background: rgb(241, 241, 241);"></div>
		<!--Layout right part end-->

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
	<!--代码结束-->
</body>

</html>