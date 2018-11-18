<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">

<head>

<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/CaiGou/css/them.css">
<jsp:include page="/CaiGou/jsp/cgthd/caigoutuihuoJS.jsp"></jsp:include>

</head>

<body class="" style="padding-right: 0px;" onload="init()">

	<!--代码开始-->
	<div class="container" id="container">
		<!--header 开始-->
		<%-- <jsp:include page="/Common/jsp/navigation.jsp"></jsp:include> --%>
		<!--header 结束-->
		<div class="content" id="content">
			<!--titletab star-->
			<div class="collapse navbar-collapse navbar-default navbar-titletab"
				style="padding: 0px 0 0 0;">
				<div class="navbar-header">
					<a href="#" class="navbar-brand ml20">采购退货单</a>
				</div>
				<ul class="nav nav-tabs f14 fb">
					<li id="li-caigouwaitauditwait" class="ml20 tab active"><a
						href="javascript:void(0)" onclick="queryWaitAudit()" class="">待审核<span
							id="waitAudit"> </span></a></li>
					<li id="li-caigouaudit" class="ml20 tab"><a
						href="javascript:void(0);" onclick="queryComplete()" class="c6">已审核</a></li>
				</ul>
			</div>
			<!--titletab end-->
			<!--panel star-->
			<div class="prl10auto" id="panel"></div>
			<!--panel end-->

			<!--分页 star-->
			<jsp:include page="/CaiGou/jsp/gys/pagination.jsp"></jsp:include>
			<!--分页 end-->
		</div>
	</div>
	<!--代码结束-->
</body>

</html>