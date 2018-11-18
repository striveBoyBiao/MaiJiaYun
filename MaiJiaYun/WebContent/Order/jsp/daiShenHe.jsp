<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<!-- saved from url=(0027)http://maijiayun.cn/sd/wait -->
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/Order/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/Order/css/bootstrap-datetimepicker.min.css" />
<script type="text/javascript">

</script>
</head>

<body>
	<!--代码开始-->
	<div class="container" id="container">
		<!--header 开始-->

		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>

		<%-- 		<script type="text/javascript" src="${pageContext.request.contextPath }/Order/js/MyStrap.js"></script> --%>

		<!--日期插件-->
		<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/Order/js/bootstrap-datetimepicker.fr.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/Order/js/bootstrap-datetimepicker.min.js"></script>
		<script src="${pageContext.request.contextPath }/Order/js/daiShenHe.js" type="text/javascript" charset="utf-8"></script> --%>
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
					<li id="li-wait" class="ml20 tab active"><a
						href="${pageContext.request.contextPath }/servlet/order/orderServlet?method=shenHe"
						class="">待审核 <span></span></a></li>
					<li id="li-merge" class="tab"><a class="c6"
						href="${pageContext.request.contextPath }/servlet/order/orderServlet?method=heBing">待合并
							<span></span>
					</a></li>
					<li id="li-split" class="tab"><a class="c6"
						href="${pageContext.request.contextPath }/servlet/order/orderServlet?method=chaiFen">待拆分
							<span></span>
						</a>
					</li>
					
					<jsp:include page="/Order/jsp/gaojisousuo.jsp"></jsp:include>
					<!---->
					<!---->
				</ul>

				
			
				<!--search end-->
			</div>
			<!--titletab end-->
			<!--panel star-->
			<div class="prl10auto white" id="panel">
				<!--功能按钮 star-->
				<div class="btn-group-block">
					<button type="button" class="btn btn-default mr5" id="batchAudit">批量审核</button>
					<!--修改物流 star-->
					<button id="changeExpress" type="button"
						class="btn btn-default mr5" data-toggle="modal"
						data-target="#changeExpressModal">修改物流</button>
					<!-- Modal -->
					<div class="modal fade" id="changeExpressModal" tabindex="-1"
						role="dialog" aria-labelledby="changeExpressModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" style="width: 350px;">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="changeExpressModalLabel">修改物流</h4>
								</div>
								<div class="modal-body">
									<!--part one-->
									<form role="input" class="navbar-form">
										<!-- Split button -->
										<div class="left btn-group-text">请选择物流公司</div>
										<div class="btn-group mr20 select" title="物流公司"
											id="expressCompanyId">
											<button class="btn btn-default" type="button"
												style="padding-left: 18px; text-align: left; width: 140px;">物流公司</button>
											<button data-toggle="dropdown"
												class="btn btn-default dropdown-toggle" type="button">
												<span class="caret"></span> <span class="sr-only">Toggle
													Dropdown</span>
											</button>
											<ul role="menu" class="dropdown-menu">

											</ul>
										</div>
									</form>
									<!--part one end-->
									<!--part two-->
									<div class="c6 tl lh30 pt10">注意：只有未审核并且尚未发货的订单才可以修改</div>
									<!--part two end-->
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary ok">确定</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">取消</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
					<!--修改物流 end-->
					<!--手动合单 star-->
					<button type="button" class="btn btn-default mr5"
						data-toggle="modal" id="manualMerge">手动合单</button>
					<!-- Modal -->
					<div class="modal fade" id="mergeModal" tabindex="-1" role="dialog"
						aria-labelledby="mergeModalLabel" aria-hidden="true"></div>
					<!-- /.modal -->
					<!--手动合单 end-->
					<!--手工拆单 star-->
					<button id="manualSplit" type="button" class="btn btn-default mr5"
						data-toggle="modal">手工拆单</button>
					<!-- Modal -->
					<div class="modal fade" id="splitModal" tabindex="-1" role="dialog"
						aria-labelledby="splitModalLabel" aria-hidden="true"></div>
					<!-- /.modal -->
					<!--手工拆单 end-->
					<!-- Split button -->
					<div class="btn-group">
						<button type="button" class="btn btn-default">批量 . . .</button>
						<button type="button" class="btn btn-default dropdown-toggle"
							data-toggle="dropdown">
							<span class="caret"></span> <span class="sr-only">Toggle
								Dropdown</span>
						</button>
						<ul class="dropdown-menu" role="menu" style="min-width: 94px;">
							<li><a data-toggle="modal" id="batchLock">锁单</a></li>
							<li><a id="batchUnLock">解锁</a></li>
						</ul>
					</div>
					<input type="checkbox" id="quanbuzhankai">展开全部
				</div>

				<!--功能按钮 end-->
				<!--table star-->
				<div class="panel">
					<!-- Table -->

					<table class="table table-striped table-hover" id="orderTable">
						<jsp:include page="/Order/jsp/shenHeLsz.jsp"></jsp:include>

						<!-- 此处写所有从数据库查出来的订单信息（） -->
						<tbody>
							<tr>
								<td colspan="42" class="h30"
									style="border-bottom: 3px solid #cccccc; border-top: none">
									<span class="caret"></span> <span class="fb"> 更早 </span> <!-- <a href="javascript:void(0);">(100)</a> -->
								</td>
							</tr>
							<!-- 循环tr -->
							<jsp:include page="/Order/jsp/info.jsp"></jsp:include>
							<!-- ------------------>
							<!--是否隐藏-->

							<!-- 此处添加商品详情 -->
							

							<!--是否隐藏-->
						</tbody>
						<!-- 总的tbody -->
					</table>
					<!-- -------------------- -->
					<!-- -------------------- -->
					<jsp:include page="/Order/jsp/lieshezhi.jsp"></jsp:include>


					<!--table end-->
					<div aria-hidden="true" aria-labelledby="lockinfoModalLabel"
						role="dialog" tabindex="-1" id="lockinfoModal" class="modal fade"
						style="display: none;"></div>
				</div>
				<!--分页 star-->
				<div class="row" style="margin: 0; -moz-user-select: none;"
					onselectstart="return false;" id="paging"></div>
				<!--分页 end-->
				<!-- Modal -->
				<div class="modal fade" id="tableModal" tabindex="-1" role="dialog"
					aria-labelledby="tableModalLabel" aria-hidden="true"></div>
				<!-- /.modal -->
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
	<jsp:include page="/Order/jsp/xiangQing.jsp"></jsp:include>
	<jsp:include page="/Order/jsp/page.jsp"></jsp:include>
</body>

</html>