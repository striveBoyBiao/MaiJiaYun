<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- saved from url=(0021)http://maijiayun.cn/1 -->
<html
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/CaiGou/css/them.css">
<jsp:include page="/CaiGou/jsp/gys/supplierJS.jsp"></jsp:include>

</head>

<body onload="init()" class="" style="padding-right: 0px;">
	<!--代码开始-->
	<div class="container" id="container">
		<!--header 开始-->
		<%-- <jsp:include page="/Common/jsp/navigation.jsp"></jsp:include> --%>
		<!--header 结束-->
		<div class="content" id="content">
			<!--titletab star-->
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0;">
				<div class="navbar-header">
					<a
						href="${pageContext.request.contextPath}/CaiGou/jsp/gys/gongyingshang.jsp#"
						class="navbar-brand ml20">供应商信息</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<!--<li class="active ml20"><a href="javascript:void(0);">供应商信息</a></li>-->
					<li class="pull-right" id="li-query" style="padding-top: 12px;">
						<div class="navbar-form navbar-left">
							<div class="w340">
								<div class="input-group">
									<input type="text" name="q" id="q" class="form-control"
										style="width: 300px;" placeholder="请输入供应商名称"> <span
										class="input-group-btn">
										<button class="btn btn-primary query" type="button"
											id="chaxun">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<!--titletab end-->
			<!--panel star-->
			<div class="prl10auto">
				<div class="btn-group-block">
					<button class="btn btn-default" type="button"
						data-target="#addsupplierModal" data-toggle="modal"
						id="addSupplier">添加供应商</button>
				</div>
				<!--table star-->
				<div class="panel" id="result">
					<!-- Table -->
					<!-- <table class="table table-striped table-hover">
						<thead class=" table-bordered">
							<tr>
								<th><input type="checkbox" name="chks" onclick="checkAll(this)"></th>
								<th>公司名称</th>
								<th>法人</th>
								<th>法人联系信息</th>
								<th>联系人</th>
								<th>联系人手机</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table> -->

					<!--table end-->
				</div>
				<div aria-hidden="true" aria-labelledby="addsupplierModalLabel"
					role="dialog" tabindex="-1" id="addsupplierModal"
					class="modal fade" style="display: none;">
					<!--添加供应商 star-->

					<div style="width: 800px;" class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button aria-hidden="true" data-dismiss="modal" class="close"
									type="button">×</button>
								<h4 id="addsupplierModalLabel" class="modal-title">添加供应商</h4>
							</div>
							<form id="formAddSupplier" class="form-inline" role="form">
								<div class="modal-body">
									<!--part two-->
									<div class="tl lh30">
										<table style="margin-bottom: 0"
											class="table table-hover table-bordered">
											<tbody style="font-weight: normal">
												<tr>
													<td width="80px;">公司名称</td>
													<td colspan="3"><input id="companyName" type="text"
														name="companyName" class="form-control"></td>
												</tr>
												<tr>
													<td width="80px;">公司地址</td>
													<td colspan="3"><input type="text" id="companyAddress"
														name="companyAddress" class="form-control"></td>
												</tr>
												<tr>
													<td width="80px;">法人</td>
													<td><input type="text" name="legalPerson"
														id="legalPerson" class="form-control"></td>
													<td width="80px;">电话</td>
													<td><input type="text" name="legalPhone"
														id="legalPhone" class="form-control"></td>
												</tr>
												<tr>
													<td colspan="4" class="fb f14" style="background: #f7f7f7;">联系人信息</td>
												</tr>
												<tr>
													<td width="80px;">联系人姓名</td>
													<td><input type="text" name="contactsName"
														id="contactsName" class="form-control"></td>
													<td width="80px;">联系人手机</td>
													<td><input id="contactsMobile" type="text"
														name="contactsMobile" class="form-control"></td>
												</tr>
												<tr>
													<td width="80px;">邮件</td>
													<td><input id="contactsEmail" type="text"
														name="contactsEmail" class="form-control"></td>
													<td width="80px;">QQ</td>
													<td><input type="text" name="contactsQq"
														id="contactsQq" class="form-control"></td>
												</tr>
											</tbody>
										</table>
									</div>
									<!--part two end-->
								</div>
							</form>
							<div class="modal-footer">
								<button type="button" id="saveBut" class="btn btn-primary">保存</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<span id="errorSpan" style="color: red"></span>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->

					<!--添加供应商 end-->
				</div>
				<!--panel end-->
				<!--分页 star-->
				<jsp:include page="/CaiGou/jsp/gys/pagination.jsp"></jsp:include>
				<!--分页 end-->
			</div>
			<!--Layout right part end-->
		</div>
		<!--Layout right part end-->
	</div>
	<!--代码结束-->
</body>

</html>