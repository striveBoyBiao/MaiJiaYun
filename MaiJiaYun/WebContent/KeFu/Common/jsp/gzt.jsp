<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>


<title>卖家云-全网供销_分销货源系统推荐_免费ERP进销存软件平台</title>

<link rel="shortcut icon" href="../img/favicon.ico"   type="image/x-icon">
<script src="${pageContext.request.contextPath}/Common/js/jquery.min.js" 	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Common/js/bootstrap.min.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Common/css/global.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Common/css/iconfont.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Common/css/bootstrap.css">


</head>

<body>
	<!--代码开始-->
	<div class="container" id="container">
	
		<!-- 导航 -->
		<jsp:include page="navigation.jsp">
			<jsp:param
				value="${pageContext.request.contextPath }/Common/jsp/navigation.jsp"
				name="url" />
		</jsp:include>
	
		
		
		
		
		<!--Layout right part star-->
		<div class="content" id="content"></div>
		<div class="contentbox" id="contentbox"
			style="display: block; background: rgb(241, 241, 241);">
			<div class="tips" style="left: 640px; display: none;"></div>
			<div class="content1170 row">
				<!--left star-->
				<div class="col-lg-2">
					<!--1 star-->
					<div id="contentboxMenu">
						<!--1 star-->
						<div class="row  white p15">
							<div class="h35 f16 blue bbbule">做更懂连接的卖家</div>
							<!--menu star-->
							<div class="menuItem_Content menuItem_ContentList"
								aria-multiselectable="true" role="tablist" id="accordion">
								<ul>
									<li class="navItem"><a href="http://maijiayun.cn/gzt"
										class=""><span class="mr10 iconfont icon-mrw"
											style="font-size: 18px;"></span>我的任务</a></li>
								</ul>
								<div class="panel"
									style="margin-bottom: 0px; box-shadow: none; border-radius: 0px;">
									<ul id="headingOne" role="tab">
										<li class="navItem"><a id="tongjiMenu"
											aria-controls="collapseOne" aria-expanded="false"
											href="javascript:void(0);" data-target="#collapseOne"
											data-parent="#accordion" data-toggle="collapse"
											class="collapsed" style="display: block"> <span
												class="mr10 iconfont icon-tongji" style="font-size: 18px;"></span>我的统计<span
												class="pull-right iconfont icon-bottom c9"
												style="font-size: 12px;"></span>
										</a></li>
									</ul>
									<ul aria-labelledby="headingOne" role="tabpanel"
										class="panel-collapse collapse" id="collapseOne"
										style="height: 0px;">
										<li style="height: 1px;">
											<div class="divider_line"></div>
										</li>
										<li class="navItem function"><a
											href="http://maijiayun.cn/gzt/tongji/tjgk"
											data-target="gzt/tongji/tjgk" class="pl43 ">统计概况</a></li>
										<!-- <li class="navItem function"><a href="javascript:void(0);" data-target="" class="pl43 ">健康诊断</a></li> -->
										<li class="navItem function"><a
											href="http://maijiayun.cn/gzt/tongji/goodstongji"
											data-target="gzt/tongji/goodstongji" class="pl43 ">销售统计</a></li>
										<li class="navItem function"><a
											href="http://maijiayun.cn/gzt/tongji/fxtongji"
											data-target="gzt/tongji/fxtongji" class="pl43 ">分销统计</a></li>
										<li class="navItem function"><a
											href="http://maijiayun.cn/gzt/tongji/gongxiaotongji"
											data-target="gzt/tongji/gongxiaotongji" class="pl43 ">仓储采购</a></li>
										<!-- <li class="navItem function"><a href="javascript:void(0);" data-target="" class="pl43 ">物流统计</a></li> -->
										<li class="navItem function"><a
											href="http://maijiayun.cn/gzt/tongji/hytj"
											data-target="gzt/tongji/hytj" class="pl43 ">会员统计</a></li>
										<li class="navItem function"><a
											href="http://maijiayun.cn/gzt/tongji/thhfx"
											data-target="gzt/tongji/thhfx" class="pl43 ">售后统计</a></li>
										<li style="height: 1px;">
											<div class="divider_line"></div>
										</li>
									</ul>
								</div>

								<div class="panel"
									style="margin-bottom: 0px; box-shadow: none; border-radius: 0px;">
									<ul id="headingTwo" role="tab">
										<li class="navItem"><a aria-controls="collapseTwo"
											aria-expanded="false" href="javascript:void(0);"
											data-target="#collapseTwo" data-parent="#accordion"
											data-toggle="collapse" class="collapsed"
											style="display: block"> <span
												class="mr10 iconfont icon-gangwei" style="font-size: 18px;"></span>我的岗位<span
												class="pull-right iconfont icon-bottom c9"
												style="font-size: 12px;"></span>
										</a></li>
									</ul>
									<ul aria-labelledby="headingTwo" role="tabpanel"
										class="panel-collapse collapse" id="collapseTwo"
										style="height: 0px;">
										<li style="height: 1px;">
											<div class="divider_line"></div>
										</li>

										<li class="navItem function"><a
											href="http://maijiayun.cn/gly" data-target="gly" class="pl43">管理员</a></li>

										<li class="navItem function"><a
											href="http://maijiayun.cn/kf" data-target="kf" class="pl43">客服</a></li>

										<li class="navItem function"><a
											href="http://maijiayun.cn/sd" data-target="sd" class="pl43">订单处理</a></li>

										<li class="navItem function"><a
											href="http://maijiayun.cn/kg" data-target="kg" class="pl43">库管</a></li>

										<li class="navItem function"><a
											href="http://maijiayun.cn/cg" data-target="cg" class="pl43">采购</a></li>

										<li class="navItem function"><a
											href="http://maijiayun.cn/yy" data-target="yy" class="pl43">运营</a></li>

										<li class="navItem function"><a
											href="http://maijiayun.cn/cw" data-target="cw" class="pl43">财务</a></li>

										<li style="height: 1px;">
											<div class="divider_line"></div>
										</li>
									</ul>
								</div>
								<ul>
									<!-- <li class="navItem"><a href="#" class=""><span class="mr10 yellow iconfont icon-renwu" style="font-size:18px;"></span>历史任务</a></li> -->
									<li class="navItem"><a
										href="http://maijiayun.cn/help.html" target="_blank" class=""><span
											class="mr10 green iconfont icon-help"
											style="font-size: 18px;"></span>帮助中心</a></li>
								</ul>
							</div>
							<!--menu end-->
						</div>
						<!--1 end-->
						<!--2 star-->
						<!--weixin star-->

						<div class="row white p15 mt20 tc">

							<div class="row mb10" id="fxsgl">
								<a href="http://maijiayun.cn/fxsgl.html" target="_blank"> <img
									src="../img/fxsgl.png">
								</a>
							</div>

							<div class="row mb10" id="mjyerp">
								<a href="http://maijiayun.cn/mjyerp.html" target="_blank"> <img
									src="../img/mjyerp.png">
								</a>
							</div>
						</div>

						<div class="row white p15 mt20 tc">
							<div class="linkBlock">
								<div class="f16">卖家云部署顾问</div>
								<div class="f14 mb10">贴心为您服务</div>
								<div class="row mb10">
									<a
										href="http://wpa.qq.com/msgrd?v=3&amp;uin=2848386527&amp;site=qq&amp;menu=yes"
										target="_blank" style="text-decoration: none;">
										<div class="qq_big">
											<div class="listen_text">QQ客服</div>
										</div>
									</a>
								</div>
								<div class="row mb10">
									<a
										href="http://amos.im.alisoft.com/msg.aw?v=2&amp;uid=tp_%E7%A6%BE%E5%94%90%E7%A7%91%E6%8A%80&amp;site=cntaobao&amp;s=2&amp;charset=utf-8"
										target="_blank" style="text-decoration: none;">
										<div class="ww_big">
											<div class="listen_text">旺旺客服</div>
										</div>
									</a>
								</div>
							</div>
						</div>
						<div class="row white mt20 tc">
							<div class="linkBlock">
								<h5>欢迎关注卖家云微信号</h5>
								<img width="165" height="206" src="../img/qrcode.jpg">
							</div>
						</div>
						<!--<div class="row white mt20 tc">
  <div class="linkBlock">
    <a href="http://www.da-mai.com/app.html" target="_black">
      <img width="165" height="206"
           src="http://ht-maijiayun.oss-cn-hangzhou.aliyuncs.com/ouli.png">
    </a>
  </div>
</div>
<div class="row white mt20 tc">
  <div class="linkBlock">
    <a href="http://youzan.com/?from=bd_3004" target="_black">
      <img width="165" height="206"
           src="http://ht-maijiayun.oss-cn-hangzhou.aliyuncs.com/165-380-2.jpg%255B1%255D.jpg">
    </a>
  </div>
</div>
<div class="row white mt20 tc">
  <div class="linkBlock">
    <a href="http://fuwu.taobao.com/ser/detail.htm?spm=0.0.0.0.gMJ2Si&service_code=ts-14466&tracelog=search&scm=friendlink"
       target="_black">
      <img width="165" height="206"
           src="http://ht-maijiayun.oss-cn-hangzhou.aliyuncs.com/edcf33a61c52d9793c10774bc2616803.jpg">
    </a>
  </div>
</div>
<div class="row white mt20 tc">
  <div class="linkBlock">
    <a href="http://www.yikucangchu.com/cangchu/" target="_black">
      <img width="165" height="206" src="http://ht-maijiayun.oss-cn-hangzhou.aliyuncs.com/YikuCangchu.jpg">
    </a>
  </div>
</div> -->
						<!--weixin end-->
						<!--2 end-->
					</div>
					<!--1 end-->
					<!--2 star-->
					<!--weixin star-->
					<!-- <div class="row white p15 mt20 tc">
      <div class="f16">关注卖家云服务号</div>
      <div class="f14">用你得微信上卖家云</div>
      <div class="mt10"><img src="img/qrcode.png" width="135" height="135"></div>
    </div> -->
					<!--weixin end-->
					<!--2 end-->
					<!--3 star-->
					<!--3 end-->
				</div>
				<!--left end-->
				<!--center star-->
				<div class="col-lg-7">
					<!--1 star-->
					<div class="row white p15">
						<div class="media">
							<a class="s-avatar_big pull-left"
								href="http://maijiayun.cn/page.html#/fxs/homepage/70243"
								target="_blank"> <img id="tenantryAvatorUrl"
								src="../img/admin_logo.png" width="80" height="80">
							</a>
							<div class="media-body">
								<div class="media-heading f20 companyName">
									<a style="text-decoration: none;" class="c0"
										href="http://maijiayun.cn/page.html#/fxs/homepage/70243"
										target="_blank">KBQ</a>
								</div>
								<div class="row mt20 mb5" style="min-height: 31px;">

									<div class="c6 f14 pull-left">
										<a href="javascript:void(0);" data-toggle="modal"
											class="editTenantry">完善公司资料</a>
									</div>

									<div class="pull-right" style="display: none;">
										<span class="f12 c9">还可以输入</span> <span class="num red">300</span>
										<span class="f12 c9">字</span>
									</div>
								</div>
							</div>
						</div>
						<!--信息输入框 star-->
						<div class="row" id="createTopic">
							<div class="talkarrow"></div>
							<div class="talkborder">
								<!---->
								<div class="talkcontent">
									<div class="talkcontainer">
										<div class="container_input_box f14">
											<textarea name="content" class="TextArea c9"
												style="height: 80px; overflow-y: hidden;"
												data-mentions-input="true" placeholder="分享你的工作动态..."></textarea>
										</div>
									</div>
								</div>
								<!---->
								<!---->
								<div class="setgroup" style="display: none;">
									<div class="row">
										<div class="pull-left lh45">
											<span class="mr15 "> <a id="addAttachment"
												href="javascript:void(0);" style="text-decoration: none;"><span
													class="glyphicon glyphicon-paperclip f14"></span></a>
											</span> <span class="dropdown" scope="0"> <a
												href="javascript:void(0);" style="text-decoration: none;"
												class="dropdown-toggle" data-toggle="dropdown"> <span
													class="glyphicon glyphicon-eye-open f14"></span><span
													id="scopeName">所有人可见</span> <b class="caret"></b></a> <!---->
												<ul class="dropdown-menu scrollspy-example"
													style="max-height: 135px; width: 200px;">
													<li scope="0"><a href="javascript:void(0);"
														class="pt7b10"> <label class="ml10 mr20"
															style="margin-bottom: 0px;">所有人可见</label></a></li>
													<li scope="1"><a href="javascript:void(0);"
														class="pt7b10"> <label class="ml10 mr20"
															style="margin-bottom: 0px;">所有供应商可见</label></a></li>
													<li scope="2"><a href="javascript:void(0);"
														class="pt7b10"> <label class="ml10 mr20"
															style="margin-bottom: 0px;">所有分销商可见</label></a></li>
												</ul> <!---->
											</span>
										</div>
										<div class="pull-right">
											<div class="right lh45 faqi">
												<button class="btn btn-primary once faqi" type="button"
													style="font-size: 14px; padding: 3px 25px;"
													disabled="disabled">发布</button>
											</div>
										</div>
									</div>
								</div>
								<!---->
								<div class="row plr10" id="attachmentRow" style="display: none;"></div>
							</div>
						</div>
						<!--信息输入框 end-->
					</div>
					<!--1 end-->
					<!--2 star-->
					<div id="threeSteps"></div>


					<!--2 end-->
					<!--3 star-->
					<div class="row white mt20" id="userFeeds">
						<div class="row p15">
							<div class="f20 dropdown" id="selectType">
								<a style="text-decoration: none;" href="javascript:void(0);"
									class="dropdown-toggle c0" data-toggle="dropdown"> <span
									name="currentType" cond="0">全部动态</span> <!--<span name="currentTypeCount" class="label label-primary f10">0</span>-->
									<b class="caret"></b>
								</a> <span class="pull-right f14 pt8"></span>
								<!--我参与的任务 下拉菜单 star-->
								<ul class="dropdown-menu" style="width: 127px;">
									<li class="feedsType" feedstype="TOPIC" feedscount="0" cond="0"
										typename="全部动态"><a href="javascript:void(0);"><span
											class="badge"></span> 全部动态</a></li>
									<li class="feedsType" feedstype="CREATE" feedscount="0"
										cond="1" typename="我发起的"><a href="javascript:void(0);"><span
											class="badge"></span> 我发起的 </a></li>
									<li class="feedsType" feedstype="FAVORITE" feedscount="0"
										cond="2" typename="我收藏的"><a href="javascript:void(0);"><span
											class="badge"></span>我收藏的 </a></li>
								</ul>
								<!--我参与的任务 下拉菜单 end-->
							</div>
						</div>
						<!---->
						<div class="divider_line"></div>
						<!--传说中的小黄条-->
						<div class="row xiaohuangtiao" style="display: none;">
							<div class="tc lh30">
								<div class="alert alert-warning" role="alert">
									<a id="xiaohuangtiao" href="javascript:void(0);">有<span
										id="newDiscussNum">10</span>条新的动态
									</a>
								</div>
							</div>
						</div>
						<!--下黄条结束-->
						<!--sns star-->
						<div class="row" style="min-height: 600px;" id="rows">
							<div class="col-md-12 userFeed" discussid="2881">
								<div class="row" style="overflow: hidden;">
									<!--star-->
									<ul class="media-list dicussUl"
										style="margin-bottom: 0px; overflow: hidden">
										<li class="media m-userinfo discuss"
											style="margin-top: 10px; overflow: unset;" discussid="2881"
											commentid="-1">
											<div class="tips" style="display: none;"></div> <a
											href="javascript:void(0);" class="s-avatar_normal pull-left">
												<img width="60" height="60" class="media-object"
												src="../img/portrait.png"> <span class="s-round-mask"></span>
										</a>
											<div class="media-body f14" style="overflow: hidden;">
												<h5 class="media-heading fn c9 lh30 dropdown">

													<a href="http://maijiayun.cn/#" data-toggle="modal"
														data-target="#chatMessageModal" data-tid="71107"
														data-uid="18263"> 管理员 </a> &nbsp; （ <a
														href="http://maijiayun.cn/page.html#gys/homepage/71107"
														target="_blank" class="c9 companyName">石榴枇杷水果销售</a>）：
													<ul class="dropdown-menu companyName">
														<li><a
															href="http://maijiayun.cn/page.html#gys/homepage/71107"
															target="_blank">供应商主页</a></li>


														<li><a href="http://maijiayun.cn/#" rel="tooltip"
															data-type="zhaomu" data-tid="71107" data-toggle="modal"
															data-target="#stopModal">申请成为分销商</a></li>


													</ul>


													<!---->
													<div class="dropdown pull-right">

														<a style="text-decoration: none; visibility: hidden"
															href="javascript:void(0);" class="dropdown-toggle lh8"
															data-toggle="dropdown"> <span
															class="iconfont icon-bottom blue fb"
															style="font-size: 12px;"></span>
														</a>

														<div class="lh8">

															<a style="text-decoration: none;"
																href="javascript:void(0);" class="favorite"> <span
																class="iconfont icon-star themecolor4"
																style="font-size: 14px;" title="收藏"></span>
															</a>

														</div>

													</div>
												</h5>
												<div class="lh20 mb10 pr35 wb" id="showcontent">现在枇杷上市，需要的联系，联系方式15154983872微信同号</div>

												<!--附件-->
												<div class="row">

													<!--文档附件-->


												</div>

												<div class="row mb10 pr20">
													<div class="col-md-6" style="padding-left: 0px;">
														<span class="mr10"><a href="javascript:void(0);"
															class="replyTopic">评论(0)</a></span> <span class="mr10"><a
															href="http://maijiayun.cn/#" data-toggle="modal"
															data-target="#chatMessageModal" data-tid="71107"
															data-uid="18263">私聊</a></span>

													</div>
													<div class="col-md-6 tr c9">

														<span>11月19日 10:22</span>

													</div>
												</div>
												<!---->
												<!--回复 star-->
												<div class="posts" style="display: none" discussid="2881">
													<div class="replyarrow"></div>
													<div class=" mb10 paperclipblock" style="padding: 0px;">
														<div class="replyTopic"></div>
														<div class="row" style="background-color: #fcfcfc;">
															<div class="col-md-12">
																<div class="row">
																	<ul style="margin-bottom: 0px;"
																		class="media-list posts"></ul>
																</div>
															</div>
														</div>
													</div>
													<a href="javascript:void(0);" class="loadComment"
														style="display: none">加载更多评论</a>
												</div>
												<!--回复 end-->
												<div class="divider_line"></div>
											</div>
										</li>
									</ul>
									<!--end-->
								</div>
							</div>
							<div class="col-md-12 userFeed" discussid="2880">
								<div class="row" style="overflow: hidden;">
									<!--star-->
									<ul class="media-list dicussUl"
										style="margin-bottom: 0px; overflow: hidden">
										<li class="media m-userinfo discuss"
											style="margin-top: 10px; overflow: unset;" discussid="2880"
											commentid="-1">
											<div class="tips" style="display: none;"></div> <a
											href="javascript:void(0);" class="s-avatar_normal pull-left">
												<img width="60" height="60" class="media-object"
												src="../img/portrait.png"> <span class="s-round-mask"></span>
										</a>
											<div class="media-body f14" style="overflow: hidden;">
												<h5 class="media-heading fn c9 lh30 dropdown">

													<a href="http://maijiayun.cn/#" data-toggle="modal"
														data-target="#chatMessageModal" data-tid="71063"
														data-uid="18252"> 管理员 </a> &nbsp; （ <a
														href="http://maijiayun.cn/page.html#gys/homepage/71063"
														target="_blank" class="c9 companyName">桥架专家</a>）：
													<ul class="dropdown-menu companyName">
														<li><a
															href="http://maijiayun.cn/page.html#gys/homepage/71063"
															target="_blank">供应商主页</a></li>


														<li><a href="http://maijiayun.cn/#" rel="tooltip"
															data-type="zhaomu" data-tid="71063" data-toggle="modal"
															data-target="#stopModal">申请成为分销商</a></li>


													</ul>


													<!---->
													<div class="dropdown pull-right">

														<a style="text-decoration: none; visibility: hidden"
															href="javascript:void(0);" class="dropdown-toggle lh8"
															data-toggle="dropdown"> <span
															class="iconfont icon-bottom blue fb"
															style="font-size: 12px;"></span>
														</a>

														<div class="lh8">

															<a style="text-decoration: none;"
																href="javascript:void(0);" class="favorite"> <span
																class="iconfont icon-star themecolor4"
																style="font-size: 14px;" title="收藏"></span>
															</a>

														</div>

													</div>
												</h5>
												<div class="lh20 mb10 pr35 wb" id="showcontent">这个只有网页版的吗？</div>

												<!--附件-->
												<div class="row">

													<!--文档附件-->


												</div>

												<div class="row mb10 pr20">
													<div class="col-md-6" style="padding-left: 0px;">
														<span class="mr10"><a href="javascript:void(0);"
															class="replyTopic">评论(0)</a></span> <span class="mr10"><a
															href="http://maijiayun.cn/#" data-toggle="modal"
															data-target="#chatMessageModal" data-tid="71063"
															data-uid="18252">私聊</a></span>

													</div>
													<div class="col-md-6 tr c9">

														<span>11月18日 22:36</span>

													</div>
												</div>
												<!---->
												<!--回复 star-->
												<div class="posts" style="display: none" discussid="2880">
													<div class="replyarrow"></div>
													<div class=" mb10 paperclipblock" style="padding: 0px;">
														<div class="replyTopic"></div>
														<div class="row" style="background-color: #fcfcfc;">
															<div class="col-md-12">
																<div class="row">
																	<ul style="margin-bottom: 0px;"
																		class="media-list posts"></ul>
																</div>
															</div>
														</div>
													</div>
													<a href="javascript:void(0);" class="loadComment"
														style="display: none">加载更多评论</a>
												</div>
												<!--回复 end-->
												<div class="divider_line"></div>
											</div>
										</li>
									</ul>
									<!--end-->
								</div>
							</div>
							<div class="col-md-12 userFeed" discussid="2879">
								<div class="row" style="overflow: hidden;">
									<!--star-->
									<ul class="media-list dicussUl"
										style="margin-bottom: 0px; overflow: hidden">
										<li class="media m-userinfo discuss"
											style="margin-top: 10px; overflow: unset;" discussid="2879"
											commentid="-1">
											<div class="tips" style="display: none;"></div> <a
											href="javascript:void(0);" class="s-avatar_normal pull-left">
												<img width="60" height="60" class="media-object"
												src="../img/1479136338127QQ图片20161105233818.jpg"> <span
												class="s-round-mask"></span>
										</a>
											<div class="media-body f14" style="overflow: hidden;">
												<h5 class="media-heading fn c9 lh30 dropdown">

													<a href="http://maijiayun.cn/#" data-toggle="modal"
														data-target="#chatMessageModal" data-tid="70411"
														data-uid="18083"> 飘落的蒲公英 </a> &nbsp; （ <a
														href="http://maijiayun.cn/page.html#fxs/homepage/70411"
														target="_blank" class="c9 companyName">服装天地</a>）：
													<ul class="dropdown-menu companyName">
														<li><a
															href="http://maijiayun.cn/page.html#fxs/homepage/70411"
															target="_blank">分销商主页</a></li>



													</ul>


													<!---->
													<div class="dropdown pull-right">

														<a style="text-decoration: none; visibility: hidden"
															href="javascript:void(0);" class="dropdown-toggle lh8"
															data-toggle="dropdown"> <span
															class="iconfont icon-bottom blue fb"
															style="font-size: 12px;"></span>
														</a>

														<div class="lh8">

															<a style="text-decoration: none;"
																href="javascript:void(0);" class="favorite"> <span
																class="iconfont icon-star themecolor4"
																style="font-size: 14px;" title="收藏"></span>
															</a>

														</div>

													</div>
												</h5>
												<div class="lh20 mb10 pr35 wb" id="showcontent">以最优质的产品为大家服务</div>

												<!--附件-->
												<div class="row">

													<!--文档附件-->


												</div>

												<div class="row mb10 pr20">
													<div class="col-md-6" style="padding-left: 0px;">
														<span class="mr10"><a href="javascript:void(0);"
															class="replyTopic">评论(0)</a></span> <span class="mr10"><a
															href="http://maijiayun.cn/#" data-toggle="modal"
															data-target="#chatMessageModal" data-tid="70411"
															data-uid="18083">私聊</a></span>

													</div>
													<div class="col-md-6 tr c9">

														<span>11月18日 21:39</span>

													</div>
												</div>
												<!---->
												<!--回复 star-->
												<div class="posts" style="display: none" discussid="2879">
													<div class="replyarrow"></div>
													<div class=" mb10 paperclipblock" style="padding: 0px;">
														<div class="replyTopic"></div>
														<div class="row" style="background-color: #fcfcfc;">
															<div class="col-md-12">
																<div class="row">
																	<ul style="margin-bottom: 0px;"
																		class="media-list posts"></ul>
																</div>
															</div>
														</div>
													</div>
													<a href="javascript:void(0);" class="loadComment"
														style="display: none">加载更多评论</a>
												</div>
												<!--回复 end-->
												<div class="divider_line"></div>
											</div>
										</li>
									</ul>
									<!--end-->
								</div>
							</div>
							<div class="col-md-12 userFeed" discussid="2878">
								<div class="row" style="overflow: hidden;">
									<!--star-->
									<ul class="media-list dicussUl"
										style="margin-bottom: 0px; overflow: hidden">
										<li class="media m-userinfo discuss"
											style="margin-top: 10px; overflow: unset;" discussid="2878"
											commentid="-1">
											<div class="tips" style="display: none;"></div> <a
											href="javascript:void(0);" class="s-avatar_normal pull-left">
												<img width="60" height="60" class="media-object"
												src="../img/1479460859342侠客全球行LOGO.jpg"> <span
												class="s-round-mask"></span>
										</a>
											<div class="media-body f14" style="overflow: hidden;">
												<h5 class="media-heading fn c9 lh30 dropdown">

													<a href="http://maijiayun.cn/#" data-toggle="modal"
														data-target="#chatMessageModal" data-tid="70999"
														data-uid="18236"> 侠客全球行 </a> &nbsp; （ <a
														href="http://maijiayun.cn/page.html#gys/homepage/70999"
														target="_blank" class="c9 companyName">河南世信国际货运代理有限公司</a>）：
													<ul class="dropdown-menu companyName">
														<li><a
															href="http://maijiayun.cn/page.html#gys/homepage/70999"
															target="_blank">供应商主页</a></li>


														<li><a href="http://maijiayun.cn/#" rel="tooltip"
															data-type="zhaomu" data-tid="70999" data-toggle="modal"
															data-target="#stopModal">申请成为分销商</a></li>


													</ul>


													<!---->
													<div class="dropdown pull-right">

														<a style="text-decoration: none; visibility: hidden"
															href="javascript:void(0);" class="dropdown-toggle lh8"
															data-toggle="dropdown"> <span
															class="iconfont icon-bottom blue fb"
															style="font-size: 12px;"></span>
														</a>

														<div class="lh8">

															<a style="text-decoration: none;"
																href="javascript:void(0);" class="favorite"> <span
																class="iconfont icon-star themecolor4"
																style="font-size: 14px;" title="收藏"></span>
															</a>

														</div>

													</div>
												</h5>
												<div class="lh20 mb10 pr35 wb" id="showcontent">我公司以国内销售贸易、批发零售贸易和进出口贸易为主，诚招淘宝、微商、各级代理，支持一件代发，有需要了可以直接联系我，18037579516</div>

												<!--附件-->
												<div class="row">

													<!--文档附件-->


												</div>

												<div class="row mb10 pr20">
													<div class="col-md-6" style="padding-left: 0px;">
														<span class="mr10"><a href="javascript:void(0);"
															class="replyTopic">评论(0)</a></span> <span class="mr10"><a
															href="http://maijiayun.cn/#" data-toggle="modal"
															data-target="#chatMessageModal" data-tid="70999"
															data-uid="18236">私聊</a></span>

													</div>
													<div class="col-md-6 tr c9">

														<span>11月18日 16:20</span>

													</div>
												</div>
												<!---->
												<!--回复 star-->
												<div class="posts" style="display: none" discussid="2878">
													<div class="replyarrow"></div>
													<div class=" mb10 paperclipblock" style="padding: 0px;">
														<div class="replyTopic"></div>
														<div class="row" style="background-color: #fcfcfc;">
															<div class="col-md-12">
																<div class="row">
																	<ul style="margin-bottom: 0px;"
																		class="media-list posts"></ul>
																</div>
															</div>
														</div>
													</div>
													<a href="javascript:void(0);" class="loadComment"
														style="display: none">加载更多评论</a>
												</div>
												<!--回复 end-->
												<div class="divider_line"></div>
											</div>
										</li>
									</ul>
									<!--end-->
								</div>
							</div>
							<div class="col-md-12 userFeed" discussid="2877">
								<div class="row" style="overflow: hidden;">
									<!--star-->
									<ul class="media-list dicussUl"
										style="margin-bottom: 0px; overflow: hidden">
										<li class="media m-userinfo discuss"
											style="margin-top: 10px; overflow: unset;" discussid="2877"
											commentid="-1">
											<div class="tips" style="display: none;"></div> <a
											href="javascript:void(0);" class="s-avatar_normal pull-left">
												<img width="60" height="60" class="media-object"
												src="../img/portrait.png"> <span class="s-round-mask"></span>
										</a>
											<div class="media-body f14" style="overflow: hidden;">
												<h5 class="media-heading fn c9 lh30 dropdown">

													<a href="http://maijiayun.cn/#" data-toggle="modal"
														data-target="#chatMessageModal" data-tid="70508"
														data-uid="18077"> 管理员 </a> &nbsp; （ <a
														href="http://maijiayun.cn/page.html#gys/homepage/70508"
														target="_blank" class="c9 companyName">xa测试</a>）：
													<ul class="dropdown-menu companyName">
														<li><a
															href="http://maijiayun.cn/page.html#gys/homepage/70508"
															target="_blank">供应商主页</a></li>


														<li><a href="http://maijiayun.cn/#" rel="tooltip"
															data-type="zhaomu" data-tid="70508" data-toggle="modal"
															data-target="#stopModal">申请成为分销商</a></li>


													</ul>


													<!---->
													<div class="dropdown pull-right">

														<a style="text-decoration: none; visibility: hidden"
															href="javascript:void(0);" class="dropdown-toggle lh8"
															data-toggle="dropdown"> <span
															class="iconfont icon-bottom blue fb"
															style="font-size: 12px;"></span>
														</a>

														<div class="lh8">

															<a style="text-decoration: none;"
																href="javascript:void(0);" class="favorite"> <span
																class="iconfont icon-star themecolor4"
																style="font-size: 14px;" title="收藏"></span>
															</a>

														</div>

													</div>
												</h5>
												<div class="lh20 mb10 pr35 wb" id="showcontent">卖家云不错，只是有演示数据的话，就更好了。</div>

												<!--附件-->
												<div class="row">

													<!--文档附件-->


												</div>

												<div class="row mb10 pr20">
													<div class="col-md-6" style="padding-left: 0px;">
														<span class="mr10"><a href="javascript:void(0);"
															class="replyTopic">评论(1)</a></span> <span class="mr10"><a
															href="http://maijiayun.cn/#" data-toggle="modal"
															data-target="#chatMessageModal" data-tid="70508"
															data-uid="18077">私聊</a></span>

													</div>
													<div class="col-md-6 tr c9">

														<span>11月18日 14:10</span>

													</div>
												</div>
												<!---->
												<!--回复 star-->
												<div class="posts" style="display: none" discussid="2877">
													<div class="replyarrow"></div>
													<div class=" mb10 paperclipblock" style="padding: 0px;">
														<div class="replyTopic"></div>
														<div class="row" style="background-color: #fcfcfc;">
															<div class="col-md-12">
																<div class="row">
																	<ul style="margin-bottom: 0px;"
																		class="media-list posts"></ul>
																</div>
															</div>
														</div>
													</div>
													<a href="javascript:void(0);" class="loadComment"
														style="display: none">加载更多评论</a>
												</div>
												<!--回复 end-->
												<div class="divider_line"></div>
											</div>
										</li>
									</ul>
									<!--end-->
								</div>
							</div>
							<div class="col-md-12 userFeed" discussid="2876">
								<div class="row" style="overflow: hidden;">
									<!--star-->
									<ul class="media-list dicussUl"
										style="margin-bottom: 0px; overflow: hidden">
										<li class="media m-userinfo discuss"
											style="margin-top: 10px; overflow: unset;" discussid="2876"
											commentid="-1">
											<div class="tips" style="display: none;"></div> <a
											href="javascript:void(0);" class="s-avatar_normal pull-left">
												<img width="60" height="60" class="media-object"
												src="../img/portrait.png"> <span class="s-round-mask"></span>
										</a>
											<div class="media-body f14" style="overflow: hidden;">
												<h5 class="media-heading fn c9 lh30 dropdown">

													<a href="http://maijiayun.cn/#" data-toggle="modal"
														data-target="#chatMessageModal" data-tid="7665"
														data-uid="2274"> 刘高才 </a> &nbsp; （ <a
														href="http://maijiayun.cn/page.html#gys/homepage/7665"
														target="_blank" class="c9 companyName">优食汇商贸</a>）：
													<ul class="dropdown-menu companyName">
														<li><a
															href="http://maijiayun.cn/page.html#gys/homepage/7665"
															target="_blank">供应商主页</a></li>


														<li><a href="http://maijiayun.cn/#" rel="tooltip"
															data-type="zhaomu" data-tid="7665" data-toggle="modal"
															data-target="#stopModal">申请成为分销商</a></li>


													</ul>


													<!---->
													<div class="dropdown pull-right">

														<a style="text-decoration: none; visibility: hidden"
															href="javascript:void(0);" class="dropdown-toggle lh8"
															data-toggle="dropdown"> <span
															class="iconfont icon-bottom blue fb"
															style="font-size: 12px;"></span>
														</a>

														<div class="lh8">

															<a style="text-decoration: none;"
																href="javascript:void(0);" class="favorite"> <span
																class="iconfont icon-star themecolor4"
																style="font-size: 14px;" title="收藏"></span>
															</a>

														</div>

													</div>
												</h5>
												<div class="lh20 mb10 pr35 wb" id="showcontent">本公司主营年货礼品，中秋月饼,
													名优水果，地方特产等季节性产品。采取线上平台和线下团队营销模式,承接零售,团购及企事业单位礼品定制业务.
													我们始终坚持"诚信为本,用心服务"的经营理念,引领健康、高品质的生活,
													全方位地为客户提供最优质的产品。优品荟萃旗舰平台期待与您的合作!</div>

												<!--附件-->
												<div class="row">

													<!--文档附件-->


												</div>

												<div class="row mb10 pr20">
													<div class="col-md-6" style="padding-left: 0px;">
														<span class="mr10"><a href="javascript:void(0);"
															class="replyTopic">评论(0)</a></span> <span class="mr10"><a
															href="http://maijiayun.cn/#" data-toggle="modal"
															data-target="#chatMessageModal" data-tid="7665"
															data-uid="2274">私聊</a></span>

													</div>
													<div class="col-md-6 tr c9">

														<span>11月18日 00:47</span>

													</div>
												</div>
												<!---->
												<!--回复 star-->
												<div class="posts" style="display: none" discussid="2876">
													<div class="replyarrow"></div>
													<div class=" mb10 paperclipblock" style="padding: 0px;">
														<div class="replyTopic"></div>
														<div class="row" style="background-color: #fcfcfc;">
															<div class="col-md-12">
																<div class="row">
																	<ul style="margin-bottom: 0px;"
																		class="media-list posts"></ul>
																</div>
															</div>
														</div>
													</div>
													<a href="javascript:void(0);" class="loadComment"
														style="display: none">加载更多评论</a>
												</div>
												<!--回复 end-->
												<div class="divider_line"></div>
											</div>
										</li>
									</ul>
									<!--end-->
								</div>
							</div>
							<div class="col-md-12 userFeed" discussid="2875">
								<div class="row" style="overflow: hidden;">
									<!--star-->
									<ul class="media-list dicussUl"
										style="margin-bottom: 0px; overflow: hidden">
										<li class="media m-userinfo discuss"
											style="margin-top: 10px; overflow: unset;" discussid="2875"
											commentid="-1">
											<div class="tips" style="display: none;"></div> <a
											href="javascript:void(0);" class="s-avatar_normal pull-left">
												<img width="60" height="60" class="media-object"
												src="../img/1479387018560IMG_20141105_170526_副本.jpg"> <span
												class="s-round-mask"></span>
										</a>
											<div class="media-body f14" style="overflow: hidden;">
												<h5 class="media-heading fn c9 lh30 dropdown">

													<a href="http://maijiayun.cn/#" data-toggle="modal"
														data-target="#chatMessageModal" data-tid="70612"
														data-uid="18103"> 熊晓琦 </a> &nbsp; （ <a
														href="http://maijiayun.cn/page.html#gys/homepage/70612"
														target="_blank" class="c9 companyName">江西之家特产百货</a>）：
													<ul class="dropdown-menu companyName">
														<li><a
															href="http://maijiayun.cn/page.html#gys/homepage/70612"
															target="_blank">供应商主页</a></li>


														<li><a href="http://maijiayun.cn/#" rel="tooltip"
															data-type="zhaomu" data-tid="70612" data-toggle="modal"
															data-target="#stopModal">申请成为分销商</a></li>


													</ul>


													<!---->
													<div class="dropdown pull-right">

														<a style="text-decoration: none; visibility: hidden"
															href="javascript:void(0);" class="dropdown-toggle lh8"
															data-toggle="dropdown"> <span
															class="iconfont icon-bottom blue fb"
															style="font-size: 12px;"></span>
														</a>

														<div class="lh8">

															<a style="text-decoration: none;"
																href="javascript:void(0);" class="favorite"> <span
																class="iconfont icon-star themecolor4"
																style="font-size: 14px;" title="收藏"></span>
															</a>

														</div>

													</div>
												</h5>
												<div class="lh20 mb10 pr35 wb" id="showcontent">测试</div>

												<!--附件-->
												<div class="row">

													<!--文档附件-->


												</div>

												<div class="row mb10 pr20">
													<div class="col-md-6" style="padding-left: 0px;">
														<span class="mr10"><a href="javascript:void(0);"
															class="replyTopic">评论(0)</a></span> <span class="mr10"><a
															href="http://maijiayun.cn/#" data-toggle="modal"
															data-target="#chatMessageModal" data-tid="70612"
															data-uid="18103">私聊</a></span>

													</div>
													<div class="col-md-6 tr c9">

														<span>11月17日 20:50</span>

													</div>
												</div>
												<!---->
												<!--回复 star-->
												<div class="posts" style="display: none" discussid="2875">
													<div class="replyarrow"></div>
													<div class=" mb10 paperclipblock" style="padding: 0px;">
														<div class="replyTopic"></div>
														<div class="row" style="background-color: #fcfcfc;">
															<div class="col-md-12">
																<div class="row">
																	<ul style="margin-bottom: 0px;"
																		class="media-list posts"></ul>
																</div>
															</div>
														</div>
													</div>
													<a href="javascript:void(0);" class="loadComment"
														style="display: none">加载更多评论</a>
												</div>
												<!--回复 end-->
												<div class="divider_line"></div>
											</div>
										</li>
									</ul>
									<!--end-->
								</div>
							</div>
							<div class="col-md-12 userFeed" discussid="2873">
								<div class="row" style="overflow: hidden;">
									<!--star-->
									<ul class="media-list dicussUl"
										style="margin-bottom: 0px; overflow: hidden">
										<li class="media m-userinfo discuss"
											style="margin-top: 10px; overflow: unset;" discussid="2873"
											commentid="-1">
											<div class="tips" style="display: none;"></div> <a
											href="javascript:void(0);" class="s-avatar_normal pull-left">
												<img width="60" height="60" class="media-object"
												src="../img/portrait.png"> <span class="s-round-mask"></span>
										</a>
											<div class="media-body f14" style="overflow: hidden;">
												<h5 class="media-heading fn c9 lh30 dropdown">

													<a href="http://maijiayun.cn/#" data-toggle="modal"
														data-target="#chatMessageModal" data-tid="70282"
														data-uid="17962"> 管理员 </a> &nbsp; （ <a
														href="http://maijiayun.cn/page.html#fxs/homepage/70282"
														target="_blank" class="c9 companyName">利民超市</a>）：
													<ul class="dropdown-menu companyName">
														<li><a
															href="http://maijiayun.cn/page.html#fxs/homepage/70282"
															target="_blank">分销商主页</a></li>



													</ul>


													<!---->
													<div class="dropdown pull-right">

														<a style="text-decoration: none; visibility: hidden"
															href="javascript:void(0);" class="dropdown-toggle lh8"
															data-toggle="dropdown"> <span
															class="iconfont icon-bottom blue fb"
															style="font-size: 12px;"></span>
														</a>

														<div class="lh8">

															<a style="text-decoration: none;"
																href="javascript:void(0);" class="favorite"> <span
																class="iconfont icon-star themecolor4"
																style="font-size: 14px;" title="收藏"></span>
															</a>

														</div>

													</div>
												</h5>
												<div class="lh20 mb10 pr35 wb" id="showcontent">123123</div>

												<!--附件-->
												<div class="row">

													<!--文档附件-->


												</div>

												<div class="row mb10 pr20">
													<div class="col-md-6" style="padding-left: 0px;">
														<span class="mr10"><a href="javascript:void(0);"
															class="replyTopic">评论(0)</a></span> <span class="mr10"><a
															href="http://maijiayun.cn/#" data-toggle="modal"
															data-target="#chatMessageModal" data-tid="70282"
															data-uid="17962">私聊</a></span>

													</div>
													<div class="col-md-6 tr c9">

														<span>11月17日 18:31</span>

													</div>
												</div>
												<!---->
												<!--回复 star-->
												<div class="posts" style="display: none" discussid="2873">
													<div class="replyarrow"></div>
													<div class=" mb10 paperclipblock" style="padding: 0px;">
														<div class="replyTopic"></div>
														<div class="row" style="background-color: #fcfcfc;">
															<div class="col-md-12">
																<div class="row">
																	<ul style="margin-bottom: 0px;"
																		class="media-list posts"></ul>
																</div>
															</div>
														</div>
													</div>
													<a href="javascript:void(0);" class="loadComment"
														style="display: none">加载更多评论</a>
												</div>
												<!--回复 end-->
												<div class="divider_line"></div>
											</div>
										</li>
									</ul>
									<!--end-->
								</div>
							</div>
							<div class="col-md-12 userFeed" discussid="2872">
								<div class="row" style="overflow: hidden;">
									<!--star-->
									<ul class="media-list dicussUl"
										style="margin-bottom: 0px; overflow: hidden">
										<li class="media m-userinfo discuss"
											style="margin-top: 10px; overflow: unset;" discussid="2872"
											commentid="-1">
											<div class="tips" style="display: none;"></div> <a
											href="javascript:void(0);" class="s-avatar_normal pull-left">
												<img width="60" height="60" class="media-object"
												src="../img/portrait.png"> <span class="s-round-mask"></span>
										</a>
											<div class="media-body f14" style="overflow: hidden;">
												<h5 class="media-heading fn c9 lh30 dropdown">

													<a href="http://maijiayun.cn/#" data-toggle="modal"
														data-target="#chatMessageModal" data-tid="70282"
														data-uid="17962"> 管理员 </a> &nbsp; （ <a
														href="http://maijiayun.cn/page.html#fxs/homepage/70282"
														target="_blank" class="c9 companyName">利民超市</a>）：
													<ul class="dropdown-menu companyName">
														<li><a
															href="http://maijiayun.cn/page.html#fxs/homepage/70282"
															target="_blank">分销商主页</a></li>



													</ul>


													<!---->
													<div class="dropdown pull-right">

														<a style="text-decoration: none; visibility: hidden"
															href="javascript:void(0);" class="dropdown-toggle lh8"
															data-toggle="dropdown"> <span
															class="iconfont icon-bottom blue fb"
															style="font-size: 12px;"></span>
														</a>

														<div class="lh8">

															<a style="text-decoration: none;"
																href="javascript:void(0);" class="favorite"> <span
																class="iconfont icon-star themecolor4"
																style="font-size: 14px;" title="收藏"></span>
															</a>

														</div>

													</div>
												</h5>
												<div class="lh20 mb10 pr35 wb" id="showcontent">123123</div>

												<!--附件-->
												<div class="row">

													<!--文档附件-->


												</div>

												<div class="row mb10 pr20">
													<div class="col-md-6" style="padding-left: 0px;">
														<span class="mr10"><a href="javascript:void(0);"
															class="replyTopic">评论(0)</a></span> <span class="mr10"><a
															href="http://maijiayun.cn/#" data-toggle="modal"
															data-target="#chatMessageModal" data-tid="70282"
															data-uid="17962">私聊</a></span>

													</div>
													<div class="col-md-6 tr c9">

														<span>11月17日 18:31</span>

													</div>
												</div>
												<!---->
												<!--回复 star-->
												<div class="posts" style="display: none" discussid="2872">
													<div class="replyarrow"></div>
													<div class=" mb10 paperclipblock" style="padding: 0px;">
														<div class="replyTopic"></div>
														<div class="row" style="background-color: #fcfcfc;">
															<div class="col-md-12">
																<div class="row">
																	<ul style="margin-bottom: 0px;"
																		class="media-list posts"></ul>
																</div>
															</div>
														</div>
													</div>
													<a href="javascript:void(0);" class="loadComment"
														style="display: none">加载更多评论</a>
												</div>
												<!--回复 end-->
												<div class="divider_line"></div>
											</div>
										</li>
									</ul>
									<!--end-->
								</div>
							</div>
							<div class="col-md-12 userFeed" discussid="2871">
								<div class="row" style="overflow: hidden;">
									<!--star-->
									<ul class="media-list dicussUl"
										style="margin-bottom: 0px; overflow: hidden">
										<li class="media m-userinfo discuss"
											style="margin-top: 10px; overflow: unset;" discussid="2871"
											commentid="-1">
											<div class="tips" style="display: none;"></div> <a
											href="javascript:void(0);" class="s-avatar_normal pull-left">
												<img width="60" height="60" class="media-object"
												src="../img/portrait.png"> <span class="s-round-mask"></span>
										</a>
											<div class="media-body f14" style="overflow: hidden;">
												<h5 class="media-heading fn c9 lh30 dropdown">

													<a href="http://maijiayun.cn/#" data-toggle="modal"
														data-target="#chatMessageModal" data-tid="70734"
														data-uid="18078"> 管理员 </a> &nbsp; （ <a
														href="http://maijiayun.cn/page.html#gys/homepage/70734"
														target="_blank" class="c9 companyName">GSSM</a>）：
													<ul class="dropdown-menu companyName">
														<li><a
															href="http://maijiayun.cn/page.html#gys/homepage/70734"
															target="_blank">供应商主页</a></li>


														<li><a href="http://maijiayun.cn/#" rel="tooltip"
															data-type="zhaomu" data-tid="70734" data-toggle="modal"
															data-target="#stopModal">申请成为分销商</a></li>


													</ul>


													<!---->
													<div class="dropdown pull-right">

														<a style="text-decoration: none; visibility: hidden"
															href="javascript:void(0);" class="dropdown-toggle lh8"
															data-toggle="dropdown"> <span
															class="iconfont icon-bottom blue fb"
															style="font-size: 12px;"></span>
														</a>

														<div class="lh8">

															<a style="text-decoration: none;"
																href="javascript:void(0);" class="favorite"> <span
																class="iconfont icon-star themecolor4"
																style="font-size: 14px;" title="收藏"></span>
															</a>

														</div>

													</div>
												</h5>
												<div class="lh20 mb10 pr35 wb" id="showcontent">三木商贸</div>

												<!--附件-->
												<div class="row">

													<!--文档附件-->


												</div>

												<div class="row mb10 pr20">
													<div class="col-md-6" style="padding-left: 0px;">
														<span class="mr10"><a href="javascript:void(0);"
															class="replyTopic">评论(0)</a></span> <span class="mr10"><a
															href="http://maijiayun.cn/#" data-toggle="modal"
															data-target="#chatMessageModal" data-tid="70734"
															data-uid="18078">私聊</a></span>

													</div>
													<div class="col-md-6 tr c9">

														<span>11月16日 21:35</span>

													</div>
												</div>
												<!---->
												<!--回复 star-->
												<div class="posts" style="display: none" discussid="2871">
													<div class="replyarrow"></div>
													<div class=" mb10 paperclipblock" style="padding: 0px;">
														<div class="replyTopic"></div>
														<div class="row" style="background-color: #fcfcfc;">
															<div class="col-md-12">
																<div class="row">
																	<ul style="margin-bottom: 0px;"
																		class="media-list posts"></ul>
																</div>
															</div>
														</div>
													</div>
													<a href="javascript:void(0);" class="loadComment"
														style="display: none">加载更多评论</a>
												</div>
												<!--回复 end-->
												<div class="divider_line"></div>
											</div>
										</li>
									</ul>
									<!--end-->
								</div>
							</div>
						</div>
						<!--sns end-->
					</div>
					<!--3 end-->
				</div>
				<!--center end-->
				<!--right star-->
				<div class="col-lg-3">
					<!--1 star-->
					<div class="row white p15">
						<div class="media m-userinfo">
							<a href="javascript:void(0);"  data-toggle="modal" data-target="#edit_accountModal"   class="s-avatar_big pull-left mr10">
								<span class="s-edit-mask">个人信息</span> <img id="userAvatorUrl"
								src="../img/1479106991441209_s.jpg" width="80" height="80"> <span
								class="s-round-mask editUserInfo"></span>
							</a>
							<div class="media-body">
								<div style="overflow: hidden;" class="media-heading f20">blue</div>
								<div class="row mt20 mb5">
									<div class="f12 c6">
										<a href="javascript:void(0);" class="editUserInfo"  data-toggle="modal" data-target="#edit_accountModal">
											修改个人信息</a>
									</div>
								</div>
							</div>
						</div>

						<div class="row p10 themebgcolor3 mt15">
							对卖家云进行系统设置， <a id="setTenantryFunction"
								href="javascript:void(0);" data-toggle="modal"> <span
								class=" white_font themebgcolor4">选择系统功能</span>
							</a>
						</div>
						<script>
							$("#setTenantryFunction").on('click', function() {
								window.location.href = "setSystem";
							});
						</script>
					</div>
					<!--1 end-->
					<!--3-2 star-->
					<div id="myColleaguesDiv"></div>
					<!--3-2 end-->
					<!--4 star-->
					<!--<div class="row themebordercolor5 mt20 p15">-->
					<!--<div class="row tc mb10"><img src="img/listen_pic.png" width="225" height="72"></div>-->
					<!--<div class="row">-->
					<!--<a id="addNewRequirement" href="javascript:void(0);" data-toggle="modal" >-->
					<!--<div class="pull-left listen">-->
					<!--<div class="listen_text">新需求</div>-->
					<!--</div>-->
					<!--</a>-->
					<!--<a id="addSystemProblem" href="javascript:void(0);" data-toggle="modal" >-->
					<!--<div class="pull-right listen">-->
					<!--<div class="listen_text">系统问题</div>-->
					<!--</div>-->
					<!--</a>-->
					<!--</div>-->
					<!--</div>-->
					<!--4 end-->

					<div class="row white mt20">
						<a href="http://maijiayun.cn/#" data-toggle="modal"
							data-target="#inviteContactModal" data-tab="fenxiao"><img
							width="263" height="190" src="../img/yaoqing2.jpg"></a>
					</div>


					<!--搜索 star-->
					<div class="row white mt20">
						<div class="p15">
							<div class="has-feedback dropdown">
								<input type="text" id="searchCompanyInput"
									class="form-control input-sm dropdown-toggle"
									placeholder="按照公司名称查找供应商，分销商" data-toggle="dropdown"> <span
									id="searchCompanyButton"
									class="glyphicon glyphicon-search form-control-feedback c9"
									style="width: 30px; height: 30px; line-height: 30px;"></span>
								<!---->
								<div class="dropdown-menu row" role="menu"
									style="padding-top: 0" id="searchCompanyResult"></div>
								<!---->
							</div>
						</div>
					</div>
					<!--搜索 end-->

					<!--推荐 star-->
					<div class="row white mt20" id="recommendationShowcase" style="">
						<div class="themebordercolor3">
							<div class="row p15">
								<div class="f20">推荐供应商</div>
							</div>
						</div>
						<div class="divider_line"></div>
						<div class="themebordercolor2">
							<div class="row">
								<ul class="media-list">
									<div class="p15">
										<a href="http://maijiayun.cn/page.html#gys/homepage/1039"
											target="_blank">
											<div class="">
												<img src="../img/tuijian02.jpg" width="230px;" height="170px;">
											</div>
											<div class=" lh40 tc f14">飞耐时户外</div>
										</a>
										<div class="divider"></div>
									</div>
								</ul>
							</div>
						</div>
					</div>
					<!--推荐 end-->

					<!--5 star-->
					<div class="row white mt20">
						<div class="themebordercolor3">
							<div class="row p15">
								<div class="f20">公告</div>
							</div>
						</div>
						<div class="divider_line"></div>
						<div class="themebordercolor2">
							<div class="row">
								<ul class="list-group" style="margin-bottom: 0px;">

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="23">卖家云版本更新-20160107</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="22">卖家云版本更新-20151221</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="21">卖家云版本更新-20151217</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="20">卖家云版本更新-20150826</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="19">卖家云版本更新-20150604</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="18">卖家云版本更新-20150505</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="17">卖家云版本更新-20150403</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="16">卖家云版本更新-20150128</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="15">卖家云版本更新-20150123</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="14">卖家云版本更新-20150113</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="13">卖家云版本更新-20150107</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="12">卖家云版本更新-20141225</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="11">卖家云版本更新-20141212</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="10">卖家云紧急公告-20141205</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="9">卖家云版本更新-20141125</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="8">卖家云版本更新-20141119</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="7">卖家云电子面单上线啦</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="6">卖家云电子面单内测</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="5">卖家云版本更新-20141029</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="4">卖家云版本更新-20141017</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="3">卖家云版本更新-20140928</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="2">卖家云版本更新-20140917</a>
										</div>
									</li>

									<li class="list-group-item themebordercolor0 themebgcolor2">
										<div class="f12">
											<a href="javascript:void(0);" class="c3" bulletinid="1">亲,恭喜您获得卖家云免费使用权</a>
										</div>
									</li>

								</ul>
							</div>
						</div>
					</div>
					<!--5 end-->
				</div>
				<!--right end-->
			</div>
			<!--欢迎公告-->
			<div aria-hidden="false" role="dialog" tabindex="-1"
				class="modal fade" id="bulletin" style="z-index: 1500;"></div>
			<!--分销申请-->
			<div class="modal fade" id="stopModal" tabindex="-1" role="dialog"
				aria-labelledby="stopModalLabel" aria-hidden="true">
				<div style="width: 530px;" class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button aria-hidden="true" data-dismiss="modal" class="close"
								type="button">×</button>
							<h4 class="modal-title" id="stopModalLabel">申请招募</h4>
						</div>
						<div class="modal-body">
							<div class="row f14 mb10">
								<div class="talkcontent">
									<div class="talkcontainer">
										<div class="container_input_box f14">
											<textarea data-mentions-input="true"
												style="height: 80px; overflow-y: hidden; border: 1px solid #cccccc; padding: 5px 10px;"
												id="textarea_Updater" placeholder="请填写合作意向..."
												class="TextArea c9"></textarea>
										</div>
									</div>
								</div>
							</div>
							<!--end-->
						</div>
						<div class="modal-footer" style="margin-top: 0px;">
							<button type="button" class="btn btn-primary" id="btntermSure">确定</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal" id="btntermCancel">取消</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
		</div>
		<!--Layout right part end-->

		<div id="spinner" style="display: none;">
			<div class="modal fade" aria-hidden="false" role="dialog"
				tabindex="-1" style="display: block;">
				<div class="modal-dialog tc" style="margin-top: 300px;">
					<img src="../img/loading3.gif">
				</div>
			</div>
			<div class="modal-backdrop fade" style="background: #ffffff;"></div>
		</div>

		
		<div id="chatMessageModal" class="modal fade ng-scope"
			aria-hidden="true">
			<div class="right w-xxl bg-white md-whiteframe-z2 ng-scope" style="">
				<div class="chatbox ng-scope">
					<!---->
					<div class="p-h-md tc bgf1">
						<a class="pull-right text-muted-lt text-2x m-t-n inline p-sm"
							data-dismiss="modal" href="http://maijiayun.cn/#">×</a> <a
							class="pull-left f18" data-toggle="modal"
							data-target="#chatContactModal" data-dismiss="modal"
							href="http://maijiayun.cn/#"> <span
							class="glyphicon glyphicon-arrow-left"></span>
						</a> <strong><span id="chatUserName">&nbsp;</span></strong>
					</div>
					<!---->
					<div class="box-row">
						<div class="box-cell" id="chatMessageScrollBox">
							<div class="box-inner m-userinfo">
								<div class="p-md">
									<div id="chatMessageCheckHistory">
										<div class="clear tc">
											<div class="p p-v-xs inline">&nbsp;</div>
										</div>
									</div>
									<div id="chatMessageTopTimeDivider"></div>
									<div id="chatMessageList"></div>
								</div>
							</div>
						</div>
					</div>
					<!---->
					<div class="p-h-md p-v bgf1">
						<div class="ng-pristine ng-valid">
							<div class="input-group">
								<input type="text" placeholder="按回车发送消息" autocomplete="off"
									class="form-control" id="sendChatMessageInput"> <span
									class="input-group-btn">
									<button type="button" class="btn btn-primary"
										id="sendChatMessageButton">发送</button>
								</span>
							</div>
						</div>
					</div>
					<!---->
				</div>
			</div>
		</div>
		<div data-backdrop="false" id="chatGroupSendingModal"
			class="modal fade ng-scope" aria-hidden="true">
			<div class="right w-xl bg-white md-whiteframe-z2 ng-scope" style="">
				<div class="chatbox ng-scope">
					<!--1-->
					<div class="p-h-md tc">
						<a class="pull-right text-muted-lt text-2x m-t-n inline p-sm"
							data-dismiss="modal" href="http://maijiayun.cn/#">×</a> <a
							class="pull-left f18" data-toggle="modal"
							data-target="#chatContactModal" data-dismiss="modal"
							href="http://maijiayun.cn/#" id="chatGroupSendingBack"> <span
							class="glyphicon glyphicon-arrow-left"></span>
						</a> <strong>选择联系人</strong>
					</div>
					<!--搜索-->
					<div class="row p-h-plr">
						<div class="has-feedback dropdown">
							<input type="text" data-toggle="dropdown"
								placeholder="查找公司/姓名/手机"
								class="form-control input-sm dropdown-toggle"
								id="chatGroupSendingSearchBox"> <span
								style="width: 30px; height: 30px; line-height: 30px;"
								class="glyphicon glyphicon-search form-control-feedback c9"></span>
							<!---->
							<div style="padding-top: 0" role="menu" class="dropdown-menu row">
								<ul class="media-list m-userinfo scrollspy-example "
									style="margin-bottom: 0px; max-height: 470px; margin-top: 0px;"
									id="chatGroupSendingSearchResult">
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
								<ul class="media-list m-userinfo scrollspy-example"
									style="margin-bottom: 0px; height: 100%; margin-top: 0px;"
									id="chatGroupSendingContactList">
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
									<ul class="scrollspy-example"
										style="margin-bottom: 0px; height: 100%; margin-top: 0px;"
										id="chatGroupSendingSelectedList">
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!--3-->
					<div class="p-h-md p-v bgf1">
						<div class="ng-pristine ng-valid">
							<div class="input-group">
								<input type="text" placeholder="按回车发送消息" autocomplete="off"
									class="form-control" id="sendChatGroupMessageInput"> <span
									class="input-group-btn">
									<button type="button" class="btn btn-primary"
										id="sendChatGroupMessageButton">发送</button>
								</span>
							</div>
						</div>
					</div>
					<!--end-->
				</div>
			</div>
		</div>
		<div id="inviteContactModal" class="modal fade" tabindex="-1"
			role="dialog" aria-labelledby="inviteContactModalLabel"
			aria-hidden="true">
			<div style="width: 795px;" class="modal-dialog">
				<div class="modal-content">
					<div
						class="collapse navbar-collapse navbar-default navbar-titletab"
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
												<input type="text" name="userName" class="form-control"
													placeholder="被邀请人的姓名(必填)"> <span
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
												<input type="text" name="userPhone" class="form-control"
													placeholder="被邀请人的手机号(必填)"> <span
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
												<input type="text" name="userEmail" class="form-control"
													placeholder="被邀请人的Email地址(非必填)"> <span
													class="glyphicon form-control-feedback"></span>
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
												<div class="col-md-12 selectblock">
													<ul>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="19"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	管理员
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="10"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	客服
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="11"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	订单处理
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="15"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	库管
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="16"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	采购
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="17"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	运营
															</span>
														</a></li>

														<li name="userFunctionSet" class="userFunction"
															userfunctionid="18"><a href="javascript:void(0);">
																<span class="text"> <span
																	class="iconfont icon-check" style="font-size: 14px"></span>
																	财务
															</span>
														</a></li>

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
												<input type="text" name="companyUserName"
													class="form-control" placeholder="被邀请的联系人姓名(必填)"> <span
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
											<div name="companyUserPhone"
												class="alert alert-danger p7 f12" role="alert"
												style="display: none;"></div>
										</div>
									</div>
									<div class="col-md-8">
										<label for="inputEmail3" class="col-sm-2 control-label c6">Email</label>
										<div class="form-group has-feedback">
											<div class="col-sm-10">
												<input type="text" name="companyUserEmail"
													class="form-control" placeholder="被邀请人的Email地址(非必填)">
												<span class="glyphicon form-control-feedback"></span>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-left: 0px;">
										<div class="form-group">
											<div name="companyUserEmail"
												class="alert alert-danger p7 f12" role="alert"
												style="display: none;"></div>
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
						<button type="button" class="btn btn-primary invite">邀请</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<div id="manageContactModal" class="modal fade" tabindex="-1"
			role="dialog" aria-labelledby="manageContactModalLabel"
			aria-hidden="true">
			<div style="width: 795px;" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title" id="manageContactModalLabel">分配岗位</h4>
					</div>
					<div role="tabpanel" class="modal-body"
						style="padding: 15px 0 0 0;">
						<!--1 star-->
						<div class="row f14">
							<form class="form-horizontal" role="form">
								<!---->
								<div class="col-md-8">
									<label for="inputEmail3" class="col-sm-2 control-label c6">姓名</label>
									<div class="form-group has-feedback">
										<div class="col-sm-10">
											<input disabled="" id="manageContactUserNameInput"
												type="text" name="name" value="" class="form-control"
												placeholder="请输入您同事的姓名"> <span
												class="glyphicon form-control-feedback"></span>
										</div>
									</div>
								</div>
								<div class="col-md-4" style="padding-left: 0px;">
									<div class="form-group">
										<div name="name" class="alert alert-danger p7 f12"
											role="alert" style="display: none;"></div>
									</div>
								</div>
								<!---->
								<div class="col-md-8">
									<label for="inputEmail3" class="col-sm-2 control-label c6">手机</label>
									<div class="form-group has-feedback">
										<div class="col-sm-10">
											<input disabled="" id="manageContactUserPhoneInput"
												type="text" name="phone" class="form-control" value=""
												placeholder="请输入您同事的手机号码"> <span
												class="glyphicon form-control-feedback"></span>
										</div>
									</div>
								</div>
								<div class="col-md-4" style="padding-left: 0px;">
									<div class="form-group">
										<div name="phone" class="alert alert-danger p7 f12"
											role="alert" style="display: none;"></div>
									</div>
								</div>
								<!---->
								<div class="col-md-8">
									<label for="inputEmail3" class="col-sm-2 control-label c6">Email</label>
									<div class="form-group has-feedback">
										<div class="col-sm-10">
											<input disabled="" id="manageContactUserEmailInput"
												type="text" name="email" class="form-control" value=""
												placeholder="请输入您同事的Email"> <span
												class="glyphicon form-control-feedback"></span>
										</div>
									</div>
								</div>
								<div class="col-md-4" style="padding-left: 0px;">
									<div class="form-group">
										<div name="email" class="alert alert-danger p7 f12"
											role="alert" style="display: none;"></div>
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
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>

		<div style="width: 300px; height: 80px; display: none;" class="modal"
			id="keepsuccessModal" tabindex="-1" role="dialog"
			aria-labelledby="logisticsModalLabel" aria-hidden="false">
			<div class="modal-dialog" style="width: 300px; margin: 52px 0 0 0;">
				<div style="background: #61be44; border-radius: 0px; border: none"
					class="modal-content">
					<div style="padding: 5px;" class="modal-body">
						<!--part one-->
						<div style="color: #ffffff;" class="c6 tc" id="showTempDiv">保存成功！</div>
						<!--part one end-->
					</div>
				</div>
			</div>
		</div>
		<div style="width: 300px; height: 80px; display: none;" class="modal"
			id="keeperrorModal" tabindex="-1" role="dialog"
			aria-labelledby="logisticsModalLabel" aria-hidden="false">
			<div class="modal-dialog" style="width: 300px; margin: 52px 0 0 0;">
				<div style="background: #ff5831; border-radius: 0px; border: none"
					class="modal-content">
					<div style="padding: 5px;" class="modal-body">
						<!--part one-->
						<div style="color: #ffffff;" class="c6 tc" id="showErrorTempDiv">保存失败！</div>
						<!--part one end-->
					</div>
				</div>
			</div>
		</div>


	
	</div>
	<div id="modal"></div>
	</div>
	<!--代码结束-->
</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  