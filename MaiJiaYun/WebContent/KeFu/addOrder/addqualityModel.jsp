<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加商品</title>
</head>

<body>
	<div class="modal fade" id="addqualitytModal" tabindex="-1" role="dialog" aria-labelledby="addqualitytModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog" style="width: 900px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="addTacticsItemModalLabel">添加商品</h4>
				</div>
				<div class="modal-body" style="padding: 10px 20px;">
					<!--part one-->
					<div style="width: 250px;" class="input-group">
						<input id="qualitysearchText" name="q" value="" type="text" placeholder="请输入SKU编码/商品名称" class="form-control"> <span class="input-group-btn">
							<button onclick="listOfProducts()" style="height:34px;" class="btn btn-primary query" type="button">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
					<!--part one end-->
					<!--part two-->
					<div class="tl lh30 scrollspy-example" style="height: 400px">
						<table id="listOfProducts" class="table table-striped table-hover" style="margin-bottom: 0">
							<thead class=" table-bordered">
								<tr>
									<th><input type="checkbox"></th>
									<th>商品图</th>
									<th>SKU编码</th>
									<th>商品名称</th>
									<th>属性</th>
									<th>库存</th>
								</tr>
							</thead>
						</table>
					</div>
					<!--part two end-->
				</div>
				<div class="modal-footer" style="margin-top: 0px; background: #ebebeb; padding: 5px 20px">
					<button type="button" class="btn btn-primary ok" onclick="addListOfAddOrder()" data-dismiss="modal">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>