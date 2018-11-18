<%@page import="mjy.caigou.vo.PurchaseVO"%>
<%@page import="mjy.caigou.po.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<nav>

	<%	String url=request.getParameter("url");
		PageInfo<PurchaseVO> pageInfo = (PageInfo<PurchaseVO>) request.getAttribute("pageInfo");
	%>
	<div class="row" style="margin: 0; -moz-user-select: none;"
		onselectstart="return false;" id="paging"></div>

	<div style="float: right">
		<div style="margin-right: 10px; float: left;">
			<ul class="pagination">
				<li class="dropup">
					<div class="lh30 left">共</div>
					<div class="btn-group" style="margin: 0 5px;">
						<span class="lh30 left fb red" id="totalRecords"> 
						<%=pageInfo.getTotalRecords()%>
						</span>
						<div class="lh30 left" style="margin-left: 5px;">条记录</div>

					</div>
				</li>
			</ul>
		</div>


		<div style="width: 150px; float: left;">
			<ul class="pagination">
				<li class="dropup">
					<div class="lh30 left">每页显示</div>
					<div class="btn-group" style="margin: 0 5px;">


						<button type="button"
							class="btn dropdown-toggle selectpicker btn-default"
							data-toggle="dropdown" title="10";">
							<span id="shuzi" class="filter-option pull-left" name="pSize">
								<%=pageInfo.getPageSize()%>
							</span>&nbsp; <span class="caret"></span>
						</button>


						<ul class="dropdown-menu inner selectpicker" role="menu"
							style="max-height: 449px; overflow-y: auto; min-height: 71px; cursor: pointer;">
							<li rel="0" class="selected"><a
								href="<%=url %>?pSize=10 "
								tabindex="0"><span class="text">10</span></a></li>
							<li rel="1"><a
								href="<%=url %>?pSize=20 "
								tabindex="0" class="" style=""><span class="text"
									onclick="dropDownBoxr(this)">20</span></a></li>
							<li rel="2"><a
								href="<%=url %>?pSize=50 "
								tabindex="0" class="" style=""><span class="text"
									onclick="dropDownBoxr(this)">50</span></a></li>
							<li rel="3"><a
								href="<%=url %>?pSize=100 "
								tabindex="0" class="" style=""><span class="text"
									onclick="dropDownBoxr(this)">100</span></a></li>
							<li rel="4"><a
								href="<%=url %>?pSize=200"
								tabindex="0" class="" style=""><span class="text"
									onclick="dropDownBoxr(this)">200</span></a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>

		<div style="width: 350px; float: left;" id="pagingPages">
			<ul class="pagination">
				<!-- 前一页 -->
				<%
					int pageNo = Integer.parseInt(pageInfo.getPageNum());

					if (pageNo == 1) {
				%>
				<li class="disabled"><a href="#">&laquo;</a></li>
				<%
					} else {
				%>
				<li class="active"><a
					href="<%=url %>?pageNo=<%=pageNo - 1%><%=pageInfo.getQueryUrl()%>&pSize=<%=pageInfo.getPageSize()%>">&laquo;</a></li>
				<%
					}
				%>

				<!-- 计算显示的页码 -->
				<%
					int pageCount = pageInfo.getPageCount();
					int begin = 0, end = 0;

					if (pageCount <= 5) {
						begin = 1;
						end = pageCount;
					} else {
						begin = pageNo - 2;
						end = pageNo + 3;

						if (begin < 1) {
							begin = 1;
							end = 5;
						}

						if (end > pageCount) {
							begin = pageCount - 4;
							end = pageCount;
						}
					}
				%>

				<%
					for (int i = begin; i <= end; i++) {
						if (i == pageNo) {
				%>
				<li class="active"><a
					href="<%=url %>?pageNo=<%=i%>&queryUrl=<%=pageInfo.getQueryUrl()%>&pSize=<%=pageInfo.getPageSize()%>"><%=i%></a></li>
				<%
					} else {
				%>
				<li><a
					href="<%=url %>?pageNo=<%=i%>&queryUrl=<%=pageInfo.getQueryUrl()%>&pSize=<%=pageInfo.getPageSize()%>"><%=i%></a></li>
				<%
					}
					}
				%>

				<%
					if (end < pageCount) {
				%>
				<li><a href="#">....</a></li>
				<%
					}
				%>
				<%
					if (pageNo == pageCount) {
				%>
				<li class="disabled"><a href="#">&raquo;</a></li>
				<%
					} else {
				%>
				<li><a
					href="<%=url %>?pageNo=<%=pageNo + 1%>&pSize=<%=pageInfo.getPageSize()%>">&raquo;</a></li>
				<%
					}
				%>
			</ul>
		</div>

	</div>
</nav>