//仓库查询，添加仓库

var cangkuQuery1 = function() {
	var divDiaochu = $("#diaochuCangku");
	var ul = $(divDiaochu).find("ul");
	
	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/AdddiaobodanServlet",
		type : "post",
		datatype : "json",
		data : {},
		success : function(result) {
			 // console.log(result);
			ul[0].innerHTML = "";
			for ( var index in result) {
				// console.log(result[index].wareHouseName)
				if (index == 0) {
					$(ul)
							.append(
									"<li onclick='checkon1(this)' val='18065'><a href='javascript:void(0);'>"
											+ result[index].wareHouseName
											+ "</a></li>");
				} else {
					$(ul)
							.append(
									"<li onclick='checkon1(this)' val='18065'><a href='javascript:void(0);'>"
											+ result[index].wareHouseName
											+ "</a></li>");
				}

			}
		}
	});
}
// 仓库查询，添加仓库到调入仓库下拉框
var cangkuQuery2 = function() {

	var divDiaoru = $("#diaoruCangku");
	var ul = $(divDiaoru).find("ul");

	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/AdddiaobodanServlet",
		type : "post",
		datatype : "json",
		data : {},
		success : function(result) {
			// console.log(result);
			ul[0].innerHTML = "";
			for ( var index in result) {
				
				if (index == 0) {
					$(ul)
							.append(
									"<li onclick='checkon2(this)' val='18065'><a href='javascript:void(0);'>"
											+ result[index].wareHouseName
											+ "</a></li>");
				} else {
					$(ul)
							.append(
									"<li onclick='checkon2(this)' val='18065'><a href='javascript:void(0);'>"
											+ result[index].wareHouseName
											+ "</a></li>");
				}

			}
		}
	});
}

// 仓库的选中显示
var checkon1=function(event){
	var button=$("#diaochuCangku").find("button")[0];
	$(button).text($(event).text());
	showBtn();
}

var checkon2=function(event){
	var button=$("#diaoruCangku").find("button")[0];
	$(button).text($(event).text());
	showBtn();
}

// 显示添加调拨商品按钮和保存按钮
var showBtn=function(){
	var button1=$("#diaochuCangku").find("button")[0];
	
	var button2=$("#diaoruCangku").find("button")[0];
/*
 * alert($(button1).text()); alert($(button2).text());
 */
	if($(button1).text()!=$(button2).text()){
		
		$("#addSku").attr("disabled",false);
		if($(button1).text()!="调出仓库"&&$(button2).text()!="调入仓库"){
			$("#saves").attr("disabled",false);
		}
	}else{
		$("#addSku").attr("disabled",true);
		
	}
}

// 添加调拨商品的模态框
var addModel=function(){
	// var button=$("#diaochuCangku").find("button")[0];
	var cangkuName=$("#diaochuCangku").children("button").html();
	console.log(cangkuName);
	
	var table=$("#listOfProducts");
	$.ajax({
		url:window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)+"/AdddiaobodanServlet2",
				
		data:{cangkuName:cangkuName},
		type : "post",
		datatype : "json",
				
		success:function(result){
			// console.log(result);
			
			table[0].innerHTML="";
			
			$(table).append(
				"<thead class='table-bordered'>"+"<tr>"	
				+"<th><input type='checkbox' onclick='checkAll(this.checked)'></th>"
				+"<th>商品图</th>"+"<th>SKU编码</th>"
				+"<th>商品名称</th>"+"<th>属性</th>"
				+"<th>库存</th>"
				+"</tr>"+"</thead>"
			);		
			
			for(var index in result){
				// console.log(result[index].sku);
				
				var tbody = document.createElement("tbody");
				$(tbody).attr("style","font-weight:normal");
				var tr=document.createElement("tr");
				
				
				$(tr).append("<td><input type='checkbox' name='checkproduct'></td>");
				$(tr).append("<td><img src='"+result[index].goodPicture+"'alt='50X50' class='img-thumbnail' style='height:50px;width:50px;'></td>");
				$(tr).append("<td>"+result[index].sku+"</td>");
				$(tr).append("<td>"+result[index].goodName+"</td>");
				$(tr).append("<td>"+result[index].property+"</td>");
				$(tr).append("<td>"+result[index].goodCount+"</td>");
				
				$(tbody).append(tr);
				$(table).append(tbody);
				
			}
		}
		
	});	
}

// //checkbox全选
// var checkAll=function(){
// var table=$("#listOfProducts");
// var inputs=$(table).find("input");
// alert(inputs[0])
// if(input[0].checked==true){
// for(var i=0;i<inputs.lenght;i++){
// inputs[i].checked=true;
// }
// }else{
// for(var i=0;i<inputs.lenght;i++){
// inputs[i].checked=false;
// }
// }
//	
// }
//checkbox全选
function checkAll(flag) {
	var ck = document.getElementsByName("checkproduct")
	for (var i = 0; i < ck.length; i++) {
		ck[i].checked = flag;
	}
}

// 添加调拨商品
var addDiaobodan=function(){
	// var table=$("#listOfProducts");
	var tbody=$("#listOfProducts").find("tbody");
	
	var producttbody=$("#skuPanel").find("tbody");


	/*if(producttbody.length==0){	
		$("#skuPanel").find("div").remove();
		$("#skuPanel").append(
			"<table class='table table-striped table-hover' style='margin-bottom: 20px'>"
			+"<thead class='table-bordered'>"+"</tr>"
			+"<th>SKU编码</th>"+"<th>商品名称</th>"
			+"<th style=';'>商品属性</th>"+"<th>库存数量</th>"
			+"<th>调出数量</th>"
			+"<th>备注</th>"+"<th>操作</th>"
			+"</tr>"
			+"</thead>"+"</table>"
		);*/
	var isTrue = false;
	for(var index=0;index<tbody.length;index++){
		var input=$(tbody[index]).find("input");
		if(input[0].checked==true){
			isTrue = true;
		}
	}
	if(isTrue){
		$("#skuPanel").find("div").remove();
		$("#skuPanel").find("table").remove();
		
	}
	
	if($("#skuPanel").find("div").html()!="请添加调拨商品"){
		
		$("#skuPanel").append(
			"<table class='table table-striped table-hover' style='margin-bottom: 20px'>"
			+"<thead class='table-bordered'>"+"</tr>"
			+"<th>SKU编码</th>"+"<th>商品名称</th>"
			+"<th style=';'>商品属性</th>"+"<th>库存数量</th>"
			+"<th>调出数量</th>"
			+"<th>备注</th>"+"<th>操作</th>"
			+"</tr>"
			+"</thead>"+"</table>"
			);
	}
	
	
	
	for(var index=0;index<tbody.length;index++){
		var input=$(tbody[index]).find("input");
		if(input[0].checked==true){
			
			var tds=$(tbody[index]).find("td");
				
			$("#skuPanel").find("table").append(
					"<tbody style='font-weight:normal' name='tbody1'>"
					+"<tr  modelid='c120'>"
					+"<td id='sku'>"+$(tds[2]).text()+"</td>"
					+"<td>"+$(tds[3]).text()+"</td>"
					+"<td>"+$(tds[4]).text()+"</td>"
					+"<td>"+$(tds[5]).text()+"</td>"
					+"<td><input type='text' id='quantity' class='form-control integer' name='quantity' style='width: 90px;' placeholder='输入数量' value=''></td>"
					+"<td><input type='text' id='beizhu' class='form-control' name='beizhu' style='width: 400px;' value=''></td>"
					+"<td><a href='###' onclick='deleteList(this)' class='delete' >删除</a></td>"
					+"</tr>"
					+"</tbody>"
			);
				
		}
			
	}
}	

		

// 调拨单删除操作
var deleteList=function(event){
	var tbody=$(event).parent().parent().parent();
	var tbodyParent=$(tbody).parent();
	var tbodys=$(tbodyParent).find("tbody");
	if(tbodys.length==1){
		var thead=$(tbodyParent).find("thead");
		thead.remove();
		tbody.remove();
		tbodyparentpar=$(tbodyParent).parent();
		tbodyparentpar[0].innerHTML="<div style='margin-bottom: 20px;' class='well well-lg tc'>请添加调拨商品</div>"
	}else{
		tbody.remove();
	}
	
}

// 保存操作
var save=function(){
//	alert("xxx");
//	alert($("#skuPanel").find("div").html());
	if($("#skuPanel").find("div").html()=="请添加调拨商品"){
		console.log($("#skuPanel").find("div").html())
		//data-toggle="modal"	
		$("#Modaltext").text("请添加调拨商品");
		$("#saves").attr("data-toggle","modal");
	}else {
		var tbody1=$("#skuPanel").find("tbody");
			//document.getElementsByName("tbody1");
		var str="";	
		var beizhu2=$("textarea").val();
		for(var i=0;i<tbody1.length;i++){
			
			var inputs=tbody1[i].getElementsByTagName("input")[0].value;		
			var beizhu1=tbody1[i].getElementsByTagName("input")[1].value;
			
			//alert(beizhu2);
			//alert(inputs1);
			//var tds=tbody1[i].getElementsByTagName("td")[3].text();
				//$(tbody1[i]).find("input");
			var tds=$(tbody1[i]).find("td");
			var td=$(tds[3]).text();
			//alert($(tds[3]).text());
			//alert(inputs);
			//alert(td);
			var isTrue = true;
			if(inputs==""){
				isTrue = false;
				$("#Modaltext").text("调出数量不能为空");
				$("#saves").attr("data-toggle","modal");
				//$("#Modaltext").html="调出数量不能为空";
				//alert("调出数量不能为空");		
			}else if(inputs==0){
				isTrue = false;
				$("#Modaltext").text("调出数量不能为零");
				$("#saves").attr("data-toggle","modal");
				//alert("调出数量不能为零");			
			}else if(inputs>td){
				isTrue = false;
				$("#Modaltext").text("不能大于库存");
				$("#saves").attr("data-toggle","modal");
				//alert("不能大于库存");
			}
			
			if(isTrue){			
				//alert(1);			
				/*str="sku="$(tds[0]).text()+"kucun="+$(tds[3]).text()+"diaochu="+inputs+"beizhu1="beizhu1+"beizhu2="beizhu2;
				alert(str);*/	
				var diaobosInfo = new Array();
				var diaochuCangku=$("#diaochuCangku").children("button").html();
				var diaoruCangku=$("#diaoruCangku").children("button").html();
				var diaoboInfo={
						"sku":          $(tds[0]).text(),
						"goodName":     $(tds[1]).text(),
						"goodProperty": $(tds[2]).text(),
						"goodRepertory":$(tds[3]).text(),
						"outNumber":    inputs,
						"beizhu":      beizhu1
					
				};
				diaobosInfo.push(diaoboInfo);
				
				$.ajax({
					url : window.document.location.pathname.substring(0,
							window.document.location.pathname.substr(1).indexOf('/') + 1)
							+ "/AdddiaobodanServlet3",
					type : "post",
					data :{
						diaochuCangku:diaochuCangku,
						diaoruCangku: diaoruCangku,
						beizhu:      beizhu2,					
						diaoboInfo:JSON.stringify(diaobosInfo)
					},
					
					datatype:"json",
					success:function(result){
					var url = window.document.location.pathname.substring(0,
								window.document.location.pathname.substr(1)
								.indexOf('/') + 1)
						+ "/servlet/kg/WeiwanchengServlet1";
				//	alert(result);
						if (result) {
					//	alert(url);
							location.href = url;
							
						}
					}
				
				});
			}
		}
		
		
	}		
		
				//if(){
				//str+=
		//	}		
		/*$(quantity).each(function(data){
			//console.log($(this).val());
			var td = $(this).find("input")[0].val();
		//	alert($(this).find("td")[4].find("input")[0].val());
			alert(td);
			if($(this).find("td")[4].val()==0){
				alert("不能为零");
				
			}else if($(this).getElementsByTagName("td")[4].val()==null){
				alert("不能为空");
			}else{
				//str+=7
			}
		});*/				
}

function init() {
	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/servlet/kg/DiaoboAddServlet",
		type : "post",
		data :{			
		},
		
		datatype:"json",
		success:function(result){
			for(var index in result){
				if(result[index].diaobostate=="待审核"){
					$("#head").find("a").innerHTML("编辑调拨单");
					
					var button1=$("#diaochuCangku").find("button")[0];
					$(button1).text(result[index].diaobodanOutStore);
					
					var button2=$("#diaoruCangku").find("button")[0];
					$(button2).text(result[index].diaobodanInStore);
					
					$("#skuPanel").append(
							"<table class='table table-striped table-hover' style='margin-bottom: 20px'>"
							+"<thead class='table-bordered'>"+"</tr>"
							+"<th>SKU编码</th>"+"<th>商品名称</th>"
							+"<th style=';'>商品属性</th>"+"<th>库存数量</th>"
							+"<th>调出数量</th>"
							+"<th>备注</th>"+"<th>操作</th>"
							+"</tr>"
							+"</thead>"+"</table>"
							);
				
								
					$("#skuPanel").find("table").append(
							"<tbody style='font-weight:normal' name='tbody1'>"
							+"<tr  modelid='c120'>"
							+"<td id='sku'>"+result[index].sku+"</td>"
							+"<td>"+result[index].goodName+"</td>"
							+"<td>"+result[index].goodProperty+"</td>"
							+"<td>"+result[index].goodRepertory+"</td>"
							+"<td><input type='text' id='quantity' class='form-control integer' name='quantity' style='width: 90px;' placeholder='输入数量' value='"+result[index].outNumber+"'></td>"
							+"<td><input type='text' id='beizhu' class='form-control' name='beizhu' style='width: 400px;' value='"+result[index].beizhu+"'></td>"
							+"<td><a href='###' onclick='deleteList(this)' class='delete' >删除</a></td>"
							+"</tr>"
							+"</tbody>"
					);
						
					$("#bz").find("textarea").text(result[index].diaoboBeizhu);
								
				}
				else if(result[index].diaobostate=="出库中"||result[index].diaobostate=="入库中"){
					$("#head").find("a").innerHTML("调拨单详情");
					
				}
							
			}
			
		}
		
	});
}



