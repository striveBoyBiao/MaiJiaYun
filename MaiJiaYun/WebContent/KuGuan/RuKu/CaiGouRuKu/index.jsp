<%@page import="mjy.kuguan.ruku.po.CaigourukuPO"%>
<%@page import="mjy.kuguan.ruku.util.PageInfo"%>


<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>

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

<!-- 驳回 -->

<script type="text/javascript">
var NowPageNo = "1";
var NowPageInfo = "";
var NowWare = "";
var NowPageSize = 10;
		function testMethod(i) {
			

			
			var ccc =  document.getElementById("PurchaseNote"+i).getElementsByTagName("td")[1].getElementsByTagName("a")[0].innerHTML;
			var removeSome = document.getElementsByName("removeSome"+i)[0];
			$.get("/MaiJiaYun/RemoveServlet?RemovePurchaseNote="+ccc+NowPageInfo+"&pageNo="+NowPageNo+"&warehouse="+NowWare+"&pageSize="+NowPageSize,function(data){
		 		var paging = document.getElementById("paging");
				var tbody1 = document.getElementById("tbody1");
				paging.innerHTML = "";
		//		alert(Info);
		//		alert(document.getElementsByName("q")[0].value);
				
	//			alert(str+"&Info="+NowPageInfo+"&pageNo="+NowPageNo+"&warehouse="+ware);
				var	Info = "Info=";
			
				
		//			alert("xxx");
					tbody1.innerHTML = "" ; 
					var i = 0;
					
					$(data).find("CaigourukuPO").each(function(){
					//	alert("xxx");
						tbody1.innerHTML += "<tr id=\"PurchaseNote"+i+"\"><td><input type=\"checkbox\" name=\"checkOrder\"></td>"
						+"<td><a href=\"javascript:void(0);\"class=\"operate-ruku-edit\">"+$(this).find("caigouCode").text()+"</a></td>"
						+"<td>"+$(this).find("caigouCaigoudanCode").text()+"</td><td>"+$(this).find("caigouWarehouse").text()+"</td>"
						+"<td>"+$(this).find("caigouInCount").text()+"</td><td id = \"Infinish"+i+"\">"+$(this).find("caigouInFinish").text()+"</td>"
						+"<td>"+$(this).find("caigouSetTime").text()+"</td><td>"+$(this).find("caigouAuthor").text()+"</td><td colspan=\"2\">"
						+"<button data-target=\"#stock_upModal\" data-toggle=\"modal\"class=\"btn btn-default mr5 operate-ruku-edit\" type=\"button\" data-toggle=\"modal\" data-target=\"#stock_upModal\"	onclick=\"giveInfo("+i+")\">编辑入库</button>"
						+"<button class=\"btn btn-default operate-reject\" type=\"button\" name=\"removeSome"+i+"\"	id=\"removeSome\" onclick=\"testMethod("+i+")\" >驳回到采购单</button>"
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
						
						str+=" <li id=\"last\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+(parseInt($(data).find("pageNo").text())-1)+")\">&lt;</span></li>";	
					}
					
					if($(data).find("pageNo").text()==1){
						str+="<li id=\"last\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+1+")\">&lt;</span></li>";	
					}
						
					if($(data).find("pageCount").text()<5){
						
						for(a = 1;a<=$(data).find("pageCount").text();a++){
						 	if(a==$(data).find("pageNo").text()){
								str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
							} else{
							str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
							}
						}
					}else{
						if($(data).find("pageNo").text()<=3){
							for(a = 1;a<=5;a++){
								//
								if(a==$(data).find("pageNo").text()){
									str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
								} else{
								str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>"
								}
							}
						}
						if($(data).find("pageNo").text()>=$(data).find("pageCount").text()-2){
							for(a = $(data).find("pageCount").text();a>$(data).find("pageCount").text()-5;a--){
								if(a==$(data).find("pageNo").text()){
									str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
								}else{ 
								str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>"
							}
							}
						}
						if($(data).find("pageCount").text()-2>$(data).find("pageNo").text()>3){
							for(a = $(data).find("pageCount").text()-2;a<$(data).find("pageCount").text()+2;a++){
								if(a==$(data).find("pageNo").text()){
									str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
								} else{
								str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>"
								}
								}
						}
					}
					
				//	paging.innerHTML +=str+ "<li id=\"next\" class=\"fb fmsun\"><a 	href=\"javascript:void(0);\">&gt;</a></li></ul></div></div></div>"
					 if($(data).find("pageNo").text()<$(data).find("pageCount").text()){
						
						str+=" <li id=\"next\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+(parseInt($(data).find("pageNo").text())+1)+")\">&gt;</span></li>";	
					}
					
					if($(data).find("pageNo").text()==$(data).find("pageCount").text()){
						str+="<li id=\"next\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+$(data).find("pageCount").text()+")\">&gt;</span></li>";	
					}
					
					if($(data).find("pageCount").text()==0){
						str += "<li id=\"next\" class=\"fb fmsun\"><a 	href=\"javascript:void(0);\">&gt;</a></li></ul></div></div></div>";
					}
					paging.innerHTML += str;
					var caigou = document.getElementById("li-caigou");
					caigou.firstChild.innerHTML = "采购入库("+$(data).find("rowCount").text()+")";
					whenStart(); 
					
					
				});
				
	
			/* if(NowWare!=null||NowWare!=""){
				BywareAndPage(NowWare,NowPageNo);
			}else{
				PageInfoSelectList(NowPageInfo,NowPageNo);
			} */
			
		
			
		}
	
		/*数字不能大于最大数值  */
		function overage(num){
			var newNumber = document.getElementsByName("actualQuantities"+num)[0].value;
		//	alert("xxx");
			var oldNumber = document.getElementsByName("actualQuantities"+num)[0].max;
		//	alert(oldNumber);
			var errorNum = document.getElementsByName("errorNum")[0];
			
			 if(newNumber==""||newNumber == null){
				document.getElementsByName("actualQuantities"+num)[0].value = 0;
			}
			
			
			if(parseInt(newNumber)>parseInt(oldNumber)){
		//		alert("xxx");
		//		errorNum.style ="hidden"; 
				document.getElementsByName("actualQuantities"+num)[0].value = oldNumber;
		//		errorNum.innerHTML = "不能大于"+newNumber;
		//		errorNum.show(500);
			}else{
			//	alert("x");
				errorNum.style ="visible"; 
			}
			
			
		}
		
		function getListByware(ware){
			
			BywareAndPage(ware,1);
			NowWare = ware;
			NowPageNo = 1;
		}
		
		function BywareAndPage(ware,page){
			
			NowWare = ware;
			NowPageNo = page;
			var paging = document.getElementById("paging");
			var tbody1 = document.getElementById("tbody1");
			paging.innerHTML = "";
		//	alert(ware);
			$.get("/MaiJiaYun/GetWoreHouseServlet?warehouse="+ware+"&pageNo="+page+"&pageSize="+NowPageSize,function(data){
		 		
			//	alert("xxx");
					tbody1.innerHTML = "" ; 
					var i = 0;
					
					$(data).find("CaigourukuPO").each(function(){
						
						tbody1.innerHTML += "<tr id=\"PurchaseNote"+i+"\"><td><input type=\"checkbox\" name=\"checkOrder\"></td>"
						+"<td><a href=\"javascript:void(0);\"class=\"operate-ruku-edit\">"+$(this).find("caigouCode").text()+"</a></td>"
						+"<td>"+$(this).find("caigouCaigoudanCode").text()+"</td><td>"+$(this).find("caigouWarehouse").text()+"</td>"
						+"<td>"+$(this).find("caigouInCount").text()+"</td><td id = \"Infinish"+i+"\">"+$(this).find("caigouInFinish").text()+"</td>"
						+"<td>"+$(this).find("caigouSetTime").text()+"</td><td>"+$(this).find("caigouAuthor").text()+"</td><td colspan=\"2\">"
						+"<button data-target=\"#stock_upModal\" data-toggle=\"modal\"class=\"btn btn-default mr5 operate-ruku-edit\" type=\"button\" data-toggle=\"modal\" data-target=\"#stock_upModal\"	onclick=\"giveInfo("+i+")\">编辑入库</button>"
						+"<button class=\"btn btn-default operate-reject\" type=\"button\" name=\"removeSome"+i+"\"	id=\"removeSome\" onclick=\"testMethod("+i+")\" >驳回到采购单</button>"
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
					
					
					
					
					
					+"</li> </ul></div><div style=\"width: 350px; float: left;\" id=\"pagingPages\"> <ul class=\"pagination\">";
					if($(data).find("pageNo").text()>1){
						
						str+=" <li id=\"last\" class=\"fb fmsun\"><span  onclick=\"BywareAndPage('"+ware+"',"+(parseInt($(data).find("pageNo").text())-1)+")\">&lt;</span></li>";	
					}
					
					if($(data).find("pageNo").text()==1){
						str+="<li id=\"last\" class=\"fb fmsun\"><span  onclick=\"BywareAndPage('"+ware+"',"+1+")\">&lt;</span></li>";	
					}
						
		//			alert($(data).find("pageCount").text());
					
					
					if($(data).find("pageCount").text()<5){
						
						for(a = 1;a<=$(data).find("pageCount").text();a++){
						 	if(a==$(data).find("pageNo").text()){
								str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"BywareAndPage('"+ware+"',"+a+")\">"+a+"</span></li>";
							} else{
							str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"BywareAndPage('"+ware+"',"+a+")\">"+a+"</span></li>";
							}
						}
					}else{
						if($(data).find("pageNo").text()<=3){
							for(a = 1;a<=5;a++){
								//
								if(a==$(data).find("pageNo").text()){
									str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"BywareAndPage('"+ware+"',"+a+")\">"+a+"</span></li>";
								} else{
								str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"BywareAndPage('"+ware+"',"+a+")\">"+a+"</span></li>"
								}
							}
						}
						if($(data).find("pageNo").text()>=$(data).find("pageCount").text()-2){
							for(a = $(data).find("pageCount").text();a>$(data).find("pageCount").text()-5;a--){
								if(a==$(data).find("pageNo").text()){
									str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"BywareAndPage('"+ware+"',"+a+")\">"+a+"</span></li>";
								}else{ 
								str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"BywareAndPage('"+ware+"',"+a+")\">"+a+"</span></li>"
							}
							}
						}
						if($(data).find("pageCount").text()-2>$(data).find("pageNo").text()>3){
							for(a = $(data).find("pageCount").text()-2;a<$(data).find("pageCount").text()+2;a++){
								if(a==$(data).find("pageNo").text()){
									str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"BywareAndPage('"+ware+"',"+a+")\">"+a+"</span></li>";
								} else{
								str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"BywareAndPage('"+ware+"',"+a+")\">"+a+"</span></li>"
								}
								}
						}
					}
					
				//	paging.innerHTML +=str+ "<li id=\"next\" class=\"fb fmsun\"><a 	href=\"javascript:void(0);\">&gt;</a></li></ul></div></div></div>"
					 if($(data).find("pageNo").text()<$(data).find("pageCount").text()){
						
						str+=" <li id=\"next\" class=\"fb fmsun\"><span  onclick=\"BywareAndPage('"+ware+"',"+(parseInt($(data).find("pageNo").text())+1)+")\">&gt;</span></li>";	
					}
					
					if($(data).find("pageNo").text()==$(data).find("pageCount").text()){
						str+="<li id=\"next\" class=\"fb fmsun\"><span  onclick=\"BywareAndPage('"+ware+"',"+$(data).find("pageCount").text()+")\">&gt;</span></li>";	
					}
					
					if($(data).find("pageCount").text()==0){
						str += "<li id=\"next\" class=\"fb fmsun\"><a 	href=\"javascript:void(0);\">&gt;</a></li></ul></div></div></div>";
					}
					paging.innerHTML += str;
					whenStart();
				});
			
			} 
			
				
				
				
			
		
		
		/* 仓库信息 */
		function warehouseNo(){
			
			
			
			$.get("/MaiJiaYun/WarehouseNoSelvet", function(data){
			//	alert("a");
			   
				var ware = document.getElementById("warehouse");
				 ware.innerHTML ="";
				 ware.innerHTML += "<a href=\"javascript:void(0);\" tabindex=\"-1\" role=\"menuitem\" warehouseid=\"18016\" type=\"自有仓库\"><span onclick = \"getListByware('全部仓库')\">全部仓库</span></a>"
		//		 ware.innerHTML += "<a href=\"/MaiJiaYun/GetWoreHouseServlet?warehouse=全部仓库\" tabindex=\"-1\" role=\"menuitem\" warehouseid=\"18016\" type=\"自有仓库\">全部仓库</a>"
				$(data).find("message").each(function() {
				//	var $info = $(this).find("message");
					
						//alert($(this).text());
						var message = $(this).text();
					//	alert(message);
						
						ware.innerHTML += "<a href=\"javascript:void(0);\" tabindex=\"-1\" role=\"menuitem\" warehouseid=\"18016\" type=\"自有仓库\"><span onclick = \"getListByware('"+message+"')\">"+message+"</span></a>";
					
					});
				 whenStart();

			});
		
		}
		function aaaa(ccc){
		//	alert(ccc);
			var str = "/MaiJiaYun/AddServlet?PurchaseNote="+ccc;
			 for(i=0;i<10000;i++){
				 if(document.getElementsByName("actualQuantities"+i)[0]==null){
						 var memo = document.getElementsByName("memo")[0].value;
						str += "&memo="+memo;
			//			alert(str);
						$.get(str+NowPageInfo+"&pageNo="+NowPageNo+"&warehouse="+NowWare+"&pageSize="+NowPageSize,function(data){
								
					 		var paging = document.getElementById("paging");
							var tbody1 = document.getElementById("tbody1");
							paging.innerHTML = "";
					//		alert(Info);
					//		alert(document.getElementsByName("q")[0].value);
							
				//			alert(str+"&Info="+NowPageInfo+"&pageNo="+NowPageNo+"&warehouse="+ware);
							var	Info = "Info=";
						
							
					//			alert("xxx");
								tbody1.innerHTML = "" ; 
								var i = 0;
								
								$(data).find("CaigourukuPO").each(function(){
								//	alert("xxx");
									tbody1.innerHTML += "<tr id=\"PurchaseNote"+i+"\"><td><input type=\"checkbox\" name=\"checkOrder\"></td>"
									+"<td><a href=\"javascript:void(0);\"class=\"operate-ruku-edit\">"+$(this).find("caigouCode").text()+"</a></td>"
									+"<td>"+$(this).find("caigouCaigoudanCode").text()+"</td><td>"+$(this).find("caigouWarehouse").text()+"</td>"
									+"<td>"+$(this).find("caigouInCount").text()+"</td><td id = \"Infinish"+i+"\">"+$(this).find("caigouInFinish").text()+"</td>"
									+"<td>"+$(this).find("caigouSetTime").text()+"</td><td>"+$(this).find("caigouAuthor").text()+"</td><td colspan=\"2\">"
									+"<button data-target=\"#stock_upModal\" data-toggle=\"modal\"class=\"btn btn-default mr5 operate-ruku-edit\" type=\"button\" data-toggle=\"modal\" data-target=\"#stock_upModal\"	onclick=\"giveInfo("+i+")\">编辑入库</button>"
									+"<button class=\"btn btn-default operate-reject\" type=\"button\" name=\"removeSome"+i+"\"	id=\"removeSome\" onclick=\"testMethod("+i+")\" >驳回到采购单</button>"
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
								
								
								
								
								
								+"</li> </ul></div><div style=\"width: 350px; float: left;\" id=\"pagingPages\"> <ul class=\"pagination\">";
								if($(data).find("pageNo").text()>1){
									
									str+=" <li id=\"last\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+(parseInt($(data).find("pageNo").text())-1)+")\">&lt;</span></li>";	
								}
								
								if($(data).find("pageNo").text()==1){
									str+="<li id=\"last\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+1+")\">&lt;</span></li>";	
								}
									
								if($(data).find("pageCount").text()<5){
									
									for(a = 1;a<=$(data).find("pageCount").text();a++){
									 	if(a==$(data).find("pageNo").text()){
											str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
										} else{
										str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
										}
									}
								}else{
									if($(data).find("pageNo").text()<=3){
										for(a = 1;a<=5;a++){
											//
											if(a==$(data).find("pageNo").text()){
												str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
											} else{
											str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>"
											}
										}
									}
									if($(data).find("pageNo").text()>=$(data).find("pageCount").text()-2){
										for(a = $(data).find("pageCount").text();a>$(data).find("pageCount").text()-5;a--){
											if(a==$(data).find("pageNo").text()){
												str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
											}else{ 
											str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>"
										}
										}
									}
									if($(data).find("pageCount").text()-2>$(data).find("pageNo").text()>3){
										for(a = $(data).find("pageCount").text()-2;a<$(data).find("pageCount").text()+2;a++){
											if(a==$(data).find("pageNo").text()){
												str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
											} else{
											str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>"
											}
											}
									}
								}
								
							//	paging.innerHTML +=str+ "<li id=\"next\" class=\"fb fmsun\"><a 	href=\"javascript:void(0);\">&gt;</a></li></ul></div></div></div>"
								 if($(data).find("pageNo").text()<$(data).find("pageCount").text()){
									
									str+=" <li id=\"next\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+(parseInt($(data).find("pageNo").text())+1)+")\">&gt;</span></li>";	
								}
								
								if($(data).find("pageNo").text()==$(data).find("pageCount").text()){
									str+="<li id=\"next\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+$(data).find("pageCount").text()+")\">&gt;</span></li>";	
								}
								
								if($(data).find("pageCount").text()==0){
									str += "<li id=\"next\" class=\"fb fmsun\"><a 	href=\"javascript:void(0);\">&gt;</a></li></ul></div></div></div>";
								}
								
								paging.innerHTML += str;
								whenStart(); 
							});
							
						
					
						var caigou = document.getElementById("li-caigou");
						caigou.firstChild.innerHTML = "采购入库("+$(data).find("rowCount").text()+")";
						return;
					}
				var actualQuantities = document.getElementsByName("actualQuantities"+i)[0].value;
				var memos = document.getElementsByName("memos"+i)[0].value;
		//		alert(actualQuantities);
		//		alert(memos);
				str += "&actualQuantities"+i+"="+actualQuantities+"&memos"+i+"="+memos; 
			} 
		
			
		}
		
		
		
		/* 详情 */
		function giveInfo(i){
			
			var ccc =  document.getElementById("PurchaseNote"+i).getElementsByTagName("td")[1].getElementsByTagName("a")[0].innerHTML;
			var info = document.getElementById("PurchaseInfoList");
			var form1 = document.getElementById("form1");
			var save = document.getElementById("save");
			info.innerHTML = "";
			
		//	$(form1).attr("action","/MaiJiaYun/AddServlet?PurchaseNote="+ccc);
		//	$.get("/MaiJiaYun/addServlet?PurchaseNote=",function(data){});
				
			$(save).attr("onclick","aaaa('"+ccc+"')");
			
		
			var chooise = document.getElementById("chooiseWarehouse");
			var Quantity = 0;
			var Achieve = 0;
			var num = 0;
			$.get("/MaiJiaYun/servlet/PurchaseInfocompileServlet?PurchaseNote="+ccc,function(data){
				chooise.innerHTML = "选择仓库："+$(data).find("worehouse").text();
				$(data).find("purchaseInfocompilePO").each(function() {
					var PurchaseSKU =  $(this).find("PurchaseSKU").text();
		
					info.innerHTML += "<tr><td class=\"fb\">"+$(this).find("PurchaseSKU").text()+"<input type=\"hidden\" name=\"voucherSkuIds\" value=\"59369\"></td>"
					+"<td><a title=\"\" rel=\"tooltip\" href=\"javascript:void(0);\" style=\"color:#333333;text-decoration:none;\" data-original-title=\" "+$(this).find("PurchaseName").text()+"\">"+$(this).find("PurchaseName").text()+"</a></td>"
					+ "<td><a title=\"\" rel=\"tooltip\" href=\"javascript:void(0);\" style=\"color:#333333;text-decoration:none;\" data-original-title=\""+$(this).find("PurchaseProperty").text()+"\">"+$(this).find("PurchaseProperty").text()+"</a></td>"
					+ "<td>"+$(this).find("PurchaseQuantity").text()+"</td>"
					+ "<td>"+$(this).find("AchieveQuantity").text()+"</td>"
					+ "<td>	<div class=\"form-group form-group-input\" style=\"width:70px;\">"
					+ "<input onkeydown=\"onlyNum();\" skucode=\""+$(this).find("PurchaseSKU").text()+"\" value=\"0\"  name=\"actualQuantities"+num+"\" type=\"text\" class=\"form-control input-operate integer\" max=\""+($(this).find("PurchaseQuantity").text()-$(this).find("AchieveQuantity").text())+"\" style=\"width:100%;\" onblur=\"overage("+num+")\">"
					+ "</div><input type=\"hidden\" name=\"lostQuantity\" value=\"0\"><input type=\"hidden\" name=\"brokenQuantity\" value=\"0\"></td>"
					+ "<td><input type=\"text\"  name=\"memos"+num+"\" class=\"form-control\" value=\""+$(this).find("memo").text()+"\"></td></tr>";
					Quantity += parseInt($(this).find("PurchaseQuantity").text());
					Achieve += parseInt($(this).find("AchieveQuantity").text());
					num++;
				});
				
				info.innerHTML += "<tr style=\"background:#dcdcdc;border:1px solid #dcdcdc;\">"
				+ "<td colspan=\"3\" class=\"fb\">合计：</td>"
				+ "<td class=\"fb\">需入库合计：<span id=\"total\" class=\"red\">"+Quantity+"</span></td>"
				+"<td class=\"fb\">已入库合计：<span id=\"changetotal\" spantotal=\"0\" class=\"red\">"+Achieve+"</span></td>"
				+ "<td colspan=\"4\" class=\"fb\">未入库：<span id=\"untotal\" class=\"red\">"+(Quantity-Achieve)+"</span></td></tr>";
				
			//	if(Quantity-Achieve==0){
					
					/* var note = document.getElementById("PurchaseNote"+i);
					note.parentNode.removeChild(note); */
					
			//	}
			whenStart();
				/* if(Achieve>0){
					var removeSome = document.getElementById("removeSome");
					$(removeSome).attr("disabled","true");
				} */
			});
			
		}
		
		
		function onlyNum() {
		    if(!(event.keyCode==46)&&!(event.keyCode==8)&&!(event.keyCode==37)&&!(event.keyCode==39))
		    if(!((event.keyCode>=48&&event.keyCode<=57)||(event.keyCode>=96&&event.keyCode<=105)))
		    event.returnValue=false;
		}
		
		
		function SelectList(){
			
			var paging = document.getElementById("paging");
			var Info = document.getElementsByName("q")[0].value;
	//		alert("/MaiJiaYun/SelectListServlet?Info="+Info);
			var tbody1 = document.getElementById("tbody1");
			paging.innerHTML = "";
	//		alert(Info);
	//		alert(document.getElementsByName("q")[0].value);
			
			if(Info == ""|| Info==null){
				Info = "This is a null,Do not select"
			}
			NowPageInfo = "Info="+Info;
			$.get("/MaiJiaYun/SelectListServlet?Info="+Info+"&pageSize="+NowPageSize+"&pageNo="+NowPageNo,function(data){
	//			alert("xxx");
				tbody1.innerHTML = "" ; 
				var i = 0;
				
				$(data).find("CaigourukuPO").each(function(){
					
					tbody1.innerHTML += "<tr id=\"PurchaseNote"+i+"\"><td><input type=\"checkbox\" name=\"checkOrder\"></td>"
					+"<td><a href=\"javascript:void(0);\"class=\"operate-ruku-edit\">"+$(this).find("caigouCode").text()+"</a></td>"
					+"<td>"+$(this).find("caigouCaigoudanCode").text()+"</td><td>"+$(this).find("caigouWarehouse").text()+"</td>"
					+"<td>"+$(this).find("caigouInCount").text()+"</td><td id = \"Infinish"+i+"\">"+$(this).find("caigouInFinish").text()+"</td>"
					+"<td>"+$(this).find("caigouSetTime").text()+"</td><td>"+$(this).find("caigouAuthor").text()+"</td><td colspan=\"2\">"
					+"<button data-target=\"#stock_upModal\" data-toggle=\"modal\"class=\"btn btn-default mr5 operate-ruku-edit\" type=\"button\" data-toggle=\"modal\" data-target=\"#stock_upModal\"	onclick=\"giveInfo("+i+")\">编辑入库</button>"
					+"<button class=\"btn btn-default operate-reject\" type=\"button\" name=\"removeSome"+i+"\"	id=\"removeSome\" onclick=\"testMethod("+i+")\" >驳回到采购单</button>"
					+"</td></tr> ";
				
					
					i++;
				});
				var Listinfo =$(data).find("queryParm").text();
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
					
					str+=" <li id=\"last\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+(parseInt($(data).find("pageNo").text())-1)+")\">&lt;</span></li>";	
				}
				
				if($(data).find("pageNo").text()==1){
					str+="<li id=\"last\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+1+")\">&lt;</span></li>";	
				}
					
				if($(data).find("pageCount").text()<5){
					
					for(a = 1;a<=$(data).find("pageCount").text();a++){
					 	if(a==$(data).find("pageNo").text()){
							str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
						} else{
						str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
						}
					}
				}else{
					if($(data).find("pageNo").text()<=3){
						for(a = 1;a<=5;a++){
							//
							if(a==$(data).find("pageNo").text()){
								str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
							} else{
							str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>"
							}
						}
					}
					if($(data).find("pageNo").text()>=$(data).find("pageCount").text()-2){
						for(a = $(data).find("pageCount").text();a>$(data).find("pageCount").text()-5;a--){
							if(a==$(data).find("pageNo").text()){
								str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
							}else{ 
							str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>"
						}
						}
					}
					if($(data).find("pageCount").text()-2>$(data).find("pageNo").text()>3){
						for(a = $(data).find("pageCount").text()-2;a<$(data).find("pageCount").text()+2;a++){
							if(a==$(data).find("pageNo").text()){
								str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
							} else{
							str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>"
							}
							}
					}
				}
				
			//	paging.innerHTML +=str+ "<li id=\"next\" class=\"fb fmsun\"><a 	href=\"javascript:void(0);\">&gt;</a></li></ul></div></div></div>"
				 if($(data).find("pageNo").text()<$(data).find("pageCount").text()){
					
					str+=" <li id=\"next\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+(parseInt($(data).find("pageNo").text())+1)+")\">&gt;</span></li>";	
				}
				
				if($(data).find("pageNo").text()==$(data).find("pageCount").text()){
					str+="<li id=\"next\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+$(data).find("pageCount").text()+")\">&gt;</span></li>";	
				}
				
				if($(data).find("pageCount").text()==0){
					str += "<li id=\"next\" class=\"fb fmsun\"><a 	href=\"javascript:void(0);\">&gt;</a></li></ul></div></div></div>";
				}
				paging.innerHTML += str;
				whenStart();
			});
			
		}
		function PageInfoSelectList(Listinfo,a){
			
	//		alert(Listinfo);
	//		alert(a);
			NowPageNo = a;
			NowPageInfo = Listinfo;
			var pageSize =  document.getElementById("currentPageSize").innerHTML;
	 		var paging = document.getElementById("paging");
			var tbody1 = document.getElementById("tbody1");
			
			paging.innerHTML = "";
	//		alert(Info);
	//		alert(document.getElementsByName("q")[0].value);
			var Info = Listinfo;
			if(Info == ""|| Info==null){
				Info = "Info="
			}
			$.get("/MaiJiaYun/SelectListServlet?"+Info+"&pageNo="+a+"&pageSize="+pageSize,function(data){
	//			alert("xxx");
				tbody1.innerHTML = "" ; 
				var i = 0;
				
				$(data).find("CaigourukuPO").each(function(){
					
					tbody1.innerHTML += "<tr id=\"PurchaseNote"+i+"\"><td><input type=\"checkbox\" name=\"checkOrder\"></td>"
					+"<td><a href=\"javascript:void(0);\"class=\"operate-ruku-edit\">"+$(this).find("caigouCode").text()+"</a></td>"
					+"<td>"+$(this).find("caigouCaigoudanCode").text()+"</td><td>"+$(this).find("caigouWarehouse").text()+"</td>"
					+"<td>"+$(this).find("caigouInCount").text()+"</td><td id = \"Infinish"+i+"\">"+$(this).find("caigouInFinish").text()+"</td>"
					+"<td>"+$(this).find("caigouSetTime").text()+"</td><td>"+$(this).find("caigouAuthor").text()+"</td><td colspan=\"2\">"
					+"<button data-target=\"#stock_upModal\" data-toggle=\"modal\"class=\"btn btn-default mr5 operate-ruku-edit\" type=\"button\" data-toggle=\"modal\" data-target=\"#stock_upModal\"	onclick=\"giveInfo("+i+")\">编辑入库</button>"
					+"<button class=\"btn btn-default operate-reject\" type=\"button\" name=\"removeSome"+i+"\"	id=\"removeSome\" onclick=\"testMethod("+i+")\" >驳回到采购单</button>"
					+"</td></tr> ";
				
					
					i++;
				});
				var str = "";
				// "<div class=\"row\" style=\"margin: 0; -moz-user-select: none;\" onselectstart=\"return false;\" id=\"paging\">"
	//			paging.innerHTML; 
		//		alert($(data).find("pageNo").text());
				
				
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
					
					str+=" <li id=\"last\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+(parseInt($(data).find("pageNo").text())-1)+")\">&lt;</span></li>";	
				}
				
				if($(data).find("pageNo").text()==1){
					str+="<li id=\"last\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+1+")\">&lt;</span></li>";	
				}
				
				
				 
				
				
				if($(data).find("pageCount").text()<5){
					
					for(a = 1;a<=$(data).find("pageCount").text();a++){
					 	if(a==$(data).find("pageNo").text()){
							str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
						} else{
						str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
						}
					}
				}else{
					if($(data).find("pageNo").text()<=3){
						for(a = 1;a<=5;a++){
							//
							if(a==$(data).find("pageNo").text()){
								str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
							} else{
							str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>"
							}
						}
					}
					if($(data).find("pageNo").text()>=$(data).find("pageCount").text()-2){
						for(a = $(data).find("pageCount").text();a>$(data).find("pageCount").text()-5;a--){
							if(a==$(data).find("pageNo").text()){
								str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
							}else{ 
							str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>"
						}
						}
					}
					if($(data).find("pageCount").text()-2>$(data).find("pageNo").text()>3){
						for(a = $(data).find("pageCount").text()-2;a<$(data).find("pageCount").text()+2;a++){
							if(a==$(data).find("pageNo").text()){
								str +="<li name=\"pageclass\" class=\"page active\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>";
							} else{
							str +="<li name=\"pageclass\" class=\"fb fmsun\" page=\""+a+"\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+a+")\">"+a+"</span></li>"
							}
							}
					}
				}
				
			//	paging.innerHTML +=str+ "<li id=\"next\" class=\"fb fmsun\"><a 	href=\"javascript:void(0);\">&gt;</a></li></ul></div></div></div>"
				 if($(data).find("pageNo").text()<$(data).find("pageCount").text()){
					
					str+=" <li id=\"next\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+(parseInt($(data).find("pageNo").text())+1)+")\">&gt;</span></li>";	
				}
				
				if($(data).find("pageNo").text()==$(data).find("pageCount").text()){
					str+="<li id=\"next\" class=\"fb fmsun\"><span  onclick=\"PageInfoSelectList('"+NowPageInfo+"',"+$(data).find("pageCount").text()+")\">&gt;</span></li>";	
				}
				
				if($(data).find("pageCount").text()==0){
					str += "<li id=\"next\" class=\"fb fmsun\"><a 	href=\"javascript:void(0);\">&gt;</a></li></ul></div></div></div>";
				}
				
				paging.innerHTML += str;
				
				whenStart();
			});
		} 
		
		function whenStart(){
			//alert("xxx");

		 for(i=0;i<10000;i++){
			 if(document.getElementsByName("removeSome"+i)[0]==null){
					return;
				}
			var Infinish = document.getElementById("Infinish"+i).innerHTML;
		//	alert(document.getElementById("Infinish1").innerHTML);
			if(Infinish>0){
				var a = i;
				var removeSome = document.getElementsByName("removeSome"+a)[0];
		//		$(removeSome).attr("disabled","true");
				$(removeSome).remove();
			}
			
			
		} 
			
		}
		function setPageSize(size){
			NowPageSize  = size;
			document.getElementById("currentPageSize").innerHTML = size;
			if(NowWare==null||NowWare==""){
				PageInfoSelectList(NowPageInfo,1);
				
			}else{
				BywareAndPage(NowWare,1);
				
			}
		}
		
		
		
		
		
	</script>
</head>
<body style="padding-right: 0px;" class="" onload="whenStart()">
	<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
	<!--代码开始-->
	<%
		List<CaigourukuPO> list;
		String diaoboNum = request.getAttribute("diaoboNum")==null?"":request.getAttribute("diaoboNum").toString();
		String tuihuoNum =  request.getAttribute("TuihuoNum")==null?"":request.getAttribute("TuihuoNum").toString();
		
		PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
		if (pageInfo != null) {
			list = pageInfo.getList();
		} else {
			list = null;
		}
		//	List<CaigourukuPO> list = (List<CaigourukuPO>)request.getAttribute("CaigourukuPO");
	%>
	<div class="container" id="container">
		<!--header 开始-->


		<!--Layout left part star-->
		<!-- style="position: fixed;left:0, top:0, z-index:1030; display:none;" -->
		<!--<div class="sidebar-nav navbar-fixed-top" id="menu" style="display:none;"></div>-->
		<!--Layout left part end-->
		<!--Layout right part star-->
		<div class="content" id="content">
			<!--titletab star-->
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px;">
				<div class="navbar-header">
					<a href="#" class="navbar-brand ml20">入库单</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<!-- 修改了href实现本地页面跳转 -->
					<li id="li-caigou" class="ml20 tab active"><a class=""
						href="/MaiJiaYun/servlet/Purchase">采购入库(<%=pageInfo.getRowCount() %>)<span id="caigou_num"></span></a></li>
					<li id="li-xiaoshou" class="tab"><a class="c6"
						href="/MaiJiaYun/servlet/ReturnSales">销售退货入库 (<%=tuihuoNum %>)<span></span></a></li>
					<li id="li-diaobo" class="tab"><a class="c6"
						href="${pageContext.request.contextPath}/servlet/DiaoborukudanServlet">调拨入库 (<%=diaoboNum%>)<span></span></a>
					</li>
					<li id="li-conplete" class="tab"><a class="c6"
						href="${pageContext.request.contextPath}/servlet/WanchengServlet">已完成入库</a></li>
					<li class="pull-right" id="li-query" style="padding-top: 12px;">
						<div class="w340">
							<div class="input-group">
								<input name="q" class="form-control" value=""
									placeholder="入库单编号/相关单据号/制单人" type="text"> <span
									class="input-group-btn">
									<button type="button" class="btn btn-primary query"
										onclick="SelectList()" style="height: 33px">
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

							<span class="glyphicon glyphicon-save mr5"></span> <span
								style="display: none;" class="f10" id="taskCount"></span>

						</button>
						<ul id="importOrderUl" aria-labelledby="importOrderListButton"
							style="width: 340px; height: 200px;" role="menu"
							class="dropdown-menu scrollspy-example">
							<li>
								<div class=" mr20 ml20"
									style="border-bottom: 1px solid #eeeeee;">
									<div style="line-height: 60px; text-align: center;">
										<span class="c6" style="display: inline;">当前没有进行中的任务</span>
									</div>
								</div>
							</li>
						</ul>

					</div>
					<!--table star-->
					<div class="panel mt15">
						<!-- Table -->
						<table class="table table-striped table-hover">
							<thead class=" table-bordered">
								<tr>
									<th width="50"><input type="checkbox"></th>
									<th>入库单编号</th>
									<th>相关采购单</th>
									<th width="130">
										<div class="dropdown">
											<button data-toggle="dropdown" id="dropdownMenu1"
												type="button"
												style="padding: 0px; box-shadow: none; background: transparent none repeat scroll 0% 0%;"
												class="btn dropdown-toggle fb" onclick="warehouseNo()">
												入库仓库 <span class="caret"></span>
											</button>
											<ul aria-labelledby="dropdownMenu1" role="menu"
												class="dropdown-menu">

												<li role="presentation" id=warehouse>
													<!-- 	<a href="/servlet/Purchase?warehouse=默认仓库" tabindex="-1" role="menuitem" warehouseid="18016" type="自有仓库">默认仓库</a> -->

												</li>

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
							<!-- 默认暂无数据 -->

							<!-- 模拟数据 -->
							<tbody id="tbody1">


								<%
									int i = 0;
									if (list != null) {
										for (CaigourukuPO pi : list) {
								%>

								<tr id="PurchaseNote<%=i%>">
									<td><input type="checkbox" name="checkOrder"></td>

									<td><a href="javascript:void(0);"
										class="operate-ruku-edit"><%=pi.getCaigouCode()%></a></td>

									<td><%=pi.getCaigouCaigoudanCode()%></td>
									<td><%=pi.getCaigouWarehouse()%></td>
									<td><%=pi.getCaigouInCount()%></td>
									<td id = "Infinish<%=i %>"><%=pi.getCaigouInFinish()%></td>
									<td><%=pi.getCaigouSetTime()%></td>
									<td><%=pi.getCaigouAuthor()%></td>
									<td colspan="2">

										<button data-target="#stock_upModal" data-toggle="modal"
											class="btn btn-default mr5 operate-ruku-edit" type="button"
											data-toggle="modal" data-target="#stock_upModal"
											onclick="giveInfo(<%=i%>)">编辑入库</button>

										<button class="btn btn-default operate-reject" type="button"
											id="removeSome" name="removeSome<%=i%>"
											onclick="testMethod(<%=i%>)">驳回到采购单</button>

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
													style="float: left;"><%=pageInfo.getRowCount()%></span>
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
							
												</ul>
											</div> 
										</li>
									</ul>
								</div>

								<div style="width: 350px; float: left;" id="pagingPages">
									<ul class="pagination">
								<%
			String value = "";
								if (pageInfo != null) {
									if(pageInfo.getPageNo() == null){
										pageInfo.setPageNo("0");
									}
									
				if(Integer.parseInt(pageInfo.getPageNo())>1){
					%>
					<li id="last" class="fb fmsun"><span  onclick="PageInfoSelectList('<%=value %>',<%=Integer.parseInt(pageInfo.getPageNo())-1%>)">&lt;</span></li>
					
					<%
				}else{
					%>
					<li id="last" class="fb fmsun"><span  onclick="PageInfoSelectList('<%=value %>',<%=1%>)">&lt;</span></li>
					<%
				}
			%>
										<%
										
											
												if (Integer.parseInt(pageInfo.getPageCount()) <= 5) {
													
													for (int no = 1; no <= Integer.parseInt(pageInfo.getPageCount()); no++) {
														if(no == 1){
										%>
										<li name="pageclass" class="page active" page="<%=no%>"><span onclick="PageInfoSelectList('<%=value %>',<%=no%>)"><%=no %></span></li>

										<%
														}else{
															%>
										<li name="pageclass" class="fb fmsun" page="<%=no%>"><span onclick="PageInfoSelectList('<%=value %>',<%=no%>)"><%=no %></span></li>
															<%
															
														}
											}
												} else if (Integer.parseInt(pageInfo.getPageCount()) > 5) {
												//	if (Integer.parseInt(pageInfo.getPageNo()) > 3) {
														int pageno = 3;
										%>
										<li class="fb fmsun" page=<%=(pageno - 2)%>><span onclick="PageInfoSelectList(<%=value %>,<%=(pageno - 2)%>)"><%=(pageno - 2) %></span>
										</li>
										<li class="fb fmsun" page=<%=(pageno - 1)%>><span onclick="PageInfoSelectList(<%=value %>,<%=(pageno - 1)%>)"><%=(pageno - 1) %></span>
										</li>
										<li class="fb fmsun" page=<%=(pageno)%>><span onclick="PageInfoSelectList(<%=value %>,<%=(pageno)%>)"><%=(pageno) %></span>
										</li>
										<li class="fb fmsun" page=<%=(pageno + 1)%>><span onclick="PageInfoSelectList(<%=value %>,<%=(pageno + 1)%>)"><%=(pageno + 1) %></span>										</li>
										<li class="fb fmsun" page=<%=(pageno + 2)%>><span onclick="PageInfoSelectList(<%=value %>,<%=(pageno + 2)%>)"><%=(pageno + 2) %></span>
										</li>
										<%
											}
											//	}
											}
										%>

	<%
		
				if(Integer.parseInt(pageInfo.getPageNo())<Integer.parseInt(pageInfo.getPageCount())){
					%>
					<li id="next" class="fb fmsun"><span  onclick="PageInfoSelectList('<%=value %>',<%=Integer.parseInt(pageInfo.getPageNo())+1%>)">&gt;</span></li>
					
					<%
				}else{
					%>
					<li id="next" class="fb fmsun"><span  onclick="PageInfoSelectList('<%=value %>',<%=Integer.parseInt(pageInfo.getPageNo())%>)">&gt;</span></li>
					<%
				}
			%>
									</ul>
								</div>
							</div>
						</div>
						<!--分页 end-->

						<!--编辑入库 star-->

						<!-- aria-hidden=false,class="modal fade in", style="display: block;" 显示模态框 bootstrap:务必为 .modal 添加 role="dialog" 属性，aria-labelledby="myModalLabel" 属性用于指向模态框的标题-->
						<div aria-hidden="true" aria-labelledby="stock_upModalLabel"
							role="dialog" tabindex="-1" id="stock_upModal" class="modal fade"
							style="display: none;" hidden="true">
							<div style="width: 1000px;" class="modal-dialog">

								<!-- 模态框开始 -->
								<div class="modal-content">
									<div class="modal-header">
										<button aria-hidden="true" data-dismiss="modal" class="close"
											type="button">×</button>
										<h4 id="stock_upModalLabel" class="modal-title">编辑入库</h4>
										
										
											
														
																				
										
									</div>
									
									
									
									
									
									<div class="modal-body" style="padding-top: 0px;">
										<form class="form-inline" role="search" id="form1"
											method="post">
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
															<th>已入库数量</th>
															<th>本次入库数量</th>
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
											<div class="modal-footer">
												<!-- <button class="btn btn-primary" id="progress" type="button">保存进度</button> -->
									<!--			<input class="btn btn-primary once" id="save" type="submit" 
													value="确认入库" />
												<button data-dismiss="modal" class="btn btn-default"
													type="button">取消</button>-->
												<span id="errorSpan" style="color: red"></span>
											</div>
										</form>
											<button data-dismiss="modal" class="btn btn-primary once" id="save" 
												 >确认入库</button>
								<button data-dismiss="modal" class="btn btn-default"
									type="button">取消</button> 
										
										
										
									</div>
							 


								</div>
							</div>
						</div>

						<!-- 模态框结束 -->

						<div aria-hidden="true" aria-labelledby="stock_upinfoModalLabel"
							role="dialog" tabindex="-1" id="stock_upinfoModal"
							class="modal fade" style="display: none;"></div>
						<!--编辑入库 end-->

					</div>
				</div>
			</div>
			<div class="contentbox" id="contentbox"
				style="background: rgb(241, 241, 241) none repeat scroll 0% 0%; display: none;"></div>


			<div style="width: 300px; height: 80px; display: none;" class="modal"
				id="keepsuccessModal" tabindex="-1" role="dialog"
				aria-labelledby="logisticsModalLabel" aria-hidden="false">
				<div class="modal-dialog"
					style="width: 300px; margin: 52px 0px 0px;">
					<div
						style="background: rgb(97, 190, 68) none repeat scroll 0% 0%; border-radius: 0px; border: medium none;"
						class="modal-content">
						<div style="padding: 5px;" class="modal-body">
							<!--part one-->
							<div style="color: rgb(255, 255, 255);" class="c6 tc"
								id="showTempDiv">保存成功！</div>
							<!--part one end-->
						</div>
					</div>
				</div>
			</div>
			<div style="width: 300px; height: 80px; display: none;" class="modal"
				id="keeperrorModal" tabindex="-1" role="dialog"
				aria-labelledby="logisticsModalLabel" aria-hidden="false">
				<div class="modal-dialog"
					style="width: 300px; margin: 52px 0px 0px;">
				
					<!--  none repeat scroll 0% 0%         medium-->
					<div
						style="background: rgb(255, 88, 49); border-radius: 0px; border:  none;"
						class="modal-content">
						<div style="padding: 5px;" class="modal-body">
							<!--part one-->
							<!-- <div style="color: rgb(255, 255, 255);" class="c6 tc"
								id="showErrorTempDiv">保存失败！</div> -->
							<div style="color: #ffffff;" class="c6 tc" id="showErrorTempDiv"
								name="errorNum">不能大于5</div>
							<!--part one end-->
						</div>
					</div>
				</div>
			</div>

			<div aria-hidden="true" aria-labelledby="edit_accountModalLabel"
				role="dialog" tabindex="-1" id="edit_accountModal"
				class="modal fade" style="display: none;"></div>
			<div id="modal"></div>
		</div>
		<!--代码结束-->

		<!-- 导出选择提示框 -->
		<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"
			id="daochu">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<button type="button" class="bootbox-close-button close"
							data-dismiss="modal" aria-hidden="true"
							style="margin-top: -10px;">×</button>
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