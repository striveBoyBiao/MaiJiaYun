/**
 * 
 */
var supplierId = "";

function init() {

	query();

	$("#chaxun").click(function() {
		query();
	});

	$("#saveBut").click(function() {
		$('#addsupplierModal').modal('hide');
		saveAndUpdateSupplier();
	});

	// 模态框隐藏后触发
	$('#addsupplierModal').on('hidden.bs.modal', function(e) {
		$("#companyName").val("");
		$("#companyAddress").val("");
		$("#legalPerson").val("");
		$("#legalPhone").val("");
		$("#contactsName").val("");
		$("#contactsMobile").val("");
		$("#contactsEmail").val("");
		$("#contactsQq").val("");
		supplierId = "";
	});

}

function checkForm(){
	
}

function showSupplier(xianqing) {
	supplierId = $(xianqing).parent().parent().attr("modelid");
	$.ajax({
		url : getRootPath() + "/servlet/caigou/SupplierQueryServlet",
		data : {
			supplierId : supplierId
		},
		type : "post",
		datatype : "xml",
		success : function(data) {
			if ($(data)) {
				$.each(data, function(index, element) {
					$("#companyName").val(element.supplierCName);
					$("#companyAddress").val(element.supplierCAddress);
					$("#legalPerson").val(element.supplierLPerson);
					$("#legalPhone").val(element.supplierLPhone);
					$("#contactsName").val(element.supplierLMName);
					$("#contactsMobile").val(element.supplierLMMobile);
					$("#contactsEmail").val(element.supplierLMEmail);
					$("#contactsQq").val(element.supplierLMQq);
				});
			}
		}
	});
}

function deleteSupplier(shangchu) {

	$.ajax({
		url : getRootPath() + "/servlet/caigou/SupplierChangeServlet",
		data : {
			deleteSupplierId : $(shangchu).parent().parent().attr("modelid")
		},
		type : "post",
		datatype : "xml",
		success : function(data) {
			query();
		}
	});
}

function saveAndUpdateSupplier() {
	var datas = $("#formAddSupplier").serialize();
	datas = datas + "&supplierId=" + supplierId;
	$.ajax({
		url : getRootPath() + "/servlet/caigou/SupplierChangeServlet",
		data : datas,
		type : "post",
		datatype : "xml",
		success : function(data) {
			query();
		}
	});
}

function query() {
	$.ajax({
		url : getRootPath() + "/servlet/caigou/SupplierQueryServlet",
		data : {
			supplierCName : $("#q").val()
		},
		type : "post",
		datatype : "xml",
		success : function(data) {
			var resultHtml = "";
			if ($(data)) {
				$.each(data,function(index, element) {
					resultHtml += "<tr modelid=\""+ element.supplierId + "\">";
					resultHtml += "<td><input type=\"checkbox\"></td>";
					resultHtml += "<td>"+ element.supplierCName + "</td>";
					resultHtml += "<td>"+ element.supplierLPerson + "</td>";
					resultHtml += "<td>"+ element.supplierLPhone + "</td>";
					resultHtml += "<td>"+ element.supplierLMName + "</td>";
					resultHtml += "<td>"+ element.supplierLMMobile + "</td>";
					resultHtml += "<td><a style=\"cursor: pointer;\" onclick=\"showSupplier(this)\" data-target=\"#addsupplierModal\" data-toggle=\"modal\" class=\"mr5 operate-supplier-edit\">详情</a> <a href=\"javascript:void(0);\" onclick=\"deleteSupplier(this)\" class=\"operate-supplier-delete\">删除</a></td>";
					resultHtml += "</tr>";
				});
				$("#result").html(resultHtml);
			}
		}
	});
}

/*
 * 获取项目路径，作用类似于${pageContext.request.contextPath}
 */
function getRootPath() {
	var pathName = window.document.location.pathname;
	var projectName = pathName
			.substring(0, pathName.substr(1).indexOf('/') + 1);
	return (projectName);
}