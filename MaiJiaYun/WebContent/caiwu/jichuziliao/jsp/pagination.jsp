<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="row" style="margin: 0; -moz-user-select: none;" onselectstart="return false;" id="paging">
				<div style="float: right;">
					<div style="margin-right: 10px; float: left;">
						<ul class="pagination">
							<li class="dropup">
								<div class="lh30 left">共</div>
								<div class="btn-group" style="margin: 0 5px;">
									<span class="lh30 left fb red" id="totalRecords"></span>
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
									<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
										<span id="currentPageSize">10</span> <span class="caret"></span>
									</button>
									<div class="lh30 left" style="margin-left: 5px;">个</div>
									<ul role="menu" class="dropdown-menu" id="pageSizes">
										<li><a href="javascript:getLiText(10);">10</a></li>
										<li><a href="javascript:getLiText(20);">20</a></li>
										<li><a href="javascript:getLiText(50);">50</a></li>
										<li><a href="javascript:getLiText(100);">100</a></li>
										<li><a href="javascript:getLiText(200);">200</a></li>
										<!-- <li><a href="javascript:void(0);">20</a></li>
                            <li><a href="javascript:void(0);">50</a></li> -->
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<div style="width: 350px; float: left;" id="pagingPages">
						<ul class="pagination">
							<li id="last" class="fb fmsun"><a href="javascript:void(0);">&lt;</a>
							</li>
							<li id="next" class="fb fmsun"><a href="javascript:void(0);">&gt;</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<script type="text/javascript">
		
				//根据页数添加按钮
				function addPageButton(){
					//移除重复分页按钮
					$("#last").nextUntil("#next").remove();
					var innerhtml = "";
					if(pageCount<=3){
						for(var i = 1;i<pageCount+1;i++){
							innerhtml+="<li onclick=\"pageTurn(this)\" class=\"page\" page="+i+"><a href=\"javascript:void(0);\">"+i+"</a></li>";
						}
						$("#last").after(innerhtml);
					}else{
						for(var i = 1;i<4;i++){
							innerhtml+="<li onclick=\"pageTurn(this)\" class=\"page\" page="+i+"><a href=\"javascript:void(0);\">"+i+"</a></li>";
						}
						innerhtml+="<li><a href=\"#;\">…</a></li>";
						$("#last").after(innerhtml);
					};
				
				};
				var pageSiz = null;
				var pageNo = 0;
				//分页下拉
					function getLiText(pageSize){
						$("#currentPageSize").text(pageSize);
						pageSiz = pageSize;
						init(1,pageSize);
					}
				//翻页
				function pageTurn(li){
					pageNo = parseInt($(li).attr("page"),"10");
					if(pageSiz==null){
						pageSiz=10;
					}
					init(pageNo,pageSiz);
					
				}
				//左右翻页
				$("#next").click(function(){
					
					if(pageNo==0){
						pageNo=1;
					}
					pageNo+=1;
					console.log("pageNo="+pageNo,"pageSiz="+pageSiz);
					init(pageNo,pageSiz);
				});
				$("#last").click(function(){
					
					if(pageNo<=1){
						pageNo=1;
					}else{
						pageNo-=1;
					}
					
					console.log("pageNo="+pageNo,"pageSiz="+pageSiz);
					init(pageNo,pageSiz);
				});
			</script>
</body>
</html>