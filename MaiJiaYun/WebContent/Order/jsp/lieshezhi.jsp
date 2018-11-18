<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/KeFu/ddcx/js/myjs001.js"
	type="text/javascript" charset="utf-8"></script>
	<script>
		
	</script>
</head>
<body ><!-- onload="begin()" -->
	
	<!-- Modal style="display: block;"-->
	<div class="modal fade" id="tableModal" tabindex="-1" role="dialog"
		
		aria-labelledby="tableModalLabel" aria-hidden="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<!--modal-header-->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="tableModalLabel">列设置</h4>
				</div>
				<!-- /.modal-header -->

				<!-- modal-body -->
				<div class="modal-body">
					<div class="row">

						<!--left part-->
						<form id="formThead">
							<input name="code" value="sd_unauditorder" type="hidden">
							<div class="col-xs-9 scrollspy-example" style="height: 400px;">
								<table class="table" id="tableHead">
									<thead class=" table-bordered">
										<tr trtype="head">
											<th>行号</th>
											<th>列名</th>
											<th style="width: 185px;">显示名称</th>
											<th>显示</th>
											<!-- <th>这是什么鬼</th> -->
										</tr>
									</thead>
									<tbody style="font-weight: normal">

									</tbody>
								</table>
							</div>
						</form>
						<!--left part end-->

						<!--right part-->
						<div class="col-xs-3">
							<h5 class="fb">操作</h5>
							<form>
								<button type="button" id="upButton" onclick="upOperate()"
									class="btn btn-default"
									style="width: 100%; margin-bottom: 15px" disabled="false">上移</button>
								<button type="button" id="downButton" onclick="downOperate()"
									class="btn btn-default"
									style="width: 100%; margin-bottom: 15px" disabled="false">下移</button>
								<button type="button" id="defaultButton"
									onclick="defaultOperate()" class="btn btn-default"
									style="width: 100%; margin-bottom: 45px">还原默认设置</button>

								<button type="button" id="saveCustom" onclick="saveMyCustom()"
									class="btn btn-primary" data-dismiss="modal"
									style="width: 45%;">保存</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal" style="width: 45%;">关闭</button>

							</form>
						</div>
						<!--right part end-->

					</div>
					<!-- /.row -->
				</div>
				<!-- /.modal-body -->
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->

	</div>
	<!-- /.modal -->
</body>
</html>
