
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	
</head>
<body>
	<!--代码开始-->
	<div class="container" id="container">
		<!-- 加载头部页面 -->
		<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
		<div class="content" id="content">
			<!--titletab star-->
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0;">
				<div class="navbar-header">
					<a href="javascript:void(0)" class="navbar-brand ml20">收款单</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<li id="li-shoukuan" class="ml20 tab "><a data-toggle="tab"
						href="${pageContext.request.contextPath}/servlet/cw/shouKuan"
						class="c6">应收款</a></li>
					<li id="li-yishou" class="tab active"><a data-toggle="tab"
						href="${pageContext.request.contextPath}/servlet/cw/yiShou"
						class="">已收款</a></li>
					<li id="li-shoukuanhuaizhang" class="tab"><a data-toggle="tab"
						href="${pageContext.request.contextPath}/servlet/cw/shouKuanHuaiZhang"
						class="c6">坏账</a></li>
					<li class="pull-right mr10" id="li-query"
						style="padding-top: 12px;">
						<form   calss="form-inline" action="/MaiJiaYun/servlet/cw/yiShou" role="form" method="post">
						<div class="w340">
						
							<div class="input-group">
							
						
							<label class="sr-only" for="param"></label> <input type="text" name="param" placeholder="付款人姓名/ 昵称/ 相关数据"
									style="width: 300px;" class="form-control" id="param" > <span
									class="input-group-btn">
									
									<button type="submit" class="btn btn-primary query"
										style="height:34px;">
										
										<span class="glyphicon glyphicon-search"></span>
				
									</button>
								</span>
								
							</div>
							
						</div>
						</form>
					</li>
				</ul>
				<!--search end-->
			</div>
			<!--titletab end-->
          <div class="prl10auto" id="panel">
				<!--table star-->
				<div class="panel">
					<!-- Table -->
					<table class="table table-striped table-hover">
						<thead class=" table-bordered">
							<tr>
								<th><input type="checkbox" id="chkall" onclick="checkAll()" ></th>
								<th>付款人姓名</th>
								<th>付款人昵称</th>
								<th>应收金额</th>
								<th class="select" title="收支类型" id="thtype">
									<div class="dropdown">
										<button class="btn dropdown-toggle fb"
											style="padding: 0; box-shadow: none; background: none"
											type="button" id="dropdownMenu1" data-toggle="dropdown">
											<span class="title" id="spanType">收支类型</span> <span
												class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu"
											aria-labelledby="dropdownMenu1" id="type_ul">
											
										</ul>
									</div>
								</th>
								<th>相关单据</th>
								<th>备注</th>
								<th>创建人</th>
								<th>创建时间</th>
								<th>操作人</th>
								<th>操作时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
                           <c:if test="${pageInfo.pageDate!=null && fn:length(pageInfo.pageDate)>0 }">
							 <c:forEach var ="cwShouKuanVO" items="${pageInfo.pageDate}">
							<tr>
								<td><input type="checkbox" name="chks"></td>
								<td>${cwShouKuanVO.skPayerName}</td>
								<td>${cwShouKuanVO.skPayerNickname}</td>
								<td>${cwShouKuanVO.skReceivable}</td>
								<td>${cwShouKuanVO.shouzhilxType}</td>
								<td>${cwShouKuanVO.skReceiptsCode}</td>
								<td>${cwShouKuanVO.skBeiZhu}</td>
								<td>${cwShouKuanVO.skCreator}</td>
								<td>${cwShouKuanVO.skCreateDate}</td>
								<td>${cwShouKuanVO.skOperatorId}</td>
								<td>${cwShouKuanVO.skOperationDate}</td>
								<td colspan="2"><a
								    href="${pageContext.request.contextPath}/servlet/cw/shouKuanXiangQing?skId=${cwShouKuanVO.skId}"
									name="edit_yishou">详情</a></td>
									</tr>
							</c:forEach>
				         </c:if>
						</tbody>
						
						
					</table>
					<!--table end-->
					 <!--分页 star-->
					<jsp:include page="pagination.jsp">
					  <jsp:param value="${pageContext.request.contextPath}/servlet/cw/yiShou" name="url"/>
					</jsp:include>
					<!--分页 end-->
				</div>
			</div>
			
		</div>
	</div>
		<!-- <script src="/MaiJiaYun/shoukuan/js/jquery-1.7.min.js"></script> -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/caiwu/shoukuan/js_/createshoukuan.js"></script>
</body>
</html>
