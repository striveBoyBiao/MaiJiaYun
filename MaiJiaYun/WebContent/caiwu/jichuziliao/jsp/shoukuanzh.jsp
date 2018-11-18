<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7">
<![endif]-->
<html
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">
<head>
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
						href="cw/fukuantype" class="">付款账户</a></li>
					<li id="li-shouzhitype" class="ml20 tab"><a
						href="szlx.jsp" class="c6">收支类型</a></li>
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
					</div>
					<!--新增付款账户 end-->
				</div>
				<!--   table star -->
				<div class="panel">
					<!-- 	Table -->
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
						</tbody>
					</table>
					<!--  table end -->
				</div>
			</div>
		</div>
	</div>
	<!--代码结束-->
</body>
</html>

