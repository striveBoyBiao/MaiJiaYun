<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="../img/favicon.ico"   type="image/x-icon">
<script src="${pageContext.request.contextPath}/Common/js/jquery.min.js" 	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Common/js/bootstrap.min.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Common/css/global.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Common/css/iconfont.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Common/css/bootstrap.css">


</head>
<body>
		<jsp:include page="navigation.jsp">
			<jsp:param
				value="${pageContext.request.contextPath }/Common/jsp/navigation.jsp"
				name="url" />
		</jsp:include>
	
</body>
</html>