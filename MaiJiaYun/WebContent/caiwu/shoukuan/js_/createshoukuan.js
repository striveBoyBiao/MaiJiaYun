
$(document).ready(function() {
	/* 获取当前页面的文件名或路径 */
	var pathname = window.location.pathname.substring(1);
	/*获取项目名称*/
	var projectName = pathname.substring(0, pathname.indexOf('/'));	
	//加载页面时触发
	$("#li-shoukuan a").attr("href","javascript:void(0)");
	$("#li-yishou a").attr("href","javascript:void(0)");
	$("#li-shoukuanhuaizhang a").attr("href","javascript:void(0)");	
	//创建查询框
	createQuery();
	ajaxCreateShouKuan();
	/*异步请求生成收款表信息的方法*/
	function ajaxCreateShouKuan(event){
		/*
		 * 获取参数
		 */
		//获取模糊查询
		var param = $("#param").val();
		//获取每页显示个数
		var pageSize = $("#currentPageSize").html();
		//获取收支类型的id	
		if($(event).parent("ul").attr("id")=="type_ul"){
			var shouzhilxId = $(event).attr("shouzhilxId");
		}		
		if(event=="NoShouzhilxId"){
			var shouzhilxId = "";		
		}	
		//获取页数，点击页码
		if( $(event).attr("page")){
			var pageNo = $(event).attr("page");
		}
		//获取页数，点击上一页、下一页
		if(!isNaN(event)){
			var pageNo = event;
		}
		//设置状态，默认为0,通过标签页属性判断
		var skState = 0;
		if($("#li-shoukuan").hasClass("active")){	
			skState = 0;				
		}else if($("#li-yishou").hasClass("active")){
			skState = 1;			
		}else if($("#li-shoukuanhuaizhang").hasClass("active")){
			skState = 2;			
		}
		/*
		 * 异步请求
		 */
		$.ajax({
			url : "/"+projectName+"/servlet/cw/queryShouKuanByParams",
			type : "post",
			data : {
				method:"queryShouKuan",
				shouzhilxId : shouzhilxId,
				skState:skState,
				pageSize:pageSize,
				pageNo:pageNo,
				param:param
			},
			datatype : "json",					
			success:function(data) {					
				if(data){	
					//数据总个数
					$("#totalRecords").html(data[0].rowCount);
					createAddBtn(skState);
					createThead(skState);
					createTbody(data[0].pageDate,skState);						
					createPaginationNo(data[0].pageCount,data[0].pageNo);
					$("#currentPageSize").html(data[0].pageSize);	
					updateURL(skState,data[0].pageNo);
				}
			}		
		});		  
	}
	/* 
	 * 异步生成收支类型
	 */	
	function createShouZhiLeiXing(){
		$.ajax({
			url : "/"+projectName+"/servlet/cw/queryShouKuanByParams",
			data:{
				method:"queryShouZhiLeiXing"
			},
			type : "post",
			datatype : "json",					
			success:function(data) {
				var shouZhiLeiXingS = "";						
				if(data){
					$("#type_ul").html("");
					$.each(data,function(index,element){				
						shouZhiLeiXingS+= "<li shouzhilxId="+element.shouzhilxId+">";
						shouZhiLeiXingS+= "<a href='javascript:void(0)' code='' >";
						shouZhiLeiXingS+= element.shouzhilxType;
						shouZhiLeiXingS+="</a></li>";
					}); 
					$("#type_ul").html(shouZhiLeiXingS);							
				}				
			}
		});
	}
	/*更改地址栏URL内容*/
	function updateURL(skState,pageNo){
		if(skState==0){
			window.history.pushState(null, "", "/"+projectName+"/servlet/cw/shouKuan/"+pageNo);
		}else if(skState==1){
			window.history.pushState(null, "", "/"+projectName+"/servlet/cw/yiShou/"+pageNo);
		}else if(skState==2){
			window.history.pushState(null, "", "/"+projectName+"/servlet/cw/shouKuanHuaiZhang/"+pageNo);
		}
	}
	
	/*
	 * ******点击事件******
	 */
	//菜单栏的点击事件
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		$("#currentPageSize").html(10);	
		$("#param").val("");
		ajaxCreateShouKuan("NoShouzhilxId");
	});
	//收支类型的点击事件，异步生成
	$(document).on('click','#dropdownMenu1',function(){
		createShouZhiLeiXing();		
	});
	$(document).on('click','#type_ul li',function(){
		ajaxCreateShouKuan(this);
	});
	/*每页显示个数*/
 	$("#pageSizes li a").click(function() {			
		$("#currentPageSize").html($(this).html());
		ajaxCreateShouKuan(this);	
	});	
 	//模糊搜索框的事件
 	$(document).on('click','.query',function(){
		ajaxCreateShouKuan();
	});
 	$(document).on('focus','#param',function(){
		$("#param").val("");
		
	});
 	//回车键事件
// 	$(document).on('keypress','#param',function(event){
// 		if(event.keyCode ==13){
//		    alert("sdd");
//		  }	
//	});

 	var modalState;
 	var modalSkId;
	/* 	点击收款、坏账时弹出的模态框 生成代码的方法*/
	$(document).on('click','.mr5',function(){
		var skId = $(this).attr("shoukuanid");		
		var mark = 2;
		if($(this).attr("name")==="btnShouKuan"){
			mark=1;
		}
		var modalId = "myModal" +skId+mark;
		var modal = "";	
		modal += "<div class='myModal modal fade' id='"+modalId+"' tabindex='-1'"
			+">";
		modal +="<div class='modal-dialog'>"
				+"<div class='modal-content'>"
				+"<div class='modal-header'>"
		modal +="<button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>";
		modal +="<h4 class='modal-title' >";
		if(mark == 1){
			modal +="你是否确认收款，确认后无法驳回！";
		}else{
			modal +="你是否确认坏账，确认后无法驳回！";
		}						
		modal +="</h4></div>";											
		modal +="<div class='modal-footer'>";
		modal +="<button type='button' class='btn btn-default' data-dismiss='modal'>取消</button>";
		modal +="<button  type='button' class='confirm btn btn-primary' >确认</button></div></div></div></div>";													
		$("body ").prepend(modal);
		modalState = mark;
		modalSkId = skId;
		//模态框的点击事件
		clickModal(modalId);			
	});
	//模态框的点击事件
	function clickModal(modalId){		
		//显示和隐藏模态框
		$("#"+modalId).modal();
		/* 清除模态框 */
		$("#"+modalId).on('hidden.bs.modal', function (e) {
			$("#"+modalId).remove();
		});			
	}
	//模态框的确定按钮点击事件
	$(document).on('click','.confirm',function(){		
		modalId = $(".myModal").attr("id");
		$.ajax({
			url : "/"+projectName+"/servlet/cw/queryShouKuanByParams",
			data:{
				method:"shouKuanOrHuaiZ",
				skId:modalSkId,
				skState:modalState
			},
			type : "post",
			datatype : "json",					
			success:function(data) {					
				if(data){	
					ajaxCreateShouKuan()
					// 清除模态框 
					$("#"+modalId).remove();
				}					
			}
		});
	});
	/*页码及页数的点击事件*/
	$(document).on('click','.page',function(){
		ajaxCreateShouKuan($(this));
	});
	$(document).on('click','#last',function(){
		if(pageNoThis!=1){
			pageNoThis = parseInt(pageNoThis,"10")-1;
			ajaxCreateShouKuan(pageNoThis);
		}
	});
	$(document).on('click','#next',function(){
		if(pageNoThis&&pageNoThis!=pageCountThis){
			pageNoThis = parseInt(pageNoThis,"10")+1;
			ajaxCreateShouKuan(pageNoThis);
		}
	});
	/*
	 * ******生成标签代码*******
	 */
	/*创建查询框*/
	function createQuery() {
		//设置模糊查询表单提交的action属性为""
		$("#li-query").html("");
		var queryHT = "";
		queryHT+="<div class='w340'>"
		queryHT+="<div class='input-group'>"			
		queryHT+="<label class='sr-only' for='param'></label>" +
					" <input type='text' name='param'  placeholder='付款人姓名/付款人昵称/相关数据'"
				+"style='width: 300px;' class='form-control' id='param' > ";
		queryHT+="<span class='input-group-btn'>";			
		queryHT+="<button type='submit' class='btn btn-primary query' style='height:34px;'>";				
		queryHT+="<span class='glyphicon glyphicon-search'></span>"
		queryHT+="</button></span></div></div>";
		$("#li-query").html(queryHT);
	}
	/*创建添加应收单按钮*/
	function createAddBtn(skState){
		$(".btn-group-block").remove();
		if(skState==0){			
			var addBtn = "";
			addBtn+="<div class='btn-group-block'>";
			addBtn+="<form role='search' class='form-inline'>";
			addBtn+="<div class='form-group mr20'>";
			addBtn+="<a href='/"+projectName+"/servlet/cw/addShouKuan'>";
			addBtn+="<button id='btnAddShouKuan' class='btn btn-default' type='button'>添加应收单 </button>";
			addBtn+=	"</a></div></form></div>";
			$("#panel ").prepend(addBtn);	
		}	
	}
	/*创建表头*/
	function  createThead(skState){
		$("table").find("thead").html("");
		var thead="";
		thead+="<tr>"
		thead+="<th><input type='checkbox' id='chkall' onclick='checkAll()'></th>"
		thead+="<th>付款人姓名</th>"
		thead+="<th>付款人昵称</th>"
		thead+="<th>应收金额</th>"
		thead+="<th class='select' title='收支类型' id='thtype'>"
		thead+="<div class='dropdown'>"
		thead+="<button class='btn dropdown-toggle fb'  data-toggle='dropdown' style='padding: 0; box-shadow: none; background: none' type='button'  id='dropdownMenu1' data-toggle='dropdown'>"
		thead+="<span class='title' id='spanType'>收支类型</span> ";
		thead+="<span class='caret'></span>"
		thead+="</button>"
		thead+="<ul class='dropdown-menu ' style='height: 260px;overflow: auto;position: absolute;' role='menu' aria-labelledby='dropdownMenu1' id='type_ul'>"
		thead+="</ul></div>"
		thead+="</th>"
		thead+="<th>相关单据</th>"
		thead+="<th>备注</th>"
		thead+="<th>创建人</th>"
		thead+="<th>创建时间</th>"
				
		if(skState==1||skState==2){
			thead+="<th>操作人</th>"
			thead+="<th>操作时间</th>"
		}
		thead+="<th>操作</th>"
		thead+="</tr>"
	    $("table").find("thead").html(thead);
	}
 	/*创建表格中的数据*/
 	function  createTbody(pageData,skState) {	
 		$(".table").find("tbody").html("");		
		var shouKuanData="";
		if(pageData){						
			$.each(pageData,function(index,element){	
				shouKuanData += "<tr>";
				shouKuanData += "<td><input type='checkbox' name='chks'></td>";
				shouKuanData += "<td>"+element.skPayerName+"</td>";
				shouKuanData += "<td>"+element.skPayerNickname+"</td>";
				shouKuanData += "<td>"+element.skPayables+"</td>";
				shouKuanData += "<td>"+element.shouzhilxType+"</td>";
				shouKuanData += "<td>"+element.skReceiptsCode+"</td>";
				shouKuanData += "<td>"+element.skBeiZhu+"</td>";
				shouKuanData += "<td>"+element.skCreator+"</td>";
				shouKuanData += "<td>"+element.skCreateDate+"</td>";
				if(skState==0){
					shouKuanData += "<td colspan=2>";
					shouKuanData += "<button  shoukuanid="+element.skId+" name=btnShouKuan type=button class='btn btn-default mr5' data-toggle='modal' data-target=#myModal"+element.skId+"1>";
					shouKuanData += "收款</button>";
					shouKuanData += "<button  shoukuanid="+element.skId+" name=btnHuaiZhang type=button class='btn btn-default mr5' data-toggle='modal' data-target=#myModal"+element.skId+"2>";
					shouKuanData += "坏账</button>";
				}else{
					shouKuanData += "<td>"+element.skOperatorId+"</td>";
					shouKuanData += "<td>"+element.skOperationDate+"</td>";
					shouKuanData += "<td colspan=2>";					
				}
				shouKuanData += "<a  shoukuanid = '"+element.skId+"' href='/"+projectName+"/servlet/cw/shouKuanXiangQing?skId="+element.skId+"'>详情</a>";
				shouKuanData += "</td>";
				shouKuanData += "</tr>";
			});
			$(".table").find("tbody").html(shouKuanData);					
		}
	}
 	//获取当前页，及总页数
 	var pageNoThis;
 	var pageCountThis;
	/*创建分页数字*/
 	function createPaginationNo(pageCount,pageNo) {		
		pageNo = parseInt(pageNo,"10");
		$("#pagingPages").html("");
		var paginationNo = "";
		paginationNo+="<ul class='pagination'>";
		paginationNo+="	<li id='last' class='fb fmsun'><a href='javascript:void(0);'>&lt;</a></li>";
		/* 计算显示的页码 */
		if(pageCount<=3){
			var begin = 1;
			var end = pageCount;
		}else{
			begin = pageNo - 1;
			end = pageNo + 1 ;
			if(begin<1){
				begin = 1;
				end = 3 ;	
			}
			if(end > pageCount){
				begin = pageCount - 2;
				end = pageCount ;	
			}
		}
		if(pageNo > 3){
			paginationNo+="	<li class=' '><a href='javascript:void(0);'>...</a></li>";
		}
		for(var i = begin ; i <= end ; i++){
			if(i==pageNo){
				paginationNo+="	<li class='page active' page = '"+i+"'><a href='javascript:void(0);'>"+i+"</a></li>";
			}else{
				paginationNo+="	<li class='page ' page = '"+i+"'><a href='javascript:void(0);'>"+i+"</a></li>";
			}
		}
		if(end < pageCount){
			paginationNo+="	<li class=' '><a href='javascript:void(0);'>...</a></li>";
		}
		paginationNo+="	<li id='next' class='fb fmsun'><a href='javascript:void(0);'>&gt;</a></li>";
		paginationNo+="</ul>";
		$("#pagingPages").html(paginationNo);	
		//将回调函数中的值赋给全局变量
		pageCountThis = pageCount;
		pageNoThis = pageNo;
	} 
 	function checkAll(){
		var chkall=document.getElementById("chkall");
		var chks=document.getElementsByName("chks");
		for(var i=0;i<chks.length;i++){
			chks[i].checked=chkall.checked;
		}	
	}
});