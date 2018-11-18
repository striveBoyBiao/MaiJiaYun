<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="icon"
	href="${pageContext.request.contextPath}/Login/img/favicon.ico">
<link type="text/css"
	href="${pageContext.request.contextPath}/Login/css/bootstrap.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/Login/css/bootstrap_out.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/Login/css/signin.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/Login/css/global_out.css"
	rel="stylesheet">
<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>
</head>
<body onload="draw()">
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a href="${pageContext.request.contextPath}/RegisterServlet"
				type="button" class="navbar-toggle btn-primary register-link">注册</a>
			<a href="invitation.html" type="button"
				class="navbar-toggle btn-link" style="background: transparent;">邀请加入</a>
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/Login/html/login.html"><img
				src="${pageContext.request.contextPath}/Login/img/logo.png"
				width="90px" height="30px"></a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a
					href="${pageContext.request.contextPath}/Login/html/login.html">首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/Login/html/introduction.html">产品介绍</a></li>
				<li><a
					href="${pageContext.request.contextPath}/Login/html/about.html">关于我们</a></li>
			</ul>
			<div class="nav navbar-nav navbar-right">
				<a
					href="http://wpa.qq.com/msgrd?v=3&amp;uin=3238039043&amp;site=qq&amp;menu=yes"
					type="button" class="btn btn-link navbar-btn">QQ客服</a> <a
					href="invitation.html" type="button"
					class="btn btn-link navbar-btn">邀请加入</a> <a
					href="${pageContext.request.contextPath}/RegisterServlet"
					type="button" class="btn btn-primary navbar-btn register-link">注册</a>
			</div>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	</nav>
	<!---->
	<div class="register">
		<div class="jumbotron">
			<h1 class="text-center">找回密码</h1>
		</div>
	</div>
	<!---->
	<div class="container-fluid forget">
		<!--改密 选择-->
		<div class="" id="verifyContainer">
			<form class="form-register">
				<div class="f12 red green mb10 msg" style="text-align: center;"></div>

				<div class="form-group">
					<label>邮箱账号</label>
					<div class="has-feedback">
						<input name="identifier" type="text" class="form-control"
							placeholder="请输入邮箱账号"> <span
							class="glyphicon form-control-feedback"></span>
					</div>
				</div>

				<div class="form-group" id="inputSmsCodeDiv">
					<label>图片验证码</label> <label class="control-label pull-right"
						id="smsCodeTipsMsg"></label>
					<div class="input-group captchatupian">
						<input type="text" class="form-control" placeholder="请输入右侧字符"
							name="captcha" id="captcha" maxlength="7"> <span
							class="input-group-btn"> <canvas id="yanzhengma"
								width="100px" height="44px" onclick="draw()">点击刷新</canvas>
						</span>
					</div>
				</div>

				<div class="form-group">
					<label>邮箱验证码</label> <label class="control-label pull-right"
						id="emailCodeTipsMsg"></label>
					<div class="input-group captchaemail">
						<input type="text" class="form-control" placeholder="请输入邮箱验证码"
							name="verifyCode"> <span
							class="input-group-btn phonecode">
							<button class="btn btn-default btn-lg sendVerifyCode"
								type="button">获取验证码</button>
						</span>
					</div>
				</div>

				<button class="btn btn-lg btn-success btn-block submit"
					type="button">提交</button>

				<!-- Small modal -->
				<br />
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target=".bs-example-modal-sm" style="margin-left: 60px; background-color: #F7F7F7;">
					<a><span class="glyphicon glyphicon-phone"> 通过短信找回密码</span></a>
				</button>

				<div class="modal fade bs-example-modal-sm" tabindex="-1"
					role="dialog" aria-labelledby="mySmallModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="mySmallModalLabel" style="color: red;">提示：</h4>
							</div>
							<div class="modal-body">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;该版块正在升级中，如给您带来不便，敬请谅解！</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!--修改密码-->
	<form class="form-register" id="resetPswdContainer"
		style="display: none">
		<div class="col-sm-offset-2 f12 red mb10 msg"></div>
		<div class="form-group">
			<label>请输入新密码</label>
			<div class="has-feedback">
				<input name="newPwd" type="password" class="form-control"
					placeholder=""> <span
					class="glyphicon form-control-feedback"></span>
			</div>
		</div>
		<div class="form-group">
			<label>重复输入新密码</label>
			<div class="has-feedback">
				<input class="form-control" placeholder="" type="password"
					name="confirmNewPwd">
			</div>
		</div>
		<button class="btn btn-lg btn-success btn-block" type="button" id="ok">确定</button>
	</form>
	<!--修改密码 end-->

	<!--修改密码 成功-->
	<form class="form-register" id="resetSuccessContainer"
		style="display: none">
		<div class="form-register-heading f30 text-center red">密码修改成功!</div>
		<div class=" f14  mb10" style="text-align: center;" id="pcSuccessInfo">
			<span class="red f16" id="seconds" style="display:">5</span> 秒钟回到登录界面
			<a href="/login">立即登录</a>
		</div>
	</form>
	<!--修改密码 成功 end-->

	<!-- Bootstrap core JavaScript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${pageContext.request.contextPath}/Login/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/Login/js/bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/Login/js/jquery.cookie.js"></script>
	<script
		src="${pageContext.request.contextPath}/Login/js/yanzhengma.js"></script>
	<script type="text/javascript">
		$(function() {
			var params = {
				identifier : ''
			};
			var isChecked = false, isCaptcha = false, issend = false, isEmailCaptcha = false;
			$("input[name=identifier]").on('blur', function(e) {
				//邮箱
				checkIdentifier(e);
			});
			$("input[name=captcha]").on('blur', function(e) {
				//图片验证码
				checkCaptcha(e);
			});
			$("input[name=captcha]").on('focus', function(e) {
				//清除
				removeTitle(e);
			});
			$("button.sendVerifyCode").on("click", function(e) {
				//发送验证码
				sendVerifyCode(e);
			});
			$("button.submit").on("click", function(e) {
				//提交
				onClickSubmitIdentifier(e);
			});
			$("input[name=newPwd]").on('blur', function(e) {
				checkNewPwd(e);
			});
			$("input[name=confirmNewPwd]").on('blur', function(e) {
				checkConfirmNewPwd(e);
			});
			$("button#ok").on("click", function(e) {
				onClickOkBtn(e);
			});

			//邮箱账号验证
			var checkIdentifier = function(e) {

				/*如果e有值，并且e有stopPropagation这个属性，则调用e.stopPropagation()
				否则执行window.event.cancelBubble=true*/
				e && e.stopPropagation();
				var $input = $("input[name=identifier]"), $div = $input
						.closest("div.has-feedback");
				//输入的邮箱地址
				identifier = $input.val().trim();

				if (!identifier) {
					_error($input, "邮箱账号不能为空！");
					return isChecked;
				} else if (!identifier.match(/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/)) {
					_error($input, "邮箱账号格式不正确！", true);
					return isChecked;
				} else {
					$.ajax({
						url : '/MaiJiaYun/ForgetEmailCheckServlet',
						type : 'post',//提交的方式
						dataType : 'json',
						data : {
							identifier : identifier,
							method: "userCheck"
						},
						success : function(re) {
							var message = re.ret;
							if (message == "ok") {
								_success($input);
								params.identifier = identifier;
								isChecked = true;
								return isChecked;
							} else {
								_error($input, message);
								return isChecked;
							}
						}
					});
				}
			};

			//图片验证码
			function checkCaptcha(e) {
				e && e.stopPropagation();
				var ps = document.getElementById("yanzhengma").className;
				var $input = $("input[name=captcha]"), $div = $("div.captchatupian"), captcha = $input
						.val().trim();

				if (!captcha) {
					$("#smsCodeTipsMsg").addClass("red").html("请输入图中的验证码！");
					$div.addClass("has-error");
					return isCaptcha;
				} else if (captcha.trim() != ps.trim()) {
					$("#smsCodeTipsMsg").addClass("red").html("输入的验证码有误！");
					$div.addClass("has-error");
					return isCaptcha;
				}

				removeTitle();
				$div.addClass("has-success");
				isCaptcha = true;
				return isCaptcha;
			}

			//清除警告
			function removeTitle(e) {
				$("#smsCodeTipsMsg").html("");
				$(".captchatupian").removeClass("has-error");
			}

			function removeEmailTitle(e) {
				$("#emailCodeTipsMsg").html("");
				$(".captchaemail").removeClass("has-error");
			}

			//发送验证码
			function sendVerifyCode(e) {
				e && e.stopPropagation();
				var $btn = $(e.currentTarget), wait = 60;

				//验证邮箱账号
				checkIdentifier();
				// 验证图片验证
				checkCaptcha();

				if (isChecked && isCaptcha) {
					//设置按钮失效
					$btn.html("正在发送验证码...");
					$btn.attr("disabled", true);

					$.ajax({
						url : '/MaiJiaYun/ForgetEmailCheckServlet',
						type : 'post',//提交的方式
						dataType : 'json',
						data : {
							email : params.identifier,
							method:"sendEmail"
						},
						success : function(re) {
							var message = re.retu;
							if (message == "请检查邮箱是否正确! ") {
								$("div.msg:visible").addClass("red").html(
										message);
								return issend;
							} else {
								$("div.msg:visible").addClass("green").html(
										message);
								var intervalId = setInterval(function() {
									$btn.html((wait--) + "秒后失效重新发送");
									$("input[name=verifyCode]").on('blur',
											function(e) {
												//邮箱验证码
												checkEmailCaptcha(e);
											});
									$("input[name=verifyCode]").on('focus',
											function(e) {
												//邮箱验证码
												removeEmailTitle(e);
											});
									if (wait == 0) {
										clearInterval(intervalId);
										$btn.attr("disabled", false);
										$btn.html("免费获取验证码");
									}
								}, 1000);
								issend = true;
								return issend;
							}
						},
					});
				}
			}

			//邮箱验证码
			function checkEmailCaptcha(e) {
				e && e.stopPropagation();
				var $input = $("input[name=verifyCode]"), $div = $("div.captchaemail"), verifyCode = $input
						.val().trim();
				if (!verifyCode) {
					$("#emailCodeTipsMsg").addClass("red").html("请输入邮箱的验证码！");
					$div.addClass("has-error");
					return isEmailCaptcha;
				} else {
					$.ajax({
						url : '/MaiJiaYun/ForgetEmailCheckServlet',
						type : 'post',//提交的方式
						dataType : 'json',
						data : {
							emailcode : verifyCode,
							method:"emailCheck"
						},
						success : function(re) {
							var message = re.retu;
							if (message == "ok") {
								$("#emailCodeTipsMsg").removeClass("red").html(
										"");
								$div.removeClass("has-error");
								$div.addClass("has-success");
								isEmailCaptcha = true;
								return isEmailCaptcha;
							} else {
								$("#emailCodeTipsMsg").addClass("red").html(
										message);
								$div.addClass("has-error");
								return isEmailCaptcha;
							}
						},
					});
				}
			}

			function onClickSubmitIdentifier(e) {
				var $input = $("input[name=identifier]"), identifier = $(
						"input[name=identifier]:visible").val().trim(), verifyCode = $(
						"input[name=verifyCode]:visible").val().trim(), $verifyCode = $("input[name=verifyCode]:visible"), isValidIdentifier = false;
				if (!identifier) {
					_error($input, "邮箱账号不能为空！");
					return false;
				}
				if (!captcha) {
					$("#smsCodeTipsMsg").addClass("red").html("请输入图中的验证码！");
					$div = $("div.captchatupian");
					$div.addClass("has-error");
					return false;
				}
				if (isChecked && isCaptcha && isEmailCaptcha) {
					renderResetPassword();
					e.stopPropagation();
				}
			}

			//新密码页面
			function renderResetPassword() {
				$('#verifyContainer').hide();
				$('#resetPswdContainer').show();
			}

			function checkNewPwd(e) {
				var $input = $("input[name=newPwd]"), newPwd = $input.val();
				if (!newPwd) {
					_error($input, "密码不能为空!", true);
					return false;
				} else {
					if (newPwd.length < 6) {
						_error($input, "密码必须大于6位!", true);
						return false;
					}
					_success($input);
					return true;
				}
			}

			function checkConfirmNewPwd() {
				var $input = $("input[name=confirmNewPwd]"), newPwd = $(
						"input[name=newPwd]").val(), confirmNewPwd = $input
						.val();
				if (!checkNewPwd()) {
					return false;
				} else {
					if (!confirmNewPwd) {
						_error($input, "确认密码不能为空!", true);
						return false;
					} else {
						if (newPwd !== confirmNewPwd) {
							_error($input, "两次输入密码不一致！", true);
							return false;
						}
					}
				}
				_success($input);
				return true;
			}

			function onClickOkBtn(e) {
				if (checkNewPwd() && checkConfirmNewPwd()) {
					var newPwd = $("input[name=newPwd]").val(), confirmNewPwd = $(
							"input[name=confirmNewPwd]").val();
					$.ajax({
						type : 'POST',
						url : '/MaiJiaYun/ForgetEmailCheckServlet',
						data : {
							identifier : params.identifier,
							password : newPwd,
							method: "changPwd"
						},
						success : function() {
							renderResetPasswordSuccess();
						},
					});
				}
				e.stopPropagation();
			}

			function renderResetPasswordSuccess() {
				$('#resetSuccessContainer').show();
				$('#resetPswdContainer').hide();
				var seconds = 5;
				var intervalId = setInterval(
						function() {
							if (--seconds == 0) {
								clearInterval(intervalId);
								window.location.href = "${pageContext.request.contextPath}/login";
							} else {
								$("#seconds").text(seconds);
							}
						}, 1000);
			}

			function _error($input, msg, needFocus) {
				var $div = $input.closest("div.has-feedback"), $span = $div
						.find("span.glyphicon");
				$("div.msg:visible").addClass("red").html(msg);
				$div.removeClass("has-success").addClass("has-error");
				$span.removeClass("glyphicon-ok").addClass("glyphicon-remove");
				needFocus && $input.focus();
			}

			function _success($input) {
				var $div = $input.closest("div.has-feedback"), $span = $div
						.find("span.glyphicon");
				$("div.msg:visible").removeClass("red").html("");
				$div.removeClass("has-error").addClass("has-success");
				$span.removeClass("glyphicon-remove").addClass("glyphicon-ok");
			}

		});
	</script>
</body>
</html>