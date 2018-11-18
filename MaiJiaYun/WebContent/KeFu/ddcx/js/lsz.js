//列设置js
var initialize = function(event){//初始化
	var tbody = $("#tableHead").find("tbody");
	var testvar = (window.location.search).split("=");
	var pageUrl = testvar[testvar.length-1];
	$.ajax({
		url: window.document.location.pathname.substring(0, window.document.location.pathname.substr(1).indexOf('/') + 1) + "/LieshezhiQueryServlet",
		type: "post",
		data: {
			page:pageUrl,//获取页面信息，根据页面更改page的值
			state1:1
		},
		datatype: "json",
		success: function(result) {
			$(tbody).html("");
			var lieshezhis = result;
			for(var i in lieshezhis){
				var showTd;
				if(lieshezhis[i].state){
					showTd = "<td>"
						+ "<a index='"
						+ lieshezhis[i].sequence
						+ "' showtype='show' class='operate-show' title='显示' href='javascript:void(0)' onclick='showAndHidden(this)'>"
						+ "<i class='glyphicon glyphicon-ok' style='color:green'></i>"
						+ "</a>" + "</td>"
				}else{
					showTd = "<td>"
						+ "<a index='"
						+ lieshezhis[i].sequence
						+ "' showtype='hidden' class='operate-show' title='不显示' href='javascript:void(0)' onclick='showAndHidden(this)'>"
						+ "<i class='glyphicon glyphicon-remove' style='color:red'></i>"
						+ "</a>" + "</td>"
				}
				$(tbody)
				.append(
						"<tr class='select-tr' index='"
								+ lieshezhis[i].sequence
								+ "' onclick='trselected(this)'>"
								+ "<td class='fb'>"
								+ lieshezhis[i].sequence
								+ "</td>"
								+ "<td>"
								+ "<input id='isSort"
								+ lieshezhis[i].sequence
								+ "' name='isSort' value='true' type='hidden'>"
								+ "<input id='valueList"
								+ lieshezhis[i].sequence
								+ "' name='valueList' value='' type='hidden'>"
								+ "<input id='code"
								+ lieshezhis[i].sequence
								+ "' name='code' value='"
								+ lieshezhis[i].colName
								+ "' type='hidden'> "
								+ lieshezhis[i].lieTitle
								+ "</td>"
								+ "<td attrindex='"
								+ lieshezhis[i].sequence
								+ "'><span id='nickName"
								+ lieshezhis[i].sequence
								+ "'>"
								+ lieshezhis[i].showName
								+ "</span>"
								+ "<div style='text-align:right;display: block; float: right;'>"
								+ "<button title='编辑' class='btn btn-default operatethead-edit' onclick='btnclicked(this)' type='button' style='background:none; border:none;'>"
								+ "<i class='glyphicon glyphicon-pencil '></i>"
								+ "</button>"
								+ "</div>"
								+ "</td>"
								+ showTd
								+ "<td></td>" + "</tr>");
			}
		}
	});
//	$.ajax({
//		url: window.document.location.pathname.substring(0, window.document.location.pathname.substr(1).indexOf('/') + 1) + "/LieshezhiQueryServlet",
//		type: "post",
//		data: {
//			page:"订单查询"//获取页面信息，根据页面更改page的值
//		},
//		datatype: "json",
//	});
}
var btnclicked = function(e) { // 显示名称列的编辑
	var TD = $(e).closest("td");
	var val = $(TD).find("span").text().trim();
	var html = "<input type='text' value='" + val
			+ "' class='form-control operatethead-save' onblur='save()' />";
	$(TD).html(html);
	$(".operatethead-save").focus();
}
var save = function(e) { // 显示名称列的编辑保存
	var inputVal = $(".operatethead-save").val();
	var $TD = $(".operatethead-save").closest("td");
	$TD
			.html("<span id='nickName"
					+ $TD.attr("attrIndex")
					+ "'>"
					+ inputVal
					+ "</span>"
					+ "<div style=\"text-align:right;display: block; float: right;\">"
					+ "<button class=\"operatethead-edit btn btn-default\" onclick=\"btnclicked(this)\" style=\"background:none; border:none;\" type=\"button\" class=\"btn btn-default\" title=\"\">"
					+ "<i class=\"glyphicon glyphicon-pencil\"></i></button></div>");
}
var  showAndHidden = function(e) { // 显示列的显示与不显示
	var $TD = $(e).closest("td");
	var index = $TD.attr("attrIndex");
	var $A = $(e);
	var ai = $A.find("i")[0];
	var type = $A.attr("showType");
	if (type == "show") {
		$(ai).attr("style", "color:red");
		$(ai).removeClass("glyphicon-ok");
		$(ai).addClass("glyphicon-remove");
		$A.attr("title", "不显示");
		$A.attr("showType", "hidden");
	} else {
		$(ai).attr("style", "color:green");
		$(ai).removeClass("glyphicon-remove");
		$(ai).addClass("glyphicon-ok");
		$A.attr("title", "显示");
		$A.attr("showType", "show");
	}
}
var  trselected = function(e) { // 选中行
	$("#tableHead").find("td").removeAttr("style");
	$("#tableHead").find("tr").removeAttr("trType");
	var $TR = $(e).closest("tr");
	$TR.attr("trType", "allow");
	$TR.find("td").css("background-color", "#f0f8fd");
	if ($TR.find("span.glyphicon-flag").length) {
		$("#upButton, #downButton").attr("disabled", true);
	} else {
		$("#upButton, #downButton").attr("disabled", false);
	}
}

var upOperate = function(e) {// 上移
	var $TR = $("#tableHead").find("tr[trType=allow]");
	$TR.insertBefore($TR.prev());
	$TR.find("td").css("background-color", "#f0f8fd");
}

var downOperate = function(e) {// 下移
	var $TR = $("#tableHead").find("tr[trType=allow]");
	$TR.insertAfter($TR.next());
	$TR.find("td").css("background-color", "#f0f8fd");
}
var defaultOperate = function(e){//恢复默认设置
	//state=defaultState,sequence=defaultSequence,存入数据库,initialize()
	var tbody = $("#tableHead").find("tbody");
	var testvar = (window.location.search).split("=");
	var pageUrl = testvar[testvar.length-1];
	$.ajax({
		url: window.document.location.pathname.substring(0, window.document.location.pathname.substr(1).indexOf('/') + 1) + "/LieshezhiQueryServlet",
		type: "post",
		data: {
			page:pageUrl,//获取页面信息，根据页面更改page的值
			state1:2
		},
		datatype: "json",
		success: function(result) {
			$(tbody).html("");
			var lieshezhis = result;
			for(var i in lieshezhis){
				var showTd;
				if(lieshezhis[i].defaultState){
					showTd = "<td>"
						+ "<a index='"
						+ lieshezhis[i].defaultSequence
						+ "' showtype='show' class='operate-show' title='显示' href='javascript:void(0)' onclick='showAndHidden(this)'>"
						+ "<i class='glyphicon glyphicon-ok' style='color:green'></i>"
						+ "</a>" + "</td>"
				}else{
					showTd = "<td>"
						+ "<a index='"
						+ lieshezhis[i].defaultSequence
						+ "' showtype='hidden' class='operate-show' title='不显示' href='javascript:void(0)' onclick='showAndHidden(this)'>"
						+ "<i class='glyphicon glyphicon-remove' style='color:red'></i>"
						+ "</a>" + "</td>"
				}
				$(tbody)
				.append(
						"<tr class='select-tr' index='"
								+ lieshezhis[i].defaultSequence
								+ "' onclick='trselected(this)'>"
								+ "<td class='fb'>"
								+ lieshezhis[i].defaultSequence
								+ "</td>"
								+ "<td>"
								+ "<input id='isSort"
								+ lieshezhis[i].defaultSequence
								+ "' name='isSort' value='true' type='hidden'>"
								+ "<input id='valueList"
								+ lieshezhis[i].defaultSequence
								+ "' name='valueList' value='' type='hidden'>"
								+ "<input id='code"
								+ lieshezhis[i].defaultSequence
								+ "' name='code' value='"
								+ lieshezhis[i].colName
								+ "' type='hidden'> "
								+ lieshezhis[i].lieTitle
								+ "</td>"
								+ "<td attrindex='"
								+ lieshezhis[i].defaultSequence
								+ "'><span id='nickName"
								+ lieshezhis[i].defaultSequence
								+ "'>"
								+ lieshezhis[i].lieTitle
								+ "</span>"
								+ "<div style='text-align:right;display: block; float: right;'>"
								+ "<button title='编辑' class='btn btn-default operatethead-edit' onclick='btnclicked(this)' type='button' style='background:none; border:none;'>"
								+ "<i class='glyphicon glyphicon-pencil '></i>"
								+ "</button>"
								+ "</div>"
								+ "</td>"
								+ showTd
								+ "<td></td>" + "</tr>");
			}
		}
	});
}
var saveMyCustom = function(e){//保存数据到数据库
	var tbody = $("#tableHead").find("tbody");
	var trs = $(tbody).find("tr");
	var lieshezhiArray = new Array();
	for(var i=0;i<trs.length;i++){
		var index = i+1;
		var lieTitle = $($(trs[i]).find("td")[1]).text().trim();
		var showName = $($(trs[i]).find("td")[2]).find("span").html();
//		var lieTitle = $("#code" + (i+1)).closest("td").text().trim();
//		var showName = $("#nickName"+(i+1)).html();
		var state = ($(trs[i]).find("[showType]").attr("showType"))==("show");
		
		var lieshezhi = {
				"lieTitle":lieTitle,
				"showName":showName,
				"state":state,
				"sequence":index
		}
		lieshezhiArray.push(lieshezhi);
		
	}
	
	var testvar = (window.location.search).split("=");
	var pageUrl = testvar[testvar.length-1];
	
	$.ajax({
		url: window.document.location.pathname.substring(0, window.document.location.pathname.substr(1).indexOf('/') + 1) + "/LieshezhiQueryServlet",
		type: "post",
		data: {
			lieshezhiArr:JSON.stringify(lieshezhiArray),
			page:pageUrl,//获取页面信息，根据页面更改page的值
			state1:3
		},
		datatype: "json",
		success: function(result) {
			if(result[0] = true){
				location.href = window.document.location.pathname.substring(0,
						window.document.location.pathname.substr(1)
								.indexOf('/') + 1)
						+ "/servlet/DdcxMethodServlet?method=ddcx";
			}
		}
	});

}
//var begin = function() {
//	initializeLieshezhi();
//}