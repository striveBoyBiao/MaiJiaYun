<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>

<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>
<script src="${pageContext.request.contextPath}/Common/js/jquery.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/Common/js/bootstrap.min.js"
	type="text/javascript"></script>

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/Common/img/favicon.ico"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/Common/css/global.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/Common/css/iconfont.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/Common/css/bootstrap.css">


<script type="text/javascript">
	//加载所有的职位动态生成岗位
	function lload(){
		var params = {
			method:"loadpost"
		};
		 $.ajax({
	            url: '/MaiJiaYun/servlet/LoginActionServlet',
	            type: 'post',//提交的方式
	            dataType:'json',
	            data: params,
	            success: function(re) {
            		var htmlli="";
					$.each(re,function(index,element){
						htmlli +="<li class=\"userFunction\" id=\""+element.postId+"\" value=\""+element.postId+"\" onclick=\"qxxz("+element.postId+")\">";
						htmlli +="<a href=\"javascript:void(0);\">";
						htmlli +="<span class=\"text\"> <span class=\"iconfont icon-check\" style=\"font-size:14px\"> </span>";
						htmlli +=element.postName;
						htmlli +="</span></a></li>";
					});
					$("#manageContactUserFunctionList").html(htmlli);
	          	}
		 });
	}

	//取消或者新加权限显示
	function qxxz(postId){
		var li = document.getElementById(postId);
		if(li.className == "userFunction"){
			li.className = "active"
		}else{
			li.className = "userFunction"
		}
	}

	//动态加载同事
	var htmltext="";
	var myArray=new Array();
	function ts(){
		var params = {
			method:"ts"
		};
		 $.ajax({
	            url: '/MaiJiaYun/servlet/LoginActionServlet',
	            type: 'post',//提交的方式
	            dataType:'json',
	            data: params,
	            success: function(re) {
	            	if(re.nu=="nu"){
	            		$("#asdul").html("<li style='margin-top: 0px;' class='media themebgcolor2'><div style='height: 315px;' class='row p15 tc f14 lh30 c9'><div class='row'>还没有同事,<br> 快邀请他们一起工作吧</div><button data-toggle='modal' data-target='#inviteContactModal' data-dismiss='modal' data-tab='tongshi' type='button' class='btn btn-default mt20 inviteColleague'>+邀请同事</button></div></li>");
	            	}else{
	            		htmltext="";
						$.each(re,function(index,element){
							myArray[index*4]=element.userId;
							myArray[index*4+1]=element.userName;
							myArray[index*4+2]=element.userPhoneNumber;
							myArray[index*4+3]=element.userEmail;
							htmltext += "<li class='media themebgcolor2' style='margin-top: 0px;' id='"+element.userId+"'>";
							htmltext += "<div class='row'>";
							htmltext += "<a class='block w210 pull-left' href='#' data-toggle='modal' data-target='#chatMessageModal' data-dismiss='modal' style='border-bottom: 0'>";
							htmltext += "<div class='s-avatar pull-left mr10'>";
							htmltext += "<img src=\""+element.userImgPath+"\" class='media-object' height='45' width='45'> <span class='s-round-mask'></span>";
							htmltext += "</div>";
							htmltext += "<div class='media-body pt5'>";
							htmltext += "<div class='media-heading'>";
							htmltext += "<div class='c0'>";
							htmltext += element.userNickname+"<span id='"+element.userId+"' class='badge ml10' style='font-size: 10px; display: none'>0</span>";
							htmltext += "</div>";
							htmltext += "<div class='c9'></div>";
							htmltext += "</div>";
							htmltext += "</div></a> ";
							if(document.getElementById("chatContactBottomButtons").children.length>1){
								htmltext += "<span class='pull-right platebtn'> <a data-toggle='modal' data-target=''#manageContactModal' data-dismiss='modal' href='#' class='del' onclick=\"xiugai("+index+")\"> <span class='f14 glyphicon glyphicon-cog' style='top: 2px'></span>";
								htmltext += "</a> <a href='#' class='del mr10' name='deleteTongshi'> <span class='iconfont icon-close fb' style='font-size: 16px;''></span>";
								htmltext += "</a>";
								htmltext += "</span>";
							}
							htmltext += "</div>";
							htmltext += "</li>";
						});
						$("#asdul").html(htmltext);
	            	}
				}
		 });
	}
	
	//获取该同事的权限并初始化标记出来
	function xiugai(index){
		$("#manageContactUserNameInput").attr('placeholder',myArray[index*4+1]);
		$("#manageContactUserPhoneInput").attr('placeholder',myArray[index*4+2]);
		$("#manageContactUserEmailInput").attr('placeholder',myArray[index*4+3]);
		$("#xiugaiOK").attr('value',myArray[index*4]);
		var params = {
				userid:myArray[index*4],
				method:"getpost"
			};
			 $.ajax({
		            url: '/MaiJiaYun/servlet/LoginActionServlet',
		            type: 'post',//提交的方式
		            dataType:'json',
		            data: params,
		            success: function(re) {
						$.each(re,function(index,element){
							document.getElementById(element.postId).className = "active";
						});
		            }
			 });
		document.getElementById("shez").click();
	}
	//修改按钮提交
	function OK() {
		var da="";
		for(i=0;i<$("ul#manageContactUserFunctionList .active").length;i++){
			da += $("ul#manageContactUserFunctionList .active")[i].getAttribute("value")+"  ";
		}
		var params = {
				userid:$("#xiugaiOK").val(),
				post:da,
				method:"savepost"
			};
		 $.ajax({
	            url: '/MaiJiaYun/servlet/LoginActionServlet',
	            type: 'post',//提交的方式
	            dataType:'json',
	            data: params,
	            success: function(re) {
					
	            }
		 });
		document.getElementById("guanbi").click();
	}
</script>
</head>


<!--heard开始 -->
<div class="navbar-fixed-top">

	<div id="topad" class="all"></div>

	<div class="navbar navbar-inverse" role="navigation" id="header">
		<div class="navbar-header">
			<a class="navbar-brand" href="javascript:void(0);"><img
				src="${pageContext.request.contextPath}/Common/img/logo.png"
				width="120" height="33" alt="logo"></a>
		</div>

		<div class="navbar-collapse collapse" style="padding-right: 15px;">
			<ul class="nav navbar-nav f18" id="headerMenu">
				<li><span class="pos1"></span><a
					href="${pageContext.request.contextPath}/servlet/gzt"
					data-target="gzt">工作台</a></li>

				<c:forEach var="postVO" items="${userPostVOs}">
					<c:if test="${postVO.postName=='供应商'||postVO.postName=='分销商'}">
						<li functionid="20" functionname="供销" functionuri="fxs">
							<!--<button class="btn btn-linknav dropdown-toggle btn-lgest" type="button" data-toggle="dropdown">供销 <b class="caret"></b></button>-->
							<a class="dropdown-toggle" data-toggle="dropdown"
							href="javascript:void(0);">供销 <b class="caret"></b></a>
							<div class="dropdown-menu row" role="menu" style="width: 160px;">
								<div class="col-md-12 meaulist">
									<ul class="submenu">
										<c:forEach var="limiVO" items="${postVO.limits}">
											<li><a href="" class="c0"> <span
													class="iconfont ${limiVO.limitIcon}"
													style="font-size: 14px;"></span> ${limiVO.limitName}
											</a></li>
										</c:forEach>
									</ul>
								</div>
								<div class="row" style="height: 12px;"></div>
							</div>
						</li>
						<li><span class="pos1"></span><a href="javascript:void(0);"
							data-target="delegation/delegationSchedule">一对一服务</a></li>
					</c:if>
				</c:forEach>


				<li>
					<!--<button class="btn btn-linknav dropdown-toggle btn-lgest" type="button" data-toggle="dropdown">ERP <b class="caret"></b></button>-->
					<a class="dropdown-toggle" data-toggle="dropdown"
					href="javascript:void(0);">ERP <b class="caret"></b></a> <c:choose>
						<c:when test="${userInfoVO.userType=='boss' }">
							<c:set var="postNum" value="${fn:length(userPostVOs)-1}" />
							<c:set var="left" value="-286" />
						</c:when>
						<c:otherwise>
							<c:set var="postNum" value="${fn:length(userPostVOs)}" />
							<c:set var="left" value="0" />
						</c:otherwise>
					</c:choose>

					<div class="dropdown-menu row" row="menu"
						style="width:${postNum*136}px; left: ${left}px;">
						<c:forEach var="erpPostVO" items="${userPostVOs}">
							<c:if
								test="${erpPostVO.postName!='供应商'&& erpPostVO.postName!='分销商'}">
								<div class="col-md-2 meaulist"
									style="padding-right: 0; width: 130px;">
									<ul class="submenu">
										<li>
											<div class="c9 f14 lh30 fb">${erpPostVO.postName}</div>
										</li>

										<c:forEach var="limitVO" items="${erpPostVO.limits}">
											<c:if test="${limitVO.defaulted||limitVO.selected}">
												<li><a
													href="${pageContext.request.contextPath}${limitVO.limitUrl}"
													class="c0" data-target="gly/dianpu"> <span
														class="iconfont ${limitVO.limitIcon}"
														style="font-size: 14px;"></span> ${limitVO.limitName}
												</a></li>
											</c:if>
										</c:forEach>

									</ul>
								</div>
							</c:if>

						</c:forEach>
						<div class="row" style="height: 12px;"></div>
					</div>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right f18">
				<li><a id="showChatBtn" href="" data-toggle="modal"
					data-target="#chatContactModal" data-init="true" onclick="lload()">
						<span style="font-size: 22px;" class="iconfont icon-duihua"></span>
						<span id="showChatCount" class="badge" style="display: none">0</span>
				</a></li>

				<li>
					<!--  li class="dropdown"--> <a id="showAlarmBtn" href=""
					class="dropdown-toggle" data-toggle="dropdown"> <span
						class="glyphicon glyphicon-bell"></span> <!-- <span id="showAlarmCount" class="badge" style="">1</span> -->
				</a> <!-- 通知信息显示 
					 <div style="width: 270px;" role="menu" class="dropdown-menu row">
						<ul id="alarmShowUl"
							style="margin-bottom: 0px; max-height: 295px; margin-top: 0px;"
							class="media-list m-userinfo scrollspy-example">
							<li name="alarmRow" style="margin-top: 0px;"
								class="media themebgcolor2" userfeedid="174462"
								targeturi="ALARM_10043"><a href="javascript: void(0);"
								name="alarmToTargetBtn" class="block">
									<div class="s-avatar pull-left mr10">
										
										<img width="45" height="45" class="media-object"
											src="${pageContext.request.contextPath}/Common/img/usermaster.jpg">
										<span class="s-round-mask"></span>
									</div>
									<div class="media-body pt5">
										<div class="media-heading">供应商"新世界手机"同意了贵公司的分销合作</div>
									</div>
							</a>
							</li>
						</ul>
					</div-->
				</li>
				<li class="dropdown"><a href="http://maijiayun.cn/#"
					class="dropdown-toggle" data-toggle="dropdown"> <!-- <span class="glyphicon glyphicon-user" id="userSpan"> 管理员</span> <b class="caret"></b> -->
						<span class="glyphicon glyphicon-user"></span>
				</a>
					<div style="width: 140px;" role="menu" class="dropdown-menu row">
						<div class="col-md-12 meaulist">
							<ul class="submenu">
								<li><a style="cursor: pointer" data-toggle="modal"
									data-target="#edit_accountModal"> <span
										class="iconfont icon-laoban" style="font-size: 14px;"></span>
										个人信息
								</a></li>
								<li><a href="javascript:void(0);" id="logout"> <span
										class="iconfont icon-play" style="font-size: 14px;"></span> 退出
								</a> <script>
									$("#logout").click(function() {
														window.location.href = "/MaiJiaYun/servlet/LoginActionServlet?method=logout";
									})
								</script></li>
							</ul>
						</div>
						<div class="row" style="height: 12px;"></div>
					</div></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</div>
<!--header 结束-->

<!--编辑个人信息模态框开始-->
<div aria-hidden="true" aria-labelledby="edit_accountModalLabel"
	role="dialog" tabindex="-1" id="edit_accountModal" class="modal fade"
	style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">×</button>
				<h4 id="edit_accountModalLabel" class="modal-title">资料修改</h4>
			</div>
			<div class="modal-body">
				<!---->
				<!-- Nav tabs -->
				<ul class="nav nav-tabs fb" role="tablist">

					<li id="personalinfo-li" class="active"><a
						style="cursor: pointer;" data-target="#personalinfo" role="tab"
						data-toggle="tab">个人资料</a></li>
					<li><a style="cursor: pointer;" data-target="#passwordDiv"
						role="tab" data-toggle="tab">修改密码</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">

					<div class="tab-pane active" id="personalinfo">
						<div class="row">
							<div class="bs-callout" style="border: none">
								<!--star-->
								<form class="form-horizontal" role="form" id="userForm"
									enctype="multipart/form-data">
									<div class="form-group">
										<label for="" class="col-sm-3 control-label">昵称</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" name="nickName"
												id="name" value="${userInfoVO.userPO.userNickname}">
										</div>
									</div>
									<!---->
									<div class="divider"></div>
									<!---->
									<div class="form-group" style="margin-top: 20px;">
										<label class="col-sm-3 control-label" for="">上传头像</label>
										<div class="col-sm-6 control-label">
											<!-- Display filename inside the button instead of its label -->
											<input type="file" data-filename-placement="inside"
												name="picUrlUser" id="picUrlUser" title="update pic">
										</div>
									</div>
									<div class="form-group" id="userPicDiv"
										style="margin-bottom: 0px;">
										<label class="col-sm-3 control-label" for=""></label>
										<div class="col-sm-6">
											<div class="form-group" style="margin-bottom: 0px;">
												<div class="media m-userinfo">
													<a class="s-avatar_big pull-left" target="_blank" href="">
														<span class="s-edit-mask">上传头像</span> <img
														src="${userInfoVO.userPO.userImgPath}" id="userPic"
														width="80" height="80" class="media-object"> <span
														class="s-round-mask" id="uploadClick"></span>
													</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 上传图像 转圈层-->
									<div class="form-group ptb15" id="userLoadDiv"
										style="margin-bottom: 0px; display: none;">
										<label class="col-sm-3 control-label" for=""></label>
										<div class="col-sm-6">
											<div class="form-group" style="margin-bottom: 0px;">
												<div style="padding-left: 25px;">
													<a class="s-avatar_big pull-left" target="_blank" href="">
														<img
														src="${pageContext.request.contextPath}/Common/img/loading3.gif"
														width="30" height="30" class="media-object">


													</a>
												</div>
											</div>
										</div>
									</div>
									<!---->
									<div class="divider"></div>
									<!---->
									<div class="form-group" style="margin-top: 20px;">
										<label for="" class="col-sm-3 control-label">邮箱地址</label>
										<div class="col-sm-6">
											<input type="email" name="email" class="form-control"
												id="email" value="${userInfoVO.userPO.userEmail}">

										</div>
										<div class="col-sm-2 lh30">
											<a href=""></a>
										</div>
									</div>
									<!---->
									<div class="divider"></div>
									<!---->
									<div class="form-group" style="margin-top: 20px;">
										<label for="" class="col-sm-3 control-label">手机号码</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="phone"
												value="${userInfoVO.userPO.userPhoneNumber}" disabled="">


										</div>
										<div class="col-sm-3 lh30">
											<a href=""></a>
										</div>
									</div>

									<!---->
								</form>
								<!--end-->
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary" id="saveUser" type="button"
								data-dismiss="modal">确定</button>
							<!-- 提交表单更新个人资料 -->
							<script>
								//文件选择框内容改变时预览图片
								$("#picUrlUser")[0].onchange=function(){
									url = window.URL.createObjectURL(document.getElementById("picUrlUser").files.item(0)); 
									$("#userPic").attr("src",url);
									//图片加载完成之前使用过渡图片
									$("#userPicDiv").hide();
									$("#userLoadDiv").show();
									$("#userPic").load(function(){
										$("#userPicDiv").show();
										$("#userLoadDiv").hide();
									});
								};
							
							
								$("#saveUser").click(function(){
									var form = new FormData(document.getElementById("userForm"));
									$.ajax({
										url:"<%=request.getContextPath()%>/servlet/LoginActionServlet?method=saveUserInfo",
																type : "post",
																data : form,
																processData : false,
																contentType : false,
																success : function(
																		data) {

																},
																error : function(
																		e) {
																	alert("错误！！");
																}
															});

												});
							</script>




							<button data-dismiss="modal" class="btn btn-default"
								type="button">取消</button>
						</div>
					</div>
					<!---->
					<div class="tab-pane" id="passwordDiv">
						<div class="row" style="height: 300px;">
							<div class="bs-callout" style="border: none">
								<!--star-->
								<form class="form-horizontal" id="passwordForm" role="form">
									<!---->
									<div class="form-group" style="margin-top: 20px;">
										<label for="" class="col-sm-3 control-label">当前密码</label>
										<div class="col-sm-6">
											<input type="password" id="passwordOld" class="form-control">
											<span class="glyphicon"></span>
										</div>
										<div class="col-sm-3">
											<span class="red lh30"></span>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-3 control-label">新密码</label>
										<div class="col-sm-6">
											<input type="password" class="form-control" name="password"
												id="password" placeholder="">
										</div>
									</div>

									<div class="form-group" style="margin-bottom: 20px;">
										<label for="" class="col-sm-3 control-label">确认新密码</label>
										<div class="col-sm-6">
											<input type="password" name="passwordNew"
												class="form-control" id="passwordNew"> <span
												class="glyphicon"></span>
										</div>
									</div>
									<!---->

								</form>
								<!--end-->
							</div>

						</div>
						<div class="modal-footer">
							<button class="btn btn-primary" id="savePassword" type="button">确定</button>
							<button data-dismiss="modal" class="btn btn-default"
								type="button">取消</button>
						</div>
					</div>
					<!---->
				</div>

			</div>
			<!---->
		</div>
	</div>

	<div id="modal"></div>
</div>
<!--编辑个人信息模态框结束-->


<!-- 聊天模态框开始 -->
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
					<label class="btn btn-default chattab active" style="padding: 0px;">
						<a data-toggle="tab"
						href="http://maijiayun.cn/#chatContactHuihuaTab"> <input
							type="radio" name="options" id="option1" autocomplete="off"
							checked=""> 会话
					</a>
					</label> <label class="btn btn-default chattab" style="padding: 0px;"
						onclick="ts()"> <a data-toggle="tab"
						href="http://maijiayun.cn/#chatContactTongshiTab"> <input
							type="radio" name="options" id="option2" autocomplete="off"
							checked=""> 同事
					</a>
					</label>
					<c:if test="${userInfoVO.userType=='boss'}">
						<label class="btn btn-default chattab" style="padding: 0px;">
							<a data-toggle="tab"
							href="http://maijiayun.cn/#chatContactFenxiaoTab"> <input
								type="radio" name="options" id="option3" autocomplete="off"
								checked=""> 供应商

						</a>
						</label>
					</c:if>

				</div>
			</div>
			<!--2-->
			<div class="box-row">
				<div class="box-cell tab-content mt5" id="chatContactTabContent">
					<div class="box-inner tab-pane fade plate active in"
						id="chatContactHuihuaTab" role="tabpanel">
						<ul class="media-list m-userinfo scrollspy-example "
							style="margin-bottom: 0px; height: 100%; margin-top: 0px;">

							<!-- 最近聊天好友 -->
							<!--li class="media themebgcolor2" style="margin-top: 0px;"
								id="recent_chatid_3941"><a class="block"
								href="http://maijiayun.cn/#" data-toggle="modal"
								data-target="#chatMessageModal" data-dismiss="modal"
								data-tid="70235" data-uid="18038" style="border-bottom: 0">
									<div class="s-avatar pull-left mr10">
										<img width="45" height="45"
											src="${pageContext.request.contextPath}/Common/img/1479387540867u=827755154,1215765185&amp;fm=21&amp;gp=0.jpg"
											class="media-object"> <span class="s-round-mask"></span>
									</div>
									<div class="media-body pt5">
										<div class="media-heading">
											<div class="c0">汪老板</div>
											<div class="c9">新世界手机</div>
										</div>
									</div>
							</a></li-->

						</ul>
					</div>

					<div class="box-inner tab-pane fade plate "
						id="chatContactTongshiTab" role="tabpanel">
						<ul class="media-list m-userinfo scrollspy-example "
							style="margin-bottom: 0px; height: 100%; margin-top: 0px;"
							id="asdul">
						</ul>
					</div>

					<div class="box-inner tab-pane fade plate"
						id="chatContactFenxiaoTab" role="tabpanel">
						<ul class="media-list m-userinfo scrollspy-example "
							style="margin-bottom: 0px; height: 100%; margin-top: 0px;">

							<!-- 供应商 -->
							<!--  li class="media themebgcolor2" style="margin-top: 0px;"
								id="contact_tuId_7023518038"><a class="block"
								href="http://maijiayun.cn/#" data-toggle="modal"
								data-target="#chatMessageModal" data-dismiss="modal"
								data-tid="70235" data-uid="18038" style="border-bottom: 0">
									<div class="s-avatar pull-left mr10">
										<img width="45" height="45"
											src="${pageContext.request.contextPath}/Common/img/1479387540867u=827755154,1215765185&amp;fm=21&amp;gp=0.jpg"
											class="media-object"> <span class="s-round-mask"></span>
									</div>
									<div class="media-body pt5">
										<div class="media-heading">
											<div class="c0">
												汪老板 <span id="unreadMsgCnt_tuId_7023518038"
													class="badge ml10" style="font-size: 10px; display: none">0</span>
											</div>
											<div class="c9">新世界手机</div>
										</div>
									</div>
							</a></li-->

						</ul>
					</div>
				</div>
			</div>
			<!--3-->
			<div class="p-h-md bgf1">
				<div class="btn-group btn-group-justified btn-group-sm"
					role="tablist" data-toggle="buttons" id="chatContactBottomButtons">
					<c:if test="${userInfoVO.userType=='boss'}">
						<a data-toggle="modal" data-target="#inviteContactModal"
							data-dismiss="modal" role="button" class="btn btn-default"
							href="http://maijiayun.cn/#">+ 邀请</a>
					</c:if>
					<a data-toggle="modal" data-target="#chatGroupSendingModal"
						data-dismiss="modal" role="button" class="btn btn-default"
						href="http://maijiayun.cn/#">群发</a>
				</div>
			</div>
			<!--end-->
		</div>
	</div>
</div>
<!-- 聊天模态框结束 -->


<!-- 邀请模态框开始 -->
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
										<input type="text" id="userName" name="userName"
											class="form-control" placeholder="被邀请人的姓名(必填)"> <span
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
										<input type="text" id="userPhone" name="userPhone"
											class="form-control" placeholder="被邀请人的手机号(必填)"> <span
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
										<input type="text" id="userEmail" name="userEmail"
											class="form-control" placeholder="被邀请人的Email地址(必填)">
										<span class="glyphicon form-control-feedback"></span>
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
										<div class="col-md-12 selectblock" id="FPfunction">
											<ul>
												<c:forEach var="postVO" items="${userPostVOs}">
													<c:if
														test="${postVO.postName!='供应商'&&postVO.postName!='分销商'}">
														<li name="userFunctionSet" class="userFunction"
															userfunctionid="${postVO.postId}"><a
															href="javascript:void(0);"> <span class="text">
																	<span class="iconfont icon-check"
																	style="font-size: 14px"></span> ${postVO.postName}
															</span>
														</a></li>

													</c:if>
												</c:forEach>
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
										<input type="text" name="companyUserName" class="form-control"
											placeholder="被邀请的联系人姓名(必填)"> <span
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
											class="form-control" placeholder="被邀请人的Email地址(必填)">
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
				<button type="button" id="binvite" class="btn btn-primary invite">邀请</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- 邀请模态框结束 -->
<h id="aaa" class="${userInfoVO.userPO.userId}"></h>
<style type="text/css">
#aaa {
	visibility: hidden
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		//检测用户名是否正确和存在
		var checkUserName = false;//全局定义用户名检测的boolean值
		var checkUserPhone = false;//全局定义手机号检测的boolean值
		var checkUserEmail = false;//全局定义邮箱检测的boolean值
		var setUserFunction = false;//全局定义岗位是否设置成功
		$("#userName").change(function(e) {
			var uname = $("#userName").val().trim();
			$input = e&& $(e.currentTarget)|| $("input[name=userName]");
			$feedBackDiv = $input.closest("div.has-feedback");
			successFeedBackClass = "has-success";
			errorFeedBackClass = "has-error";
			$glyphiconSpan = $feedBackDiv.find("span.glyphicon.form-control-feedback");
			successGlyphiconClass = "glyphicon-ok";
			errorGlyphiconClass = "glyphicon-remove";
			$alertDiv = $("div[name=userName]");//所有含有name=userName属性的div

			if (uname != null && uname != "") {//用户名不为空
				$alertDiv.text("").hide();
				$glyphiconSpan.removeClass(errorGlyphiconClass).addClass(successGlyphiconClass);
				$feedBackDiv.removeClass(errorFeedBackClass).addClass(successFeedBackClass);
				checkUserName = true;
				//alert(checkUserName);
			} else {//用户名为空
				$alertDiv.text("您还没有填写同事姓名").show();
				$glyphiconSpan.removeClass(successGlyphiconClass).addClass(errorGlyphiconClass);
				$feedBackDiv.removeClass(successFeedBackClass).addClass(errorFeedBackClass);
				$input.focus();
				checkUserName = false;
				//alert(checkUserName);
			}
			//alert("用户名验证:"+checkUserName);
			return checkUserName;
	});
	//alert("用户名验证:"+checkUserName);
	//检测手机号是否正确与存在
	$("#userPhone").change(function(e) {
		var uphone = $("#userPhone").val().trim();
		$input = e&& $(e.currentTarget)|| $("input[name=userPhone]");
		$feedBackDiv = $input.closest("div.has-feedback");
		successFeedBackClass = "has-success";
		errorFeedBackClass = "has-error";
		$glyphiconSpan = $feedBackDiv.find("span.glyphicon.form-control-feedback");
		successGlyphiconClass = "glyphicon-ok";
		errorGlyphiconClass = "glyphicon-remove";
		$alertDiv = $("div[name=userPhone]");

			if (uphone != null && uphone != "") {//手机号不为空
				////检测手机号码格式不合适的
				if (!/^0?(13[0-9]|15[012356789]|17[0678]|18[0-9]|14[57])[0-9]{8}$/.test(uphone)) {
					$alertDiv.text("手机号码格式不正确").show();
					$glyphiconSpan.removeClass(successGlyphiconClass).addClass(errorGlyphiconClass);
					$feedBackDiv.removeClass(successFeedBackClass).addClass(errorFeedBackClass);
					vcheckUserPhone = false;
					$input.focus();
				} else {//格式正确，检测手机号码是否已存在于注册用户中
					//var result = false;	
					var pram = {
						phone : uphone,
						method : "checkPhone"
					};
					$.ajax({
						type : "post",
						url : "/MaiJiaYun/CheckInviteUser",
						data : pram,
						dataType : "json",
						success : function(data) {
							//alert(data.message);
							if (data.message == "true") {
								$alertDiv.text("已存在的手机号").show();
								$glyphiconSpan.removeClass(successGlyphiconClass).addClass(errorGlyphiconClass);
								$feedBackDiv.removeClass(successFeedBackClass).addClass(errorFeedBackClass);
								checkUserPhone = false;
								$input.focus();
								} else {
										$alertDiv.text("").hide();
										$glyphiconSpan.removeClass(errorGlyphiconClass).addClass(successGlyphiconClass);
										$feedBackDiv.removeClass(errorFeedBackClass).addClass(successFeedBackClass);
										checkUserPhone = true;
										//alert("手机号检测");
									}
								},
								error : function() {
									alert("error");
								}
							});
					//alert("手机验证:"+checkUserPhone);
				}

			} else {//手机号为空
				$alertDiv.text("手机号不能为空").show();
				$glyphiconSpan.removeClass(successGlyphiconClass).addClass(errorGlyphiconClass);
				$feedBackDiv.removeClass(successFeedBackClass).addClass(errorFeedBackClass);
				checkUserPhone = false;
				$input.focus();
			}
			//alert("手机验证:"+checkUserPhone);
			return checkUserPhone;
	});
	//检测邮箱是否正确
	$("#userEmail").change(function(e) {
		var uemail = $("#userEmail").val().trim();
		$input = e&& $(e.currentTarget)|| $("input[name=userEmail]");
		$feedBackDiv = $input.closest("div.has-feedback");
		successFeedBackClass = "has-success";
		errorFeedBackClass = "has-error";
		$glyphiconSpan = $feedBackDiv.find("span.glyphicon.form-control-feedback");
		successGlyphiconClass = "glyphicon-ok";
		errorGlyphiconClass = "glyphicon-remove";
		$alertDiv = $("div[name=userEmail]");
		if (uemail != null && uemail != "") {//邮箱不为空
			if (!/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/.test(uemail)) {//邮箱格式是否正确
			$alertDiv.text("Email格式不正确").show();
			$glyphiconSpan.removeClass(successGlyphiconClass).addClass(errorGlyphiconClass);
			$feedBackDiv.removeClass(successFeedBackClass).addClass(errorFeedBackClass);
			checkUserEmail = false;
			$input.focus();
		} else {
			var pram = {
				email : uemail,
				method : "checkEmail"
			};
			$.ajax({
				type : "post",
				url : "/MaiJiaYun/CheckInviteUser",
				data : pram,
				dataType : "json",
				success : function(data) {
					if (data.message == "true") {
						$alertDiv.text("已存在的邮箱").show();
						$glyphiconSpan.removeClass(successGlyphiconClass).addClass(errorGlyphiconClass);
						$feedBackDiv.removeClass(successFeedBackClass).addClass(errorFeedBackClass);
						checkUserEmail = false;
						$input.focus();
					} else {
							$alertDiv.text("").hide();
							$glyphiconSpan.removeClass(errorGlyphiconClass).addClass(successGlyphiconClass);
							$feedBackDiv.removeClass(errorFeedBackClass).addClass(successFeedBackClass);
							checkUserEmail = true;
							}
					}
				});
			}
		} else {//邮箱为空
				$alertDiv.text("邮箱不能为空").show();
				$glyphiconSpan.removeClass(successGlyphiconClass).addClass(errorGlyphiconClass);
				$feedBackDiv.removeClass(successFeedBackClass).addClass(errorFeedBackClass);
				checkUserEmail = false;
				$input.focus();
			}
				//alert("邮箱验证:"+checkUserEmail);
				return checkUserEmail;
			});

	$(".userFunction").click(function(e) { //设置岗位
		var userFunctions = $("div#FPfunction .active");//定义被选中岗位集合
		$userFunction = $(e.currentTarget);//当前目标
		userFunctionId = $userFunction.attr("userFunctionId");//返回userFunctionId属性
		userFunction = $("userFunctions.active");//被选中的岗位
	
		if ($userFunction.is(".userFunction")) {//如果岗位初始初始状态没有被选中
			$userFunction.removeClass("userFunction");
			$userFunction.addClass("active");//点击之后激活active类 
			return userFunction;

		} else if ($userFunction.is(".active")) {//如果岗位选中了
			$userFunction.removeClass("active");
			$userFunction.addClass("userFunction");
			return userFunction;
		}

		if (userFunctions.length == 0) {
			//alert("至少给您的同事分配一个岗位");
			setUserFunction = false;
		} else {
			setUserFunction = true;
		}
		//alert(setUserFunction);
		return setUserFunction;
	});

	$("#binvite").click(function() { //邀请同事   	
		if (checkUserName && checkUserPhone && checkUserEmail) {
			var userFunctions = $("div#FPfunction .active");//被选中的岗位
			var userCurrent = $("#aaa").attr("class");//获取当前用户
			var uemail = $("#userEmail").val().trim();
			var uphone = $("#userPhone").val().trim();
			var uname = $("#userName").val().trim();
			//alert(userFunctions.get(0));
			var str="";
			//获取被选中的岗位的
    		userFunctions.each(function(index,ele){
    			str+=$(this).attr("userFunctionId")+",";
    			//console.log($(this).attr("userFunctionId"));
    		});
    		 if (str.length > 0) {
    		        str = str.substr(0, str.length - 1);
    		  }
			console.log(str);
			
			//成功邀请后的小邀请框提示
			console.log(userCurrent);
			var leftWidth = (window.screen.width)/ 2 - 150 + "px";
			$("#inviteContactModal").modal("hide");
			$("#keepsuccessModal").css("left", leftWidth).show(200).fadeIn(200).delay(2000).fadeOut(300).hide(300);
			$("#showTempDiv").html("邀请成功");
			//发送邮箱验证码
			var pram = {
					post:str,//岗位
					userC : userCurrent,//当前用户
					email : uemail,
					phone : uphone,
					name : uname,
					method : "processInviteInfo"
			};
			$.ajax({
					type : "post",
					url : "/MaiJiaYun/InvitationController",
					data : pram,
					dataType : "json",
			});

		} else {
			alert("邀请失败");
		}
	});
})
</script>

<!-- 设置好友权限莫太狂 -->
<!-- 触发器 -->
<button class="btn btn-primary btn-lg" data-toggle="modal"
	data-target="#manageContactModal" id="shez"></button>
<div id="manageContactModal" class="modal fade " tabindex="-1"
	role="dialog" aria-labelledby="manageContactModalLabel"
	aria-hidden="true" style="display: none;">
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
									<input disabled="" id="manageContactUserPhoneInput" type="text"
										name="phone" class="form-control" value=""
										placeholder="请输入您同事的手机号码"> <span
										class="glyphicon form-control-feedback"></span>
								</div>
							</div>
						</div>
						<div class="col-md-4" style="padding-left: 0px;">
							<div class="form-group">
								<div name="phone" class="alert alert-danger p7 f12" role="alert"
									style="display: none;"></div>
							</div>
						</div>
						<!---->
						<div class="col-md-8">
							<label for="inputEmail3" class="col-sm-2 control-label c6">Email</label>
							<div class="form-group has-feedback">
								<div class="col-sm-10">
									<input disabled="" id="manageContactUserEmailInput" type="text"
										name="email" class="form-control" value=""
										placeholder="请输入您同事的Email"> <span
										class="glyphicon form-control-feedback"></span>
								</div>
							</div>
						</div>
						<div class="col-md-4" style="padding-left: 0px;">
							<div class="form-group">
								<div name="email" class="alert alert-danger p7 f12" role="alert"
									style="display: none;"></div>
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
										<ul id="manageContactUserFunctionList"></ul>
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
				<button type="button" class="btn btn-primary updatePackUser"
					value="" onclick="OK()" id="xiugaiOK">修改</button>
				<button type="button" class="btn btn-default" data-dismiss="modal"
					id="guanbi">关闭</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- 设置好友模态框结束 -->
>
