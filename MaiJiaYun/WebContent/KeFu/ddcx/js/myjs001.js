function initialize() {// 初始化model页面：使model页面内的表格内容根据页面的列生成
	var tbody = $("#tableHead").find("tbody");
	var ths = $("[colname='splitMergeStatus']").closest("tr").find("th");

	for (var i = 2; i < ths.length - 2; i++) {
		var name = $(ths[i]).attr("colname");
		if ($(ths[i]).attr("title") != null) {
			$(tbody)
					.append(
							"<tr class='select-tr' index='"
									+ i
									+ "' onclick='trselected(this)'>"
									+ "<td class='fb'>"
									+ (i - 1)
									+ "</td>"
									+ "<td>"
									+ "<input id='isSort"
									+ i
									+ "' name='isSort' value='true' type='hidden'>"
									+ "<input id='valueList"
									+ i
									+ "' name='valueList' value='' type='hidden'>"
									+ "<input id='code"
									+ i
									+ "' name='code' value='"
									+ name
									+ "' type='hidden'> "
									+ $(ths[i]).attr("title")
									+ "</td>"
									+ "<td attrindex='"
									+ i
									+ "'><span id='nickName"
									+ i
									+ "'>"
									+ $(ths[i]).attr("title")
									+ "</span>"
									+ "<div style='text-align:right;display: block; float: right;'>"
									+ "<button title='编辑' class='btn btn-default operatethead-edit' onclick='btnclicked(this)' type='button' style='background:none; border:none;'>"
									+ "<i class='glyphicon glyphicon-pencil '></i>"
									+ "</button>"
									+ "</div>"
									+ "</td>"
									+ "<td>"
									+ "<a index='"
									+ i
									+ "' showtype='show' class='operate-show' title='显示' href='javascript:void(0)' onclick='showAndHidden(this)'>"
									+ "<i class='glyphicon glyphicon-ok' style='color:green'></i>"
									+ "</a>" + "</td>" + "<td></td>" + "</tr>");
		} else {
			$(tbody)
					.append(
							"<tr class='select-tr' index='"
									+ i
									+ "' onclick='trselected(this)'>"
									+ "<td class='fb'>"
									+ (i - 1)
									+ "</td>"
									+ "<td>"
									+ "<input id='isSort"
									+ i
									+ "' name='isSort' value='true' type='hidden'>"
									+ "<input id='valueList"
									+ i
									+ "' name='valueList' value='' type='hidden'>"
									+ "<input id='code"
									+ i
									+ "' name='code' value='"
									+ name
									+ "' type='hidden'> "
									+ $(ths[i]).html()
									+ "</td>"
									+ "<td attrindex='"
									+ i
									+ "'><span id='nickName"
									+ i
									+ "'>"
									+ $(ths[i]).html()
									+ "</span>"
									+ "<div style='text-align:right;display: block; float: right;'>"
									+ "<button title='编辑' class='btn btn-default operatethead-edit' onclick='btnclicked(this)' type='button' style='background:none; border:none;'>"
									+ "<i class='glyphicon glyphicon-pencil '></i>"
									+ "</button>"
									+ "</div>"
									+ "</td>"
									+ "<td>"
									+ "<a index='"
									+ i
									+ "' showtype='show' class='operate-show' title='显示' href='javascript:void(0)' onclick='showAndHidden(this)'>"
									+ "<i class='glyphicon glyphicon-ok' style='color:green'></i>"
									+ "</a>" + "</td>" + "<td></td>" + "</tr>");
		}
	}
};

function btnclicked(e) { // 显示名称列的编辑
	var TD = $(e).closest("td");
	// var index = $(TD).attr("attrIndex");
	var val = $(TD).find("span").text().trim();
	var html = "<input type='text' value='" + val
			+ "' class='form-control operatethead-save' onblur='save()' />";
	$(TD).html(html);
	// $("#nickName" + index).val(val);
	$(".operatethead-save").focus();
};

function save(e) { // 显示名称列的编辑保存
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
};

function showAndHidden(e) { // 显示列的显示与不显示
	// 获取id编号
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
};

function trselected(e) { // 选中行
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
};

function upOperate(e) {// 上移
	var $TR = $("#tableHead").find("tr[trType=allow]");
	$TR.insertBefore($TR.prev());
	$TR.find("td").css("background-color", "#f0f8fd");

//	var val = $TR.find("[name='code']").attr("value");
//	var colNames = $("[colname='" + val + "']");
//	for (var j = 0; j < colNames.length; j++) {
//		// colNames[j].style.display = '';
//		if ($(colNames[j]).prev().attr("colname") != "splitMergeStatus"
//				&& $(colNames[j]).prev().html().trim() != "") {
//			$(colNames[j]).insertBefore($(colNames[j]).prev());
//		}
//	}
};

function downOperate(e) {// 下移
	var $TR = $("#tableHead").find("tr[trType=allow]");
	$TR.insertAfter($TR.next());
	$TR.find("td").css("background-color", "#f0f8fd");

//	var val = $TR.find("[name='code']").attr("value");
//	var colNames = $("[colname='" + val + "']");
//	for (var j = 0; j < colNames.length; j++) {
//		// colNames[j].style.display = '';
//		if ($(colNames[j]).next().html().trim() != "操作"
//				&& $(colNames[j]).next().find("button").html().trim() != "详情") {
//			$(colNames[j]).insertAfter($(colNames[j]).next());
//		}
//	}
};

function defaultOperate(e) {// 恢复默认
	var allCol = $("[showType]");
	for (var i = 0; i < allCol.length; i++) {
		var index = $(allCol[i]).attr("index");
		var name = $("#code" + index).closest("td").text().trim();
		$("#nickName" + index).html(name);
		if (i < 8) {
			if ($(allCol[i]).attr("showType") == "hidden") {
				showAndHidden(allCol[i]);
			}
		} else {
			if ($(allCol[i]).attr("showType") == "show") {
				showAndHidden(allCol[i]);
			}
		}
	}
};

function saveMyCustom() {// 保存
	var allCol = $("[showType]");
	for (var i = 0; i < allCol.length; i++) {
		var index = $(allCol[i]).attr("index");
		var showName = $("#nickName" + index).html();
		var val = $("#code" + index).attr("value");
		if ($(allCol[i]).attr("showType") == "show") {
			var colNames = $("[colname='" + val + "']");
			if($(colNames[0]).attr("title")!=null){
				$(colNames[0]).attr("title",showName);
				var spans=$(colNames[0]).find("button").find("span");
				$(spans[0]).html(showName);
			}else{
				$(colNames[0]).html(showName);
			}
			for (var j = 0; j < colNames.length; j++) {
				$(colNames[j]).attr("style", "display:'';");
			}
		} else {
			var colNames = $("[colname='" + val + "']");
			for (var j = 0; j < colNames.length; j++) {
				$(colNames[j]).attr("style", "display: none;");
			}
		}
	}
	
	//改变列的顺序
	var tbody=$("#tableHead").find("tbody");
	var inputs=$(tbody).find("[name='code']");
	var val = new Array();
	for(var i=0;i<inputs.length;i++){
		val.push($(inputs[i]).attr("value"));
	}
	for(var i = 0; i < val.length; i++) {
		var colNames = $("[colname='" + val[i] + "']");
		if(i==0){
			$(colNames[0]).insertAfter($("[colname='splitMergeStatus']"));
			for(var j=1;j<colNames.length;j++){
				var trs=$("[colname='splitMergeStatus']").closest("table").find("tbody").find("tr");
				$(colNames[j]).insertAfter($(trs[j]).find("td")[1]);
			}
		}else{
			for(var j=0;j<colNames.length;j++){
				$(colNames[j]).insertAfter($("[colname='" + val[i-1] + "']")[j]);
			}
		}
	}
};

var begin = function() {
	initialize();
	defaultOperate();
	saveMyCustom();
}