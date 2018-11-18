<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="mjy.caiwu.fukuan.beans.FuKuanVo"%>
<%@page import="mjy.caiwu.fukuan.beans.PageInfo"%>
<!DOCTYPE html>
<html >
<head>
  <title>待财务审核</title>
  <script type="text/javascript" src="${pageContext.request.contextPath}/caiwu/fukuan/js/jquery.min.js"></script>
  
 
<script type="text/javascript">

//解析json
$(document).ready(function(){  
	  //获取页面数据 
		  $.ajax({
	  		url:"${pageContext.request.contextPath}/servlet/cw/Wait_checkServlet?method=waitCheckPage",
	  		type:"post",
	  		dataType:"json",
	  		success: function(data){
	  			queryPageSize(data[0].pageSize);
	  			var mh=document.getElementById("m").value;
	  			var resultHtml = ""; 	
	  			 if(data){
	  				
					 $.each(data[0].pageDate,function(index,element){
						 
						 if(index==0){
							changeCount(element.other4);
							queryCount(element.other6);
							pageInfo(data[0].pageNo,data[0].pageCount);
						 }
						
						resultHtml+="<tr>";
						resultHtml+="<th><input type='checkbox'></th>";
						resultHtml+="<td>"+ element.fkNo+"</td>";
						resultHtml+="<td>"+ element.fkSkName+"</td>";
						resultHtml+="<td>"+ element.fkNumber+"</td>";
						resultHtml+="<td>"+ element.fkShouldpayMoney+"</td>";
						resultHtml+="<td>"+ element.other1+"</td>";
						resultHtml+="<td>"+ element.fkCreaterTime+"</td>";
						resultHtml+="<td><button id="+index+" value="+ element.fkNo+" onclick=\"change("+index+")\""+"name='jizhang' modelid='2859' type='button' class='btn btn-default mr5'>记账</button>"+
									"<button onclick=\"change2("+index+")\""+" name='bohui'  modelid='2859' type='button' class='btn btn-default mr5'>驳回</button>"+
									"<a  href='${pageContext.request.contextPath}/servlet/cw/Wait_checkServlet?method=xiqing&fkNo="+element.fkNo+"&mohu="+mh+"'name='edit' modelid='2859'>详情</a>"
									+"</td>";
									
						resultHtml+="</tr>";
					});
				  
					
					 //如果数据为空 
					 if(!data[0].pageDate||data[0].pageDate==""){
						 if(data[0].queryCount!=null){
							 changeCount(data[0].queryCount); 
						 }
						 queryCount(0);
						 pageInfo(1,0);
					 }
					$("#result").html(resultHtml);
				}
			  
	  		} 		
	 });
	  
	  
	  //由键盘的回车键进行模糊搜索 
	  $("#m").keydown(function(event){
		  if(event.keyCode==13){
			  mohuSearch();
		  }
	  })
	  
	
  });	 	
	 	
	 	

  

  
/*模糊查询   */
function mohuSearch(){
	mh=document.getElementById("m").value;
	$.ajax({
		url:"${pageContext.request.contextPath}/servlet/cw/Wait_checkServlet",
		type:"post",
		data:{
			method:"waitCheckPage",
			mohu:mh,
		},
		datatype:"json",
		success:function(data){
			var resultHtml = ""; 	
	  		if(data){
	  		
	  			update2(resultHtml,data);
	  	
	  		}	
		}
	});
}    
 
  
  


	// 记账
function change(index) {
	par = document.getElementById(index).value;
	$.ajax({
			url : "${pageContext.request.contextPath}/servlet/cw/Wait_checkServlet",
			type : "post",
			data : {
				method:"waitCheckPage",
				param : par
			},
			datatype : "json",
			success : function(data) {
				var resultHtml = "";
				if (data) {
					update2(resultHtml, data);
				}
			}

	});
}
    
    
    
    

    // 驳回
function change2(index) {
	par2 = document.getElementById(index).value;
	$.ajax({
				url : "${pageContext.request.contextPath}//servlet/cw/Wait_checkServlet",
				type : "post",
				data : {
					method:"waitCheckPage",
					param2 : par2
				},
				datatype : "json",
				success : function(data) {
					var resultHtml = "";
					if (data) {
						
						update2(resultHtml, data);

					}
				}

			});

}
  
  
  
    /*获取json数据    */
	  function update2(resultHtml,data){
		  
		  var mh=document.getElementById("m").value;
		 
		  $.each(data[0].pageDate,function(index,element){
			
			  if(index==0){
				 
				    changeCount(element.other4);
					queryCount(element.other6);
					pageInfo(data[0].pageNo,data[0].pageCount);
				 }
				resultHtml+="<tr>";
				resultHtml+="<th><input type='checkbox'></th>";
				resultHtml+="<td>"+ element.fkNo+"</td>";
				resultHtml+="<td>"+ element.fkSkName+"</td>";
				resultHtml+="<td>"+ element.fkNumber+"</td>";
				resultHtml+="<td>"+ element.fkShouldpayMoney+"</td>";
				resultHtml+="<td>"+ element.other1+"</td>";
				resultHtml+="<td>"+ element.fkCreaterTime+"</td>";
				resultHtml+="<td><button id="+index+" value="+ element.fkNo+" onclick=\"change("+index+")\""+"name='jizhang' modelid='2859' type='button' class='btn btn-default mr5'>记账</button>"+
							"<button onclick=\"change2("+index+")\""+" name='bohui'  modelid='2859' type='button' class='btn btn-default mr5'>驳回</button>"+
							"<a  href='${pageContext.request.contextPath}/servlet/cw/Wait_checkServlet?method=xiqing&fkNo="+element.fkNo+"&mohu="+mh+"'name='edit' modelid='2859'>详情</a>"
							+"</td>";
							
				resultHtml+="</tr>";
			});
		   //如果数据为空 
			 if(!data[0].pageDate||data[0].pageDate==""){
				 if(data[0].queryCount!=null){
					 changeCount(data[0].queryCount); 
				 }
				 queryCount(0);
				 pageInfo(1,0);
			 }
			$("#result").html(resultHtml);
	
	  }
 
  
    
  //显示页面数据量
   function changeCount(count){
	   $("#count").html("待财务审核("+count+")");
	  
   }
    
  //查询后的条数 
  function queryCount(num){
	  $("#totalRecords").html(num);
  }
  //刷新页面后设置大小
  function queryPageSize(pageSize){
	  $("#currentPageSize").html(pageSize);
  }
  
  
  
  
  
//上一页 
  function shangyiye(pageNo){
		
	  gongzong(pageNo);
}

	//下一页 
function xiayiye(pageNo){
	
	 gongzong(pageNo);
}
	
//中间数字 
function zhongjianye(pageNo){
	  gongzong(pageNo);
}    
  
  //公共代码 
 function gongzong(pageNo){
	 $.ajax({
			url:"${pageContext.request.contextPath}/servlet/cw/Wait_checkServlet",
			type:"post",
			data:{
				method:"waitCheckPage",
				pageNo:pageNo
				
			},
			datatype:"json",
			success:function(data){
				var resultHtml = ""; 	
	  			if(data){
	  				
	  				update2(resultHtml,data);
	 			}	
			}
	});
 }
  
  
  
  
  
  
  
  //每页大小 
    $(function(){
    	$(".choose").click(function(){
    		var pageSize=$(this).html();
    		$("#currentPageSize").html(pageSize);
    		$.ajax({
    			url:"${pageContext.request.contextPath}/servlet/cw/Wait_checkServlet",
    			type:"post",
    			data:{
    				method:"waitCheckPage",
    				pageSize:pageSize
    			},
    			datatype:"json",
    			success:function(data){
    				var resultHtml = ""; 	
    	  			if(data){
    	  				
    	  				update2(resultHtml,data);  	  	
    	  			}	
    			} 			
    		});
    	})
    })

   //动态创建 分页 
   function pageInfo(pageNo,pageCount){
	   pageNo = parseInt(pageNo,"10");
 		var result="";
 		result+="<nav>";
 		result+="<ul class='pagination'>";
 		if(pageNo==1){
 			result+="<li class='disabled'><a href='#'>&laquo;</a></li>";
 		}else{
 			result+="<li><a href='#' onclick=\"shangyiye("+(pageNo-1)+")\""+" ><<</a></li>";
 		}
 		var begin=0;
 		var end=0;
 		if(pageCount<=5){
 			begin=1;
 			end=pageCount;
 		}else{
 			begin=pageNo-2;
 			end=pageNo+3;
 			if(begin<1){
 				begin=1;
 	 			end=5;
 			}
 			if(end>pageCount){
 				begin=pageCount-4;
 	 			end=pageCount;
 			}
 			
 		}
 		
 			
		//<!--显示中间页数  -->
 		for(var i=begin;i<=end;i++){
 			if(i==pageNo){
 				result+="<li class='active'><a href='#' onclick=\"zhongjianye("+i+")\""+" >"+i+"</a></li>";
 		}else{
 				result+="<li><a href='#' onclick=\"zhongjianye("+i+")\""+" >"+i+"</a></li>";
 			}
 		}
 			
 		
		if(end< pageCount){
 			result+="<li><a href='#'>....</a></li>";
 		}
 		//<!--禁止  -->
 		if(pageNo==pageCount){
 			result+="<li class='disabled'><a href='#'>&raquo;</a></li>";
 		}
 		//<!--下一页  -->
		if(pageNo!=pageCount){
			result+="<li><a href='#' onclick=\"xiayiye("+(pageNo+1)+")\""+">>></a></li>";
		}

		result+="</ul></nav>";
		$("#footer").html(result);
 			
 	 
      }
  
  









</script>
	

  
 
</head>
<body style="padding-right: 0px;" class=""><!--代码开始-->
	<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
	
  <div class="content" id="content"> 
         <div class="collapse navbar-collapse navbar-default navbar-titletab" style="padding:0px 0 0 0;">
           <div class="navbar-header">
             <a href="#" class="navbar-brand ml20">付款单</a>
           </div>
             <ul class="nav nav-tabs f14 fb">
                 <li id="li-auditwaitcaiwu" val="待财务审核" class="ml20 tab active"><a  id="count" class="c6" href="${pageContext.request.contextPath }/servlet/cw/Wait_checkServlet?method=zhujiemian">待财务审核 <span></span></a></li>
                <li id="li-yingfu" val="应付款" class="tab"><a class="c6" href="${pageContext.request.contextPath }/servlet/cw/fukuan/ShouldPayServlet?method=showAllData">应付款</a></li>
                <li id="li-yifu" val="已付款" class="tab"><a class="c6" href="${pageContext.request.contextPath }/servlet/cw/fukuan/PayedServlet?method=ShowAllData">已付款</a></li>
                <li id="li-fukuanhuaizhang" val="坏账" class="tab"><a class="" href="${pageContext.request.contextPath }/servlet/cw/fukuan/bad_pay?method=showAllData">坏账</a></li>
                <li class="pull-right mr10" id="li-query" style="padding-top: 12px;">
                    <div class="w340">
                        <div class="input-group">
                        <input id="m" name="q" placeholder="收款人姓名/收款人昵称/相关单据" style="width:300px;" class="form-control" type="text">
                        <span class="input-group-btn">
                        <button onclick="mohuSearch()" type="button" class="btn btn-primary query"><span class="glyphicon glyphicon-search"></span></button>
                        </span>
                        </div>
                    </div>
                  </li>
             </ul>
         </div>
<!--titletab end-->
<!-- 中间表格 -->
		<div class="prl10auto" id="panel">
			<div id="WaitingModel" style="display: none"></div>
			<div class="panel mt15">
				<!--table star-->
				<div class="panel">
					<!-- Table -->
					<table class="table table-striped table-hover" id="tableList">
						<thead class=" table-bordered">
							<tr>
								<th><input type="checkbox"></th>
								<th>采购编号</th>
								<th>供应商</th>
								<th>采购数量</th>
								<th>合计金额</th>
								<th>创建人</th>
								<th>创建时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="result">
						</tbody>
					</table>
					<!--table end-->
					
					
				<div style="float: right;">
					<div style="margin-right: 10px; float: left;">
						<ul class="pagination">
							<li class="dropup">
								<div class="lh30 left">共</div>
								<div class="btn-group" style="margin: 0 5px;">
									<span class="lh30 left fb red" id="totalRecords">${count }</span>
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
										class="btn btn-default dropdown-toggle" type="button" >
										<c:if test="${pageSize==null }">
											<span id="currentPageSize">10</span> 
										</c:if>
										
										<span class="caret"></span>
									</button>
									<div class="lh30 left" style="margin-left: 5px;">个</div>
									
									<ul role="menu" class="dropdown-menu" id="pageSizes">
										<c:set var="pageSize" value="0"></c:set>
										<li><a href="javascript:void(0);" class="choose"  >10</a></li>
										<c:set var="pageSize" value="1"></c:set>
										<li><a href="javascript:void(0);" class="choose"  >20</a></li>
										<c:set var="pageSize" value="2"></c:set>
										<li><a href="javascript:void(0);" class="choose"  >50</a></li>
										<c:set var="pageSize" value="3"></c:set>
										<li><a href="javascript:void(0);" class="choose"  >100</a></li>
										<c:set var="pageSize" value="4"></c:set>
										<li><a href="javascript:void(0);" class="choose"  >200</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
					
					
					<div style="width: 450px; float: left;" id="footer"></div>
					
					
					
					
					
				</div>
			</div>
		</div>
	</div>
	
	
	
	
				
					
					
	
	
	
	
	
	
	
<!--代码结束--></body></html>