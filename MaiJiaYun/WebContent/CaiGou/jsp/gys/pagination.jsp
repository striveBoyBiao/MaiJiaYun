<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div class="row" style="margin: 0; -moz-user-select: none;"
					onselectstart="return false;" id="paging">
					<div style="float: right;">
						<div style="margin-right: 10px; float: left;">
							<ul class="pagination">
								<li class="dropup">
									<div class="lh30 left">共</div>
									<div class="btn-group" style="margin: 0 5px;">
										<span class="lh30 left fb red" id="totalRecords">1</span>
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
										<button data-toggle="dropdown"
											class="btn btn-default dropdown-toggle" type="button">
											<span id="currentPageSize">10</span> <span class="caret"></span>
										</button>
										<div class="lh30 left" style="margin-left: 5px;">个</div>
										<ul role="menu" class="dropdown-menu" id="pageSizes">
											<li><a href="javascript:void(0);">10</a></li>
											<li><a href="javascript:void(0);">20</a></li>
											<li><a href="javascript:void(0);">50</a></li>
											<li><a href="javascript:void(0);">100</a></li>
											<li><a href="javascript:void(0);">200</a></li>
											<!-- <li><a href="javascript:void(0);">20</a></li>
                            <li><a href="javascript:void(0);">50</a></li> -->
										</ul>
									</div>
								</li>
							</ul>
						</div>
						<div style="width: 350px; float: left;" id="pagingPages">
							<ul class="pagination">
								<li id="last" class="fb fmsun"><a
									href="javascript:void(0);">&lt;</a></li>

								<li class="page active" page="1"><a
									href="javascript:void(0);" id="pageNum">1</a></li>

								<li id="next" class="fb fmsun"><a
									href="javascript:void(0);">&gt;</a></li>
							</ul>
						</div>
					</div>
				</div>