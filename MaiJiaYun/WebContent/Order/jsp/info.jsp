<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<c:forEach items="${pageInfo.orderInfos }" var="orderInfo">


		<tr id="unAuditTr11655707" false=""
			orderid="${orderInfo.order.orderCode }" class="order">
			<td false=""><input type="checkbox" style="margin-right: 5px;"></td>
			<td ></td>

			<!--订单号/下单时间  -->
			<td false="" colname="b2cCode/createTime"><a
				href="javascript:void(0);" class="show-order-detail">${orderInfo.order.orderCode }</a><br>${orderInfo.order.orderTime }</td>
			<!--买家姓名 -->
			<td false="" colname="customerName">${orderInfo.buyer.buyerName }</td>
			<!--买家备注  -->
			<td false="" colname="buyerMemo">${orderInfo.order.orderBuyerRemark }</td>
			<!--卖家备注  -->
			<td false="" colname="sellerMemo">${orderInfo.order.orderSellerRemark }</td>
			<!--店铺名称  -->
			<td false="" colname="eShopName">${orderInfo.shop.shopName }</td>
			<!--地址 -->
			<td false="" colname="receiverAddress"><c:choose>
					<c:when test="${fn:length(orderInfo.buyer.buyerAddress)<10 }">
											${fn:substring(orderInfo.buyer.buyerAddress, 0,fn:length(orderInfo.buyer.buyerAddress))}
										</c:when>
					<c:when test="${fn:length(orderInfo.buyer.buyerAddress)<20 }">
											${fn:substring(orderInfo.buyer.buyerAddress, 0,10)}<br>
											${fn:substring(orderInfo.buyer.buyerAddress, 10,fn:length(orderInfo.buyer.buyerAddress))}
										</c:when>
					<c:otherwise>
											${fn:substring(orderInfo.buyer.buyerAddress, 0,10)}<br>
											${fn:substring(orderInfo.buyer.buyerAddress, 10,18)}...
										</c:otherwise>
				</c:choose></td>
			<!-- 快递公司  -->
			<td false="" colname="expressCompanyName">
				<!-- ems -->${orderInfo.logistic.logisticName }</td>
			<!-- 数量  -->
			<td false="" colname="skuTotalQuantity">
				${orderInfo.order.orderGoodNum}</td>
			<!--实付/运费  -->
			<td false="" colname="paymentAmount/buyerPostageFee">${orderInfo.order.orderPayMent }
				/ ${orderInfo.order.orderFreight }</td>
			<!--买家手机号  -->
			<td false="" colname="receiverMobile">${orderInfo.buyer.buyerPhone }</td>
			<!--买家电话号  -->
			<td false="" colname="receiverPhone">${orderInfo.buyer.buyerTel }</td>
			<!--买家姓名  -->
			<td false="" colname="receiverName">${orderInfo.buyer.buyerName }</td>
			<!--付款时间  -->
			<td false="" colname="paymentTime">${orderInfo.order.orderPayTime }</td>
			<!--审单时间  -->
			<td false="" colname="auditTime">${orderInfo.order.orderExaTime }</td>
			<!--发货时间  -->
			<td false="" colname="deliveryTime">${orderInfo.order.orderSendTime }</td>
			<!--快递单号  -->
			<td false="" colname="expressCode">${orderInfo.order.orderExpressCode }</td>
			<!--物流/运单号  -->
			<td false="" colname="expressCompanyName/expressCode">${orderInfo.logistic.logisticName }/${orderInfo.order.orderWaybill }</td>
			<td false="" colspan="2">
				<div class="btn-group" style="margin-right: 10px;">
					<!-- <a style="display: inline-block"
						href=""></a> -->
					<button code="${orderInfo.order.orderCode}" onclick="shenHe(this)"
						class="btn btn-default operation-audit" type="button">审核</button>
					<button data-toggle="dropdown" style="margin-right: 0"
						class="btn btn-default dropdown-toggle" type="button">
						<span class="caret"></span> <span class="sr-only">Toggle
							Dropdown</span>
					</button>
					<ul style="min-width: 94px;" role="menu" class="dropdown-menu">
						<li class="operation-lock"><a style="cursor: pointer;"
							data-target="#lockinfoModal" data-toggle="modal">锁单</a></li>
					</ul>
				</div>
				<div class="btn-group show-order-detail">
					<a href="javascript:void(0);" xiangQing="2"
						onclick="changeDetails(this)">详情</a>
				</div>
			</td>
		</tr>

	</c:forEach>
</body>
</html>