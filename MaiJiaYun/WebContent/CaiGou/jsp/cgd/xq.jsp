<%@page import="mjy.caigou.po.DetailsPO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!--详情  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- saved from url=(0042)http://maijiayun.cn/cg/caigoudan/show/4278 -->
<html class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
  <meta name="renderer" content="webkit">
  <meta name="keywords" content="供销平台,分销平台,分销,供销,货源,分销推荐,货源推荐,供销系统,分销系统,ERP,免费ERP,ERP软件,免费ERP软件,进销存,进销存软件,免费进销存软件">
  <meta name="description" content="禾唐卖家云独一无二的供销平台，开启供销双方合作的桥梁，无安装，免培训，极致用户体验 。包含寻找优质分销商，一键发布货源信息，一键代发、批发进货轻松接单！让您与分销商的订单业务无缝衔接，供销双方实时互动 ，沟通协作业务拓展不再是难事。">
  <meta http-equiv="X-UA-Compatible" content="IE=8,9,chrome=1">
  <title></title>
  
</head>

<body><!--代码开始-->
<div class="container" id="container">
<jsp:include page="/Common/jsp/navigation.jsp"></jsp:include> 
  <!--header 开始-->
  
  <!--header 结束-->
  <!--Layout left part star-->
  <!-- style="position: fixed;left:0, top:0, z-index:1030; display:none;" -->
  <!--<div class="sidebar-nav navbar-fixed-top" id="menu" style="display:none;"></div>-->
  <!--Layout left part end-->
  <!--Layout right part star-->
  <div class="content" id="content"><!--titletab star-->
<div class="collapse navbar-collapse navbar-default navbar-titletab" style="padding:0px 0 0 0; background-color:#FFFFFF">
  <div class="navbar-header">
    <a href="http://maijiayun.cn/#" class="navbar-brand ml20">采购单详情</a>
  </div>
  <ul class="nav nav-tabs f14 fb">
    <!--<li class="active ml20"><a href="javascript:void(0)"  style="background:#f1f1f1;">采购单详情</a></li>-->
  </ul>
</div>
<!--titletab end-->
<!--panel star-->
<div class="prl10auto">
  <!--table star-->
  <div class="panel prl10auto mt15" style="padding:20px 10px;">
    <h5>
    <form class="form-inline" role="form">
      <%  List<DetailsPO> list=(List<DetailsPO>)request.getAttribute("list");
       		DetailsPO deta=list.get(0);
       %>
      <div class="form-group pr10">供应商:</div>
      <div class="form-group pr20">
        <div class="btn-group">
         <%=deta.getSupplierCName() %>
        </div>  
      </div>
      <div class="form-group pr10">仓库:</div>
      <div class="form-group pr20">
        <div class="btn-group">
         <%=deta.getWarehouseName() %>
        </div>
      </div>
    </form>
    </h5>
  </div>
  <!--panle star-->
  <div class="panel prl10auto" style="padding:20px 10px;">
    <!-- Table -->
    <table class="table" style="margin-bottom:20px;">
      <thead class=" table-bordered">
        <tr>
          <th>商品图片</th>
          <th>SKU编码</th>
          <th>商品名称</th>
          <th>商品属性</th>
          <th>采购数量</th>
          <th>已入库数量</th>
          <th>单价</th>
          <th>总价</th>
          <th>备注</th>
        </tr>
      </thead>
      <tbody>
        <!---->
        <tr>
          <td><img src="+<%deta.getGoodPrice();%>>+" style="height: 50px; width:50px;" class="img-thumbnail"  alt="50x50"></td>
          <td class="fb"><%=deta.getSku()%></td>
          <td><%=deta.getGoodName() %></td>
          <td><%=deta.getGoodName() %></td>
          <td><%=deta.getPurchaseSum()%></td>
          <td><%=deta.getStorageQuantity() %></td>
          <td><%=deta.getGoodPrice()%></td>
          <td><%=deta.getPurchaseNumber()%></td>
          <td><%=deta.getRemark()%></td>
        </tr>
        
        <tr style="background:#dcdcdc;border:1px solid #dcdcdc; ">
          <td colspan="4" class="fb">合计：</td>
          <td colspan="2" class="fb">采购数量总计：<span class="red" id="skuTotalQuantity"><%=deta.getPurchaseSum()%></span></td>
          <td colspan="3" class="fb">采购总价：<span class="red" id="skuTotalFee"><%=deta.getPurchaseNumber()%></span></td>
        </tr>
        
      </tbody>
    </table>
    <!--table end-->
    <!--备注star-->
    <form class="form-horizontal" role="form" style="padding:10px 0px;">
      <div class="form-group">
        <div class="w50 left lh30 fb f14">备注</div>
        <div class="col-sm-5"><textarea rows="3" class="form-control" disabled="disabled"><%=deta.getRemark()%></textarea></div>
      </div>
    </form>
    <!--备注end-->
    <div style="padding:20px 10px 40px 10px">
      <!-- <button class="btn btn-primary mr5" type="button">保存</button> -->
        <button class="btn btn-default" type="button" "><a href="daicaiwu.jsp">返回</a></button>
    </div>
    <!--panle end-->
  </div>
</div></div>
  <div class="contentbox" id="contentbox" style="display: none; background: rgb(241, 241, 241);"></div>
  <!--Layout right part end-->

  <div id="spinner" style="display:none;">
    <div class="modal fade" aria-hidden="false" role="dialog" tabindex="-1" style="display:block;">
      <div class="modal-dialog tc" style="margin-top:300px;">
        <img src="../css/loading3.gif">
      </div>
    </div>
    <div class="modal-backdrop fade" style="background:#ffffff;"></div>
  </div>

  
  <div id="chatMessageModal" class="modal fade ng-scope" aria-hidden="true"><div class="right w-xxl bg-white md-whiteframe-z2 ng-scope" style="">
  <div class="chatbox ng-scope">
    <!---->
    <div class="p-h-md tc bgf1">
      <a class="pull-right text-muted-lt text-2x m-t-n inline p-sm" data-dismiss="modal" href="http://maijiayun.cn/#">×</a>
      <a class="pull-left f18" data-toggle="modal" data-target="#chatContactModal" data-dismiss="modal" href="http://maijiayun.cn/#">
        <span class="glyphicon glyphicon-arrow-left"></span>
      </a>
      <strong><span id="chatUserName">&nbsp;</span></strong>
    </div>
    <!---->
    <div class="box-row">
      <div class="box-cell" id="chatMessageScrollBox">
        <div class="box-inner m-userinfo">
          <div class="p-md">
            <div id="chatMessageCheckHistory">
              <div class="clear tc"><div class="p p-v-xs inline">&nbsp;</div></div>
            </div>
            <div id="chatMessageTopTimeDivider">
            </div>
            <div id="chatMessageList">
            </div>
          </div>
        </div>
      </div>
    </div>
    <!---->
    <div class="p-h-md p-v bgf1">
      <div class="ng-pristine ng-valid">
        <div class="input-group">
          <input type="text" placeholder="按回车发送消息" autocomplete="off" class="form-control" id="sendChatMessageInput">
          <span class="input-group-btn">
            <button type="button" class="btn btn-primary" id="sendChatMessageButton">发送</button>
          </span>
        </div>
      </div>
    </div>
    <!---->
  </div>
</div></div>
  <div data-backdrop="false" id="chatGroupSendingModal" class="modal fade ng-scope" aria-hidden="true"><div class="right w-xl bg-white md-whiteframe-z2 ng-scope" style="">
  <div class="chatbox ng-scope">
    <!--1-->
    <div class="p-h-md tc">
      <a class="pull-right text-muted-lt text-2x m-t-n inline p-sm" data-dismiss="modal" href="http://maijiayun.cn/#">×</a>
      <a class="pull-left f18" data-toggle="modal" data-target="#chatContactModal" data-dismiss="modal" href="http://maijiayun.cn/#" id="chatGroupSendingBack">
        <span class="glyphicon glyphicon-arrow-left"></span>
      </a>
      <strong>选择联系人</strong>
    </div>
    <!--搜索-->
    <div class="row p-h-plr">
      <div class="has-feedback dropdown">
        <input type="text" data-toggle="dropdown" placeholder="查找公司/姓名/手机" class="form-control input-sm dropdown-toggle" id="chatGroupSendingSearchBox">
        <span style="width:30px; height:30px; line-height:30px;" class="glyphicon glyphicon-search form-control-feedback c9"></span>
        <!---->
        <div style="padding-top:0" role="menu" class="dropdown-menu row">
          <ul class="media-list m-userinfo scrollspy-example " style="margin-bottom:0px;max-height:470px; margin-top:0px;" id="chatGroupSendingSearchResult">
          </ul>
        </div>
        <!---->
      </div>
    </div>
    <!--搜索 end-->
    <!--2-->
    <div class="box-row">
      <div class="box-cell">
        <div class="box-inner plate">
          <ul class="media-list m-userinfo scrollspy-example" style="margin-bottom:0px;height:100%; margin-top:0px;" id="chatGroupSendingContactList">
          </ul>
        </div>
      </div>
    </div>
    <!--3-->
    <div class="p-h-md bgf1 tc">
      <span class="text-muted">选择联系人添加到群发</span>
    </div>
    <!--end-->
  </div>
</div>

<div class="say w-xxl bg-white md-whiteframe-z2 ng-scope">
  <div class="chatbox ng-scope">
    <!--1-->
    <div class="p-h-md tc bgf1">
      <strong class="sayblock">发送消息给</strong>
    </div>
    <!--2-->
    <div class="box-row">
      <div class="box-cell">
        <div class="box-inner">
          <!---->
          <div class="row f12 tc c6">
            <div class="p p-v-xs bg-chattime inline mt15">从右侧选择联系人</div>
          </div>
          <!---->
          <div class="row m-userinfo plate">
            <ul class="scrollspy-example" style="margin-bottom:0px;height:100%; margin-top:0px;" id="chatGroupSendingSelectedList">
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!--3-->
    <div class="p-h-md p-v bgf1">
      <div class="ng-pristine ng-valid">
        <div class="input-group">
          <input type="text" placeholder="按回车发送消息" autocomplete="off" class="form-control" id="sendChatGroupMessageInput">
          <span class="input-group-btn">
            <button type="button" class="btn btn-primary" id="sendChatGroupMessageButton">发送</button>
          </span>
        </div>
      </div>
    </div>
    <!--end-->
  </div>
</div></div>
  
  <div id="manageContactModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="manageContactModalLabel" aria-hidden="true"><div style="width:795px;" class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h4 class="modal-title" id="manageContactModalLabel">分配岗位</h4>
    </div>
    <div role="tabpanel" class="modal-body" style="padding:15px 0 0 0;">
      <!--1 star-->
      <div class="row f14">
        <form class="form-horizontal" role="form">
          <!---->
          <div class="col-md-8">
            <label for="inputEmail3" class="col-sm-2 control-label c6">姓名</label>
            <div class="form-group has-feedback">
              <div class="col-sm-10">
                <input disabled="" id="manageContactUserNameInput" type="text" name="name" value="" class="form-control" placeholder="请输入您同事的姓名">
                <span class="glyphicon form-control-feedback"></span>
              </div>
            </div>
          </div>
          <div class="col-md-4" style="padding-left:0px;">
            <div class="form-group">
              <div name="name" class="alert alert-danger p7 f12" role="alert" style="display:none;"></div>
            </div>
          </div>
          <!---->
          <div class="col-md-8">
            <label for="inputEmail3" class="col-sm-2 control-label c6">手机</label>
            <div class="form-group has-feedback">
              <div class="col-sm-10">
                <input disabled="" id="manageContactUserPhoneInput" type="text" name="phone" class="form-control" value="" placeholder="请输入您同事的手机号码">
                <span class="glyphicon form-control-feedback"></span>
              </div>
            </div>
          </div>
          <div class="col-md-4" style="padding-left:0px;">
            <div class="form-group">
              <div name="phone" class="alert alert-danger p7 f12" role="alert" style="display:none;"></div>
            </div>
          </div>
          <!---->
          <div class="col-md-8">
            <label for="inputEmail3" class="col-sm-2 control-label c6">Email</label>
            <div class="form-group has-feedback">
              <div class="col-sm-10">
                <input disabled="" id="manageContactUserEmailInput" type="text" name="email" class="form-control" value="" placeholder="请输入您同事的Email">
                <span class="glyphicon form-control-feedback"></span>
              </div>
            </div>
          </div>
          <div class="col-md-4" style="padding-left:0px;">
            <div class="form-group">
              <div name="email" class="alert alert-danger p7 f12" role="alert" style="display:none;"></div>
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
                  <ul id="manageContactUserFunctionList">
                  </ul>
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
      <button type="button" class="btn btn-primary updatePackUser">修改</button>
      <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
    </div>
  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div>

  <div style="width: 300px; height: 80px; display: none;" class="modal" id="keepsuccessModal" tabindex="-1" role="dialog" aria-labelledby="logisticsModalLabel" aria-hidden="false">
    <div class="modal-dialog" style="width:300px; margin:52px 0 0 0;">
      <div style="background:#61be44; border-radius: 0px; border:none" class="modal-content">
        <div style="padding:5px;" class="modal-body">
          <!--part one-->
          <div style="color:#ffffff;" class="c6 tc" id="showTempDiv">保存成功！</div>
          <!--part one end-->
        </div>
      </div>
    </div>
  </div>
  <div style="width: 300px; height: 80px; display: none;" class="modal" id="keeperrorModal" tabindex="-1" role="dialog" aria-labelledby="logisticsModalLabel" aria-hidden="false">
    <div class="modal-dialog" style="width:300px; margin:52px 0 0 0;">
      <div style="background:#ff5831; border-radius: 0px; border:none" class="modal-content">
        <div style="padding:5px;" class="modal-body">
          <!--part one-->
          <div style="color:#ffffff;" class="c6 tc" id="showErrorTempDiv">保存失败！</div>
          <!--part one end-->
        </div>
      </div>
    </div>
  </div>

  
</div>
<!--代码结束--></body></html>