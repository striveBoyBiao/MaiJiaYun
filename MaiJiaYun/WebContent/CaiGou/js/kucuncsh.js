/**
 * 库存初始化页面JS文件
 * 作者：第九小组组员张俊
 */


/**********js的分页开始************/
//分页变量
var pageCount=10;//每页的条数
var pageNum=0;//当前页码
var sum=0;//总条数
var pageTotal=0;
var temporary=0;

//分页之第一次进页面的结果
function firstPage(){
	
	//计算页码总页数
	if(sum%pageCount==0){
		pageTotal=sum/pageCount;
	}else{
		pageTotal=sum/pageCount+1;
	}
	temporary=pageTotal;
	//只显示五个小标签
	if(pageTotal>5){
		pageTotal=5;
	}
	
	var pageNumberStr="<li id=\"last\" class=\"fb fmsun\"><a href=\"javascript:void(0);\" onclick=\"changeLast()\">&lt;</a></li>";
	for(var i=1;i<=pageTotal;i++){
		
		pageNumberStr+="<li class=\"page\" page=\""+i+"\"><a href=\"javascript:void(0);\" onclick=\"changePage(this)\">"+i+"</a></li>";
	}
	pageNumberStr+="<li id=\"next\" class=\"fb fmsun\"><a href=\"javascript:void(0);\" onclick=\"changeNext()\">&gt;</a></li>";
	$("#pagingPages ul").html(pageNumberStr);

	
	//第一次进来  有默认值  设置页码
	//先都设置不显示
	$("tbody tr").hide();
	
	//设置第一页显示
	for(var i=1;i<=pageCount;i++){
		
		$("tbody tr[modelid="+i+"]").show();
	}
	//设置激活
	$("#pagingPages ul li[page=\"1\"]").addClass("active");
}



//分页之  改变页码或改变每也的条数(页码按钮)
function changePage(obj){
	//当前页码
	 pageNum=parseInt($(obj).text().trim());
	//每页的条数 
	 pageCount=parseInt($("#currentPageSize").text().trim());
	//alert($("#currentPageSize").text().trim());
	
	//所有隐藏
	$("tbody tr").hide();
	//循环开始条件
	var pageStart=pageCount*(pageNum-1)+1;
	//循环结束条件
	var pageEnd=pageStart+pageCount;
	for(var i=pageStart;i<pageEnd;i++){
		$("tbody tr[modelid="+i+"]").show();
	}
	
}

//页码改变
function changePage2(){
	
	//每页的条数 
	 pageCount=parseInt($("#currentPageSize").text().trim());
	//alert($("#currentPageSize").text().trim());
	
	
	 
	   //计算页码总页数
		if(sum%pageCount==0){
			pageTotal=sum/pageCount;
		}else{
			pageTotal=sum/pageCount+1;
		}
		temporary=pageTotal;
		//只显示五个小标签
		if(pageTotal>5){
			pageTotal=5;
		}

		$("#pagingPages ul li").remove();
		
		var pageNumberStr="<li id=\"last\" class=\"fb fmsun\"><a href=\"javascript:void(0);\" onclick=\"changeLast()\">&lt;</a></li>";
		for(var i=1;i<=pageTotal;i++){
			
			pageNumberStr+="<li class=\"page\" page=\""+i+"\"><a href=\"javascript:void(0);\" onclick=\"changePage(this)\">"+i+"</a></li>";
		}
		pageNumberStr+="<li id=\"next\" class=\"fb fmsun\"><a href=\"javascript:void(0);\" onclick=\"changeNext()\">&gt;</a></li>";
		$("#pagingPages ul").html(pageNumberStr);
	 
	
	//当改变每页条数  将当前的页码置为1
	//pageNum=1;	
		

		
	//所有隐藏
	$("tbody tr").hide();
	for(var i=1;i<=pageCount;i++){
		$("tbody tr[modelid="+i+"]").show();
	}
}







			
//选择仓库查询参数 ：仓库   是否显示未显示商品数量   搜索框   
function changeWarehouse(obj){
	
	//得到仓库的值  显示在页面
	var str=$(obj).find("span").text();
	$("#myButton .pull-left").text(str);
	$("tbody #myCangKu").text(str);
	searchQuery();

}


function loading(){
	 //获取当前用户的所有仓库名
	 $.post("/MaiJiaYun/servlet/cg/KuCunCSH2",{"Info":"firstVisit"},function(data){
		
		 
		 var goodStr="";
		 //设置总条数
		 sum=data.length;
		 //显示总条数
		 $("#totalRecords").text(sum);
		 
			$.each(data,function(index,element){
			       goodStr+="<tr skuid="+element.goodId+" modelid=\""+(index+1)+"\">"
							+"<td>"+element.sku+"</td><td>"+element.goodName+"</td>"
							+"<td>颜色分类:浅绿色;尺码:us6</td>"
							+"<td>"+element.goodId+"</td>"
							+"<td id=\"myCangKu\">默认仓库</td>"
							+"<td id=\"td_quantity2080281\">"
							+"<div class=\"dropdown \" style=\"position: relative;\" id=\"div_quantity2080281\">"
							+"<input class=\"form-control Integer dropdown-toggle\" data-toggle=\"dropdown\" type=\"number\" name=\"warehouseSkuQuantity\" value="+element.goodCount+" placeholder=\"未设置\" onblur=\"tableStyle(this)\">"
							+"<ul class=\"dropdown-menu scrollspy-example ul-binding\" role=\"menu\""
							+"style=\"left: 0px; background: #f8f8f8; max-height: 200px;\"></ul></div></td></tr>"
			});
			
			$("tbody").html(goodStr);
			
			//分页之显示页码（总页码也计算出来）要在回调函数中
			firstPage();
		
	 });
	 
	
	 
	 
	 
}

//是否显示未显示商品数量
var stockStatus=1;//选择状态
function searchQuery(){
	//得到仓库值
	var buttonValue=$("#myButton .pull-left").text().trim();
	//alert("仓库的值:"+buttonValue);
	
	var searchValue=$("#mySearch").val().trim();
	//alert("搜索框内的值:"+searchValue)

	//alert("选择状态:"+stockStatus); 全局变量
	
	 //将参数传递过去
	 $.post("/MaiJiaYun/servlet/cg/KuCunCSH2",{"buttonValue":buttonValue,"searchValue":searchValue,"stockStatus":stockStatus,"Info":"2333"},function(data){
			 //设置总条数
			 sum=data.length;
			 //显示总条数
			 $("#totalRecords").text(sum);
			 
			 
		    var myUl=$("tbody tr").remove();
		    var goodStr="";
		  
			$.each(data,function(index,element){
			//alert(element.goodName);
			       goodStr+="<tr skuid="+element.goodId+" modelid=\""+(index+1)+"\">"
							+"<td>"+element.sku+"</td><td>"+element.goodName+"</td>"
							+"<td>颜色分类:浅绿色;尺码:us6</td>"
							+"<td>"+element.goodId+"</td>"
							+"<td id=\"myCangKu\">"+buttonValue+"</td>"
							+"<td id=\"td_quantity2080281\">"
							+"<div class=\"dropdown \" style=\"position: relative;\" id=\"div_quantity2080281\">"
							+"<input class=\"form-control Integer dropdown-toggle\" data-toggle=\"dropdown\" type=\"number\" name=\"warehouseSkuQuantity\" value="+element.goodCount+" placeholder=\"未设置\" onblur=\"tableStyle(this)\">"
							+"<ul class=\"dropdown-menu scrollspy-example ul-binding\" role=\"menu\""
							+"style=\"left: 0px; background: #f8f8f8; max-height: 200px;\"></ul></div></td></tr>"
			});
			
			$("tbody").html(goodStr);
			firstPage();
			
	 });
}

function stockStatusQuery(){
	//得到仓库值
	var buttonValue=$("#myButton .pull-left").text().trim();
	//alert("仓库的值:"+buttonValue);
	
	var searchValue=$("#mySearch").val().trim();
	//alert("搜索框内的值:"+searchValue)
	
	stockStatus=stockStatus*(-1);//选择状态
	//alert("选择状态:"+stockStatus);
	
	 //将参数传递过去
	 $.post("/MaiJiaYun/servlet/cg/KuCunCSH2",{"buttonValue":buttonValue,"searchValue":searchValue,"stockStatus":stockStatus,"Info":"2333"},function(data){
		
		 //设置总条数
		 sum=data.length;
		 //显示总条数
		 $("#totalRecords").text(sum);
		 
		  var myUl=$("tbody tr").remove();
		  var goodStr="";

			$.each(data,function(index,element){
			
				       goodStr+="<tr skuid="+element.goodId+" modelid=\""+(index+1)+"\">"
								+"<td>"+element.sku+"</td><td>"+element.goodName+"</td>"
								+"<td>颜色分类:浅绿色;尺码:us6</td>"
								+"<td>"+element.goodId+"</td>"
								+"<td id=\"myCangKu\">"+buttonValue+"</td>"
								+"<td id=\"td_quantity2080281\">"
								+"<div class=\"dropdown \" style=\"position: relative;\" id=\"div_quantity2080281\">"
								+"<input class=\"form-control Integer dropdown-toggle\" data-toggle=\"dropdown\" type=\"number\" name=\"warehouseSkuQuantity\" value="+element.goodCount+" placeholder=\"未设置\" onblur=\"tableStyle(this)\">"
								+"<ul class=\"dropdown-menu scrollspy-example ul-binding\" role=\"menu\""
								+"style=\"left: 0px; background: #f8f8f8; max-height: 200px;\"></ul></div></td></tr>"
				 
				});
			
			$("tbody").html(goodStr);
			
			firstPage();
			
	 });
	
}


//完成初始化  按钮的js文件
function initComplete() {
	//得到仓库值
	var buttonValue=$("#myButton .pull-left").text().trim();


	var goodsStr="";
	$("tbody tr").each(function(item,i){
		
		if($(i).find("input").val().trim()!="0"){
			goodsStr+=$(i).attr("skuid").trim()+":"+$(i).find("input").val().trim()+",";
		}
		
	});
	
	
	
	$.post("/MaiJiaYun/servlet/cg/KuCunCSH2",{"buttonValue":buttonValue,"goodsStr":goodsStr,"Info":"1111"},function(data){
		
	});

}




function tableStyle(obj){
	
	var val=$(obj).val();
	$(obj).attr("value",val);
	
	if($(obj).parent().find("span").length  == 0){
		
		$(obj).parents("td").css("height","60px");
		$(obj).css("width","172px");
		$(obj).css("display","inline-block");
		$(obj).parent().append("<span class=\"iconfont icon-check green input-group-btn\" style=\"padding-left:10px; font-size:12px;display:inline-block;\"></span>");
		
	}
	
	
}
				
	//分页的改变size的 js 
function changePageSize(obj){
		
	var val=$(obj).text().trim();
	//将字符串转化成数字 赋值给每页条数
	pageCount=parseInt(val);
	$("#currentPageSize").text(val);
	
	//分页函数调用
	changePage2();
	
   }


function changeLast() {
	//alert(temporary);
	if($("#pagingPages ul li[page=\"1\"]").text().trim()=="1"){
		
	}else{
		var x=0;
		for(var i=1;i<=5;i++){
			x=parseInt($("#pagingPages ul li[page=\""+i+"\"]").text())-1;
			$("#pagingPages ul li[page=\""+i+"\"] a").text(x);
		}
	}
} 

function changeNext() {
	
	
   if(parseInt($("#pagingPages ul li[page=\"5\"]").text().trim())!=temporary&&parseInt($("#pagingPages ul li[page=\"5\"]").text().trim())<(temporary-1)){
	   var x=0;
		for(var i=1;i<=5;i++){
			x=parseInt($("#pagingPages ul li[page=\""+i+"\"]").text())+1;
			$("#pagingPages ul li[page=\""+i+"\"] a").text(x);
		}
	}
}
