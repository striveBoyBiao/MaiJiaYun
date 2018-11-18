//改变详情是否隐藏
window.onload = function() {
	// 调用列设置的开始方法
	begin();
	// 分页
	page()
	var href = window.location.href;
	if(href.indexOf("shenHe")>0||href.indexOf("faHuo")>0||href.indexOf("yiFaHuo")>0){
		advanced();
	}
	setCheckbox();
}

// 分页
var orderCode;
function changeDetails(obj) {
	var str = $(obj).text();
	if (str.trim() == "收起") {
		showThisMsg();
	} else {
		$(".panel").children("table").children("tbody").children("tr").remove(
				".order-detail");
		$("td").find("a[xiangQing='2']").text("详情")
		$("button[xiangQing='2']").text("详情")
		str = $(obj).text("收起");
		/**
		 * 单击详情后获得对应的订单号，然后在后台获得对应的数据
		 */
		orderCode = $(obj).parents("tr").children(
				"td[colname='b2cCode/createTime']").children(
				".show-order-detail").text();

		// 在对应的tr后插入添加的tr(整个详情)
		var string = $("#xqHtml").children("tbody").html();
		$(obj).parents("tr").after(string)
		$.ajax({
			url : "/MaiJiaYun/servlet/order/orderServlet?method=details",
			type : "post",
			data : {
				orderCode : orderCode + ""
			},
			dataType : "json",
			success : function(data) {
				$.each(data, function(index, element) {
					setGoodInfo(element);
					setClient(element);
					setDeal(element);
					setRemark(element);
				})
			}
		})

	}
	/* 设置客户信息 */
	function setClient(allInfo) {
		$("#buyerName")
				.val(allInfo.clientMessage.buyerName);
		$("#buyerName2").val(allInfo.clientMessage.buyerName);
		$("#tel").val(allInfo.clientMessage.buyerTel);
		$("#Phone").val(allInfo.clientMessage.buyerPhone);
		/* 物流 */
		$("#logisticName").text(allInfo.clientMessage.logisticName);
		$("#logisticName").attr("sql_id",allInfo.clientMessage.logisticId);
		/* 仓库 */
		/* 省 */
		$("button[name='Province']").text(allInfo.clientMessage.buyerProvince);
		$("button[name='Province']").attr("sql_id",allInfo.clientMessage.provincesCode);
		/* 市 */
		$("button[name='City']").text(allInfo.clientMessage.buyerCity);
		$("button[name='City']").attr("sql_id",allInfo.clientMessage.cityCode);
		/* 区 */
		$("button[name='District']").text(allInfo.clientMessage.buyerDistrict);
		$("button[name='District']").attr("sql_id",allInfo.clientMessage.areaCode);
		/* 详细地址 */
		$("input[name='receiverStreet']").val(
				allInfo.clientMessage.buyerLocation);
		/* 邮政编码 */
		$("input[name='receiverZip']").val(allInfo.clientMessage.buyerPostcode);

	}

	/* 设置交易信息 */
	function setDeal(allInfo) {
		/* 付款方式0.在线付款，1.货到付款 */
		if (allInfo.dealMessage.orderPayWay == 0) {
			$("button[name='payment']").text("在线付款");
		} else {
			$("button[name='payment']").text("货到付款");
		}
		/* 1.支付宝，2.微信3.现金 */
		var paytpye = "现金";
		if (allInfo.dealMessage.orderPayTpye == 1) {
			paytpye = "支付宝";
		} else if (allInfo.dealMessage.orderPayTpye == 2) {
			paytpye = "微信";
		}
		$("button[name='PayTpye']").text(paytpye);
		$("input[name='paymentAccount']").val(allInfo.dealMessage.alipayId);
		$("input[name='paymentTime']").val(allInfo.dealMessage.orderPayTime);
	}

	/* 设置备注信息 */
	function setRemark(allInfo) {
		$("input[name='buyerMemo']").val(allInfo.order.orderBuyerRemark);
		$("input[name='sellerMemo']").val(allInfo.order.orderSellerRemark);
	}

	// 将遍历的数据填入对应信息
	function setGoodInfo(allInfo) {
		goodInfo(allInfo.detailGoods);
		$("span[name='skuTotalQuantity']").text(allInfo.order.orderGoodNum);
		$("span[name='skuTotalWeight']").text(allInfo.order.orderWeight);
		$("span[name='skuTotalFee']").text(allInfo.order.orderTotal);
		$("span[name='discountFee']").text(allInfo.order.orderFee);
		$("span[name='skuTotalDiscount']").text(allInfo.order.orderFavorable);
		$("span[name='skuTotalFee-discountFee-skuTotalDiscount']").text(
				allInfo.order.orderPayMent);
		$("span[name='paymentAmount']").text(allInfo.order.orderPayMent);

	}

	function goodInfo(detailGoods) {
		// 在这里填入整个详情商品附加信息头的类容
		// 追加商品信息的所有tr，并给商品信息这一栏其他地方赋值
		for (var i = 0; i < detailGoods.length; i++) {
			$("#detailGood").append($("#goodHtml").children("tbody").html());
		}
		// 将商品的信息传递进去，遍历信息，并添加至对应的tr
		goods(detailGoods);
	}
	function goods(detailGoods) {
		var trs = $("#detailGood tr[modelid]")
		// 给商品信息这一个tr里的元素赋值
		for (var i = 0; i < trs.length; i++) {

			$(trs[i]).attr("modelid", $(trs[i]).attr("modelid") + i);
			var tds = $(trs[i]).children("td");
			$(tds[0]).find("img").attr("src", detailGoods[i].goodPicture);
			$(tds[1]).text(detailGoods[i].sku);
			$(tds[2]).text(detailGoods[i].goodName)
			$(tds[4]).text(detailGoods[i].goodPrice)
			$(tds[5]).children("span").text(detailGoods[i].detailGoodNum)
			$(tds[6]).text(detailGoods[i].detailGoodPrivilege)
			$(tds[7]).text(detailGoods[i].detailTotal)
		}
	}

	var labkh = $("#label-kh").click(function() {
		var khtd = this.parentElement.parentElement;
		khtd.getElementsByTagName("form")[0].style.display = "block";
		khtd.getElementsByTagName("form")[1].style.display = "none";
		khtd.getElementsByTagName("form")[2].style.display = "none";
		khtd.getElementsByTagName("form")[3].style.display = "none";
	});
	var labkh = $("#label-sp").click(function() {
		var khtd = this.parentElement.parentElement;
		khtd.getElementsByTagName("form")[0].style.display = "none";
		khtd.getElementsByTagName("form")[1].style.display = "block";
		khtd.getElementsByTagName("form")[2].style.display = "none";
		khtd.getElementsByTagName("form")[3].style.display = "none";
	});
	var labkh = $("#label-jy").click(function() {
		var khtd = this.parentElement.parentElement;
		khtd.getElementsByTagName("form")[0].style.display = "none";
		khtd.getElementsByTagName("form")[1].style.display = "none";
		khtd.getElementsByTagName("form")[2].style.display = "block";
		khtd.getElementsByTagName("form")[3].style.display = "none";
	});
	var labkh = $("#label-bz").click(function() {
		var khtd = this.parentElement.parentElement;
		khtd.getElementsByTagName("form")[0].style.display = "none";
		khtd.getElementsByTagName("form")[1].style.display = "none";
		khtd.getElementsByTagName("form")[2].style.display = "none";
		khtd.getElementsByTagName("form")[3].style.display = "block";
	});
}

function showThisMsg() {
	$("[xiangqing='2']").text("详情")
	$(".panel").children("table").children("tbody").children("tr").remove(
			".order-detail");
}
function seek() {
	// 店铺id
	var shopId = $("#eShopName").val();
	// 物流id
	var logisticId = $("#expressCompanyName").val();
	// 付款方式
	var orderPayWay = $("#paymentMethod").val();
	// 订单号
	var orderCode = $("#b2cCode").val();
	// 收货人
	var buyerName = $("#receiverName").val();
	// 手机号
	var buyerPhone = $("#receiverMobile").val();
	// 电话
	var buyerTel = $("#receiverPhone").val();
	// 地址
	var buyerAddress = $("#receiverAddress").val();
	// 商品货号
	var goodId = $("#goodsCode").val();
	// sku编码
	var sku = $("#skuCode").val();
	// 商品名称
	var goodName = $("#goodsTitle").val();
	// 商品数量
	var detailGoodNum = $("#goodsNum").val();
	// 买家备注
	var buyerRemark = $("#hasBuyerMemo").val();
	// 卖家备注
	var sellerRemark = $("#hasSellerMemo").val();
	// 下单时间上
	var orderTimeFrom = $("#orderTimeFrom").val();
	// 下单时间下
	var orderTimeTo = $("#orderTimeTo").val();
	// 审单时间上
	var orderExaTimeFrom = $("#orderExaTimeFrom").val();
	// 审单时间下
	var orderExaTimeTo = $("#orderExaTimeTo").val();
	// 发货时间上
	var orderSendTimeFrom = $("#orderSendTimeFrom").val();
	// 发货时间下
	var orderSendTimeTo = $("#orderSendTimeTo").val();

	// alert("店铺:"+shopId+" 物流:"+logisticId+" 付款方式:"+orderPayWay+"
	// 订单号:"+orderCode);
	// alert("收货人:"+buyerName+" 手机号:"+buyerPhone+" 电话:"+buyerTel+"
	// 地址:"+buyerAddress);
	// alert("商品货号:"+goodId+" sku编码:"+sku+" 商品名称:"+goodName+"
	// 商品数量:"+detailGoodNum);
	// alert("买家备注:"+buyerRemarkStr+" 卖家备注:"+sellerRemarkStr+"
	// 下单时间上:"+orderTimeFrom+" 下单时间下:"+orderTimeTo);
	// alert("审单时间上:"+orderExaTimeFrom+" 审单时间下:"+orderExaTimeTo+"
	// 发货时间上:"+orderSendTimeTo+" 发货时间下:"+orderSendTimeTo);
	/*
	 * if(buyerRemarkStr==null||buyerRemarkStr==""){ buyerRemark=0; }else
	 * if(buyerRemarkStr=="有买家备注"){ buyerRemark=1; }eles
	 * if(buyerRemarkStr=="无买家备注"){ buyerRemark=2; } if(){
	 *  }
	 */

	$.ajax({
		url : "/MaiJiaYun/sevlet/order/Advanced",
		type : "post",
		data : {
			"shopId" : shopId,
			"logisticId" : logisticId,
			"orderPayWay" : orderPayWay,
			"orderCode" : orderCode,
			"buyerName" : buyerName,
			"buyerPhone" : buyerPhone,
			"buyerTel" : buyerTel,
			"buyerAddress" : buyerAddress,
			"goodId" : goodId,
			"sku" : sku,
			"goodName" : goodName,
			"detailGoodNum" : detailGoodNum,
			"buyerRemark" : buyerRemark,
			"sellerRemark" : sellerRemark,
			"orderTimeFrom" : orderTimeFrom,
			"orderTimeTo" : orderTimeTo,
			"orderExaTimeFrom" : orderExaTimeFrom,
			"orderExaTimeTo" : orderExaTimeTo,
			"orderSendTimeFrom" : orderSendTimeFrom,
			"orderSendTimeTo" : orderSendTimeTo
		},
		dataType : "json",
		success : function() {
			alert("ajax成功了")
		}
	})
}

// 下拉框中的列表添加点击事件
var optionClick = function(parent) {
	var lis = parent.getElementsByTagName("ul")[0].getElementsByTagName("li");
	for (var index = 0; index < lis.length; index++) {
		lis[index].onclick = function() {
			var text = parent.getElementsByTagName("button")[0];
			text.innerText = this.getAttribute("val");
			text.setAttribute("sql_id", this.getAttribute("sql_id"));
		}
	}
}

// 地区下拉框事件
var appendSheng = function(name) {
	var receiverState = document.getElementById("receiverState");
	var buttonState = receiverState.getElementsByTagName("button")[0];

	var receiverCity = document.getElementById("receiverCity");
	var buttonCity = receiverCity.getElementsByTagName("button")[0];

	var receiverDistrict = document.getElementById("receiverDistrict");
	var buttonDistrict = receiverDistrict.getElementsByTagName("button")[0];

	var ul;
	var parent;
	var value;
	if (name == "sheng") {
		value = "0";
		ul = receiverState.getElementsByTagName("ul")[0];
		parent = receiverState;
	}
	if (name == "city") {
		value = buttonState.getAttribute("sql_id");
		ul = receiverCity.getElementsByTagName("ul")[0];
		parent = receiverCity;
	}
	if (name == "district") {
		value = buttonCity.getAttribute("sql_id");
		ul = receiverDistrict.getElementsByTagName("ul")[0];
		parent = receiverDistrict;
	}
	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/servlet/MethodServlet",
		type : "post",
		data : {
			method : "areaQueryMethod",
			name : name,
			value : value
		},
		datatype : "json",
		success : function(result) {
			ul.innerHTML = "";
			var areas = result.message;
			for ( var area in areas) {
				var li = document.createElement("li");
				li.setAttribute("val", areas[area].name);
				li.setAttribute("sql_id", areas[area].id);
				li.innerHTML = "<a href='###'>" + areas[area].name + "</a>";
				ul.appendChild(li);
			}
			optionClick(parent);
		}
	});

}

var setLogisti = function() {
	var logistic = document.getElementById("logistic");
	var buttonState = logistic.getElementsByTagName("button")[0];
	var ul = logistic.getElementsByTagName("ul")[0];
	var parent = logistic;
	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/servlet/MethodServlet",
		type : "post",
		data : {
			method : "logisticQueryMethod"
		},

		datatype : "json",
		success : function(result) {
			ul.innerHTML = "";
			for ( var res in result) {
				var li = document.createElement("li");
				li.setAttribute("val", result[res].logisticName);
				li.setAttribute("sql_id", result[res].logisticId);
				li.innerHTML = "<a href='###'>" + result[res].logisticName
						+ "</a>";
				ul.appendChild(li);
			}
			optionClick(parent);
		}
	});
}

/* 保存信息 详情信息*/
var saveClient = function() {
	var orderBuyerRemark = $("#inputbuy").val();
	var orderSellerRemark = $("#inputsell").val();
	var LogisticId = $("#logisticName").attr("sql_id");
//	alert("物流id:"+LogisticId);
	var buyerName = $("#buyerName2").val();
//	alert("获取的buyerName的个数"+buyerName.length);
	var buyerTel = $("#tel").val();
	var buyerPhone = $("#Phone").val();
	var buyerPostcode = $("input[name='receiverZip']").val();
//	alert("收获人："+buyerName+"电话："+buyerTel+"手机号码："+buyerPhone+"邮政编码："+buyerPostcode);
	var buyerProvince = $("button[name='Province']").attr("sql_id");
	var buyerCity = $("button[name='City']").attr("sql_id");
	var buyerDistrict = $("button[name='District']").attr("sql_id");
//	alert("省id:"+buyerProvince+"市id:"+buyerCity+"区id"+buyerDistrict);
	var buyerLocation = $("input[name='receiverStreet']").val();

	$.ajax({
		url : "/MaiJiaYun/servlet/order/MessageServlet",
		type : "post",
		data : {
			"orderCode" : orderCode,
			"orderBuyerRemark" : orderBuyerRemark,
			"orderSellerRemark" : orderSellerRemark,
			"LogisticId" : LogisticId,
			"buyerName" : buyerName,
			"buyerTel" : buyerTel,
			"buyerPhone" : buyerPhone,
			"buyerPostcode" : buyerPostcode,
			"buyerProvince" : buyerProvince,
			"buyerCity" : buyerCity,
			"buyerDistrict" : buyerDistrict,
			"buyerLocation" : buyerLocation
		},
		datatype : "json",
		success : function() {
			showThisMsg();
		}
	});
}
function setCheckbox(){
	$("tr.order").click(function(){
		if(!$(this).find("input[type='checkbox']").prop("checked")){
			$(this).find("input[type='checkbox']").prop("checked","checked");
		}else{
			$(this).find("input[type='checkbox']").removeAttr("checked");
		}
	});
}