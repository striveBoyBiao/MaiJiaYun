<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style=""
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
<!-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/addDiaobo.css" media="all"> -->

<script type="text/javascript" src = "${pageContext.request.contextPath}/KuGuan/diaoBo/js/addDiaobodan.js">
</script>

<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/KuGuan/diaoBo/js/weiwancheng.js"></script>

</head> --%>

<body style="padding-right: 0px;" class="" onload="init()">
	<!--代码开始-->
	<div class="container" id="container">

		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>

		<div class="content" id="content">
		
				<div class="collapse navbar-collapse navbar-default navbar-titletab"
					style="padding: 0px; background-color: rgb(255, 255, 255);">
					<div class="navbar-header" id="head">
						<a href="#" class="navbar-brand ml20">增加调拨单</a>
					</div>
					<ul class="nav nav-tabs f14 fb">
						<!--<li class="active ml20"><a href="javascript:void(0);" style="background:#f1f1f1;">增加调拨单</a></li>-->
					</ul>
				</div>

				<div class="prl10auto">
					<!--table star-->
					<div class="panel prl10auto mt15" style="padding: 20px 10px;">
						<h5>
							<form class="form-inline" role="form">
								<div class="form-group pr10">调出仓库</div>
								<div class="form-group pr20">
									<div id="diaochuCangku" class="btn-group select necessary"
										name="srcWarehouseId">
										<button class="btn btn-default" type="button"
											style="width: 82px; height: 34px">调出仓库</button>

										<button onclick="cangkuQuery1()"
											style="height: 34px; width: 24px;" data-toggle="dropdown"
											class="btn btn-default dropdown-toggle" type="button" >
											<span class="caret"></span>
										</button>

										<ul style="min-width: 100px; height: 200px;" role="menu"
											class="dropdown-menu scrollspy-example">
										</ul>
									</div>
								</div>
								<div class="form-group pr10">调入仓库</div>
								<div class="form-group pr20">
									<div id="diaoruCangku" class="btn-group select necessary"
										name="dstWarehouseId">
										<button class="btn btn-default" type="button"
											style="width: 82px; height: 34px">调入仓库</button>

										<button onclick="cangkuQuery2()"
											style="height: 34px; width: 24px;" data-toggle="dropdown"
											class="btn btn-default dropdown-toggle" type="button">
											<span class="caret"></span>
										</button>
										<ul style="min-width: 100px; height: 200px;" role="menu"
											class="dropdown-menu scrollspy-example">

										</ul>
									</div>
								</div>

								<button onclick="addModel()" id="addSku" type="button"
									class="btn btn-primary btn-lg" data-toggle="modal"
									data-target="#myModel" disabled="disabled">
									<span class="glyphicon glyphicon-plus"></span> 添加调拨商品
								</button>

								<!-- model -->
								<div style="display: none;" aria-hidden="true" id="myModel"
									aria-labelledby="allotgoodsModalLabel" role="dialog"
									tabindex="-1" id="addSkuModal" class="modal fade in">
									<div style="width: 900px;" class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button aria-hidden="true" data-dismiss="modal"
													class="close" type="button">×</button>
												<h4 id="allotgoodsModalLabel" class="modal-title">添加商品</h4>
											</div>
											<div style="padding: 10px 20px;" class="modal-body">
												<!--part one-->
												<div class="input-group" style="width: 250px;">
													<input type="text" class="form-control"
														placeholder="请输入SKU编码/商品名称" name="q" value=""> <span
														class="input-group-btn">
														<button type="button" style="height: 34px; width: 40px;"
															class="btn btn-primary query">
															<span class="glyphicon glyphicon-search"></span>
														</button>
													</span>
												</div>
												<!--part one end-->
												<!--part two-->
												<div style="height: 400px" class="tl lh30 scrollspy-example">
													<table id="listOfProducts" style="margin-bottom: 0"
														class="table table-striped table-hover">


													</table>
												</div>
												<!--part two end-->
											</div>
											<div
												style="margin-top: 0px; background: #ebebeb; padding: 5px 20px"
												class="modal-footer">
												<button onclick="addDiaobodan()" class="btn btn-primary ok"
													type="button" data-dismiss="modal">确定</button>
																		
												<button  class="btn btn-default cancel"
													type="button" data-dismiss="modal">取消</button>
												
											</div>
										</div>
									</div>
									<!-- /.modal-content -->

									<!--调拨商品 end-->

								</div>
							</form>
						</h5>
					</div>
				</div>

				<!--panle star-->
				<div class="panel prl10auto" style="padding: 20px 10px;">
					<!-- Table -->
					<div id="skuPanel">
						<div style="margin-bottom: 20px;" class="well well-lg tc">请添加调拨商品</div>
					</div>
					<!--table end-->
					<!--备注star-->
					<form action="http://maijiayun.cn/kg/diaobodan/add"
						class="form-horizontal" role="form" style="padding: 30px 0px;" id="bz">
						<div class="form-group" >
							<div class="w50 left lh30 fb f14">备注</div>
							<div class="col-sm-5">
								<textarea rows="3" class="form-control" name="memo"></textarea>
							</div>
						</div>
					</form>

					<!--备注end-->
					<div style="padding: 20px 10px 40px;">
						<button onclick="save()" id="saves"
							class="btn btn-primary mr5 save" type="button" data-toggle=""
							disabled="disabled" data-target="#Model1">保存</button>
							
						<a
						href="${pageContext.request.contextPath}/servlet/kg/WeiwanchengServlet1">	
						<button class="btn btn-default cancel" id="btnReturn" onclick="cancel()"
							type="button">取消</button></a>
					</div>

					<div class="bootbox modal fade bootbox-alert in" tabindex="-1"
						role="dialog" aria-hidden="true" style="display:none;" id="Model1">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-body">
									<button type="button" class="bootbox-close-button close"
										data-dismiss="modal" aria-hidden="true"
										style="margin-top: -10px;">×</button>
									<div class="bootbox-body" id="Modaltext">请添加调拨商品</div>
								</div>
								<div class="modal-footer">
									<button data-bb-handler="ok" type="button" data-dismiss="modal"
										class="btn btn-primary">OK</button>
								</div>
							</div>
						</div>
					</div>


					<!--panle end-->
					<!--调拨商品 star-->
					<!-- <div style="display: none;" aria-hidden="true"
						aria-labelledby="allotgoodsModalLabel" role="dialog" tabindex="-1"
						id="addSkuModal" class="modal fade"></div>
				</div>

				Layout right part end
			</div>


			<div class="modal-footer">
				<button type="button" class="btn btn-primary updatePackUser">修改</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>

		</div>

		<div style="width: 300px; height: 80px; display: none;" class="modal"
			id="keepsuccessModal" tabindex="-1" role="dialog"
			aria-labelledby="logisticsModalLabel" aria-hidden="false">
			<div class="modal-dialog" style="width: 300px; margin: 52px 0px 0px;">
				<div
					style="background: rgb(97, 190, 68) none repeat scroll 0% 0%; border-radius: 0px; border: medium none;"
					class="modal-content">
					<div style="padding: 5px;" class="modal-body">
						part one
						<div style="color: rgb(255, 255, 255);" class="c6 tc"
							id="showTempDiv">保存成功！</div>
						part one end
					</div>
				</div>
			</div>
		</div>

		<div style="width: 300px; height: 80px; display: none;" class="modal"
			id="keeperrorModal" tabindex="-1" role="dialog"
			aria-labelledby="logisticsModalLabel" aria-hidden="false">
			<div class="modal-dialog" style="width: 300px; margin: 52px 0px 0px;">
				<div
					style="background: rgb(255, 88, 49) none repeat scroll 0% 0%; border-radius: 0px; border: medium none;"
					class="modal-content">
					<div style="padding: 5px;" class="modal-body">
						part one
						<div style="color: rgb(255, 255, 255);" class="c6 tc"
							id="showErrorTempDiv">保存失败！</div>
						part one end
					</div>
				</div>
			</div>
		</div> -->

					<div aria-hidden="true" aria-labelledby="edit_accountModalLabel"
						role="dialog" tabindex="-1" id="edit_accountModal"
						class="modal fade" style="display: none;"></div>
					<div id="modal"></div>
			</div>		
		</div>
	</div>
</body>
</html>
