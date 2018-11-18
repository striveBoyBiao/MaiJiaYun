<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="供销平台,分销平台,分销,供销,货源,分销推荐,货源推荐,供销系统,分销系统,ERP,免费ERP,ERP软件,免费ERP软件,进销存,进销存软件,免费进销存软件">
    <meta name="description" content="禾唐卖家云独一无二的供销平台，开启供销双方合作的桥梁，无安装，免培训，极致用户体验 。包含寻找优质分销商，一键发布货源信息，一键代发、批发进货轻松接单！让您与分销商的订单业务无缝衔接，供销双方实时互动 ，沟通协作业务拓展不再是难事。">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${pageContext.request.contextPath}/Login/img/favicon.ico">
    <title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/Login/css/bootstrap_register.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/Login/css/signin.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/Login/css/global_register.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/Login/js/yanzhengma.js" type="text/javascript" charset="utf-8"></script>
	<style>
		#mess{
			width: 260px;
			font-size: 20px;
			color: rgb(34,137,230);
			text-align: center;
			align-: center;
			display: block;
			margin: auto;
			margin-top: 80px;
			padding-bottom: 80px;
		}
	</style>
	
</head>

<body onload="draw()">
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/MaiJiaYun/html/login.html"><img src="/MaiJiaYun/Login/img/logo.png" width="90px" height="30px"></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/MaiJiaYun/Login/html/login.html">首页</a></li>
                <li><a href="/MaiJiaYun/Login/html/introduction.html">产品介绍</a></li>
                <li><a href="/MaiJiaYun/Login/html/about.html">关于我们</a></li>
            </ul>
            <div class="nav navbar-nav navbar-right">
                <a href="/MaiJiaYun/Login/html/login.html" type="button" class="btn btn-link navbar-btn">登录</a>
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
                    <li class="active" role="presentation"><a href="/MaiJiaYun/login">首页</a></li>
                    <li role="presentation"><a href="/MaiJiaYun/Login/html/introduction.html">产品介绍</a></li>
                    <li role="presentation"><a href="/MaiJiaYun/Login/html/about.html">关于我们</a></li>
                </ul>
            </div>
        </div>
     <!-- /.container-fluid -->
    </nav>
<div class="register">
    <div class="jumbotron">
        <h1 class="text-center">注册卖家云</h1>
    </div>
</div>
<!---->
<div class="container">
    <form class="form-register" action="">
        <div class="form-group has-error has-feedback">
            <label>企业类型</label>
            <div class="form-group" id="inputDistributionTypeDiv">
                <div class="btn-group" data-toggle="buttons" style="width:100%;">
                    <label class="btn btn-default btn-lg active" style="width:50%;" id="radioGYS" onclick="f(0)">
                        <input type="radio" name="options" id="option1" autocomplete="off" checked="" value="供应商"> 供应商
                    </label>
                    <label class="btn btn-default btn-lg" style="width:50%;" id="radioFXS" onclick="f(1)">
                        <input type="radio" name="options" id="option2" autocomplete="off" value="分销商"> 分销商
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group" id="inputMobileDiv">
            <label>手机号</label>
            <label class="control-label pull-right" id="mobileTipsMsg"></label>
            <input class="form-control" placeholder="请输入手机号" type="text" id="mobilePhone" onblur="checkphone()">
        </div>
        <div class="form-group" id="inputSmsCodeDiv">
            <label>验证码</label>
            <label class="control-label pull-right" id="smsCodeTipsMsg"></label>
            <div class="input-group">
                <input type="text" class="form-control" placeholder="请输入右侧字符" id="captcha" maxlength="7" onblur="requestCode()" onfocus="removeTitle();">
                <span class="input-group-btn">
                   <canvas id="yanzhengma" width="100px" height="44px"  onclick="draw()">点击刷新</canvas>
                </span>
            </div>
	        <div class="form-group" id="inputEmailDiv">
	            <label>Email</label>
	            <label class="control-label pull-right" id="Emailmsg"></label>
	            <input class="form-control" placeholder="请输入邮箱" type="text" id="Email" onblur="checkEmail()">
	        </div>
            &nbsp;
            <div class="input-group" id="inputEmailcodeDiv">
                <input type="text" class="form-control" placeholder="邮箱验证码" id="emailcode" onblur="checkEmail()">
                <span class="input-group-btn phonecode">
                    <button class="btn btn-default btn-lg" type="button" id="sendSmsBtn" ondblclick="sa()">免费获取！</button>
                </span>
            </div>
        </div>
        <div class="form-group has-feedback" id="inputMobileCompanyNameDiv">
            <label>企业名称</label>
            <label class="control-label pull-right" id="companyNameTipsMsg"></label>
            <label class="control-label pull-right"></label>
            <input class="form-control" placeholder="" type="text" id="mobileCompanyName" onblur="checkCompanyName()">
        </div>
        <div class="form-group" id="inputMobilePassDiv">
            <label>密码设置</label>
            <label class="control-label pull-right" id="mobilePassTipsMsg"></label>
            <input class="form-control" type="password" id="mobilePass" onblur="checkPassword()">
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="check" checked="checked" id="agreementCheck">我已阅读并同意 <a href="#" target="_blank">《卖家云注册协议》</a>
            </label>
        </div>
        <button class="btn btn-lg btn-success btn-block once" type="button" id="registerBtn" onclick="isExit()">注册账号</button>
	<button id="mtk" type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm" style="display:none"></button>
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div id="mess">
	      </div>
	    </div>
	  </div>
	</div>
</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/Login/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/Login/js/bootstrap.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script type="text/javascript">
var isPhoneChecked = false;
var isYanZhengMa=false;
var isGongSi=false;
var ispsd=false;
var flag=true;
var flagemail=true;
var bstype=9;
var num=0;
//注册的类型（供应商9分销商8）
function f(i){
	bstype=9-i;
}
//获取邮箱验证码
function sa(){
	checkEmail();
	if(flagemail&&$("#Email").val()!=""){
		flagemail=false;
		var params = {
			email: $("#Email").val(),
			method:"emailSend"
		};
        $.ajax({
            url: '/MaiJiaYun/registerServlet',
            type: 'post',//提交的方式
            dataType:'json',
            data: params,
            success: function(re) {
				document.getElementById("mess").innerHTML=re.retu;
				document.getElementById("mtk").click();
				if(re.retu=="请检查邮箱是否正确 "){
					num=2;
				}
            }
        });
    	num=60;
    	wait();
	}
}
//点击后按钮等待显示
function wait(){
	if(num>0){
		if(num>9){
			$("#sendSmsBtn").html(num+"秒后失效");
		}else{
			$("#sendSmsBtn").html("0"+num+"秒后失效");
		}
		num--;
		window.setTimeout("wait()",1000);
	}else{
		$("#sendSmsBtn").html("再次获取！");
		flagemail=true;
	}
}

function createxhr(){
    //如何进行方法的赛选
    if(window.XMLHttpRequest){
        var xhr = new XMLHttpRequest();
    } else {
        var version = ["Msxml2.XMLHTTP.6.0","Msxml2.XMLHTTP.5.0","Msxml2.XMLHTTP.4.0","Msxml2.XMLHTTP.3.0","Msxml2.XMLHTTP","Microsoft.XMLHTTP"];
        for(var i=0,len=version.length; i<len; i++){
            var xhr = new ActiveXObject(version[i]);
            if(xhr){
                break;
            }
        }
    }
    return xhr;
}
//注册
function isExit(){
	checkphone();
	requestCode();
	checkCompanyName();
	checkPassword();
	checkEmail();
	if(flag){
		flag=false;
		if(document.getElementById("agreementCheck").checked&&isPhoneChecked&&isYanZhengMa&&isGongSi&&ispsd){
			//if(isPhoneChecked){ 
				var params = {
					bosstype:bstype,
					emailnum: $("#emailcode").val(),
					phone : $("#mobilePhone").val(),
					email: $("#Email").val(),
					gongsi : $("#mobileCompanyName").val(),
					psd : $("#mobilePass").val(),
					method:"register"
				}; 
		        $.ajax({
		            url: '/MaiJiaYun/registerServlet',
		            type: 'post',//提交的方式
		            dataType:'json',
		            data: params,
		            success: function(msg) {
     					document.getElementById("mess").innerHTML=msg.retu;
     					document.getElementById("mtk").click();
     					if(msg.retu==($("#Email").val()+"已存在!")){
     						num=2;
     					}
     					if(msg.retu=="欢迎光临!"){
     						window.location.href=msg.path;
     					}
		            }
		        });
             
             //xhr.send(null);
		}
		flag=true;
	}
}

//手机号验证
function checkphone() {
    if ($("#mobilePhone").val() == "") {
        $("#mobileTipsMsg").html("手机号码不能为空！");
        $("#inputMobileDiv").addClass("has-error");
    }else if (!$("#mobilePhone").val().match(/^1[3|4|5|8|7][0-9]\d{4,8}$/)) {
        $("#mobileTipsMsg").html("手机号码格式不正确！请重新输入！");
        $("#inputMobileDiv").addClass("has-error");
    }else{
        $("#mobileTipsMsg").html("");
        $("#inputMobileDiv").removeClass("has-error");
    	isPhoneChecked = true;
    }
}
	
    function removeTitle() {
        $("#smsCodeTipsMsg").html("");
        $("#inputSmsCodeDiv").removeClass("has-error");
    }

    //验证码
    function requestCode() {
    	var ps = document.getElementById("yanzhengma").className;
    	var inpu = $("#captcha").val();
    	if(inpu.trim()==""||ps==""){
            $("#smsCodeTipsMsg").html("请输入图片中的验证码！");
            $("#inputSmsCodeDiv").addClass("has-error");
            document.getElementById("yanzhengma").click();
            isYanZhengMa = false;
    	}else if(inpu.trim()!=ps.trim()){
            $("#smsCodeTipsMsg").html("验证码有误,请重新输入！");
            $("#inputSmsCodeDiv").addClass("has-error");
            document.getElementById("yanzhengma").click();
            isYanZhengMa = false;
    	}else{
    		isYanZhengMa = true;
    	}
    }

    function checkCompanyName() {
        if ($("#mobileCompanyName").val() == "" || $("#mobileCompanyName").val() == "undefined") {
            $("#companyNameTipsMsg").html("公司名称不能为空!");
            $("#inputMobileCompanyNameDiv").addClass("has-error");
            isGongSi = false;
        } else{
            $("#companyNameTipsMsg").html("");
            $("#inputMobileCompanyNameDiv").removeClass("has-error");
        	isGongSi = true;
        }
    }

    function checkEmail(){
    	if($("#Email").val()==""||$("#emailcode").val()==""){
            $("#Emailmsg").html("邮箱或验证码不能为空!");
            $("#inputEmailDiv").addClass("has-error");
            $("#inputEmailcodeDiv").addClass("has-error");
            
    	}else if(!$("#Email").val().match( /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)){
            $("#Emailmsg").html("邮箱格式错误!");
            $("#inputEmailDiv").addClass("has-error");
    	}else{
    		$("#Emailmsg").html("");
            $("#inputEmailDiv").removeClass("has-error");
    	}
    }

    function checkPassword() {
        if ($("#mobilePass").val() == "" || $("#mobilePass").val() == "undefined") {
            $("#mobilePassTipsMsg").html("密码不能为空!");
            $("#inputMobilePassDiv").addClass("has-error");
            ispsd = false;
        } else if ($("#mobilePass").val().length <= 5) {
            $("#mobilePassTipsMsg").html("密码必须大于6位!");
            $("#inputMobilePassDiv").addClass("has-error");
            ispsd = false;
        }else{
            $("#mobilePassTipsMsg").html("");
            $("#inputMobilePassDiv").removeClass("has-error");
        	ispsd = true;
        }
    }
</script>

<!--cnzz来源和转化统计-->
<script type="text/javascript">
    var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cspan style='display: none' id='cnzz_stat_icon_1255058430'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1255058430' type='text/javascript'%3E%3C/script%3E"));
</script><span style="display: none" id="cnzz_stat_icon_1255058430"><a href="http://www.cnzz.com/stat/website.php?web_id=1255058430" target="_blank" title="站长统计">站长统计</a></span><script src="js/z_stat.php" type="text/javascript"></script><script src="js/core.php" charset="utf-8" type="text/javascript"></script><iframe name="186668" height="1" width="1" src="./卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台_files/mv.html"></iframe>
<!--baidu统计-->
<!-- <script type="text/javascript">
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fc1dd630158e6b217657821525e770aa9' type='text/javascript'%3E%3C/script%3E"));
</script> -->
<!--新baidu统计-->
<script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "//hm.baidu.com/hm.js?a89eaf427986d48615ee83b267071b9f";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
</script>
</body>
</html>