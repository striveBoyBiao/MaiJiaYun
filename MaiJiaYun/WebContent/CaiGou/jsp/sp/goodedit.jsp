<%@page import="mjy.caigou.po.GoodsPO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
	<script type="text/javascript">
	
	
	
	
	</script>
	<% GoodsPO goodpo= (GoodsPO)request.getAttribute("goodpo"); %>

	<%  request.getParameter("goodpo") ;%>
	<div class="content" id="content">
		<div style="background: #f1f1f1">
			<!--titletab star-->
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0; background: #ffffff;">
				<div class="navbar-header">
					<a href="javascript:history.back()" class="navbar-brand ml20"><span
						class="fb fmsun">&lt;&nbsp;</span>添加商品</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<!--<li class="active ml20 tab"><a href="javascript:void(0);" style="background:#f1f1f1;">添加商品</a></li>-->
				</ul>
			</div>
			<!--titletab end-->
			<!--panel star-->
			<div class="prl10auto">
				<!--star-->
				<div class="panel prl10auto mt15">
					<h5 class="fb">商品分类</h5>

					<div class="row mt15 mb20">
						<div class="form-inline">
							<div class="form-group">
								请选择商品分类： <select id="categoryId" class="selectpicker"
									data-width="auto" style="display: none;">
									<!--<option data-hidden="true">请选择分类</option>

											<option value="30485">未分类</option>
											<option value="30485">运动健身</option>-->
								</select>

								<div class="btn-group bootstrap-select" style="width: 76px;">
									<button type="button"
										class="btn dropdown-toggle selectpicker btn-default"
										data-toggle="dropdown" data-id="categoryId" title="请选择分类"
										id="myButton">
										<span class="filter-option pull-left">请选择分类</span>&nbsp;<span
											class="caret"></span>
									</button>
									<div class="dropdown-menu open" style="min-width: 0px;"
										id="myDropdown">
										<ul class="dropdown-menu inner selectpicker" role="menu">
											<!-- <li rel="0" class="hide is-hidden selected">
														<a tabindex="0"></a>
													</li>
													<li rel="1">
														<a tabindex="0" class="" style=""><span class="text">未分类</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a>
													</li>
													<li rel="1">
														<a tabindex="0" class="" style=""><span class="text">运动健身</span><i class="glyphicon glyphicon-ok icon-ok check-mark"></i></a>
													</li> -->
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<script>
				
				
				
				
							window.onload = function(){
								
								
								
								
								
									
								$.ajax({
									url:"/MaiJiaYun/servlet/cg/xinzengsp",
									dataType:"json",
									data:"method=dropdownBox",
									success:function(data){
										
										var sel = document.getElementById("categoryId");
										var optStr = "";
										var optShowStr = "";
										
										
										
										$.each(data,function(index,element){
											
											//注意此处的value值需要动态改变
											optStr += "<option value="+element.goodGroupId+">" + element.goodGroupName + "</option>";
			
											optShowStr += "<li rel=\"1\"><a tabindex=\"0\" class=\"\" style=\"\"  onclick=\"changeWarehouse(this)\" >" +
												"<span class=\"text\" >" + element.goodGroupName + "</span>" +
												"</a></li>";
										});
										sel.innerHTML = optStr;
			
										$("#myDropdown").find("ul").html(optShowStr);
										
										
										innt();
										
										
										
									}
									
									
									
								});
								
								
								
								

								 
								
							}

							 function changeWarehouse(obj) {

								var str = $(obj).find("span").text();
								console.log($(obj).find("span").text());
								$("#myButton .pull-left").text(str)

							}
							 
							 
							
							 
							function innt() {
								
								$("#code").attr("disabled",true); 
								
								
								 //获取options的集合
                                                                     var options=document.getElementsByTagName("option");  
                                                                             for(var i=0;i<options.length;i++) {
                                                                            	 if(options[i].value==<%=goodpo.getGoodGroupId()%>){
                                                                            		 $("#myButton .pull-left").text(options[i].text) 
                                                                            	 }
                                                                            	 
                                                                            	 
                                                                             }       		
                                                                   

                                                                     
                                                                    
                                                  					
                                                                                            var  goodpicturepath="<%=goodpo.getGoodPicture() %>";
                                                  					if(goodpicturepath!=null){
                                                  												 
                                                  				          $("#goodPicture").css('display','block'); 
                                                  				           $("#goodpicturediv").css('display','block');
                                                  				          
                                                  				            $("#goodPicture").attr('src',"<%=goodpo.getGoodPicture() %>");
                                                  					
                         							 
                                                  					}
                                                  					
							
							
							} ;
							 
                                                                     
							 
							 
						</script>


				<div class="panel prl10auto mt15" id="goodsPanel">
					<!--star-->
					<h5 class="fb">基本信息</h5>
					<div class="row mt15 ">
						<div class="col-md-3">
							<form class="form-inline" role="form">
								<div class="form-group" style="margin-left: 45px;">货号：</div>
								<div class="form-group">
									<input type="number" id="code" name="code" class="form-control"
										placeholder="" oninput="huohao()"
										value="<%=goodpo.getGoodId()%>">
								</div>
							</form>
						</div>
						<div class="col-md-9">
							<form class="form-inline" role="form">
								<div class="form-group">商品名称：</div>
								<div class="form-group">
									<input type="text" id="title" name="title" class="form-control"
										placeholder="" oninput="huohao()"
										value=<%=goodpo.getGoodName() %>>
								</div>
							</form>
						</div>
					</div>
					<div class="row mt15 mb20">
						<div class="col-md-3">
							<form class="form-inline" role="form">
								<div class="form-group">标准售价(元)：</div>
								<div class="form-group">
									<input type="number" id="price" name="price"
										class="form-control float" placeholder="" oninput="huohao()"
										value=<%=goodpo.getGoodPrice() %>>
								</div>
							</form>
						</div>
						<div class="col-md-3">
							<form class="form-inline" role="form">
								<div class="form-group">重量(kg)：</div>
								<div class="form-group">
									<input type="number" id="weight" name="weight"
										class="form-control float" placeholder="" oninput="huohao()"
										value=<%=goodpo.getGoodWeight() %>>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="panel prl10auto" id="goodsPicPanel">
					<h5 class="fb">商品图片</h5>
					<div class="row mt15 mb20">
						<div class="row">

							<div id="goodpicturediv" class="col-md-2 mb10 goodsPic"
								modelid="c262" style="height: 100px; width: 150px;display: none" >
								<img
									src="http://ht-goods.oss-cn-hangzhou.aliyuncs.com/70190/1481013424907Tulips.jpg"
									style="height: 100px; width: 100px; display: none;"
									class="img-thumbnail" alt="100x100" id="goodPicture"> <a
									href="javascript:void(0);"><div
										class="carousel-caption deleteGoodsPic"
										onclick="deletegoodPicture()">删除</div></a>
							</div>




							<!-- <div style="float: left;"><img style="height: 100px;width: 100px; display: none;"  src="" id="goodPicture"/> </div> -->
							<!--添加图片 star-->
							<div class="col-md-2 mb10" id="addGoodsPicDiv">
								<a id="addGoodsPic" style="cursor: pointer;"
									data-target="#addSkuModal" data-toggle="modal"> <img
									src="img/pic.jpg" style="height: 100px; width: 100px;"
									class="img-thumbnail" alt="100x100">
									<div class="carousel-caption2">
										<span class="glyphicon glyphicon-plus f46"></span>
										<div class="lh15 p510">添加图片</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
				<!--end-->
				<!--star-->
				<div class="panel prl10auto" style="margin-bottom: 0px;">
					<h5>
						<form role="form" class="form-inline">
							<div class="form-group mr40 fb">SKU信息</div>
							<a id="addSku" style="cursor: pointer;" data-toggle="modal"
								onclick="addSku()"><span class="glyphicon glyphicon-plus"></span>
								添加SKU</a>
						</form>
					</h5>
					<div id="skuPanel">
						<div class="row mt15" style="padding-bottom: 20px;">

							<table style="margin-bottom: 0" class="table table-hover"
								id="skutable">
								<thead class=" table-bordered">
									<tr>
										<th style="width: 50px;"></th>
										<th>序号</th>
										<th>SKU编码</th>
										<th>售价</th>
										<th>重量(kg)</th>
										<th>属性</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="addSKU" style="font-weight: normal">

									<tr class="addtr" cid="c92" iscid="true">
										<td>
											<div class="form-group" style="display: none;">
												<span class=" white_font themebgcolor4 mr5"
													style="padding: 0 1px;">组合</span>
											</div>
										</td>
										<td style="width: 50px;">1</td>
										<td class="fb">
											<div class="form-group">
												<input type="text" id="skucode"
													class="form-control skuPanel" name="code"
													value="<%=goodpo.getSku()%>">
											</div>
										</td>
										<td>
											<div class="form-group">
												<input type="text" id="goodprice"
													class="form-control float skuPanel" name="price"
													value=<%=goodpo.getGoodPrice() %>>
											</div>
										</td>
										<td>
											<div class="form-group">
												<input type="text" id="goodweight"
													class="form-control float skuPanel" name="weight"
													value=<%=goodpo.getGoodWeight() %>>
											</div>
										</td>
										<td>
											<div class="form-group">
												<input type="text" class="form-control skuPanel"
													name="propsName" id="" value="">
											</div>
										</td>
										<td><a class="deleteSku" href="javascript:void(0);"
											onclick="dele()">删除</a> <a name="editIsCombo"
											href="javascript:void(0);" style="display: none;">编辑组合商品
												<span class="iconfont icon-bottom"
												style="font-size: 14px; display: none;"></span>
										</a> <a name="setIsCombo" href="javascript:void(0);">设为组合商品<span
												class="iconfont icon-bottom" style="font-size: 14px;"></span></a>
										</td>
									</tr>

								</tbody>
							</table>

							<script>
										var trHtml = " <tr class=\"addtr\" cid=\"c92\" iscid=\"true\"><td><div class=\"form-group\" style=\"display:none;\"><span class=\" white_font themebgcolor4 mr5\" style=\"padding:0 1px;\">组合</span></div></td> <td style=\"width:50px;\">1</td><td class=\"fb\"><div class=\"form-group\"><input type=\"text\" class=\"form-control skuPanel\" id=\"aa\" name=\"code\" value=\"-1\"></div></td><td><div class=\"form-group\"><input type=\text\" id=\"bb\" class=\"form-control float skuPanel\" name=\"price\" value=\"0\"></div></td><td><div class=\"form-group\"><input type=\"text\" id=\"cc\" class=\"form-control float skuPanel\" name=\"weight\" value=\"0\"></div></td><td><div class=\"form-group\"><input type=\"text\" id=\"dd\" class=\"form-control skuPanel\" name=\"propsName\" ></div></td><td> <a class=\"deleteSku\" href=\"javascript:void(0);\" onclick=\"dele(this)\" id='trdel'>删除</a><a name=\"editIsCombo\" href=\"javascript:void(0);\" style=\"display:none;\">编辑组合商品<span class=\"iconfont icon-bottom\" style=\"font-size:14px;display:none;\"></span></a><a name=\"setIsCombo\" href=\"javascript:void(0);\">设为组合商品<span class=\"iconfont icon-bottom\" style=\"font-size:14px;\"></span></a></td></tr>"

										function addSku() {

											$("#addSKU").append(trHtml);

											var table = document.getElementById("skutable");
											for(i = 0; i < table.rows.length; i++) {

												table.rows[i + 1].cells[1].innerHTML = (i + 1);

											}
										}

										function huohao() {

											document.getElementById("aa").value = document.getElementById("code").value;
											document.getElementById("dd").value = document.getElementById("title").value;
											document.getElementById("bb").value = document.getElementById("price").value;
											document.getElementById("cc").value = document.getElementById("weight").value;

										}

										function dele(s) {
											s.parentNode.parentNode.remove();
										}
									</script>

							<div class="modal fade" id="addpurchaseModal" tabindex="-1"
								role="dialog" aria-labelledby="addpurchaseModalLabel"
								aria-hidden="true" style="display: none;"></div>
						</div>
					</div>

				</div>
				<!--end-->
			</div>
			<!--panel end-->
			<div style="padding: 20px 10px 40px 10px">
				<button type="button" class="btn btn-primary mr5 save"
					onclick="baocun()">保存</button>


				<button type="button" class="btn btn-default cancel once"
					onclick="window.location.href='${pageContext.request.contextPath}/servlet/cg/sp?method=ini'">取消</button>
				<span id="errorSpan" style="color: red"></span>
			</div>
			<div class="modal fade" id="addSkuModal" tabindex="-1" role="dialog"
				aria-labelledby="addSkuModalLabel" aria-hidden="true"
				style="display: none;">
				<div style="width: 500px;" class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button aria-hidden="true" data-dismiss="modal" class="close"
								type="button">×</button>
							<h5 id="addpicModalLabel" class="modal-title">添加图片</h5>
						</div>
						<div class="modal-body">
							<!---->
							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist">
								<li class="active"><a data-target="#one"
									style="cursor: pointer;" role="tab" data-toggle="tab">网络图片地址</a>
								</li>
								<li><a data-target="#two" style="cursor: pointer;"
									role="tab" data-toggle="tab"> <span
										class="glyphicon glyphicon-link"></span> 添加本地图片
								</a></li>
							</ul>
							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane active" id="one">
									<div class="mt15">
										<input id="picUrl1" type="text" name="picUrl"
											placeholder="请输入网络图片地址" class="form-control"
											style="width: 455px">
									</div>
								</div>
								<div class="tab-pane" id="two">
									<form id="goodsPicForm" method="POST"
										enctype="multipart/form-data">
										<div class="mt15">
											<input id="picUrl2" type="file" name="picUrl"
												placeholder="添加本地图片" class="form-control"
												style="width: 455px">
										</div>

									</form>
								</div>
							</div>
							<!---->
						</div>
						<div class="modal-footer">
							<button id="addPicBut" class="btn btn-primary ok"
								onclick="showModel()" type="button" data-toggle='modal'>确定</button>
							<button data-dismiss="modal" class="btn btn-default"
								type="button">取消</button>
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="show2">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-body">
							<button type="button" class="bootbox-close-button close"
								data-dismiss="modal" aria-hidden="true"
								style="margin-top: -10px;">×</button>
							<div class="bootbox-body">请上传本地图片或输入网络图片地址</div>
						</div>
						<div class="modal-footer">
							<button data-bb-handler="ok" type="button"
								class="btn btn-primary" data-dismiss="modal">OK</button>
						</div>
					</div>

				</div>
			</div>

			<script>
			
			                                 var goodPicturePath="<%=goodpo.getGoodPicture() %>";
			                                
						function showModel() {

							var actEle = document.getElementsByClassName("active")[0].getElementsByTagName("a")[0].getAttribute("data-target").substring(1);

							var message = document.getElementById(actEle).getElementsByTagName("input")[0].value

							var buttonOK = document.getElementById("addPicBut");
							if(!message || message == "") {

								buttonOK.setAttribute("data-dismiss", "");
								buttonOK.setAttribute("data-target", "#show2");
							} else {
								buttonOK.setAttribute("data-target", "");
								buttonOK.setAttribute("data-dismiss", "modal");
							}
						
			
			//从本地上传图片
                             if($("#picUrl2").val()!=""){
                            	
                            	 
                            	 /* checkUrl();
                            	 document.getElementById("goodsPicForm").submit(); */
                            	 

                            	 var formData = new FormData($( "#goodsPicForm" )[0]); 
                            	
                            	 $.ajax({
                            		 url:"/MaiJiaYun/servlet/cg/xinzengsp?method=goodpicture",
                            		 dataType:"text",
                            		 cache: true,
                            	           type: "POST",
                            	 	//$('#goodsPicForm').serialize()
                            	 	data:formData,
                            	 	processData: false,
                            	 	contentType: false,
                            	 	error: function(request) {
                            	 			        alert("Connection error");
                            	 			    },
                            	           success: function(data) {
                            	        	   //去掉空格
                            	        	   
                            	        	   var data1=  data.replace(/(^\s*)|(\s*$)/g,"");
                            	        	  
                            	        	   goodPicturePath=data1; 
                            	        	  
                            	        	   $("#goodPicture").css('display','block'); 
                            	        	   $("#goodpicturediv").css('display','block');
                                          	 $("#goodPicture").attr('src',goodPicturePath);
                            	 		
                            	 			    }
                            	 			});

                            	 
                            	 
                            	 
                            	 
                            	
                             }
                             //从网络获取图片
                             if($("#picUrl1").val()!=""){
                            	 
                            	 $("#goodPicture").css('display','block'); 
                            	  $("#goodpicturediv").css('display','block');
                            	 goodPicturePath=$("#picUrl1").val();
                            	 $("#goodPicture").attr('src',goodPicturePath);
                             }
						
						 
						
						}
						
						
			
	
						//点击保存按钮触发的事件
						function baocun() {
							
							
							
							if($("#code").val()==""){
								
								$("#errorSpan").text("货号不能为空");
								return ;
							}
		                                                    if($("#title").val()==""){
								
								$("#errorSpan").text("商品名称不能为空");
								return ;
							}
							
		                                                    if($("#price").val()==""){
		                                						
		                                                             $("#errorSpan").text("价格必须字段不能为空");
		                                		             return ;
		                                					}
		                                                  
		                                                    //获取options的集合
		                                                    var options=document.getElementsByTagName("option");  
		                                                    //获取goodgroupID默认为1（未分类）
		                                                    var goodgroupId=1;
		                                                    for(var i=0;i<options.length;i++){
		                                                    	//把button的text值末尾的空格去掉
		                                                    	 var aa=  $("#myButton").text().replace(/(^\s*)|(\s*$)/g,"");  
		                                                    	
		                                            
		                                                    	//如果button的text值等于option的text值把option的value值赋给goodgroupID
		                                                    	if(aa==options[i].text){
		                                                    		goodgroupId=options[i].value;
		                                                    		
		                                                    		
		                                                    	}
		                                                    	
		                                                    }
		                                                    
		                                                    
		                                                   
		                                                 //把商品属性保存到一个对象里
		                                                    var goods={
		                                                           "goodId":$("#code").val(),
		                                                           "sku":$("#skucode").val(),
		                                                           "goodGroupId":goodgroupId,
		                                                           "goodName":$("#title").val(),
		                                                           "goodPrice":$("#price").val(),
		                                                           "goodWeight":$("#weight").val(),
		                                                           "goodPicture":goodPicturePath,
		                                                           "oldsku":"<%=goodpo.getSku()%>",
		                                                           "oldgoodId":"<%=goodpo.getGoodId()%>"
						                    
					//图片省略

					};
					var skucode = $("#skucode").val();

					$
							.ajax({
								url : "/MaiJiaYun/servlet/cg/xinzengsp?method=goodeditbaocun",
								dataType : 'text',
								data : goods,

								type : "post",
								success : function(data) {
									data = data.replace(/(^\s*)|(\s*$)/g, "");

									if (data != "error") {

										window.location.href = "${pageContext.request.contextPath}/servlet/cg/sp?method=ini"
									}else {
										$("#errorSpan").text("sku/goodId不能重复");
									}


								}

							});

				}

				$("#code").change(function() {

					$("#skucode").val($("#code").val());
				});

				$("#price").change(function() {

					$("#goodprice").val($("#price").val());
				});

				function deletegoodPicture() {

					$("#goodpicturediv").css('display', 'none');
					goodPicturePath = "";
				}
			</script>

		</div>
	</div>
	<div class="contentbox" id="contentbox"
		style="display: none; background: rgb(241, 241, 241);"></div>
	<!--Layout right part end-->

	<div id="spinner" style="display: none;">
		<div class="modal fade" aria-hidden="false" role="dialog"
			tabindex="-1" style="display: block;">
			<div class="modal-dialog tc" style="margin-top: 300px;">
				<img src="img/loading3.gif">
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
						data-dismiss="modal" href="#">×</a> <strong>联系人</strong>
				</div>
				<!--搜索-->
				<div class="row p-h-plr">
					<div class="has-feedback dropdown">
						<input type="text" data-toggle="dropdown" placeholder="查找公司/姓名/手机"
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
							href="#chatContactHuihuaTab"> <input type="radio"
								name="options" id="option1" autocomplete="off" checked="">
								会话
						</a>
						</label> <label class="btn btn-default chattab" style="padding: 0px;">
							<a data-toggle="tab" href="#chatContactTongshiTab"> <input
								type="radio" name="options" id="option2" autocomplete="off"
								checked=""> 同事
						</a>
						</label> <label class="btn btn-default chattab" style="padding: 0px;">
							<a data-toggle="tab" href="#chatContactFenxiaoTab"> <input
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
						role="tablist" data-toggle="buttons" id="chatContactBottomButtons">

						<a data-toggle="modal" data-target="#inviteContactModal"
							data-dismiss="modal" role="button" class="btn btn-default"
							href="#">+ 邀请</a> <a data-toggle="modal"
							data-target="#chatGroupSendingModal" data-dismiss="modal"
							role="button" class="btn btn-default" href="#">群发</a>
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
						data-dismiss="modal" href="#">×</a> <a class="pull-left f18"
						data-toggle="modal" data-target="#chatContactModal"
						data-dismiss="modal" href="#"> <span
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
						data-dismiss="modal" href="#">×</a> <a class="pull-left f18"
						data-toggle="modal" data-target="#chatContactModal"
						data-dismiss="modal" href="#" id="chatGroupSendingBack"> <span
						class="glyphicon glyphicon-arrow-left"></span>
					</a> <strong>选择联系人</strong>
				</div>
				<!--搜索-->
				<div class="row p-h-plr">
					<div class="has-feedback dropdown">
						<input type="text" data-toggle="dropdown" placeholder="查找公司/姓名/手机"
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
				<div class="collapse navbar-collapse navbar-default navbar-titletab"
					style="padding: 0px 0 0 0;">
					<button type="button" class="close p10" data-dismiss="modal"
						aria-hidden="true">×</button>
					<ul role="tablist" class="nav nav-tabs f14 fb" id="myTab">
						<li class="ml20 tab active" role="presentation" id="inviter-tab1">
							<a href="#tab1" role="tab" data-toggle="tab">邀请同事</a>
						</li>
						<li class="tab" role="presentation" id="inviter-tab2"><a
							href="#tab2" role="tab" data-toggle="tab">邀请合作伙伴</a></li>
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
										<div name="companyUserPhone" class="alert alert-danger p7 f12"
											role="alert" style="display: none;"></div>
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
										<div name="companyUserEmail" class="alert alert-danger p7 f12"
											role="alert" style="display: none;"></div>
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
													<li class="active" id="companysupplier"><a href="#"><input
															type="radio" checked="true" value="option1"
															name="optionsRadios1"> 供应商</a></li>
													<li class="" id="companydealer"><a href="#"><input
															type="radio" value="option2" name="optionsRadios2">
															分销商</a></li>
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
				<div role="tabpanel" class="modal-body" style="padding: 15px 0 0 0;">
					<!--1 star-->
					<div class="row f14">
						<form class="form-horizontal" role="form">
							<!---->
							<div class="col-md-8">
								<label for="inputEmail3" class="col-sm-2 control-label c6">姓名</label>
								<div class="form-group has-feedback">
									<div class="col-sm-10">
										<input disabled="" id="manageContactUserNameInput" type="text"
											name="name" value="" class="form-control"
											placeholder="请输入您同事的姓名"> <span
											class="glyphicon form-control-feedback"></span>
									</div>
								</div>
							</div>
							<div class="col-md-4" style="padding-left: 0px;">
								<div class="form-group">
									<div name="name" class="alert alert-danger p7 f12" role="alert"
										style="display: none;"></div>
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