<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<thead class=" table-bordered">              <tr>
                
                <th class="select" colname="flag" title="">
                  <div class="btn-group">
                    <div class="left" style="margin-right:5px;"><input type="checkbox" id="selectAll"></div>
                    <div class="dropdown left">
                      <button class="btn dropdown-toggle fb" style="padding:0;box-shadow:none; background:none" type="button" id="dropdownMenu1" data-toggle="dropdown">
                      <span class="title"><span class="glyphicon glyphicon-flag "></span></span>  <span class="caret"></span></button>
                      <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span style="color: red" class="glyphicon glyphicon-flag"><span class="hide">红</span></span></a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span style="color: #F90" class="glyphicon glyphicon-flag"><span class="hide">黄</span></span></a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span style="color: green" class="glyphicon glyphicon-flag"><span class="hide">绿</span></span></a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span style="color: blue" class="glyphicon glyphicon-flag"><span class="hide">蓝</span></span></a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span style="color: violet" class="glyphicon glyphicon-flag"><span class="hide">紫</span></span></a></li>
                      </ul>
                    </div>
                  </div>
                </th>
                
                
                <th colname="splitMergeStatus" class="select" title="提醒">
                  <div class="dropdown">
                    <button class="btn dropdown-toggle fb" style="padding:0;box-shadow:none; background:none" type="button" id="dropdownMenu1" data-toggle="dropdown"><span class="title">提醒</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                      
                      
                      
                      
                        
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="iconfont icon-tuihuo" style="font-size:16px;color:#F90"></span>退款</a></li>
                        
                      
                        
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="glyphicon glyphicon-lock" style="color:#F90"></span>锁单</a></li>
                        
                      
                        
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">已拆分</a></li>
                        
                      
                        
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">已合并</a></li>
                        
                      
                        
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">无法送达</a></li>
                        
                      
                        
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">货到付款</a></li>
                        
                      
                      
                      
                    </ul>
                  </div>
                </th>
                
                <th colname="expressCompanyName" class="select" title="物流">
                  <div class="dropdown">
                    <button class="btn dropdown-toggle fb" style="padding:0;box-shadow:none; background:none" type="button" id="dropdownMenu1" data-toggle="dropdown"><span class="title">物流</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                      
                      <li role="presentation" class="sort" type="up"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="glyphicon glyphicon-arrow-up"></span> 升序</a></li>
                      <li role="presentation" class="sort" type="down"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="glyphicon glyphicon-arrow-down"></span> 降序</a></li>
                      
                      
                      <li class="divider"></li>
                      
                      
                      
                      
                    </ul>
                  </div>
                </th>
                
                <th colname="deliveryWarehouseName" class="select" title="仓库">
                  <div class="dropdown">
                    <button class="btn dropdown-toggle fb" style="padding:0;box-shadow:none; background:none" type="button" id="dropdownMenu1" data-toggle="dropdown"><span class="title">仓库</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                      
                      <li role="presentation" class="sort" type="up"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="glyphicon glyphicon-arrow-up"></span> 升序</a></li>
                      <li role="presentation" class="sort" type="down"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="glyphicon glyphicon-arrow-down"></span> 降序</a></li>
                      
                      
                      <li class="divider"></li>
                      
                      
                     
                      
                    </ul>
                  </div>
                </th>
                
                <th colname="eShopName" class="select" title="店铺名">
                  <div class="dropdown">
                    <button class="btn dropdown-toggle fb" style="padding:0;box-shadow:none; background:none" type="button" id="dropdownMenu1" data-toggle="dropdown"><span class="title">店铺名</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                      
                      <li role="presentation" class="sort" type="up"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="glyphicon glyphicon-arrow-up"></span> 升序</a></li>
                      <li role="presentation" class="sort" type="down"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="glyphicon glyphicon-arrow-down"></span> 降序</a></li>
                      
                      
                      <li class="divider"></li>
                      
                      
                      
                        
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">卖家云分销</a></li>
                        
                      
                      
                      <!-- <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">线下店铺</a></li> -->
                      
                      
                    </ul>
                  </div>
                </th>
                
                <th colname="isDeliverySheetPrinted" class="select" title="打印发货单">
                  <div class="dropdown">
                    <button class="btn dropdown-toggle fb" style="padding:0;box-shadow:none; background:none" type="button" id="dropdownMenu1" data-toggle="dropdown"><span class="title">打印发货单</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                      
                      <li role="presentation" class="sort" type="up"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="glyphicon glyphicon-arrow-up"></span> 升序</a></li>
                      <li role="presentation" class="sort" type="down"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="glyphicon glyphicon-arrow-down"></span> 降序</a></li>
                      
                      
                      <li class="divider"></li>
                      
                      
                      
                        
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">已打印</a></li>
                        
                      
                        
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">未打印</a></li>
                        
                      
                      
                      
                    </ul>
                  </div>
                </th>
                
                <th colname="isExpressSheetPrinted" class="select" title="打印快递单">
                  <div class="dropdown">
                    <button class="btn dropdown-toggle fb" style="padding:0;box-shadow:none; background:none" type="button" id="dropdownMenu1" data-toggle="dropdown"><span class="title">打印快递单</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                      
                      <li role="presentation" class="sort" type="up"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="glyphicon glyphicon-arrow-up"></span> 升序</a></li>
                      <li role="presentation" class="sort" type="down"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="glyphicon glyphicon-arrow-down"></span> 降序</a></li>
                      
                      
                      <li class="divider"></li>
                      
                      
                      
                        
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">已打印</a></li>
                        
                      
                        
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">未打印</a></li>
                        
                      
                      
                      
                    </ul>
                  </div>
                </th>
                
                <th colname="expressCode">快递单号</th>
                
                <th colname="b2cCode/createTime">订单号/下单时间</th>
                
                <th colname="customerName">买家</th>
                
                <th colname="buyerMemo" class="select" title="买家备注">
                  <div class="dropdown">
                    <button class="btn dropdown-toggle fb" style="padding:0;box-shadow:none; background:none" type="button" id="dropdownMenu1" data-toggle="dropdown"><span class="title">买家备注</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                      
                      
                      
                      
                        
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">有买家备注</a></li>
                        
                      
                        
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">无买家备注</a></li>
                        
                      
                      
                      
                    </ul>
                  </div>
                </th>
                
                <th colname="sellerMemo" class="select" title="卖家备注">
                  <div class="dropdown">
                    <button class="btn dropdown-toggle fb" style="padding:0;box-shadow:none; background:none" type="button" id="dropdownMenu1" data-toggle="dropdown"><span class="title">卖家备注</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                      
                      
                      
                      
                        
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">有卖家备注</a></li>
                        
                      
                        
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">无卖家备注</a></li>
                        
                      
                      
                      
                    </ul>
                  </div>
                </th>
                
                <th colname="receiverAddress" class="select" title="地址">
                  <div class="dropdown">
                    <button class="btn dropdown-toggle fb" style="padding:0;box-shadow:none; background:none" type="button" id="dropdownMenu1" data-toggle="dropdown"><span class="title">地址</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                      
                      <li role="presentation" class="sort" type="up"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="glyphicon glyphicon-arrow-up"></span> 升序</a></li>
                      <li role="presentation" class="sort" type="down"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="glyphicon glyphicon-arrow-down"></span> 降序</a></li>
                      
                      
                      
                    </ul>
                  </div>
                </th>
                
                <th colname="skuTotalQuantity" class="select" title="数量">
                  <div class="dropdown">
                    <button class="btn dropdown-toggle fb" style="padding:0;box-shadow:none; background:none" type="button" id="dropdownMenu1" data-toggle="dropdown"><span class="title">数量</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                      
                      <li role="presentation" class="sort" type="up"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="glyphicon glyphicon-arrow-up"></span> 升序</a></li>
                      <li role="presentation" class="sort" type="down"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="glyphicon glyphicon-arrow-down"></span> 降序</a></li>
                      
                      
                      
                    </ul>
                  </div>
                </th>
                
                <th colname="paymentAmount/buyerPostageFee">实付/运费</th>
                
                <th colname="receiverMobile">收货人手机号</th>
                
                <th colname="receiverPhone">收货人电话</th>
                
                <th colname="receiverName">收货人姓名</th>
                
                <th colname="paymentTime">付款时间</th>
                
                <th colname="auditTime">审单时间</th>
                
                <th colname="deliveryTime">发货时间</th>
                
                <th colname="expressCompanyName/expressCode" class="select" title="物流/运单号">
                  <div class="dropdown">
                    <button class="btn dropdown-toggle fb" style="padding:0;box-shadow:none; background:none" type="button" id="dropdownMenu1" data-toggle="dropdown"><span class="title">物流/运单号</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                      
                      <li role="presentation" class="sort" type="up"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="glyphicon glyphicon-arrow-up"></span> 升序</a></li>
                      <li role="presentation" class="sort" type="down"><a role="menuitem" tabindex="-1" href="javascript:void(0);"><span class="glyphicon glyphicon-arrow-down"></span> 降序</a></li>
                      
                      
                      <li class="divider"></li>
                      
                      
                      
                      
                    </ul>
                  </div>
                </th>
                
                <th colname="deliveryCode">发货单号</th>
                
                <th>操作 </th>
                 <th style="border-right:none">
                  <a data-toggle="modal" data-target="#tableModal" style="cursor: pointer;" id="theadSet">列设置</a>
                </th>
              </tr>
</thead>
</body>
</html>