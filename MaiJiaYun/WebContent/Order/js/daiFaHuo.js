	/*快递单号模态框内显示订单*/
	/*根据选中的行获取到其中需要的数据（td内数据）通过遍历把html和数据放到模态框内。*/
var setOrder=function(){
	var trOrder=$("tr.order");
	var index=0;
	var trhtml;
	$("#orderExpressCode").html("");
	for (var int = 0; int < trOrder.length; int++) {
		var td=$(trOrder[int]).find("input[type='checkbox']");
		if($(td).prop("checked")){
			trhtml=$("#trhtml").html();
			$("#orderExpressCode").append(trhtml);
			var orderCode=$(trOrder[int]).find("td[colname='b2cCode/createTime'] a").text();
			var buyerName=$(trOrder[int]).find("td[colname='customerName']").text();
			var trs=$("#orderExpressCode tr[name='tr_order']");
			var td=$(trs[index]).children("td");
			$(td[0]).text(index+1);
			$(td[1]).text(orderCode);
			$(td[2]).text(buyerName);
			$(td[3]).text(buyerName);
			index++;
		}
	}
	
	/*批量生成快递单号联想箭头符号样式变换*/
	$("#orderExpressCode").children("tr").mouseenter(function(){
		$(this).find("div[name='lx']").attr("class","form-group showandhidden");
	});
	
	$("#orderExpressCode").children("tr").mouseleave(function(){
		$(this).find("div[name='lx']").attr("class","form-group showandhidden sr-only");
	});
	
	/*实现快递单号向下联想*/
	$(".glyphicon-arrow-down").click(function(){
		var lxparent=$(this).parents("div #lxparent")[0];
		var kddh=$($(lxparent).find("#express1")[0]).val();
		if(kddh!=0&&kddh!=null){
		var trparents=$(this).parents("tr[name='tr_order']").nextAll("tr");
		for (var int2 = 0; int2 < trparents.length; int2++) {
			$($(trparents[int2]).find("#express1")[0]).val(++kddh);
		}
		}else{
			alert("请输入一个快递单号以便联想");
		}
	});
	/*实现快递单号向上联想*/
	$(".glyphicon-arrow-up").click(function(){
		var lxparent=$(this).parents("div #lxparent")[0];
		var kddh=$($(lxparent).find("#express1")[0]).val();
		if(kddh!=0&&kddh!=null){
			var trparents=$(this).parents("tr[name='tr_order']").prevAll("tr");
			for (var int2 = 0; int2 < trparents.length; int2++) {
				$($(trparents[int2]).find("#express1")[0]).val(++kddh);
			}
		}else{
			alert("请输入一个快递单号以便联想");
		}
	});
}
	
	
