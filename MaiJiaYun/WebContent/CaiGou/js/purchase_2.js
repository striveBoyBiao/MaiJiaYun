
	function addPurchaseGood_2(){
//		alert("sssss");
		
		var supplierId=document.getElementById("xuzhegongyinshang").innerHTML;
//		  alert(supplierId.innerHTML);
		 var wareHouseId=document.getElementById("rukucangku").innerHTML;
//		 alert(supplierId)
		if(supplierId!="请选择"){
			
			
			if(wareHouseId!="请选择"){
				
		
		 
		var trs=$('#mytable tr').length;
//		var trr=$('#mytable').children("tr")[i];
//		alert(trs-1)
//		alert($("#num:1").text()+"hhhh");
//		alert(document.getElementById("#num_1")+"sdfsdf");
		var c=document.getElementsByName("goodNum");
		var d=document.getElementsByName("price");
		var f=document.getElementsByName("priceSum");
		var e=document.getElementsByName("beizu");
		var goodsInfo = new Array();
		for(var i=trs-1;i>0;i--){
			
			var cellss=document.getElementById("mytable").rows[parseInt(i, 10)].cells;
//			for(var j=0;j<cellss.length;j++){
			if(i==trs-1){
			
				var skuTotalQuantity=document.getElementById("skuTotalQuantity").innerHTML;
				var skuTotalFee=document.getElementById("skuTotalFee").innerHTML;
//				addPurchaseGoodAjax_1(skuTotalQuantity,skuTotalFee);
			}
			else{
				var goodPicture=cellss[0].innerHTML;
				var goodSku=cellss[1].innerHTML;
				var goodName=cellss[2].innerHTML;
//				alert(c[i-1].value);
//				alret();
				var goodNum=c[i-1].value;
				var goodRepertory=cellss[4].innerHTML;
				var goodPrice=d[i-1].value;
				var priceSum=f[i-1].innerHTML;
				var beizu=e[i-1].value;
				
				var goodInfo = {
						
						"goodPicture" : cellss[0].innerHTML,
						"goodSku" : cellss[1].innerHTML,
						"goodName" : cellss[2].innerHTML,
						"goodNum" : c[i-1].value,
						"goodRepertory" : cellss[4].innerHTML,
						"goodPrice" :d[i-1].value,
						"priceSum" : f[i-1].innerHTML,
						"beizu":e[i-1].value
					};
				goodsInfo.push(goodInfo);
//				addPurchaseGoodAjax(i,goodPicture,goodSku,goodName,goodNum,goodRepertory,goodPrice,priceSum,beizu);
			}
		}	
			 var supplierId=document.getElementById("qingxuanzhe_1").innerHTML;
//			  alert(supplierId.innerHTML);
			 var wareHouseId=document.getElementById("qingxuanzhe_2").innerHTML;
//		    var remake_2=document.getElementById("memo").innerHTML;
		    var remake_2=$("#memo").val();
//		    location.href="";
			$.ajax({
				
				url : "/MaiJiaYun/caigou/servlet/XzcgAjax_2",
				type : "post",
				data : {
					
					purchaseInfo : JSON.stringify({	skuTotalQuantity:skuTotalQuantity,
					skuTotalFee:skuTotalFee,
					supplierId:supplierId,
					wareHouseId:wareHouseId,
					remake_2:remake_2,
					}),
					goodInfo : JSON.stringify(goodsInfo)
				},
				datatype : "json",
				success : function(result) {
					
					console.log("order" + result);

					if (result[0] == true) {
						window.location.href="/MaiJiaYun/caigou/servlet/DcgServlet";
					} else {
						warningShow("添加失败，请重新添加！");
					}
//					var message = $(data).children("message").text();
//					
//					document.getElementById(priceSum).innerHTML=message;
//					document.getElementById("skuTotalQuantity").innerHTML=cc;
//					
//					document.getElementById("skuTotalFee").innerHTML=parseInt(document.getElementById("skuTotalFee").innerHTML,10)+parseInt(message,10);
					
				}
			});
			
				
//			}
		
		
	
	}else{
		alert("请添加仓库")
		return null;
	}
	}else{
			alert("请添加供应商")
			return null;
		}
	}
	

	function updatePurchaseGood(){
//		alert("sssss");
		
		var supplierId=document.getElementById("xuzhegongyinshang").innerHTML;
		  alert(supplierId);
		 var wareHouseId=document.getElementById("rukucangku").innerHTML;
		 alert(wareHouseId);
		if(supplierId!="请选择"){
			
			
			if(wareHouseId!="请选择"){
				
		
		 
		var trs=$('#mytable tr').length;
		alert(trs);
//		var trr=$('#mytable').children("tr")[i];
//		alert(trs-1)
//		alert($("#num:1").text()+"hhhh");
//		alert(document.getElementById("#num_1")+"sdfsdf");
		var c=document.getElementsByName("goodNum");
		var d=document.getElementsByName("price");
		var f=document.getElementsByName("priceSum");
		var e=document.getElementsByName("beizu");
		var goodsInfo = new Array();
		for(var i=trs-1;i>0;i--){
			
			var cellss=document.getElementById("mytable").rows[parseInt(i, 10)].cells;
//			for(var j=0;j<cellss.length;j++){
			if(i==trs-1){
			
				var skuTotalQuantity=document.getElementById("skuTotalQuantity").innerHTML;
				var skuTotalFee=document.getElementById("skuTotalFee").innerHTML;
//				addPurchaseGoodAjax_1(skuTotalQuantity,skuTotalFee);
			}
			else{
				var goodPicture=cellss[0].innerHTML;
				var goodSku=cellss[1].innerHTML;
				var goodName=cellss[2].innerHTML;
//				alert(c[i-1].value);
//				alret();
				var goodNum=c[i-1].value;
				var goodRepertory=cellss[4].innerHTML;
				var goodPrice=d[i-1].value;
				var priceSum=f[i-1].innerHTML;
				var beizu=e[i-1].value;
				
				var goodInfo = {
						
						"goodPicture" : cellss[0].innerHTML,
						"goodSku" : cellss[1].innerHTML,
						"goodName" : cellss[2].innerHTML,
						"goodNum" : c[i-1].value,
						"goodRepertory" : cellss[4].innerHTML,
						"goodPrice" :d[i-1].value,
						"priceSum" : f[i-1].innerHTML,
						"beizu":e[i-1].value
					};
				goodsInfo.push(goodInfo);
//				addPurchaseGoodAjax(i,goodPicture,goodSku,goodName,goodNum,goodRepertory,goodPrice,priceSum,beizu);
			}
		}	
			 var supplierId=document.getElementById("qingxuanzhe_1").innerHTML;
//			  alert(supplierId.innerHTML);
			 var wareHouseId=document.getElementById("qingxuanzhe_2").innerHTML;
		     var remake_2=$("#memo").val();
		    	
		    
//		    location.href="";
			$.ajax({
				
				url : "/MaiJiaYun/caigou/servlet/EditcgAjax",
				type : "post",
				data : {
					trs:JSON.stringify({trs:trs}),
					purchaseInfo : JSON.stringify({	skuTotalQuantity:skuTotalQuantity,
					skuTotalFee:skuTotalFee,
					supplierId:supplierId,
					wareHouseId:wareHouseId,
					remake_2:remake_2,
					}),
					goodInfo : JSON.stringify(goodsInfo)
				},
				datatype : "json",
				success : function(result) {
					
					console.log("order" + result);

					if (result[0] == true) {
						window.location.href="/MaiJiaYun/caigou/servlet/DcgServlet";
					} else {
						warningShow("添加失败，请重新添加！");
					}
//					var message = $(data).children("message").text();
//					
//					document.getElementById(priceSum).innerHTML=message;
//					document.getElementById("skuTotalQuantity").innerHTML=cc;
//					
//					document.getElementById("skuTotalFee").innerHTML=parseInt(document.getElementById("skuTotalFee").innerHTML,10)+parseInt(message,10);
					
				}
			});
			
				
//			}
		
		
	
	}else{
		alert("请添加仓库")
		return null;
	}
	}else{
			alert("请添加供应商")
			return null;
		}
	}
	