<%@page import="mjy.kuguan.ruku.po.TuihuorukuPO"%>
<%@page import="mjy.kuguan.ruku.util.PageInfoBean"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="keywords" content="卖家云网络销售在线管理系统">
<meta name="description" content="NIIT-IGEEKHOME 17营第三小组">
<meta http-equiv="X-UA-Compatible" content="IE=8,9,chrome=1">


</head>
<script type="text/javascript">
var actualQuantitiesFocus = 0;
var actualQuantitiesOnblur = 0;
var lostQuantityFocus = 0;
var brokenQuantityFocus = 0;
var AllTuihuoxiangqingNum = 0;
var isactualQuantities = false;
var islostQuantity =false;
var isbrokenQuantity = false;
var NowPageInfo = "";
var NowPageNo = 1;
var NowWare = "";
var NowPageSize = 10;



function warehouseNo(){
	
	$.get("/MaiJiaYun/TuihuoAllWareHouseServlet", function(data){
		
		var ware = document.getElementById("warehouse");
		 ware.innerHTML ="";
		 ware.innerHTML += "<a href=\"javascript:void(0);\" tabindex=\"-1\" role=\"menuitem\" warehouseid=\"18016\" type=\"自有仓库\"><span onclick = \"getListByware('全部仓库')\">全部仓库</span></a>"
		$(data).find("message").each(function() {
		//	var $info = $(this).find("message");
			
				//alert($(this).text());
				var message = $(this).text();
			//	alert(message);
				ware.innerHTML += "<a href=\"javascript:void(0);\" tabindex=\"-1\" role=\"menuitem\" warehouseid=\"18016\" type=\"自有仓库\"><span onclick = \"getListByware('"+$(this).text()+"')\">"+$(this).text()+"</span></a>"
			});
		
	});

}


function getListByware(ware){
//	alert(ware);
	PageInfoSelectList("",1,ware);
}
function saveTuihuoxiangqing(note){
//	alert("xxx");
	var actualQuantities =  document.getElementsByName("actualQuantities");
	var lostQuantity = document.getElementsByName("lostQuantity");
	var brokenQuantity =  document.getElementsByName("brokenQuantity");
	var memos = document.getElementsByName("memos");
	var memo = document.getElementsByName("memo")[0].value;
	var str = "";

	for(i=0;i<actualQuantities.length;i++){
		str += "&actualQuantities"+i+"="+actualQuantities[i].value;
		str += "&lostQuantity"+i+"="+lostQuantity[i].value;
		str += "&brokenQuantity"+i+"="+brokenQuantity[i].value;
		str += "&memos"+i+"="+memos[i].value;
	}
//	alert(str);
var pageSize =  document.getElementById("currentPageSize").innerHTML;
 	$.get("/MaiJiaYun/RemoveTuihuoServlet?PruchaseNote="+note+str+"&memo="+memo+"&Info"+NowPageInfo+"&pageNo="+NowPageNo+"&warehouse="+NowWare+"&pageSize="+pageSize,function(data){
		
 		
 		
 		
 		
 		var paging = document.getElementById("paging");
		var tbody1 = document.getElementById("tbody1");
		paging.innerHTML = "";
//		alert(Info);
//		alert(document.getElementsByName("q")[0].value);
		
//			alert(str+"&Info="+NowPageInfo+"&pageNo="+NowPageNo+"&warehouse="+ware);
		
	
		
//			alert("xxx");
			tbody1.innerHTML = "" ; 
			var i = 0;
			
			$(data).find("CaigourukuPO").each(function(){
			//	alert("xxx");
				tbody1.innerHTML += "<tr id=\"PruchaseNote"+i+"\"><td><input type=\"checkbox\" name=\"checkOrder\"></td>"
				+"<td><a href=\"javascript:void(0);\"class=\"operate-ruku-edit\">"+$(this).find("caigouCode").text()+"</a></td>"
				+"<td>"+$(this).find("caigouCaigoudanCode").text()+"</td><td>"+$(this).find("caigouWarehouse").text()+"</td>"
				+"<td>"+$(this).find("caigouInCount").text()+"</td><td id = \"Infinish"+i+"\">"+$(this).find("caigouInFinish").text()+"</td>"
				+"<td>"+$(this).find("caigouSetTime").text()+"</td><td>"+$(this).find("caigouAuthor").text()+"</td><td colspan=\"2\">"
				+"<button data-target=\"#stock_upModal\" data-toggle=\"modal\"class=\"btn btn-default mr5 operate-ruku-edit\" type=\"button\" data-toggle=\"modal\" data-target=\"#stock_upModal\"	onclick=\"giveInfo("+i+")\">编辑入库</button>"
				
				+"</td></tr> ";
			
				
				i++;
			});
			var str = "";
			// "<div class=\"row\" style=\"margin: 0; -moz-user-select: none;\" onselectstart=\"return false;\" id=\"paging\">"
//			paging.innerHTML; 
			str+="<div style=\"float: right;\"> <div style=\"margin-right: 10px; float: left;\"> <ul class=\"pagination\">"
			+"<li class=\"dropup\"> <div class=\"lh30 left\" style=\"float: left;\">共</div><div class=\"btn-group\" style=\"margin: 0 5px; float: left;\">"
			+"<span class=\"lh30 left fb red\" id=\"totalRecords\" style=\"float: left;\">"+$(data).find("rowCount").text()+"</span>"
			+"<div class=\"lh30 left\" style=\"margin-left: 5px; float: left;\">条记录</div>"
			+"</div></li></ul></div><div style=\"width: 150px; float: left;\">"
			+"<ul class=\"pagination\"> <li class=\"dropup\">" 
			
			+"<div class=\"lh30 left\" style=\"float: left;\">每页显示</div>"
			+"<div class=\"btn-group\" style=\"margin: 0 5px; float: left;\"id=\"page_size\">"
			+"<button data-toggle=\"dropdown\"class=\"btn btn-default dropdown-toggle\" type=\"button\">"
			+"<span id=\"currentPageSize\">"+NowPageSize+"</span> <span class=\"caret\"></span></button>"
			+"<div class=\"lh30 left\"style=\"margin-left: 5px; float: left;\">个</div><ul role=\"menu\" class=\"dropdown-menu\" id=\"pageSizes\">"
			+"<li><a href=\"javascript:setPageSize(10);\">10</a></li><li><a href=\"javascript:setPageSize(20);\">20</a></li>"
			+"<li><a href=\"javascript:setPageSize(50);\">50</a></li><li><a href=\"javascript:setPageSize(100);\">100</a></li>"
			+"<li><a href=\"javascript:setPageSize(200);\">200</a></li><li><a href=\"javascript:setPageSize(20);\">20</a></li>"
			+"</ul></div>"
			
			+"</li> </ul></div><div style=\"width: 350px; float: left;\" id=\"pagingPages\"> <ul class=\"pagination\">";
			if($(data).find("pageNo").text()>1){
				
				str+=" <li id=\"last\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+(parseInt($(data).find("pageNo").text())-1)+",'"+NowWare+"')\">&lt;</span></li>";	
			}
			
			if($(data).find("pageNo").text()==1){
				str+="<li id=\"last\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+1+",'"+NowWare+"')\">&lt;</span></li>";	
			}
if($(data).find("pageCount").text()<5){
				
				for(a = 1;a<=$(data).find("pageCount").text();a++){
				 	if(a==$(data).find("pageNo").text()){
						str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+",'"+NowWare+"')\">"+a+"</span></li>";
					} else{
					str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+",'"+NowWare+"')\">"+a+"</span></li>";
					}
				}
			}else{
				if($(data).find("pageNo").text()<=3){
					for(a = 1;a<=5;a++){
						//
						if(a==$(data).find("pageNo").text()){
							str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+",'"+NowWare+"')\">"+a+"</span></li>";
						} else{
						str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+",'"+NowWare+"')\">"+a+"</span></li>"
						}
					}
				}
				if($(data).find("pageNo").text()>=$(data).find("pageCount").text()-2){
					for(a = $(data).find("pageCount").text();a>$(data).find("pageCount").text()-5;a--){
						if(a==$(data).find("pageNo").text()){
							str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+",'"+NowWare+"')\">"+a+"</span></li>";
						}else{ 
						str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+",'"+NowWare+"')\">"+a+"</span></li>"
					}
					}
				}
				if($(data).find("pageCount").text()-2>$(data).find("pageNo").text()>3){
					for(a = $(data).find("pageCount").text()-2;a<$(data).find("pageCount").text()+2;a++){
						if(a==$(data).find("pageNo").text()){
							str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+",'"+NowWare+"')\">"+a+"</span></li>";
						} else{
						str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+",'"+NowWare+"')\">"+a+"</span></li>"
						}
						}
				}
			}
			
			
		//	paging.innerHTML +=str+ "<li id=\"next\" class=\"fb fmsun\"><a 	href=\"javascript:void(0);\">&gt;</a></li></ul></div></div></div>"
			 if($(data).find("pageNo").text()<$(data).find("pageCount").text()){
				
				str+=" <li id=\"next\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+(parseInt($(data).find("pageNo").text())+1)+",'"+NowWare+"')\">&gt;</span></li>";	
			}
			
			if($(data).find("pageNo").text()==$(data).find("pageCount").text()){
				str+="<li id=\"next\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+$(data).find("pageCount").text()+",'"+NowWare+"')\">&gt;</span></li>";	
			}
			
			if($(data).find("pageCount").text()==0){
				str += "<li id=\"next\" class=\"fb fmsun\"><a 	href=\"javascript:void(0);\">&gt;</a></li></ul></div></div></div>";
			}
			
			
			paging.innerHTML +=str; 
			var xiashou = document.getElementById("li-xiaoshou");
			xiaoshou.firstChild.innerHTML = "销售退货入库("+$(data).find("rowCount").text()+")";
 		
 		
 		
 		
		
	}); 
		
 	
}


function giveInfo(i){
	
	var note = document.getElementById("PruchaseNote"+i).getElementsByTagName("td")[1].getElementsByTagName("a")[0].innerHTML;
	var info = document.getElementById("PurchaseInfoList");
	var form1 = document.getElementById("form1");

	info.innerHTML = "";
//	var form1 = document.getElementById("form1");
	var save = document.getElementById("save");
	
	$(save).attr("onclick","saveTuihuoxiangqing('"+note+"')");
//	$(form1).attr("action","/MaiJiaYun/AddTuiHuoServlet?TuihuoNote="+note);
	
	$.get("/MaiJiaYun/TuihuoxiangqingServlet?PruchaseNote="+note,function(data){
		var chooise = document.getElementById("chooiseWarehouse");
		chooise.innerHTML = "选择仓库："+$(data).find("worehouse").text();
		
		
		
		
		var Allnum = 0;
		var num = 0;
		$(data).find("tuihuoxiangqingPO").each(function() {
	//		alert("a");
			info.innerHTML += "<tr skuid=\"59369\"><td class=\"fb\">"+$(this).find("TuihuoSKU").text()+" <input type=\"hidden\"name=\"voucherSkuIds\" value=\"59369\"></td>"
			+"<td><a title=\"\" rel=\"tooltip\"	href=\"javascript:void(0);\"style=\"color: #333333; text-decoration: none;\"data-original-title=\""+$(this).find("TuihuoName").text()+"\">"+$(this).find("TuihuoName").text()+"</a></td>"
			+"<td><a title=\"\" rel=\"tooltip\"	href=\"javascript:void(0);\"style=\"color: #333333; text-decoration: none;\" data-original-title=\""+$(this).find("TuihuoProperty").text()+"\">"+$(this).find("TuihuoProperty").text()+"</a></td>"
			+"<td name=\"expectedQuantity\" val=\""+$(this).find("TuihuoQuantity").text()+"\" id=\"expectedQuantity"+num+"\">"+$(this).find("TuihuoQuantity").text()+"</td>"
			+"<td><div class=\"form-group\" style=\"width: 70px;\"><input type=\"text\"class=\"form-control Integer input-operate\"	name=\"actualQuantities\" id=\"actualQuantities"+num+"\" onfocus=\"getactualQuantities("+num+")\" style=\"width: 100%;\" value=\"0\" onblur=\"getactualQuantitiesBlur("+num+")\"></div></td>"
			+"<td><div class=\"form-group\" style=\"width: 70px;\"><input type=\"text\"class=\"form-control Integer input-operate\"name=\"lostQuantity\" style=\"width: 100%;\" value=\"0\" id=\"lostQuantity"+num+"\"  onfocus=\"getlostQuantity("+num+")\" onblur=\"getlostQuantityBlur("+num+")\"></div></td>"
			+"<td><div class=\"form-group\" style=\"width: 70px;\"><input type=\"text\"class=\"form-control Integer input-operate\"name=\"brokenQuantity\" style=\"width: 100%;\" id=\"brokenQuantity"+num+"\"  onfocus=\"getbrokenQuantity("+num+")\" onblur=\"getbrokenQuantityBlur("+num+")\" value=\"0\"></div></td>"
			+"<td><input type=\"text\" name=\"memos\"class=\"form-control\" value = \""+$(this).find("memo").text()+"\"></td></tr>";
			Allnum += parseInt($(this).find("TuihuoQuantity").text());
			num++;
		});
		AllTuihuoxiangqingNum = num;
		info.innerHTML += "<tr style=\"background: #dcdcdc; border: 1px solid #dcdcdc;\"><td colspan=\"3\" class=\"fb\">合计：</td>"
		+"<td class=\"fb\">需入库合计：<span id=\"total\" class=\"red\">"+Allnum+"</span></td>"
		+"<td class=\"fb\">可入库合计：<span id=\"actualQuantitys\"	class=\"red\">0</span></td>"
		+"<td class=\"fb\">破损合计：<span id=\"lostQuantitys\"	class=\"red\">0</span></td>"
		+"<td colspan=\"4\" class=\"fb\">丢失合计：<span id=\"brokenQuantitys\" class=\"red\">0</span></td>	</tr>"
	
	});
	
	
}

function getactualQuantities(i){
//	actualQuantitiesFocus = 0;
	var a = document.getElementById("actualQuantities"+i).value;
//	alert(a);

	actualQuantitiesFocus = a;
//	alert(actualQuantitiesFocus);
}
function getlostQuantity(i){
	var a = document.getElementById("lostQuantity"+i).value;
	lostQuantityFocus = a;
//	alert(lostQuantityFocus);
	
}

function getbrokenQuantity(i){
	var a = document.getElementById("brokenQuantity"+i).value;
	brokenQuantityFocus = a;
	
	
}






function getactualQuantitiesBlur(i){
	
	var b = document.getElementById("actualQuantities"+i).value;
	var c = document.getElementById("actualQuantitys").innerHTML;
	var d = parseInt(c)-parseInt(actualQuantitiesFocus)+parseInt(b);
	document.getElementById("actualQuantitys").innerHTML = d;
//	alert(d);
//	alert(actualQuantitiesFocus);
	isTrue();
}


function getlostQuantityBlur(i){
	var b = document.getElementById("lostQuantity"+i).value;
	var c = document.getElementById("lostQuantitys").innerHTML;
	var d = parseInt(c)-parseInt(lostQuantityFocus)+parseInt(b);
	document.getElementById("lostQuantitys").innerHTML = d;
	isTrue();
}

function getbrokenQuantityBlur(i){
	var b = document.getElementById("brokenQuantity"+i).value;
	var c = document.getElementById("brokenQuantitys").innerHTML;
	var d = parseInt(c)-parseInt(brokenQuantityFocus)+parseInt(b);
	document.getElementById("brokenQuantitys").innerHTML = d;
	isTrue();
}
function isTrue(){
	var isTrueNo = isTrueNum();
	
	if(isTrueNo){
//		alert("xxx");
		document.getElementById("save").disabled = false;
		document.getElementById("errorSpan").innerHTML =  "";
	}else{
//		alert("sss");
		document.getElementById("save").disabled = true;
		document.getElementById("errorSpan").innerHTML = "数量总和必须等于需入库数量！"; 
	}
	
}


function isTrueNum(){
	for(i=0;i<AllTuihuoxiangqingNum;i++){
		var actualQuantities = document.getElementById("actualQuantities"+i).value;
		var lostQuantity = document.getElementById("lostQuantity"+i).value;
		var brokenQuantity = document.getElementById("brokenQuantity"+i).value; 
		var expectedQuantity = document.getElementById("expectedQuantity"+i).innerHTML;
	//	alert(expectedQuantity);
	//	alert(parseInt(actualQuantities)+parseInt(lostQuantity)+parseInt(brokenQuantity));
	//	expectedQuantity == parseInt(actualQuantities+lostQuantity+brokenQuantity);
		if(expectedQuantity == parseInt(actualQuantities)+parseInt(lostQuantity)+parseInt(brokenQuantity)){
			
		}else{
			return false;
		}
		
	}
	return true;
}

function SelectList(){
	var q = document.getElementsByName("q")[0].value;
//	alert(q);
	PageInfoSelectList(q,1,"");
}


function PageInfoSelectList(value,PageNo,warehouse){
//	var ccc =  document.getElementById("PurchaseNote"+i).getElementsByTagName("td")[1].getElementsByTagName("a")[0].innerHTML;
	NowPageInfo = value;
	NowPageNo = PageNo;
	NowWare = warehouse;
	
	
	
	var pageSize =  document.getElementById("currentPageSize").innerHTML;
	$.get("/MaiJiaYun/TuihuoListSevlet?&Info="+NowPageInfo+"&pageNo="+NowPageNo+"&warehouse="+NowWare+"&pageSize="+pageSize,function(data){
 		var paging = document.getElementById("paging");
		var tbody1 = document.getElementById("tbody1");
		paging.innerHTML = "";
//		alert(Info);
//		alert(document.getElementsByName("q")[0].value);
		
//			alert(str+"&Info="+NowPageInfo+"&pageNo="+NowPageNo+"&warehouse="+ware);
		
	
		
//			alert("xxx");
			tbody1.innerHTML = "" ; 
			var i = 0;
			
			$(data).find("CaigourukuPO").each(function(){
			//	alert("xxx");
				tbody1.innerHTML += "<tr id=\"PruchaseNote"+i+"\"><td><input type=\"checkbox\" name=\"checkOrder\"></td>"
				+"<td><a href=\"javascript:void(0);\"class=\"operate-ruku-edit\">"+$(this).find("caigouCode").text()+"</a></td>"
				+"<td>"+$(this).find("caigouCaigoudanCode").text()+"</td><td>"+$(this).find("caigouWarehouse").text()+"</td>"
				+"<td>"+$(this).find("caigouInCount").text()+"</td><td id = \"Infinish"+i+"\">"+$(this).find("caigouInFinish").text()+"</td>"
				+"<td>"+$(this).find("caigouSetTime").text()+"</td><td>"+$(this).find("caigouAuthor").text()+"</td><td colspan=\"2\">"
				+"<button data-target=\"#stock_upModal\" data-toggle=\"modal\"class=\"btn btn-default mr5 operate-ruku-edit\" type=\"button\" data-toggle=\"modal\" data-target=\"#stock_upModal\"	onclick=\"giveInfo("+i+")\">编辑入库</button>"
				
				+"</td></tr> ";
			
				
				i++;
			});
			var str = "";
			// "<div class=\"row\" style=\"margin: 0; -moz-user-select: none;\" onselectstart=\"return false;\" id=\"paging\">"
//			paging.innerHTML; 
			str+="<div style=\"float: right;\"> <div style=\"margin-right: 10px; float: left;\"> <ul class=\"pagination\">"
			+"<li class=\"dropup\"> <div class=\"lh30 left\" style=\"float: left;\">共</div><div class=\"btn-group\" style=\"margin: 0 5px; float: left;\">"
			+"<span class=\"lh30 left fb red\" id=\"totalRecords\" style=\"float: left;\">"+$(data).find("rowCount").text()+"</span>"
			+"<div class=\"lh30 left\" style=\"margin-left: 5px; float: left;\">条记录</div>"
			+"</div></li></ul></div><div style=\"width: 150px; float: left;\">"
			+"<ul class=\"pagination\"> <li class=\"dropup\"> "
			+"<div class=\"lh30 left\" style=\"float: left;\">每页显示</div>"
			+"<div class=\"btn-group\" style=\"margin: 0 5px; float: left;\"id=\"page_size\">"
			+"<button data-toggle=\"dropdown\"class=\"btn btn-default dropdown-toggle\" type=\"button\">"
			+"<span id=\"currentPageSize\">"+NowPageSize+"</span> <span class=\"caret\"></span></button>"
			+"<div class=\"lh30 left\"style=\"margin-left: 5px; float: left;\">个</div><ul role=\"menu\" class=\"dropdown-menu\" id=\"pageSizes\">"
			+"<li><a href=\"javascript:setPageSize(10);\">10</a></li><li><a href=\"javascript:setPageSize(20);\">20</a></li>"
			+"<li><a href=\"javascript:setPageSize(50);\">50</a></li><li><a href=\"javascript:setPageSize(100);\">100</a></li>"
			+"<li><a href=\"javascript:setPageSize(200);\">200</a></li><li><a href=\"javascript:setPageSize(20);\">20</a></li>"
			+"</ul></div>"
			+"</li></ul></div><div style=\"width: 350px; float: left;\" id=\"pagingPages\"> <ul class=\"pagination\">";
			if($(data).find("pageNo").text()>1){
				
				str+=" <li id=\"last\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+(parseInt($(data).find("pageNo").text())-1)+",'"+NowWare+"')\">&lt;</span></li>";	
			}
			
			if($(data).find("pageNo").text()==1){
				str+="<li id=\"last\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+1+",'"+NowWare+"')\">&lt;</span></li>";	
			}
				
			if($(data).find("pageCount").text()<5){
				
				for(a = 1;a<=$(data).find("pageCount").text();a++){
				 	if(a==$(data).find("pageNo").text()){
						str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+",'"+NowWare+"')\">"+a+"</span></li>";
					} else{
					str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+",'"+NowWare+"')\">"+a+"</span></li>";
					}
				}
			}else{
				if($(data).find("pageNo").text()<=3){
					for(a = 1;a<=5;a++){
						//
						if(a==$(data).find("pageNo").text()){
							str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+",'"+NowWare+"')\">"+a+"</span></li>";
						} else{
						str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+",'"+NowWare+"')\">"+a+"</span></li>"
						}
					}
				}
				if($(data).find("pageNo").text()>=$(data).find("pageCount").text()-2){
					for(a = $(data).find("pageCount").text();a>$(data).find("pageCount").text()-5;a--){
						if(a==$(data).find("pageNo").text()){
							str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+",'"+NowWare+"')\">"+a+"</span></li>";
						}else{ 
						str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+",'"+NowWare+"')\">"+a+"</span></li>"
					}
					}
				}
				if($(data).find("pageCount").text()-2>$(data).find("pageNo").text()>3){
					for(a = $(data).find("pageCount").text()-2;a<$(data).find("pageCount").text()+2;a++){
						if(a==$(data).find("pageNo").text()){
							str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+",'"+NowWare+"')\">"+a+"</span></li>";
						} else{
						str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+",'"+NowWare+"')\">"+a+"</span></li>"
						}
						}
				}
			}
			
		//	paging.innerHTML +=str+ "<li id=\"next\" class=\"fb fmsun\"><a 	href=\"javascript:void(0);\">&gt;</a></li></ul></div></div></div>"
			 if($(data).find("pageNo").text()<$(data).find("pageCount").text()){
				
				str+=" <li id=\"next\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+(parseInt($(data).find("pageNo").text())+1)+",'"+NowWare+"')\">&gt;</span></li>";	
			}
			
			if($(data).find("pageNo").text()==$(data).find("pageCount").text()){
				str+="<li id=\"next\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+$(data).find("pageCount").text()+",'"+NowWare+"')\">&gt;</span></li>";	
			}
			
			if($(data).find("pageCount").text()==0){
				str += "<li id=\"next\" class=\"fb fmsun\"><a 	href=\"javascript:void(0);\">&gt;</a></li></ul></div></div></div>";
			}
			
			
			paging.innerHTML +=str; 
			var xiashou = document.getElementById("li-xiaoshou");
			xiaoshou.firstChild.innerHTML = "销售退货入库("+$(data).find("rowCount").text()+")";
	
		});
		
//	updataclass();

}
	function updataclass(){
		var pageclass = document.getElementsByName("pageclass");
		
		$(pageclass).each(function(){
			//alert( $(this).attr("page"));
			if($(this).attr("page")==NowPageNo){
				$(this).attr("class","page active");
				
			}else{
				$(this).attr("class","fb fmsun");
			}
		});
	}
	
	
	function setPageSize(size){
		NowPageSize  = size;
		document.getElementById("currentPageSize").innerHTML = size;
		PageInfoSelectList(NowPageInfo,1,NowWare);
	}
	
	



</script>

<body style="padding-right: 0px;" class="">

<%
	String caigouNum = request.getAttribute("caigouNum")==null?"":request.getAttribute("caigouNum").toString();
	String diaoboNum = request.getAttribute("diaoboNum")==null?"":request.getAttribute("diaoboNum").toString();


	PageInfoBean pageInfoBean = (PageInfoBean)request.getAttribute("PageInfoBean");
	
	List<TuihuorukuPO> list =pageInfoBean.getList();
%>



	<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
	<div class="content" id="content">
		<!--titletab star-->
		<div class="collapse navbar-collapse navbar-default navbar-titletab"
			style="padding: 0px;">
			<div class="navbar-header">
				<a href="#" class="navbar-brand ml20">入库单</a>
			</div>
			<ul class="nav nav-tabs f14 fb">
				<!-- 修改了href实现本地页面跳转（待改进） -->
				<li id="li-caigou" class="tab" style="margin-left: 20px"><a class="c6"
					href="/MaiJiaYun/servlet/Purchase">采购入库(<%=caigouNum %>)<span></span></a></li>
				<li id="li-xiaoshou" class="ml20 tab active" style="margin-left: 0px"><a class=""
					href="/MaiJiaYun/servlet/ReturnSales">销售退货入库(<%=pageInfoBean.getRowCount() %>)<span></span></a></li>
				<li id="li-diaobo" class="tab"><a class="c6"
					href="${pageContext.request.contextPath}/servlet/DiaoborukudanServlet">调拨入库(<%=diaoboNum %>)<span></span></a></li>
				<li id="li-conplete" class="tab"><a class="c6"
					href="${pageContext.request.contextPath}/servlet/WanchengServlet">已完成入库</a></li>
				<li class="pull-right" id="li-query" style="padding-top: 12px;">
					<div class="w340">
						<div class="input-group">
							<input value="" name="q" class="form-control"
								placeholder="入库单编号/相关单据号/制单人" type="text" > <span
								class="input-group-btn">
								<button type="button" class="btn btn-primary query" onclick="SelectList()" style="height: 33px">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<!--titletab end-->
		<div id="panel" class="prl10auto">
			<div class="btn-group-block">
				<div class="btn-group mr5" id="divImport">
					<button class="btn btn-default" type="button" id="importButton"
						data-toggle="modal" data-target="#daochu">导出</button>
					<button id="importOrderListButton" type="button"
						class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="height: 34px">
						<span class="glyphicon glyphicon-save mr5"></span><span
							style="display: none;" class="f10" id="taskCount"></span>
					</button>
					<ul id="importOrderUl" aria-labelledby="importOrderListButton"
						style="width: 340px; height: 200px;" role="menu"
						class="dropdown-menu scrollspy-example">
						<li>
							<div class=" mr20 ml20" style="border-bottom: 1px solid #eeeeee;">
								<div style="line-height: 60px; text-align: center;">
									<span class="c6" style="display: inline;">当前没有进行中的任务</span>
								</div>
							</div>
						</li>
					</ul>
				</div>

			</div>
			<!--table star-->
			<div class="panel mt15">
				<!-- Table -->
				<table class="table table-striped table-hover">
					<thead class=" table-bordered">
						<tr>
							<th width="50"><input type="checkbox"></th>
							<th>入库单编号</th>
							<th>相关销售退货单</th>
							<th width="130">
								<div class="dropdown">
									<button data-toggle="dropdown" id="dropdownMenu1" type="button"
										style="padding: 0px; box-shadow: none; background: transparent none repeat scroll 0% 0%;"
										class="btn dropdown-toggle fb" onclick="warehouseNo()">
										入库仓库 <span class="caret"></span>
									</button>
									<ul aria-labelledby="dropdownMenu1" role="menu"
										class="dropdown-menu">

										<li role="presentation" id = warehouse><!-- <a href="#" tabindex="-1"
											role="menuitem" warehouseid="18016" type="自有仓库">默认仓库</a></li> -->

									</ul>
								</div>
							</th>
							<th>入库数量</th>
							<th>已入库数量</th>
							<th>制单时间</th>
							<th>制单人</th>
							<th width="220">操作</th>

						</tr>
					</thead>

					<!-- 默认 -->
					<!--
                  <tbody>
                    
                    
                    <tr>
                      <td colspan="9"><div class="tc c6">暂无数据</div></td>
                    </tr>
                    
                  </tbody>
				  -->
					<!-- 模拟数据 -->
					<tbody id = "tbody1">
						<%
							int i = 0;
							if(list!=null){
								for(TuihuorukuPO tpo : list){
						%>
								<tr modelid="36665" id ="PruchaseNote<%=i%>">
									<td ><input
									type="checkbox" name="checkOrder" value="36665"></td>
									<td ><a
									href="javascript:void(0);" class="operate-ruku-edit" id="PurchaseNote<%=i %>"><%=tpo.getTuihuoCode()%></a>
									</td>
								<!--style="background-color: rgb(240, 248, 253);"  -->
									<td ><%=tpo.getTuihuoTuihuodanCode()%></td>
									<td ><%=tpo.getTuihuoWarehouse() %></td>
									<td ><%=tpo.getTuihuoInCount() %></td>
									<td ><%=tpo.getTuihuoInFinish() %></td>
									<td ><%=tpo.getTuihuoSetTime() %></td>
									<td ><%=tpo.getTuihuoAuthor() %></td>		
									<td colspan="2" >
									
										<button data-target="#stock_upModal" data-toggle="modal" class="btn btn-default mr5 operate-ruku-edit" type="button" onclick="giveInfo(<%=i %>)">编辑入库</button>

									<!-- <button class="btn btn-default operate-reject" type="button">驳回到销售退货单</button>-->
									</td>
								</tr>	
							
						<%			
									i++;
								}
							}
						
						%>
						
							

					</tbody>

				</table>

				<!--table end-->
				<!--分页 star-->
				
						<div class="row" style="margin: 0; -moz-user-select: none;"
							onselectstart="return false;" id="paging">
							<div style="float: right;">
								<div style="margin-right: 10px; float: left;">
									<ul class="pagination">
										<li class="dropup">
											<div class="lh30 left" style="float: left;">共</div>
											<div class="btn-group" style="margin: 0 5px; float: left;">
												<span class="lh30 left fb red" id="totalRecords"
													style="float: left;"><%=pageInfoBean.getRowCount()%></span>
												<div class="lh30 left"
													style="margin-left: 5px; float: left;">条记录</div>
											</div>
										</li>
									</ul>
								</div>
								<div style="width: 150px; float: left;">
									<ul class="pagination">
										<li class="dropup">
								<div class="lh30 left" style="float: left;">每页显示</div>
											 <div class="btn-group" style="margin: 0 5px; float: left;"
												id="page_size">
												<button data-toggle="dropdown"
													class="btn btn-default dropdown-toggle" type="button">
													<span id="currentPageSize">10</span> <span class="caret"></span>
												</button>
												<div class="lh30 left"
													style="margin-left: 5px; float: left;">个</div>
												<ul role="menu" class="dropdown-menu" id="pageSizes">
													<li><a href="javascript:setPageSize(10);">10</a></li>
													<li><a href="javascript:setPageSize(20);">20</a></li>
													<li><a href="javascript:setPageSize(50);">50</a></li>
													<li><a href="javascript:setPageSize(100);">100</a></li>
													<li><a href="javascript:setPageSize(200);">200</a></li>
													<li><a href="javascript:setPageSize(20);">20</a></li>
								<!--			<li><a href="javascript:void(0);">50</a></li>-->
												</ul>
											</div> 
										</li>
									</ul>
								</div>

								<div style="width: 350px; float: left;" id="pagingPages">
									<ul class="pagination">
										<!-- <li id="last" class="fb fmsun"><a
											href="javascript:void(0);">&lt;</a></li> -->
											<!-- 
											if($(data).find("pageNo").text()>1){
				
				str+=" <li id=\"last\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+(parseInt($(data).find("pageNo").text())-1)+",'"+NowWare+"')\">&lt;</span></li>";	
			}
			
			if($(data).find("pageNo").text()==1){
				str+="<li id=\"last\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+1+",'"+NowWare+"')\">&lt;</span></li>";	
			} -->
			<%
			String value = "";
				if(Integer.parseInt(pageInfoBean.getPageNo())>1){
					%>
					<li id="last" class="fb fmsun"><span  onclick="PageInfoSelectList('<%=value %>',<%=Integer.parseInt(pageInfoBean.getPageNo())-1%>,'<%=value%>')">&lt;</span></li>
					
					<%
				}else{
					%>
					<li id="last" class="fb fmsun"><span  onclick="PageInfoSelectList('<%=value %>',<%=1%>,'<%=value%>')">&lt;</span></li>
					<%
				}
			%>
										<%
										
											if (pageInfoBean != null) {
												if (Integer.parseInt(pageInfoBean.getPageCount()) <= 5) {
													
													for (int no = 1; no <= Integer.parseInt(pageInfoBean.getPageCount()); no++) {
														if(no == 1){
										%>
										<li name="pageclass" class="page active" page="<%=no%>"><span onclick="PageInfoSelectList('<%=value %>',<%=no%>,'<%=value %>')"><%=no %></span></li>

										<%
														}else{
															%>
										<li name="pageclass" class="fb fmsun" page="<%=no%>"><span onclick="PageInfoSelectList('<%=value %>',<%=no%>,'<%=value %>')"><%=no %></span></li>
															<%
															
														}
											}
												} else if (Integer.parseInt(pageInfoBean.getPageCount()) > 5) {
											//		if (Integer.parseInt(pageInfoBean.getPageNo()) > 3) {
														int pageno = 3;
										%>
										<li name="pageclass" class="fb fmsun" page=<%=(1)%>><span onclick="PageInfoSelectList(<%=value %>,<%=(1)%>,'<%=value %>')"><%=(pageno - 2) %></span>
										</li>
										<li name="pageclass" class="page active" page=<%=(2)%>><span onclick="PageInfoSelectList(<%=value %>,<%=(2)%>,'<%=value %>')"><%=(pageno - 1) %></span>
										</li>
										<li name="pageclass" class="page active" page=<%=(3)%>><span onclick="PageInfoSelectList(<%=value %>,<%=(pageno)%>,'<%=value %>')"><%=(pageno) %></span>
										</li>
										<li name="pageclass" class="page active" page=<%=(4)%>><span onclick="PageInfoSelectList(<%=value %>,<%=(pageno + 1)%>,'<%=value %>')"><%=(pageno + 1) %></span>										</li>
										</li>
										<li name="pageclass" class="page active" page=<%=(5)%>><span onclick="PageInfoSelectList(<%=value %>,<%=(pageno + 2)%>,'<%=value %>')"><%=(pageno + 2) %></span>
										</li>
										<%
											}
												}
								//			}
										%>


										<!-- <li id="next" class="fb fmsun"><a
											href="javascript:void(0);">&gt;</a></li> -->
											<%
		
				if(Integer.parseInt(pageInfoBean.getPageNo())<Integer.parseInt(pageInfoBean.getPageCount())){
					%>
					<li id="next" class="fb fmsun"><span  onclick="PageInfoSelectList('<%=value %>',<%=Integer.parseInt(pageInfoBean.getPageNo())+1%>,'<%=value%>')">&gt;</span></li>
					
					<%
				}else{
					%>
					<li id="next" class="fb fmsun"><span  onclick="PageInfoSelectList('<%=value %>',<%=Integer.parseInt(pageInfoBean.getPageNo())%>,'<%=value%>')">&gt;</span></li>
					<%
				}
			%>
									</ul>
								</div>
							</div>
						</div>
				<!--分页 end-->
				<!--编辑入库 star-->
				<!-- aria-hidden=false,class="modal fade in", style="display: block;" 显示模态框 -->
				<div aria-hidden="true" aria-labelledby="stock_upModalLabel"
					role="dialog" tabindex="-1" id="stock_upModal" class="modal fade"
					style="display: none;">
					<div style="width: 1000px;" class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button aria-hidden="true" data-dismiss="modal" class="close"
									type="button">×</button>
								<h4 id="stock_upModalLabel" class="modal-title">编辑入库</h4>
							</div>
							<div class="modal-body" style="padding-top: 0px;">
								<form class="form-inline" role="search" id="form1" method="post">
									<input type="hidden" name="warehouseVoucherId" value="36665">
									<!--part1 star-->
									<div class="btn-group-block">
										<!--search star-->
										<div class="form-group">商品扫描：</div>
										<!--search end-->
										<!--search star-->
										<div class="form-group mr20">
											<div class="input-group">
												<input id="goodsSku" type="text" class="form-control">
											</div>
										</div>
										<div class="form-group" id="chooiseWarehouse">选择仓库：默认仓库</div>
										<!--search end-->
									</div>
									<!--part1 end-->
									<!--part2 star-->
									<div class="tl lh30 scrollspy-example"
										style="max-height: 230px">
										<table style="margin-bottom: 0"
											class="table table-striped table-hover">
											<thead class=" table-bordered">
												<tr>
													<th>SKU编码</th>
													<th>商品名称</th>
													<th>商品属性</th>
													<th>需入库数量</th>
													<th>可入库数量</th>
													<th>破损数量</th>
													<th>丢失数量</th>
													<th>备注</th>
												</tr>
											</thead>
											<tbody style="font-weight: normal" id="PurchaseInfoList">

											
											</tbody>
										</table>
									</div>
									<!--part2 end-->
									<!--part3 star-->
									<div class="tl lh30 pt10">
										<div class="row f14 fb mt20">
											<div class="col-sm-12">入库备注</div>
											<div class="col-sm-12">
												<textarea name="memo" rows="3" class="form-control"
													style="width: 100%;"></textarea>
											</div>
										</div>
									</div>
									<!--patr3 end-->
									
								</form>
								
								
							</div>
							<div class="modal-footer">
								<!-- <button class="btn btn-primary" id="progress" type="button">保存进度</button> -->
								<button data-dismiss="modal" class="btn btn-default" id="save" disabled="disabled"  >确认入库</button>
									<button data-dismiss="modal" class="btn btn-default"
									type="button">取消</button>
								<span id="errorSpan" style="color: red"></span>
							</div>
						</div>
					</div>
				</div>
				<div aria-hidden="true" aria-labelledby="stock_upinfoModalLabel"
					role="dialog" tabindex="-1" id="stock_upinfoModal"
					class="modal fade" style="display: none;"></div>
				<!--编辑入库 end-->
			</div>
		</div>
	</div>
	<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"
		id="daochu">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="bootbox-close-button close"
						data-dismiss="modal" aria-hidden="true" style="margin-top: -10px;">×</button>
					<div class="bootbox-body">请选择您要导出的入库单</div>
				</div>
				<div class="modal-footer">
					<button data-bb-handler="ok" type="button" class="btn btn-primary"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 模态框背景 -->
	<div id="modal_background" class=""></div>

</body>
</html>