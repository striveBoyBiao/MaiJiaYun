<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal fade" id="addCustomerModal" tabindex="-1" role="dialog" aria-labelledby="addCustomerModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog" style="width: 900px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="addgoodsModalLabel">添加客户</h4>
				</div>
				<div class="modal-body" style="padding: 10px 20px;">
					<!--part one-->
					<div style="width: 250px;" class="input-group">
						<input id="customerSearchText" name="q"  type="text" placeholder="收货人\手机" class="form-control"> <span class="input-group-btn">
							<button onclick="listOfCustomers()" style="height:34px;" class="btn btn-primary query" type="button">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
					<!--part one end-->
					<!--part two-->
					<div class="tl lh30 scrollspy-example" style="height: 400px">
						<table id="listOfCustomers" class="table table-striped table-hover" style="margin-bottom: 0">
														
						</table>
					</div>
					<!--part two end-->
				</div>
				<div class="modal-footer" style="margin-top: 0px; background: #ebebeb; padding: 5px 20px">
					<button type="button" onclick="addCustomerToOrder()" class="btn btn-primary ok" data-dismiss="modal">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>