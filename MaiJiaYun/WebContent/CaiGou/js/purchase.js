function dropDownBoxr(obj) {
	
	
	 var rukucangku=document.getElementById("rukucangku");
	 var txt=$(obj).children("span").text();
	 rukucangku.innerText=txt;
//	 alert("11111");
	 
	 
	 var qingxuanzhe_2=document.getElementById("qingxuanzhe_2");
	 qingxuanzhe_2.innerText=$(obj).children("span").attr("id");
	 
//	 alert(txt);
	// rukucangku.innertext=obj.text;
}

function dropDownBoxx(obj) {
	
	
	 var xuzhegongyinshang=document.getElementById("xuzhegongyinshang");
	 var txt=$(obj).children("span").text();
	 xuzhegongyinshang.innerText=txt;
	 
	 var qingxuanzhe_1=document.getElementById("qingxuanzhe_1");
	 qingxuanzhe_1.innerText=$(obj).children("span").attr("id");
	 
//	 alert(txt);
	// rukucangku.innertext=obj.text;
}


function getChecks(){
	var check=document.getElementById("check");
	
	var checks=document.getElementsByName("chek");
	
	for(var i=0;i<checks.length;i++){
		
		checks[i].checked=check.checked;
		
	}
	
}

function getCheckAll(){
	 var goodSku=null;
	 var goodName=null;
	 var goodRepertory=null;
	 var goodPrice=null;
	 var goodPicture=null;
//	 var remark=null;
	 var purchaseNum=0;
	 var checks=document.getElementsByName("goodsSku");
	 
	 for(var i=0;i<checks.length;i++){
		 
			if(checks[i].checked){
				
				
				goodPicture=document.getElementById("goodPicture"+(i+1)).innerHTML;
				
				goodsSku=$("#goodSku"+(i+1)).html();
//				goodsSku=document.getElementById("goodSku"+(i+1)).innerHTML;
				
				goodsName=document.getElementById("goodName"+(i+1)).innerHTML;
				goodRepertory=document.getElementById("goodRepertory"+(i+1)).innerHTML;
				goodPrice=document.getElementById("goodPrice"+(i+1)).innerHTML;
//				alert("11111");
				
				creatTable(goodPicture,goodsSku,goodsName,goodRepertory,goodPrice,purchaseNum);
			}
			
			
			
		}
	 
}
	
//btn btn-primary ok
	var cow=1;
	function creatTable(goodPicture,goodSku,goodName,goodRepertory,goodPrice,purchaseNum){
		
	var a=document.getElementById("skuPanel");
	
	if(cow==1){
//		alert(cow==1);
	a.innerHTML="<table  id=\"mytable\" class=\"table\" style=\"margin-bottom:20px;\"><tr><th>商品图片</th><th>SKU编码</th><th>商品名称</th><th>采购数量</th><th>已入库数量</th><th>采购价</th><th>总价</th><th>备注</th><th>操作</th></tr></table>";
	cow++;
	creatTr(goodPicture,goodSku,goodName,goodRepertory,goodPrice,purchaseNum);
	}   //获取表格中的一行数据  
	else{
		creatTr(goodPicture,goodSku,goodName,goodRepertory,goodPrice,purchaseNum);
	}
	

	
	

	
}
	function creatTr(goodPicture,goodSku,goodName,goodRepertory,goodPrice,purchaseNum){
		
		 
		
//		alert(goodPrice);
		var addgood=document.getElementById("mytable").insertRow(cow-1);
		
		addgood.insertCell(0).innerHTML= goodPicture;
		addgood.insertCell(1).innerHTML=goodSku;
		addgood.insertCell(2).innerHTML=goodName;
		addgood.insertCell(3).innerHTML="<div class=\"form-group\" style=\"width:100px;\"><input type=\"text\" min=\"0\" showname=\"采购数量\" indexnum=\"0\" id="+("num:"+(cow-1))+" name=\"goodNum\" value="+purchaseNum+" class=\"form-control operate-caigou-blur\" placeholder=\"\" onblur=\"getPrice(this)\"></div>";
		addgood.insertCell(4).innerHTML=0;
		addgood.insertCell(5).innerHTML="<div class=\"form-group\" style=\"width:100px;\"><input type=\"text\" min=\"0\" showname=\"采购价\" indexnum=\"0\" id="+("price:"+(cow-1))+" name=\"price\" value="+goodPrice+" class=\"form-control operate-caigou-blur\" placeholder=\"0.00\" onblur=\"getPrice(this)\"></div>";
		
		addgood.insertCell(6).innerHTML="<div id="+("priceSum:"+(cow-1))+" name=\"priceSum\">0</div>"
		addgood.insertCell(7).innerHTML="<div class=\"form-group\" ><input type=\"text\" min=\"0\" showname=\"备注\" indexnum=\"0\" id="+("beizu:"+(cow-1))+" name=\"beizu\" value=\"\" class=\"form-control operate-caigou-blur\" ></div>";
		addgood.insertCell(8).innerHTML="<a href=\"#\" id="+(cow-1)+" onclick=\"deleteTr(this)\">删除</a>"
		if(cow==2){
			var addfoot=document.getElementById("mytable").insertRow();
			$("#mytable tr:last").addClass("lastTr"); 
			addfoot.innerHTML="<td colspan=\"4\" class=\"fb\">合计：</td><td colspan=\"2\" class=\"fb\">采购数量总计：<span class=\"red\" id=\"skuTotalQuantity\">0</span></td><td colspan=\"3\" class=\"fb\">采购总价：<span class=\"red\" id=\"skuTotalFee\">0.00</span></td>";
			
		}
		
		 
		 cow++;
	}	
	
	function getPrice(obj){
//		alert("xxx");
		var attr= $(obj).attr("id");
//		
		
		
		num=attr.split(":")[1];
		var n=null;
		var priceId="price:"+num;
		
		var priceSum="priceSum:"+num;
//		alert(attr.split(":")[0]=="num")
		if(attr.split(":")[0]=="num"){
			getURL(obj,priceId,priceSum);
		}
		
		if(attr.split(":")[0]=="price"){
			n="num:"+num;
			getURL(obj,n,priceSum);
		}
		
	}
//	var  stop_1=null;
	function getURL(obj,priceId,priceSum){

		var aa=document.getElementById(priceId).value;
		//goodNum的数组
//		alert("getURL");
		var c=document.getElementsByName("goodNum");
		var d=document.getElementsByName("priceSum");
		var cc=0;
		var dd=0;
		for(var i=0;i<c.length;i++){

			cc=cc+parseInt(c[i].value,10);
			
//			alert(cc);
		}
		
//		var cc=document.getElementById(priceSum).innerHTML;
		
		$.ajax({
			
			url : "/MaiJiaYun/caigou/servlet/XzcgAjax",
			type : "post",
			data : {
				uname :$(obj).val(),
				priceId :aa,

	
			},
			datatype : "xml",
			success : function(data) {
				
//				 stop_2=null;
				var message = $(data).children("message").text();
//				alert(message);
				
				document.getElementById(priceSum).innerHTML=message;
				
				document.getElementById("skuTotalQuantity").innerHTML=cc;
//				alert(document.getElementById(priceId).value);
//				alert(document.getElementById(priceId));
				var ps=document.getElementsByName("priceSum");
				document.getElementById("skuTotalFee").innerHTML="0.0";
				for(var i=0;i<ps.length;i++){
					
					document.getElementById("skuTotalFee").innerHTML=parseInt(document.getElementById("skuTotalFee").innerHTML,10)+parseInt(document.getElementById("priceSum:"+(i+1)).innerHTML,10);
				}
//				if(document.getElementById(priceId).value!=stop_1){
//					alert("shuchu");
//					
//					
//				}
				
				
			}
		});
	
		
		
		
	}	
	function deleteTr(obj){
		trs= $("#mytable").find("tr").length;
		var attr= $(obj).attr("id");
//		alert(attr)
		var priceSum="priceSum:"+attr;
		
//		alert(priceSum)
		curRow=event.srcElement.parentElement
		index=curRow.parentNode.rowIndex;
//		index=trs.index($(this).closest("tr"));
//		alert(parseInt(document.getElementById("skuTotalFee").innerHTML,10));
//		alert(document.getElementById(priceSum).innerHTML);
//		alert(parseDouble(document.getElementById(priceSum).innerHTML,10));
		document.getElementById("skuTotalFee").innerHTML=parseInt(document.getElementById("skuTotalFee").innerHTML,10)-parseInt(document.getElementById(priceSum).innerHTML,10);
		
		document.getElementById("mytable").deleteRow(index);
//			getPrice(obj);
		
		cow--;
		if(cow==2){
			var back=document.getElementById("skuPanel");
			back.innerHTML="<div class=\"well well-lg tc\" style=\"margin-bottom: 20px\"id=\"caigou\" ><table class=\"table \" style=\"margin-bottom: 0; text-align: center;\" id=\"addgood\">采购商品</table></div>";
				
		}
	}
//	function addPurchaseGood(){
////		alert("sssss");
//		
//		var supplierId=document.getElementById("xuzhegongyinshang").innerHTML;
////		  alert(supplierId.innerHTML);
//		 var wareHouseId=document.getElementById("rukucangku").innerHTML;
////		 alert(supplierId)
//		if(supplierId!="请选择"){
//			
//			
//			if(wareHouseId!="请选择"){
//				
//		
//		 
//		var trs=$('#mytable tr').length;
////		var trr=$('#mytable').children("tr")[i];
////		alert(trs-1)
////		alert($("#num:1").text()+"hhhh");
////		alert(document.getElementById("#num_1")+"sdfsdf");
//		var c=document.getElementsByName("goodNum");
//		var d=document.getElementsByName("price");
//		var f=document.getElementsByName("priceSum");
//		var e=document.getElementsByName("beizu");
//		for(var i=trs-1;i>0;i--){
//			
//			var cellss=document.getElementById("mytable").rows[parseInt(i, 10)].cells;
////			for(var j=0;j<cellss.length;j++){
//			if(i==trs-1){
//			
//				var skuTotalQuantity=document.getElementById("skuTotalQuantity").innerHTML;
//				var skuTotalFee=document.getElementById("skuTotalFee").innerHTML;
//				addPurchaseGoodAjax_1(skuTotalQuantity,skuTotalFee);
//			}
//			else{
//				var goodPicture=cellss[0].innerHTML;
//				var goodSku=cellss[1].innerHTML;
//				var goodName=cellss[2].innerHTML;
////				alert(c[i-1].value);
////				alret();
//				var goodNum=c[i-1].value;
//				var goodRepertory=cellss[4].innerHTML;
//				var goodPrice=d[i-1].value;
//				var priceSum=f[i-1].innerHTML;
//				var beizu=e[i-1].value;
//				addPurchaseGoodAjax(i,goodPicture,goodSku,goodName,goodNum,goodRepertory,goodPrice,priceSum,beizu);
//			}
//				
//			
//			
//				
////			}
//		}
//		
//	
//	}else{
//		alert("请添加仓库")
//		return null;
//	}
//		}else{
//			alert("请添加供应商")
//			return null;
//		}
//	}
//	function addPurchaseGoodAjax(i,goodPicture,goodSku,goodName,goodNum,goodRepertory,goodPrice,priceSum,beizu){
////		alert("addPurchaseGoodAjax")
//		
//		$.ajax({
//			
//			url : "/MaiJiaYun/caigou/servlet/XzcgAjax",
//			type : "post",
//			data : {
//				goodPicture :goodPicture,
//				goodSku :goodSku,
//				goodName:goodName,
//				goodNum:goodNum,
//				goodRepertory:goodRepertory,
//				goodPrice:goodPrice,
//				priceSum:priceSum,
//				beizu:beizu,
//	
//			},
//			datatype : "xml",
//			success : function(data) {
//				if(i==1){
//					window.location.href="/MaiJiaYun/caigou/servlet/DcgServlet";
//				}
//				
////				var message = $(data).children("message").text();
////				
////				document.getElementById(priceSum).innerHTML=message;
////				document.getElementById("skuTotalQuantity").innerHTML=cc;
////				
////				document.getElementById("skuTotalFee").innerHTML=parseInt(document.getElementById("skuTotalFee").innerHTML,10)+parseInt(message,10);
//
//			}
//		});
//	}
//	function addPurchaseGoodAjax_1(skuTotalQuantity,skuTotalFee){
////		alert("sssss");
////		var supplierCName=$("#rukucangku").text();
////		var wareHouseName=$("#xuzhegongyinshang").text();
//		 var supplierId=document.getElementById("qingxuanzhe_1").innerHTML;
////		  alert(supplierId.innerHTML);
//		 var wareHouseId=document.getElementById("qingxuanzhe_2").innerHTML;
//	    var remake_2=document.getElementById("memo").innerHTML;
////	    location.href="";
//		$.ajax({
//			
//			url : "/MaiJiaYun/caigou/servlet/XzcgAjax",
//			type : "post",
//			data : {
//				skuTotalQuantity:skuTotalQuantity,
//				skuTotalFee:skuTotalFee,
//				supplierId:supplierId,
//				wareHouseId:wareHouseId,
//				remake_2:remake_2,
//			},
//			datatype : "xml",
//			success : function(data) {
//				
////				var message = $(data).children("message").text();
////				
////				document.getElementById(priceSum).innerHTML=message;
////				document.getElementById("skuTotalQuantity").innerHTML=cc;
////				
////				document.getElementById("skuTotalFee").innerHTML=parseInt(document.getElementById("skuTotalFee").innerHTML,10)+parseInt(message,10);
//				
//			}
//		});
//	}
	
	
	  function getDaoRu(){
		 
		  window.location.href="/MaiJiaYun/caigou/servlet/Dcg_DrServlet"+window.location.search+"&addSuccess=add";
	  }

	  var trs=1;
	  $(document).ready(function() { 
		  // 任何需要执行的js特效 
//		  $("table tr:nth-child(even)").addClass("even"); 
		
	
		  
//		 alert("aaaaa");
		trs= $("#mytable").find("tr").length;
//		  for(var i=0;i<trs-1;i++){
		cow=trs;
		alert(trs)
		
	$("#goToNext").click(function(){
	 
		  var path=$("#rimage").val();
		  //path.slice(12)
		  alert("aaaaa");
		  aaa=path.split("\\");
		  bbb=aaa[2];
		  var nextPage="/MaiJiaYun/caigou/servlet/Dcg_DrServlet?pimage=D:\\"+aaa[2];
		  alert(nextPage);
		  window.location.href=nextPage;
		  
	  })
	  $("#shtg").click(function(){
	 
		  var path=$("shtgtd").attr("href");
		  //path.slice(12)
//		  alert("aaaaa");
//		  aaa=path.split("\\");
//		  bbb=aaa[2];
//		  var nextPage="/MaiJiaYun/caigou/servlet/Dcg_DrServlet?pimage=D:\\"+aaa[2];
//		  alert(nextPage);
		  window.location.href=path;
		  
	  })
//			  	alert($("#tbodyaa").find("tr")[i]);
//				var goodPicture=(($("#tbodyaa").find("tr")[i]).find("td")[0].ChildNodes);
//				var goodsSku=$("#tbodyaa").find("tr")[i].find("td")[1].html();
//				
//				var goodsName=$("#tbodyaa").find("tr")[i].find("td")[2].html();
//				var purchaseNum=$("#tbodyaa").find("tr")[i].find("td")[3].html()
//				var goodRepertory=$("#tbodyaa").find("tr")[i].find("td")[4].html();
//				var goodPrice=$("#tbodyaa").find("tr")[i].find("td")[5].html(); 
//				var remark=$("#tbodyaa").find("tr")[i].find("td")[7].html();
//			  creatTable(goodPicture,goodSku,goodName,goodRepertory,goodPrice,remark,purchaseNum); 
//		  }
////		  var goodPicture=
		
	  }); 
	  
	 function deleteDate(obj){
		 var purchaseCode=$(obj).attr("name");
		 $.ajax({
			 url:"/MaiJiaYun/caigou/servlet/XzcgAjax_delete",
			 type:post,
			 data:{
				 purchaseCode:purchaseCode,
			 },
			 datatype : "json",
			success : function(data) {
				$("#catgoubody").html("");
				$.each(json, function (index, item) { 
					var name = json[index].PurchaseCode;  
					var idnumber = json[index].IdNumber;  
					var sex = json[index].Sex;  
//					$("#list").html($("#list").html() + "<br>" + name + " - " + idnumber + " - "  ;

					
				});
			}
		 });
	 }
	  