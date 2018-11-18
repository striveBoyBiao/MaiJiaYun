<%@page import="mjy.caigou.beans.PageInfo"%>
<%@page import="java.util.List"%>
<%@page import="mjy.caigou.vo.KCCBVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>kucunchengben</title>



</head>
<body>
	<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>


	<div class="container" id="container">

		<div class="content" id="content">
			<!--titletab star-->
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0;">
				<div class="navbar-header">
					<a href="http://maijiayun.cn/#" class="navbar-brand ml20">库存成本</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<!--<li class="active ml20"><a href="javascript:void(0)">库存成本</a></li>-->
					<li class="pull-right" id="li-query" style="padding-top: 12px;">
						<div class="form-inline">
							<div class="form-group">
								<div class="w340">
									<div class="input-group">
										<input type="text" id="querytext" name="q"
											placeholder="商品名称/商品货号/SKU编码" style="width: 300px;"
											class="form-control"> <span class="input-group-btn">
											<button type="button" class="btn btn-primary query"
												onclick="query()">
												<span class="glyphicon glyphicon-search"></span>
											</button>
										</span>
									</div>
								</div>
							</div>

						</div>
					</li>
				</ul>
				<!--search end-->
			</div>
			<!--titletab end-->

			<!--panel star-->
			<div class="prl10auto">
				<!--table star-->
				<div class="panel mt15">
					<!-- Table -->
					<table class="table table-striped table-hover" id="tableList">
						<thead class=" table-bordered">
							<tr>
								<th><input type="checkbox" id="allcheckbox"
									onchange="changestatus()"></th>
								<script>
									function changestatus() {
										var allcheckbox = document
												.getElementById("allcheckbox");
										var checkboxs = document
												.getElementsByName("checkOrder");
										if (allcheckbox.checked) {
											for (var i = 0; i < checkboxs.length; i++) {
												checkboxs[i].checked = true;
											}

										} else {

											for (var i = 0; i < checkboxs.length; i++) {
												checkboxs[i].checked = false;
											}
										}

									}
								</script>
								<th>商品图</th>
								<th>商品名称</th>
								<th>商品货号</th>
								<th>SKU编码</th>
								<th>属性</th>
								<th>仓库</th>
								<th style="text-align: center;">总库存</th>
								<th style="text-align: center;">库存成本</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="tbody">


							<!--循环加载行-->
							<%
								PageInfo<KCCBVO> pageinfo = (PageInfo<KCCBVO>) request.getAttribute("pageinfo");
							          List<KCCBVO> kccbvos=pageinfo.getPageDate();
								for (KCCBVO kccb : kccbvos) {
							%>


							<tr modelid="219989">
								<td style="background-color: rgb(240, 248, 253);"><input
									type="checkbox" name="checkOrder" value="219989"></td>
								<td style="background-color: rgb(240, 248, 253);"><img
									src="<%=kccb.getGoodPicture()%>"
									style="height: 50px; width: 50px;" class="img-thumbnail"
									alt="50x50"></td>
								<td style="background-color: rgb(240, 248, 253);"><%=kccb.getGoodName()%></td>
								<td style="background-color: rgb(240, 248, 253);"><%=kccb.getGoodId()%></td>
								<td style="background-color: rgb(240, 248, 253);"><%=kccb.getSku()%></td>
								<td style="background-color: rgb(240, 248, 253);">null</td>
								<td style="background-color: rgb(240, 248, 253);"><%=kccb.getWareHouseName()%>
								<span style="display: none;"><%=kccb.getWarehouseId() %></span>
								</td>
								<td style="background-color: rgb(240, 248, 253);">
									<div style="text-align: right; display: block; float: right;">
										<span><%=kccb.getGoodCount()%></span>
									</div>
								</td>
								<td style="background-color: rgb(240, 248, 253);">

									</button>
									</div>
									<div
										style="text-align: right; display: block; float: right; width: 80px;">
										<span id="spanbin" style="display: inline;"><%=kccb.getGoodInventoryCost()%></span>
										<button id="buttonbin" name="btnTitle" class="btn btn-default"
											title="" type="button"
											style="background: transparent none repeat scroll 0% 0%; border: medium none; display: inline-block;"
											onclick="kucunCB(this)">
											<i class="glyphicon glyphicon-pencil"></i>
										</button>
										<input id="inputbin" onblur="kucunCB1(this)" name="txtTitle"
											class="form-control" value="3001"
											style="display: none; background-color: white;" type="text" />

									</div>
								</td>
								<td style="background-color: rgb(240, 248, 253);"><a
									skuid="2079127" warehouseid="18084" name="edit"
									data-toggle="modal" data-target="#stock_detailModal" onclick="mingxi('<%=kccb.getGoodId() %>','<%=kccb.getWarehouseId() %>')">明细</a></td>
							</tr>
							
							<script>
							
							function mingxi(obj,obj1){
								var goodId=obj;
								var warehouseId=obj1;
								var tbodytext="";
							 $("#kccbmxtbody").html(tbodytext);
						            $.ajax({
						             url:"/MaiJiaYun/servlet/cg/kccb",
							   dataType:'json',
							   data:"goodId="+goodId+"&method=querykccbmx&warehouseId="+warehouseId,
							          
							   type:"post",
							   success:function(data){
							
							
							$.each(data,function(index, element) {
								tbodytext+="<tr><td>"+element.changeTime+"</td>";
								
								tbodytext+="<td>"+element.billsName+"</td>";
								tbodytext+="<td>"+element.businessName+"</td>";
								
								tbodytext+="<td>0</td>";
								tbodytext+="<td>0.00</td>";
								tbodytext+="<td>"+element.firstInventory+"</td>";
							          tbodytext+="<td>"+element.firstCost+"</td>";
								
								tbodytext+="<td>"+element.lastInventory+"</td>";
								tbodytext+="<td>"+element.lastCost+"</td>";
								 var ss=element.lastInventory*element.lastCost; 
								tbodytext+="<td>"+ss+"</td>";
								tbodytext+="</tr>";
								
								
							});

							
				            $("#kccbmxtbody").append(tbodytext);		
								}
													

													
													
								}); 
						            
							}
							
							</script>
							
							
							

							<%
								}
							%>


						</tbody>
					</table>


					<!--  -->
					<table id="table1" style="display: none">
						<tr modelid="110">
							<td style="background-color: rgb(240, 248, 253);"><input
								type="checkbox" name="checkOrder" value="219989"></td>
							<td style="background-color: rgb(240, 248, 253);"><img
								src="" style="height: 50px; width: 50px;" class="img-thumbnail"
								alt="50x50"></td>
							<td style="background-color: rgb(240, 248, 253);"></td>
							<td style="background-color: rgb(240, 248, 253);"></td>
							<td style="background-color: rgb(240, 248, 253);"></td>
							<td style="background-color: rgb(240, 248, 253);">null</td>
							<td style="background-color: rgb(240, 248, 253);"></td>
							<td style="background-color: rgb(240, 248, 253);">
								<div style="text-align: right; display: block; float: right;">
									<span></span>
								</div>
							</td>
							<td style="background-color: rgb(240, 248, 253);">

								</button>
								</div>
								<div
									style="text-align: right; display: block; float: right; width: 80px;">
									<span id="spanbin" style="display: inline;"></span>
									<button id="buttonbin" name="btnTitle" class="btn btn-default"
										title="" type="button"
										style="background: transparent none repeat scroll 0% 0%; border: medium none; display: inline-block;"
										onclick="kucunCB(this)">
										<i class="glyphicon glyphicon-pencil"></i>
									</button>
									<input id="inputbin" onblur="kucunCB1(this)" name="txtTitle"
										class="form-control" value="3001"
										style="display: none; background-color: white;" type="text" />

								</div>
							</td>
							<td style="background-color: rgb(240, 248, 253);"><a
								skuid="2079127" warehouseid="18084" name="edit"
								data-toggle="modal" data-target="#stock_detailModal">明细</a></td>
						</tr>


					</table>










					<!--库存明细 star-->
					<div aria-hidden="true" aria-labelledby="stock_detailModalLabel"
						role="dialog" tabindex="-1" id="stock_detailModal"
						class="modal fade" style="display: none;">
						<div style="width: 800px;" class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button aria-hidden="true" data-dismiss="modal" class="close"
										type="button">×</button>
									<h4 id="stock_detailModalLabel" class="modal-title">库存明细</h4>
								</div>
								<div class="modal-body">
									<!--part 1-->
									<div style="height: 400px" class="tl lh30 scrollspy-example"
										id="xiangqing">
										<table style="margin-bottom: 0" class="table table-bordered">
											<thead>
												<tr>
													<th>变动时间</th>
													<th>业务</th>
													<th>相关单据号</th>
													<th>变动<br>数量
													</th>
													<th>变动<br>单价
													</th>
													<th>期初<br>库存
													</th>
													<th>期初<br>成本
													</th>
													<th>期末<br>库存
													</th>
													<th>期末<br>成本
													</th>
													<th>成本<br>结余
													</th>
												</tr>
											</thead>
											<tbody style="font-weight: normal" id="kccbmxtbody">

												<tr>
													<td>2016-11-17 20:22:55</td>
													<td>库存初始化</td>
													<td>管理员</td>
													<td>300</td>
													<td>0.00</td>
													<td>0</td>
													<td>0.00</td>
													<td>300</td>
													<td>0.00</td>
													<td>0.00</td>
												</tr>

												<tr>
													<td>2016-11-23 21:54:46</td>
													<td>手工调价</td>
													<td>管理员</td>
													<td>0</td>
													<td>0.00</td>
													<td>300</td>
													<td>0.00</td>
													<td>300</td>
													<td>0.00</td>
													<td>0.00</td>
												</tr>

											</tbody>
										</table>
									</div>
									<!--part 1 end-->
								</div>
								<div class="modal-footer">
									<button data-dismiss="modal" class="btn btn-default"
										type="button">关闭</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!--库存明细 end-->
					<!--table end-->
				</div>
				<!--panel end-->


				<script>
				
				
				
          var querytext="";
	function kucunCB(obj) {
		
		
		$(obj).hide();
		$(obj).prev("span").css("display", "none");
		$(obj).next("input").css("display", "block");
		$(obj).next("input").css("backgroundColor", "white");
		$(obj).next("input").val($(obj).prev("span").text());
		$(obj).next("input").focus();

		

	}

	function kucunCB1(obj) {
		
		$(obj).prev("button").css("display", "inline-block");
		$(obj).prev("button").prev("span").css("display",
				"inline-block");
		$(obj).css("display", "none");
		$(obj).css("backgroundColor", "white");
		var updateVal = $(obj).val();
		//期末成本
		var lastCost=updateVal;
		
		//期初成本
		var firstCost=$(obj).prev("button").prev("span").text();
		if(firstCost==0){
			firstCost=lastCost;
		}
		//期初库存
		var firstInventory=$(obj).parent().parent("td").prev("td").text();
		var firstInventory = firstInventory.replace(
				/(^\s*)|(\s*$)/g, "");
		
		$(obj).prev("button").prev("span").text(updateVal);
		var sku=$(obj).parent().parent("td").prev("td").prev("td").prev("td").prev("td").text();
		 var goodId=$(obj).parent().parent("td").prev("td").prev("td").prev("td").prev("td").prev("td").text();
		var warehouseId=$(obj).parent().parent("td").prev("td").prev("td").children("span").text();
		 
		
		  $.ajax({
		             url:"/MaiJiaYun/servlet/cg/kccb",
			   dataType:'text',
			   data:"sku="+sku+"&method=kccbedit&goodInventCost="+updateVal,
			          
			   type:"post",
			   success:function(data){
			
			
						
				}
									
									
									
				}); 
		  
		  
		  $.ajax({
	            url:"/MaiJiaYun/servlet/cg/kccb",
		  dataType:'text',
		  data:"warehouseId="+warehouseId+"&method=kccbmx&goodInventCost="+updateVal+"&goodId="+goodId+"&lastCost="+lastCost+"&firstCost="+firstCost+"&firstInventory="+firstInventory,
		          
		  type:"post",
		   success:function(data){
		
		
					
			}
								
								
								
			}); 
		  
		  
		  
		  
		  
		  
		  

	}
	
	function changePage(obj) {
		var val = $(obj).text();
		querytext="<%=pageinfo.getQueryParam()%>";
		$("#currentPageSize").text(val);
		window.location.href="/MaiJiaYun/servlet/cg/kccb?querytext="+querytext+"&method=showKccb&pagesize="+val;
		
		 
	}
	
	function query(){
		
		
		
		
		
		 
	//获得查询框的内容	
	   querytext=$("#querytext").val();
	   window.location.href="/MaiJiaYun/servlet/cg/kccb?querytext="+querytext+"&method=showKccb";
	/*   $.ajax({
            url:"/MaiJiaYun/servlet/cg/kccb",
	  dataType:'json',
	  data:"querytext="+querytext+"&method=queryGoodsNameorSku",	          
	  type:"post",
	  success:function(data){
		//把tbody的内容清空
		  $("#tbody").html("");
		  var tbodytext;
		  //获取id为table1的html内容
		  var table1=$("#table1").html();
		  //获取tr
		  var htmlStr = table1.substring(13,table1.length-8);
		 
		  $.each(data,function(index,element){
			 
			  //循环添加tr向tbody里
			  $("#tbody").append(htmlStr);
			  
			  
			});
	
				
		//判断tr的行数
		var trs = $("#tbody").children("tr[modelid='110']");
		//循环向tr中添加数据
		for (var i = 0; i < trs.length; i++) {
			
			 var tds = $(trs[i]).children("td");
			 $(tds[1]).find("img").attr("src",data[i].goodName);
			 $(tds[2]).text(data[i].goodName);
			 $( tds[3]).html(data[i].goodId);
			 $( tds[4]).html(data[i].sku);
			 $( tds[6]).html(data[i].wareHouseName);
			 $( tds[7]).find("span").html(data[i].goodCount);
			 $( tds[8]).find("span").html(data[i].goodInventoryCost);
		}
		}
							

		});
	   */
	 
	 
	}
	
	
	
</script>







				<!--分页 star-->
				<div class="row" style="margin: 0; -moz-user-select: none;"
					onselectstart="return false;" id="paging">
					<div style="float: right;">
						<div style="margin-right: 10px; float: left;">
							<ul class="pagination">
								<li class="dropup">
									<div class="lh30 left">共</div>
									<div class="btn-group" style="margin: 0 5px;">
										<span class="lh30 left fb red" id="totalRecords"><%=pageinfo.getRowCount() %></span>
										<div class="lh30 left" style="margin-left: 5px;">条记录</div>

									</div>
								</li>
							</ul>
						</div>
						<div style="width: 150px; float: left;">
							<ul class="pagination">
								<li class="dropup">
									<div class="lh30 left">每页显示</div>
									<div class="btn-group" style="margin: 0 5px;">
										<button data-toggle="dropdown"
											class="btn btn-default dropdown-toggle" type="button">
											<span id="currentPageSize"><%=pageinfo.getPageSize() %></span>
											<span class="caret"></span>
										</button>
										<div class="lh30 left" style="margin-left: 5px;">个</div>
										<ul role="menu" class="dropdown-menu" id="pageSizes">
											<li><a href="javascript:void(0);"
												onclick="changePage(this)">10</a></li>
											<li><a href="javascript:void(0);"
												onclick="changePage(this)">20</a></li>
											<li><a href="javascript:void(0);"
												onclick="changePage(this)">50</a></li>
											<li><a href="javascript:void(0);"
												onclick="changePage(this)">100</a></li>
											<li><a href="javascript:void(0);"
												onclick="changePage(this)">200</a></li>
											<!-- <li><a href="javascript:void(0);">20</a></li>
                            <li><a href="javascript:void(0);">50</a></li> -->
										</ul>
									</div>
								</li>
							</ul>
						</div>



						<div style="width: 350px; float: left;" id="pagingPages">
							<ul class="pagination">

								<%
							int pagenum=Integer.parseInt(pageinfo.getPageNo());
							int begin=0;
							int end=0;
							int pagesum=pageinfo.getPageCount();
							
							if(pageinfo.getPageNo().equals("1")){ %>

								<li id="last" class="fb fmsun disabled"><a
									href="javascript:void(0);">&lt;</a></li>

								<%}else{ %>
								<li><a href="/MaiJiaYun/servlet/cg/kccb?querytext=
									<%=pageinfo.getQueryParam() %>&method=showKccb&pageno=
									<%=pagenum-1 %>&pagesize<%=pageinfo.getPageSize() %>">&lt;</a></li>


								<%} %>


								<%
				if (pagenum - 3 <= 0) {
					begin = 1;
					if (5 <= pagesum) {
						end = 5;
					} else {
						end = pagesum;
					}

				} else if (pagenum + 2 > pagesum) {
					if(pagesum-4>0){
						begin = pagesum - 4;	
					}else{
						begin=1;
					}
					
					end = pagesum;

				} else {
					begin = pagenum - 2;
					end = pagenum + 2;
				}
			%>





								<%	
			
			for(int j=begin;j<=end;j++){
					
					%>
								<%if(j==pagenum){ %>



								<li class="active"><a
									href="/MaiJiaYun/servlet/cg/kccb?querytext=
									<%=pageinfo.getQueryParam() %>&method=showKccb&pageno=<%=j %>&pagesize<%=pageinfo.getPageSize() %>"><%=j %></a>
								</li>
								<%}else{ %>

								<li><a href="/MaiJiaYun/servlet/cg/kccb?querytext=
									<%=pageinfo.getQueryParam() %>&method=showKccb&pageno=
									<%=j %>&pagesize<%=pageinfo.getPageSize() %>"><%=j %></a></li>

								<%} %>


								<%} %>



								<%if(pagenum==pageinfo.getPageCount()){ %>
								<li class="disabled"><a href="#">&gt;</a></li>
								<%}else{ %>
								<li><a href="/MaiJiaYun/servlet/cg/kccb?querytext=
									<%=pageinfo.getQueryParam() %>&method=showKccb&pageno=
									<%=pagenum+1 %>&pagesize<%=pageinfo.getPageSize() %>">&gt;</a></li>
								<%} %>









								<%-- <li class="page active" page="1"><a
									href="/MaiJiaYun/servlet/cg/kccb?querytext="+<%=pageinfo.getQueryParam() %>+"&method=showKccb?pageno="+<%=Integer.parseInt(pageinfo.getPageNo())-1 %>">1</a></li>

								<li class="page" page="2"><a href="javascript:void(0);">2</a></li>

								<li class="page" page="3"><a href="javascript:void(0);">3</a></li>

								<li id="next" class="fb fmsun"><a
									href="javascript:void(0);">&gt;</a></li> --%>
							</ul>
						</div>





					</div>
				</div>
				<!--分页 end-->
			</div>
		</div>
		<div class="contentbox" id="contentbox"
			style="display: none; background: rgb(241, 241, 241);"></div>
		<!--Layout right part end-->

		<div id="spinner" style="display: none;">
			<div class="modal fade" aria-hidden="false" role="dialog"
				tabindex="-1" style="display: block;">
				<div class="modal-dialog tc" style="margin-top: 300px;">
					<img src="./3_files/loading3.gif">
				</div>
			</div>
			<div class="modal-backdrop fade" style="background: #ffffff;"></div>
		</div>

		<div data-backdrop="false" id="chatContactModal"
			class="modal fade ng-scope" aria-hidden="true">
			<div class="right w-xl bg-white md-whiteframe-z2 ng-scope">
				<div class="chatbox ng-scope">
					<!--1-->
					<div class="p-h-md">
						<a class="pull-right text-muted-lt text-2x m-t-n inline p-sm"
							data-dismiss="modal" href="http://maijiayun.cn/#">×</a> <strong>联系人</strong>
					</div>
					<!--搜索-->
					<div class="row p-h-plr">
						<div class="has-feedback dropdown">
							<input type="text" data-toggle="dropdown"
								placeholder="查找公司/姓名/手机"
								class="form-control input-sm dropdown-toggle"
								id="chatContactSearchBox"> <span
								style="width: 30px; height: 30px; line-height: 30px;"
								class="glyphicon glyphicon-search form-control-feedback c9"></span>
							<!---->
							<div style="padding-top: 0" role="menu" class="dropdown-menu row">
								<ul class="media-list m-userinfo scrollspy-example "
									style="margin-bottom: 0px; max-height: 470px; margin-top: 0px;"
									id="chatContactSearchResult">
								</ul>
							</div>
							<!---->
						</div>
					</div>
					<!--搜索 end-->
					<div class="row p-h-plr mt10">
						<div data-toggle="buttons"
							class="btn-group btn-group-justified btn-group-sm" role="tablist"
							id="chatContactTabHeader">
							<label class="btn btn-default chattab active"
								style="padding: 0px;"> <a data-toggle="tab"
								href="http://maijiayun.cn/#chatContactHuihuaTab"> <input
									type="radio" name="options" id="option1" autocomplete="off"
									checked=""> 会话
							</a>
							</label> <label class="btn btn-default chattab" style="padding: 0px;">
								<a data-toggle="tab"
								href="http://maijiayun.cn/#chatContactTongshiTab"> <input
									type="radio" name="options" id="option2" autocomplete="off"
									checked=""> 同事
							</a>
							</label> <label class="btn btn-default chattab" style="padding: 0px;">
								<a data-toggle="tab"
								href="http://maijiayun.cn/#chatContactFenxiaoTab"> <input
									type="radio" name="options" id="option3" autocomplete="off"
									checked=""> 供应商

							</a>
							</label>

						</div>
					</div>
					<!--2-->
					<div class="box-row">
						<div class="box-cell tab-content mt5" id="chatContactTabContent">
							<div class="box-inner tab-pane fade plate active in"
								id="chatContactHuihuaTab" role="tabpanel">
								<ul class="media-list m-userinfo scrollspy-example "
									style="margin-bottom: 0px; height: 100%; margin-top: 0px;">

									<li style="margin-top: 0px;" class="media themebgcolor2">
										<div style="height: 315px;" class="row p15 tc f14 lh30 c9">
											<div class="row">暂时没有新的会话</div>
										</div>
									</li>


								</ul>
							</div>
							<div class="box-inner tab-pane fade plate"
								id="chatContactTongshiTab" role="tabpanel">
								<ul class="media-list m-userinfo scrollspy-example "
									style="margin-bottom: 0px; height: 100%; margin-top: 0px;">

									<li style="margin-top: 0px;" class="media themebgcolor2">
										<div style="height: 315px;" class="row p15 tc f14 lh30 c9">
											<div class="row">
												还没有同事,<br> 快邀请他们一起工作吧
											</div>

											<button data-toggle="modal" data-target="#inviteContactModal"
												data-dismiss="modal" data-tab="tongshi" type="button"
												class="btn btn-default mt20 inviteColleague">+邀请同事</button>

										</div>
									</li>


								</ul>
							</div>
							<div class="box-inner tab-pane fade plate"
								id="chatContactFenxiaoTab" role="tabpanel">
								<ul class="media-list m-userinfo scrollspy-example "
									style="margin-bottom: 0px; height: 100%; margin-top: 0px;">

									<li style="margin-top: 0px;" class="media themebgcolor2">
										<div style="height: 315px;" class="row p15 tc f14 lh30 c9">
											<div class="row">
												还没有分销商,<br> 快邀请他们一起上卖家云
											</div>
											<button data-toggle="modal" data-target="#inviteContactModal"
												data-dismiss="modal" data-tab="fenxiao" type="button"
												class="btn btn-default mt20 inviteColleague">+邀请合作伙伴</button>
										</div>
									</li>


								</ul>
							</div>
						</div>
					</div>
					<!--3-->
					<div class="p-h-md bgf1">
						<div class="btn-group btn-group-justified btn-group-sm"
							role="tablist" data-toggle="buttons"
							id="chatContactBottomButtons">

							<a data-toggle="modal" data-target="#inviteContactModal"
								data-dismiss="modal" role="button" class="btn btn-default"
								href="http://maijiayun.cn/#">+ 邀请</a> <a data-toggle="modal"
								data-target="#chatGroupSendingModal" data-dismiss="modal"
								role="button" class="btn btn-default"
								href="http://maijiayun.cn/#">群发</a>
						</div>
					</div>
					<!--end-->
				</div>
			</div>
		</div>
		<div id="chatMessageModal" class="modal fade ng-scope"
			aria-hidden="true">
			<div class="right w-xxl bg-white md-whiteframe-z2 ng-scope" style="">
				<div class="chatbox ng-scope">
					<!---->
					<div class="p-h-md tc bgf1">
						<a class="pull-right text-muted-lt text-2x m-t-n inline p-sm"
							data-dismiss="modal" href="http://maijiayun.cn/#">×</a> <a
							class="pull-left f18" data-toggle="modal"
							data-target="#chatContactModal" data-dismiss="modal"
							href="http://maijiayun.cn/#"> <span
							class="glyphicon glyphicon-arrow-left"></span>
						</a> <strong><span id="chatUserName">&nbsp;</span></strong>
					</div>
					<!---->
					<div class="box-row">
						<div class="box-cell" id="chatMessageScrollBox">
							<div class="box-inner m-userinfo">
								<div class="p-md">
									<div id="chatMessageCheckHistory">
										<div class="clear tc">
											<div class="p p-v-xs inline">&nbsp;</div>
										</div>
									</div>
									<div id="chatMessageTopTimeDivider"></div>
									<div id="chatMessageList"></div>
								</div>
							</div>
						</div>
					</div>
					<!---->
					<div class="p-h-md p-v bgf1">
						<div class="ng-pristine ng-valid">
							<div class="input-group">
								<input type="text" placeholder="按回车发送消息" autocomplete="off"
									class="form-control" id="sendChatMessageInput"> <span
									class="input-group-btn">
									<button type="button" class="btn btn-primary"
										id="sendChatMessageButton">发送</button>
								</span>
							</div>
						</div>
					</div>
					<!---->
				</div>
			</div>
		</div>
		<div data-backdrop="false" id="chatGroupSendingModal"
			class="modal fade ng-scope" aria-hidden="true">
			<div class="right w-xl bg-white md-whiteframe-z2 ng-scope" style="">
				<div class="chatbox ng-scope">
					<!--1-->
					<div class="p-h-md tc">
						<a class="pull-right text-muted-lt text-2x m-t-n inline p-sm"
							data-dismiss="modal" href="http://maijiayun.cn/#">×</a> <a
							class="pull-left f18" data-toggle="modal"
							data-target="#chatContactModal" data-dismiss="modal"
							href="http://maijiayun.cn/#" id="chatGroupSendingBack"> <span
							class="glyphicon glyphicon-arrow-left"></span>
						</a> <strong>选择联系人</strong>
					</div>
					<!--搜索-->
					<div class="row p-h-plr">
						<div class="has-feedback dropdown">
							<input type="text" data-toggle="dropdown"
								placeholder="查找公司/姓名/手机"
								class="form-control input-sm dropdown-toggle"
								id="chatGroupSendingSearchBox"> <span
								style="width: 30px; height: 30px; line-height: 30px;"
								class="glyphicon glyphicon-search form-control-feedback c9"></span>
							<!---->
							<div style="padding-top: 0" role="menu" class="dropdown-menu row">
								<ul class="media-list m-userinfo scrollspy-example "
									style="margin-bottom: 0px; max-height: 470px; margin-top: 0px;"
									id="chatGroupSendingSearchResult">
								</ul>
							</div>
							<!---->
						</div>
					</div>
					<!--搜索 end-->
					<!--2-->
					<div class="box-row">
						<div class="box-cell">
							<div class="box-inner plate">
								<ul class="media-list m-userinfo scrollspy-example"
									style="margin-bottom: 0px; height: 100%; margin-top: 0px;"
									id="chatGroupSendingContactList">
								</ul>
							</div>
						</div>
					</div>
					<!--3-->
					<div class="p-h-md bgf1 tc">
						<span class="text-muted">选择联系人添加到群发</span>
					</div>
					<!--end-->
				</div>
			</div>

			<div class="say w-xxl bg-white md-whiteframe-z2 ng-scope">
				<div class="chatbox ng-scope">
					<!--1-->
					<div class="p-h-md tc bgf1">
						<strong class="sayblock">发送消息给</strong>
					</div>
					<!--2-->
					<div class="box-row">
						<div class="box-cell">
							<div class="box-inner">
								<!---->
								<div class="row f12 tc c6">
									<div class="p p-v-xs bg-chattime inline mt15">从右侧选择联系人</div>
								</div>
								<!---->
								<div class="row m-userinfo plate">
									<ul class="scrollspy-example"
										style="margin-bottom: 0px; height: 100%; margin-top: 0px;"
										id="chatGroupSendingSelectedList">
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!--3-->
					<div class="p-h-md p-v bgf1">
						<div class="ng-pristine ng-valid">
							<div class="input-group">
								<input type="text" placeholder="按回车发送消息" autocomplete="off"
									class="form-control" id="sendChatGroupMessageInput"> <span
									class="input-group-btn">
									<button type="button" class="btn btn-primary"
										id="sendChatGroupMessageButton">发送</button>
								</span>
							</div>
						</div>
					</div>
					<!--end-->
				</div>
			</div>
		</div>
		<div id="inviteContactModal" class="modal fade" tabindex="-1"
			role="dialog" aria-labelledby="inviteContactModalLabel"
			aria-hidden="true">
			<div style="width: 795px;" class="modal-dialog">
				<div class="modal-content">
					<div
						class="collapse navbar-collapse navbar-default navbar-titletab"
						style="padding: 0px 0 0 0;">
						<button type="button" class="close p10" data-dismiss="modal"
							aria-hidden="true">×</button>
						<ul role="tablist" class="nav nav-tabs f14 fb" id="myTab">
							<li class="ml20 tab active" role="presentation" id="inviter-tab1">
								<a href="http://maijiayun.cn/#tab1" role="tab" data-toggle="tab">邀请同事</a>
							</li>
							<li class="tab" role="presentation" id="inviter-tab2"><a
								href="http://maijiayun.cn/#tab2" role="tab" data-toggle="tab">邀请合作伙伴</a>
							</li>
						</ul>
					</div>

					<div role="tabpanel" class="modal-body row"
						style="padding: 15px 0 0 0;">
						<div class="tab-content">
							<div id="tab1" class="tab-pane fade active in" role="tabpanel">
								<form class="form-horizontal" role="form">
									<div class="col-md-8">
										<label for="inputEmail3" class="col-sm-2 control-label c6">姓名</label>
										<div class="form-group has-feedback">
											<div class="col-sm-10">
												<input type="text" name="userName" class="form-control"
													placeholder="被邀请人的姓名(必填)"> <span
													class="glyphicon form-control-feedback"></span>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-left: 0px;">
										<div class="form-group">
											<div name="userName" class="alert alert-danger p7 f12"
												role="alert" style="display: none;"></div>
										</div>
									</div>
									<!---->
									<div class="col-md-8">
										<label for="inputEmail3" class="col-sm-2 control-label c6">手机</label>
										<div class="form-group has-feedback">
											<div class="col-sm-10">
												<input type="text" name="userPhone" class="form-control"
													placeholder="被邀请人的手机号(必填)"> <span
													class="glyphicon form-control-feedback"></span>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-left: 0px;">
										<div class="form-group">
											<div name="userPhone" class="alert alert-danger p7 f12"
												role="alert" style="display: none;"></div>
										</div>
									</div>
									<div class="col-md-8">
										<label for="inputEmail3" class="col-sm-2 control-label c6">Email</label>
										<div class="form-group has-feedback">
											<div class="col-sm-10">
												<input type="text" name="userEmail" class="form-control"
													placeholder="被邀请人的Email地址(非必填)"> <span
													class="glyphicon form-control-feedback"></span>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-left: 0px;">
										<div class="form-group">
											<div name="userEmail" class="alert alert-danger p7 f12"
												role="alert" style="display: none;"></div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="divider_line"></div>
									</div>
									<!---->
									<div class="col-md-12 mt10">
										<div class="form-group">
											<label class="ml20">分配岗位</label>
											<div class="row mt10">
												<div class="col-md-12 selectblock">
													<ul>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="19"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	管理员
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="10"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	客服
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="11"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	订单处理
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="15"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	库管
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="16"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	采购
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="17"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	运营
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="18"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	财务
															</span>
														</a></li>

													</ul>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>

							<div id="tab2" class="tab-pane fade" role="tabpanel">
								<form class="form-horizontal" role="form">
									<div class="col-md-8">
										<label for="inputEmail3" class="col-sm-2 control-label c6">企业名称</label>
										<div class="form-group has-feedback">
											<div class="col-sm-10">
												<input type="text" name="companyName" class="form-control"
													placeholder="被邀请的企业名称(必填)"> <span
													class="glyphicon form-control-feedback"></span>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-left: 0px;">
										<div class="form-group">
											<div name="companyName" class="alert alert-danger p7 f12"
												role="alert" style="display: none;"></div>
										</div>
									</div>
									<div class="col-md-8">
										<label for="inputEmail3" class="col-sm-2 control-label c6">联系人</label>
										<div class="form-group has-feedback">
											<div class="col-sm-10">
												<input type="text" name="companyUserName"
													class="form-control" placeholder="被邀请的联系人姓名(必填)"> <span
													class="glyphicon form-control-feedback"></span>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-left: 0px;">
										<div class="form-group">
											<div name="companyUserName" class="alert alert-danger p7 f12"
												role="alert" style="display: none;"></div>
										</div>
									</div>
									<div class="col-md-8">
										<label for="inputEmail3" class="col-sm-2 control-label c6">手机</label>
										<div class="form-group has-feedback">
											<div class="col-sm-10">
												<input type="text" name="companyUserPhone"
													class="form-control" placeholder="被邀请人的手机号(必填)"> <span
													class="glyphicon form-control-feedback"></span>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-left: 0px;">
										<div class="form-group">
											<div name="companyUserPhone"
												class="alert alert-danger p7 f12" role="alert"
												style="display: none;"></div>
										</div>
									</div>
									<div class="col-md-8">
										<label for="inputEmail3" class="col-sm-2 control-label c6">Email</label>
										<div class="form-group has-feedback">
											<div class="col-sm-10">
												<input type="text" name="companyUserEmail"
													class="form-control" placeholder="被邀请人的Email地址(非必填)">
												<span class="glyphicon form-control-feedback"></span>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-left: 0px;">
										<div class="form-group">
											<div name="companyUserEmail"
												class="alert alert-danger p7 f12" role="alert"
												style="display: none;"></div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="divider_line"></div>
									</div>
									<div class="col-md-12 mt10">
										<div class="form-group">
											<label class="ml20">您邀请的合作伙伴身份是</label>
											<div class="row mt10">

												<div class="col-md-12 selectblock">
													<ul>
														<li class="active" id="companysupplier"><a
															href="http://maijiayun.cn/#"><input type="radio"
																checked="true" value="option1" name="optionsRadios1">
																供应商</a></li>
														<li class="" id="companydealer"><a
															href="http://maijiayun.cn/#"><input type="radio"
																value="option2" name="optionsRadios2"> 分销商</a></li>
													</ul>
												</div>

											</div>
										</div>
									</div>
								</form>

							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary invite">邀请</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<div id="manageContactModal" class="modal fade" tabindex="-1"
			role="dialog" aria-labelledby="manageContactModalLabel"
			aria-hidden="true">
			<div style="width: 795px;" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title" id="manageContactModalLabel">分配岗位</h4>
					</div>
					<div role="tabpanel" class="modal-body"
						style="padding: 15px 0 0 0;">
						<!--1 star-->
						<div class="row f14">
							<form class="form-horizontal" role="form">
								<!---->
								<div class="col-md-8">
									<label for="inputEmail3" class="col-sm-2 control-label c6">姓名</label>
									<div class="form-group has-feedback">
										<div class="col-sm-10">
											<input disabled="" id="manageContactUserNameInput"
												type="text" name="name" value="" class="form-control"
												placeholder="请输入您同事的姓名"> <span
												class="glyphicon form-control-feedback"></span>
										</div>
									</div>
								</div>
								<div class="col-md-4" style="padding-left: 0px;">
									<div class="form-group">
										<div name="name" class="alert alert-danger p7 f12"
											role="alert" style="display: none;"></div>
									</div>
								</div>
								<!---->
								<div class="col-md-8">
									<label for="inputEmail3" class="col-sm-2 control-label c6">手机</label>
									<div class="form-group has-feedback">
										<div class="col-sm-10">
											<input disabled="" id="manageContactUserPhoneInput"
												type="text" name="phone" class="form-control" value=""
												placeholder="请输入您同事的手机号码"> <span
												class="glyphicon form-control-feedback"></span>
										</div>
									</div>
								</div>
								<div class="col-md-4" style="padding-left: 0px;">
									<div class="form-group">
										<div name="phone" class="alert alert-danger p7 f12"
											role="alert" style="display: none;"></div>
									</div>
								</div>
								<!---->
								<div class="col-md-8">
									<label for="inputEmail3" class="col-sm-2 control-label c6">Email</label>
									<div class="form-group has-feedback">
										<div class="col-sm-10">
											<input disabled="" id="manageContactUserEmailInput"
												type="text" name="email" class="form-control" value=""
												placeholder="请输入您同事的Email"> <span
												class="glyphicon form-control-feedback"></span>
										</div>
									</div>
								</div>
								<div class="col-md-4" style="padding-left: 0px;">
									<div class="form-group">
										<div name="email" class="alert alert-danger p7 f12"
											role="alert" style="display: none;"></div>
									</div>
								</div>
								<!---->
								<div class="col-md-12">
									<div class="divider_line"></div>
								</div>
								<!---->
								<div class="col-md-12 mt10">
									<div class="form-group">
										<label class="ml10">分配岗位 <!-- <a href="javascript:void(0);" id="gangweijieshao"><span class="blue iconfont icon-play ml20" style="font-size:16px;"></span> 岗位介绍</a> --></label>
										<!---->
										<div class="row mt10">
											<div class="col-md-12 selectblock">
												<ul id="manageContactUserFunctionList">
												</ul>
											</div>
										</div>
										<!---->
									</div>
								</div>
								<!---->
							</form>
						</div>
						<!--1 end-->
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary updatePackUser">修改</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>

		<div style="width: 300px; height: 80px; display: none;" class="modal"
			id="keepsuccessModal" tabindex="-1" role="dialog"
			aria-labelledby="logisticsModalLabel" aria-hidden="false">
			<div class="modal-dialog" style="width: 300px; margin: 52px 0 0 0;">
				<div style="background: #61be44; border-radius: 0px; border: none"
					class="modal-content">
					<div style="padding: 5px;" class="modal-body">
						<!--part one-->
						<div style="color: #ffffff;" class="c6 tc" id="showTempDiv">保存成功！</div>
						<!--part one end-->
					</div>
				</div>
			</div>
		</div>
		<div style="width: 300px; height: 80px; display: none;" class="modal"
			id="keeperrorModal" tabindex="-1" role="dialog"
			aria-labelledby="logisticsModalLabel" aria-hidden="false">
			<div class="modal-dialog" style="width: 300px; margin: 52px 0 0 0;">
				<div style="background: #ff5831; border-radius: 0px; border: none"
					class="modal-content">
					<div style="padding: 5px;" class="modal-body">
						<!--part one-->
						<div style="color: #ffffff;" class="c6 tc" id="showErrorTempDiv">保存失败！</div>
						<!--part one end-->
					</div>
				</div>
			</div>
		</div>

		<div aria-hidden="true" aria-labelledby="edit_accountModalLabel"
			role="dialog" tabindex="-1" id="edit_accountModal" class="modal fade"
			style="display: none;"></div>
		<div id="modal"></div>
	</div>
	<!--代码结束-->





</body>
</html>