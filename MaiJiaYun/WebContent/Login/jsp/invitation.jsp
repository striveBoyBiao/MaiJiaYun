<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    
     <meta name="renderer" content="webkit">
    <meta name="keywords" content="供销平台,分销平台,分销,供销,货源,分销推荐,货源推荐,供销系统,分销系统,ERP,免费ERP,ERP软件,免费ERP软件,进销存,进销存软件,免费进销存软件">
    <meta name="description" content="禾唐卖家云独一无二的供销平台，开启供销双方合作的桥梁，无安装，免培训，极致用户体验 。包含寻找优质分销商，一键发布货源信息，一键代发、批发进货轻松接单！让您与分销商的订单业务无缝衔接，供销双方实时互动 ，沟通协作业务拓展不再是难事。">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="icon" href="http://maijiayun.cn/img/favicon.ico">
    <title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/Login/css/bootstrap-i.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/Login/css/signin-i.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/Login/css/global-i.css" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="${pageContext.request.contextPath}/Login/js/ie-emulation-modes-warning.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <!---->
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a type="button" class="navbar-toggle btn-primary" href="${pageContext.request.contextPath}/Login/html/register.html">注册</a>
                <button type="button" class="navbar-toggle btn-link" style="background: transparent;">邀请加入</button>
                <a class="navbar-brand" href="http://${pageContext.request.contextPath}/Login/html/invitation.jsp"><img src="${pageContext.request.contextPath}/Login/img/logo.png" width="90px" height="30px"></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/Login/html/login.html">首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/Login/html/introduction.html">产品介绍</a></li>
                    <li><a href="${pageContext.request.contextPath}/Login/html/about.html">关于我们</a></li>
                </ul>
                <div class="nav navbar-nav navbar-right">
                  <a href="${pageContext.request.contextPath}/Login/html/invitation.html" type="button" class="btn btn-link navbar-btn active">邀请加入</a>
                    <a href="${pageContext.request.contextPath}/Login/html/register.html" type="button" class="btn btn-primary navbar-btn register-link">注册</a>
                </div>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    <!---->
    <nav class="navbar navbar-inverse navbar-fixed-bottom bottommenu visible-xs-block" style="min-height:42px;">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <ul class="nav nav-pills nav-justified">
                    <li role="presentation"><a href="${pageContext.request.contextPath}/Login/html/login.html">首页</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/Login/html/introduction.html">产品介绍</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/Login/html/about.html">关于我们</a></li>
                </ul>
            </div>
        </div>
        <!-- /.container-fluid -->
    </nav>
    <!---->
    <div class="register">
        <div class="jumbotron">
            <h1 class="text-center">邀请加入</h1>
        </div>
    </div>
    <!---->
    <div class="container-fluid forget" style="margin-bottom:40px;">
        <!--邀请码-->
        <div class="form-register code-wrapper">
            <div class="form-group has-feedback">
                <label>邀请码</label>
                <label class="control-label pull-right alertMsgDiv invisible">验证码错误</label>
                <div class="input-group">
                    <input type="text" class="form-control" name="inviteCode" placeholder="请输入您手机或邮箱收到的邀请码">
                    <span class="input-group-btn phonecode">
                        <button class="btn btn-default btn-lg validInviteCode" type="button">验证</button>
                    </span>
                </div>
            </div>
        </div>
        <!--邀请码 end-->
        <!--企业邀请 填资料-->
        <div class="form-register companyRegister invisible">
            <div class="form-group">
                <label>邀请码</label>
                <div class="input-group">
                    <input type="text" class="form-control" name="inviteCode" placeholder="123456" disabled="">
                    <span class="input-group-btn phonecode">
                        <button class="btn btn-link btn-lg reInputInviteCode" type="button">重新输入</button>
                    </span>
                </div>
            </div>
            <div class="form-group">
                <label>手机号码/邮箱</label>
                <input class="form-control" name="mobileMail" type="text" disabled="">
            </div>
            <div class="form-group has-feedback">
                <label>企业名称</label>
                <label class="control-label pull-right invisible companyMsg">企业名称不能为空</label>
                <input class="form-control" name="companyName" placeholder="" type="text">
            </div>
            <div class="form-group has-feedback">
                <label>联系人</label>
                <label class="control-label pull-right invisible contactMsg">请输入联系人名称</label>
                <input class="form-control" name="contactName" placeholder="" type="text">
            </div>
            <div class="form-group has-feedback">
                <label>密码</label>
                <label class="control-label pull-right invisible passwordMsg">密码不能为空</label>
                <input class="form-control" name="password" placeholder="" type="password">
            </div>
            <div class="form-group has-feedback">
                <label>确认密码</label>
                <label class="control-label pull-right invisible rePasswordMsg">您两次密码输入的不同</label>
                <input class="form-control" name="rePassword" placeholder="" type="password">
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox" checked="true" value="check" name="isAgree"> 我已阅读并同意 <a href="http://maijiayun.cn/agreement.html">《卖家云注册协议》</a>
                </label>
            </div>
            <button type="submit" class="btn btn-lg btn-success btn-block acceptInvite">接受邀请</button>
        </div>
        <!--企业邀请 填资料 end-->
        <!--个人邀请 填资料-->
        <div class="form-register personalRegister invisible">
            <div class="form-group">
                <label>邀请码</label>
                <div class="input-group">
                    <input type="text" class="form-control" name="inviteCode" disabled="">
                    <span class="input-group-btn phonecode">
                        <button class="btn btn-link btn-lg reInputInviteCode" type="button">重新输入</button>
                    </span>
                </div>
            </div>
            <div class="form-group">
                <label>姓名</label>
                <input class="form-control" name="userName" type="text" disabled="">
            </div>
            <div class="form-group">
                <label>手机号码/邮箱</label>
                <input class="form-control" name="mobileMail" type="text" disabled="">
            </div>
            <div class="form-group has-feedback">
                <label>密码</label>
                <label class="control-label pull-right invisible passwordMsg">密码不能为空</label>
                <input class="form-control" name="password" placeholder="" type="password">
            </div>
            <div class="form-group has-feedback">
                <label>确认密码</label>
                <label class="control-label pull-right invisible rePasswordMsg">您两次密码输入的不同</label>
                <input class="form-control" name="rePassword" placeholder="" type="password">
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox" checked="true" value="check" name="isAgree"> 我已阅读并同意 <a href="http://maijiayun.cn/agreement.html">《卖家云注册协议》</a>
                </label>
            </div>
            <button type="submit" class="btn btn-lg btn-success btn-block acceptInvite">接受邀请</button>
        </div>
        <!--个人邀请 填资料 end-->
    </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/Login/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/Login/js/bootstrap.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="${pageContext.request.contextPath}/Login/js/ie10-viewport-bug-workaround.js"></script>
    <script type="text/javascript">
        $(function() {

            var typeflag, inviteCode, companyName, contactName;

            $('button.validInviteCode').on('click', validInviteCode);
            $('button.reInputInviteCode').on('click', render);
            $('input[type=checkbox][name=isAgree]').on('change',  onChangeAgreeCheckBox);
            $('button.acceptInvite').on('click', acceptInvite);
            $('input[name=companyName]').on('change', checkcompanyName);
            $('input[name=inviteCode]').on('keyup', bindEnter);

            function validInviteCode() {//验证激活码
                var $alertMsgDiv = $(".alertMsgDiv");
                var inviteCode = $("input[name=inviteCode]:visible").val().trim();
                
                var param={
                		inviteCode:invitationCode,
                		method:processActivate
                };
    
                if (!inviteCode) {
                    $alertMsgDiv.removeClass('invisible').text("验证码不能为空");
                    $alertMsgDiv.closest(".has-feedback").addClass("has-error");
                } else {
                    $alertMsgDiv.addClass('invisible').text("");
                    $alertMsgDiv.closest(".has-feedback").removeClass("has-error");
					$.ajax({
						type:"post",
		    			url:"/MaiJiaYun/InvitationController",//处理激活
		    			data:pram,
		    			dataType:"json",
		    			success:function(data) {
		    				if (data.message=="true") {
		    					$alertMsgDiv.hide().text("");
		                        $alertMsgDiv.closest(".has-feedback").removeClass("has-error");
		                        typeflag = result.flag;
		                        if (result.flag == "0") { //邀请用户
		                        	_renderSetPwd(inviteCode, result.result);
		                        } else { //邀请租户
		                            _renderCompanySetPwd(inviteCode, result.result);
		                          }

		                        } else {
		                            $alertMsgDiv.removeClass('invisible').text(" 您输入的验证码不存在，请您核实以后重新输入");
		                            $alertMsgDiv.closest(".has-feedback").addClass("has-error");
		                    }
		    			}
					});
                }
                return false;
            }

            function render() {
                $('.code-wrapper').removeClass('invisible').show();
                $('.personalRegister').hide();
                $('.companyRegister').hide();
                $("input[name=inviteCode]:visible").val('').focus();
            }

            function onChangeAgreeCheckBox(e) {
                var $isAgree = $(e.currentTarget),
                    isAgree = $isAgree.is(":checked");
                $("button.acceptInvite").attr("disabled", !isAgree);
            }

            function acceptInvite() {
               if (typeflag == "0") {
                    if (_checkPassword() && _checkRePassword() && _checkAgree()) {

                        $.post("/register/acceptInvite.ht", {
                            inviteCode: inviteCode,
                            password: $("input[name=password]:visible").val()
                        }, function(result) {
                            if (result.user) {
                                if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)){
                                    alert("邀请成功，请在PC端登录使用卖家云");
                                    window.location.href = "/login.html";
                                } else {
                                    window.location.href = "/gzt";
                                }

                            } else {
                                alert("接受失败，请稍后重试");
                            }
                            return false;
                        });

                    }
                } else { //邀请租户
                    if (checkcompanyName() && checkcontactName() && _checkPassword() && _checkRePassword() && _checkAgree()) {
                        $.post("/register/acceptCompanyInvite.ht", {
                            inviteCode: inviteCode,
                            companyName: companyName,
                            concactName: contactName,
                            password: $("input[name=password]:visible").val()
                        }, function(result) {
                            if (result.user) {
                                 if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)){
                                    alert("邀请成功，请在PC端登录使用卖家云");
                                    window.location.href = "/login.html";
                                } else {
                                    window.location.href = "/gzt";
                                }

                            } else {
                                alert("接受失败，请稍后重试");
                            }
                            return false;
                        });

                    }
                }
                return false;
            }

            function bindEnter(e) {
                if (e.keyCode == 13) {
                    validInviteCode();
                }
            }

            function _checkAgree() {
                var $isAgree = $("input[type=checkbox][name=isAgree]:visible");
                if ($isAgree.is(":checked")) {
                    return true;
                } else {
                    $isAgree.focus();
                    return false;
                }
            }

            function _checkPassword() {
                var $password = $("input[name=password]:visible"),
                    password = $password.val();
                if (!password) {
                    $('.passwordMsg').removeClass('invisible').show().text("密码不能为空");
                    $('.passwordMsg').closest(".has-feedback").addClass("has-error");
                    return false;
                } else {
                    $('.passwordMsg').hide().text("");
                    $('.passwordMsg').closest(".has-feedback").removeClass("has-error");
                    return true;
                }
            }

            function _checkRePassword() {
                var $password = $("input[name=password]:visible"),
                    $rePassword = $("input[name=rePassword]:visible"),
                    password = $password.val(),
                    rePassword = $rePassword.val();
                if (!rePassword) {
                    $('.rePasswordMsg').closest(".has-feedback").addClass("has-error");
                    $('.rePasswordMsg').removeClass('invisible').show().text("请再次输入密码");
                    return false;
                } else if (password !== rePassword) {
                    $('.rePasswordMsg').closest(".has-feedback").addClass("has-error");
                    $('.rePasswordMsg').removeClass('invisible').show().text("两次密码不一致");
                    return false;
                }
                $('.rePasswordMsg').closest(".has-feedback").removeClass("has-error");
                $('.rePasswordMsg').hide().text("");
                return true;
            }

            function _renderSetPwd(code, userInfo) {
                inviteCode = code;
                $('.code-wrapper').hide();
                $('.companyRegister').hide();
                $('.personalRegister').removeClass('invisible').show();

                //回填数据
                $('input[name=inviteCode]:visible').val(code);
                $('input[name=userName]:visible').val(userInfo.name); 
                $('input[name=mobileMail]:visible').val(userInfo.phone + '/' + userInfo.email);
            }
        });
    </script>

</body></html>