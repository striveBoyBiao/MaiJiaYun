<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>应付款详情</title>
 <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/caiwu/fukuan/css/them.css"/>

	<script type="text/javascript">
	
		var isSuccess=false;
	
		function setBankAccount(bankAccountId) {
			//将点击的银行名称置入选择银行的框里边
			var bankAccountName="#"+bankAccountId;
			$("#yinhang").html($(bankAccountName).html());
				
			var bankAccount="hidden_bankName"+bankAccountId;
			var bankAccountId="#"+bankAccount;
			//将银行名称对应的银行账号置入付款账号的框里边
			var fkAccountId=$(bankAccountId).val();
			$("#bankAccount").val(fkAccountId);
			
		}
		
		function checkId() {
			
			var yinhang=$("#yinhang").html();
			var accountNumber=$("#bankAccount").val();
			
			$.ajax({
				url:"${pageContext.request.contextPath}/mjy/caiwu/fukuan/servlet/BankidCheckServlet",
				type:"post",
				data:{
					yinhang:yinhang,
					accountNumber:accountNumber
				},
				datatype:"json",
				success:function(data){
					var message=data.message;
					if(message!="ok"){
						$("#checkId").html(message);
					}
				}
			});
		} 
		
		function clearWarningInformation(obj) {
			var p=document.getElementById("checkId");
			p.innerHTML="";
		}
	</script>

</head>
<body class="" style="padding-right: 0px;"><!--代码开始-->
<div class="container" id="container">

   <!--header 开始-->
  <jsp:include page="/Common/jsp/navigation.jsp"></jsp:include>
  <!--header 结束-->
  <div class="content" id="content"><div class="collapse navbar-collapse navbar-default navbar-titletab" style="padding:0px 0 0 0;">
  <div class="navbar-header">
    <a href="http://maijiayun.cn/#" class="navbar-brand ml20">付款详情</a>
  </div>
  <ul class="nav nav-tabs f14 fb">
  </ul>
</div>

<div class="prl10auto">
  <!--panel star-->
  <form style="padding:20px 15px;" role="form" id="form1"  class="form-horizontal" action="${pageContext.request.contextPath}/servlet/cw/fukuan/ShouldPayServlet?method=submitDetail&fkNo=${fkNo}" method="post">
  <div class="panel prl10auto mt15" style="padding:20px 10px;">
    <h5>收款人</h5>
    <div class="row mt15 f14">
      <div class="col-md-3">
        <div role="form" class="form-inline">
          <div class="form-group">收款人姓名：</div>
          <div class="form-group">
            <span class="fb">${spv.fkSkName }</span>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div role="form" class="form-inline">
          <div class="form-group">收款人昵称：</div>
          <div class="form-group">
            <span class="fb">${spv.fkSkNickName }</span>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div role="form" class="form-inline">
          <div class="form-group">应付款：</div>
          <div class="form-group">
            <span class="fb">${spv.fkShouldpayMoney }</span>
          </div>
          <div class="form-group">元</div>
        </div>
      </div>
    </div>
    <!---店铺名称 end-->
  </div>
  <!--panle end-->
  <!--panel star-->
  <div class="panel prl10auto" style="padding:20px 10px;">
    <h5>付款人</h5>
    <!--仓库名称 star-->
    <div class="row mt15 f14">
      <div class="col-md-3">
        <div role="form" class="form-inline">
          <div class="form-group">开户机构：</div>
          <div class="form-group">
            <input type="hidden" name="accountBank" value="">
            <input type="hidden" validate="" showname="开户机构" name="accountId" value="">
            <input type="hidden" name="status" value="未收款">
            <div class="btn-group select" name="accountBank" id="accountBank" val="">
              <button class="btn btn-default" name="yinhang" id="yinhang" type="button" value="选择银行">选择银行</button>
              <button style="height: 34px;" data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button">
              <span class="caret"></span>
              </button>
              <ul style="min-width:100px;" role="menu" class="dropdown-menu" val="">
	              <c:forEach var="bank_name" items="${map }" varStatus="st">
	                 <li val="${bank_name.key}" accountnumber="" >
	                 	<a href="javascript:void(0)" code="" id="${st.index }" onclick="setBankAccount(${st.index });">${bank_name.key}</a>
	                 	<input type="hidden" id="hidden_bankName${st.index }" value="${bank_name.value }">
	                 </li>
	              </c:forEach>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div role="form" class="form-inline">
          <div class="form-group">账号：</div>
          <div class="form-group">
            <input type="text" validate="" showname="银行帐号" name="accountNumber" style=" width:150px;" placeholder="银行帐号" id="bankAccount" class="form-control" value="${bankId[0].fkzhBankId }" onblur="checkId()" onfocus="clearWarningInformation(this)">
          </div>
          <div class="form-group"><p id="checkId" style="color:red;"></p></div>
        </div>
      </div>
      <div class="col-md-3">
        <div role="form" class="form-inline">
          <div class="form-group">付款额：</div>
          <div class="form-group">
            <input type="text" validate="" showname="付款额" name="receivedAmount" style=" width:150px;" placeholder="0.00" id="receivedAmount" class="form-control float">
          </div>
          <div class="form-group">元</div>
        </div>
      </div>
    </div>
    <!---店铺名称 end-->
  </div>
  <!--panle end-->
  <!--panel star-->
  <div class="panel prl10auto mt15" style="padding:20px 10px;">
      <h5>单据相关</h5>
      <!--店铺名称 star-->
      <div class="row mt15 f14">
        <div class="col-md-3">收支类型：<span class="fb">${spv.other1 }</span></div>
        <div class="col-md-3">相关单据号：<span class="fb">${spv.fkNo }</span></div>
      </div>
      <div class="row mt15 f14">
        <div class="col-md-3">创建时间：<span class="fb">${spv.fkCreaterTime }</span></div>
        <div class="col-md-3">创建人：<span class="fb">${spv.other2 }</span></div>
      </div>
      
        <div class="form-group">
          <div class="w50 left lh30 f14">备注</div>
          <div class="col-sm-5">
          	<textarea id="memo" class="form-control" rows="5" >${spv.fkRemark }</textarea>
          </div>
         
        </div>
       
      <!---店铺名称 end-->
    </div>
    </form>
  <!--panle end-->
  <div style="padding:20px 10px 40px 10px">
  	<%-- <a class="c6" href="${pageContext.request.contextPath}/servlet/cw/fukuan/SubmitPayDetailServlet?fkNo=${fkNo}"> --%>
   		 <button id="btnSave" type="button" class="btn btn-primary mr5" onclick="document.getElementById('form1').submit();">保存</button>
    <!-- </a> -->
    <a class="c6" href="${pageContext.request.contextPath}/servlet/cw/fukuan/ShouldPayServlet?method=showAllData">
    	<button id="btnReturn" type="button" class="btn btn-default">返回</button>
    </a>
  </div>
 
</div></div>
 
</div>

<!--代码结束--></body>
</html>