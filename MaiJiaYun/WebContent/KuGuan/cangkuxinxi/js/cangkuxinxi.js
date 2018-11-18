// 提示仓库名称相同
function existName(event) {
	$("#addModel").show();
	$("#existName").text(event);
}
// 仓库名相同时，提示框的退出
function okBye() {
	$("#addModel").attr("style", "display:none");
	$("#warehouse_addModal").attr("style", "display:none");
}

// 添加仓库信息
function addWarehouseInfo() {
	var name = $("#ziyouName").val();
	var as = $("#warehouseInfo").find("h5"); // 
	// console.log(as);
	for (var index = 0; index < as.length; index++) {
		var dbName = $(as[index]).attr("warehouseName");
		if (name == dbName) {
			existName("无效参数:" + name + "已存在");
			return false;
		} else if (name == "") {
			return false;
		} else {

		}
	}

	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/CangKuXinxiMethodServlet",
		type : "post",
		data : {
			method : "addWarehouseMethod",
			// warehouseId : $("#partthree").attr("warehouseid"),
			warehouseName : $("#ziyouName").val()
		},
		datatype : "json",
		success : function(result) {
			if (result[0] == true) {
				$("#hideReservoirZone").click();
				queryWarehouseInfo();
			}
		}
	});
}

// 删除仓库信息
function removeWarehouseInfo(event) {
	// alert($(event).attr("warehouseId"));
	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/CangKuXinxiMethodServlet",
		type : "post",
		data : {
			method : "removeWarehouseMethod",
			warehouseId : $(event).attr("warehouseId")
		},
		datatype : "json",
		success : function(result) {
			if (result[0] = true) {
				$("#hideReservoirZone").click();
				queryWarehouseInfo();
			}
		}
	});
}

// 修改仓库信息
function updateWarehouseInfo() {
	// alert($("#warehouseinfoModal").val());
	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/CangKuXinxiMethodServlet",
		type : "post",
		data : {
			method : "updateWarehouseMethod",
			warehouseId : $("#warehouseinfoModal").val(),
			warehouseName : $("#ckName").val()
		},
		datatype : "json",
		success : function(result) {
			if (result[0] == true) {
				$("#warehouseinfoModal").modal("hide");
				queryWarehouseInfo();
			}
		}
	});
}

// 将当前warehouseId赋值给模态框的val，然后直接获取模态框的val即可得到warehosueId
function getId(event) {
	$("#warehouseinfoModal").val($(event).attr("warehouseId"));
}

// 查询仓库信息
function queryWarehouseInfo() {
	hidePartthree();
	hidePartfour();
	$
			.ajax({
				url : window.document.location.pathname.substring(0,
						window.document.location.pathname.substr(1)
								.indexOf('/') + 1)
						+ "/CangKuXinxiMethodServlet",
				type : "post",
				data : {
					method : "queryWarehouseMethod"
				},
				datatype : "json",
				success : function(result) {
					// console.log(result);
					var div = $("#warehouseInfo");
					var visBtn = "hidden";
					$(div).html("");
					for ( var index in result) {
						if (result[index].goodCount == 0) {
							warehouseStatus = "【空闲】";
							visBtn = "visible";
						} else {
							warehouseStatus = "";
							visBtn = "hidden";
						}
						// console.log($("#allRadio")[0].checked);
						if ($("#allRadio")[0].checked == true) {
							$(div)
									.append(
											"<a href='javascript:void(0)' onclick='showPartthree(this)' warehouseid='"
													+ result[index].warehouseId
													+ "' warehousetype='自有仓库' class='list-group-item operate-reservoir'>"
													+ "<h5 class='list-group-item-heading' warehouseName='"
													+ result[index].warehouseName
													+ "'>"
													+ result[index].warehouseName
													+ "<i class='glyphicon '>"
													+ warehouseStatus
													+ "</i>"
													+ "<span class='pull-right'> <span class='c9 mr20'>"
													+ "自有仓库"
													+ "</span>"
													+ "<button type='button' onclick='del1(this)' warehouseid='"
													+ result[index].warehouseId
													+ "'class='btn btn-primary btn-xs operate-delete-location' style='height:22px;width:24px;visibility: "
													+ visBtn
													+ "'>"
													+ "<span class='glyphicon glyphicon-remove'></span>"
													+ "</button>"
													+ "&nbsp;"
													+ "<button style='height:22px;width:24px;' onclick='getId(this)' class='btn btn-default btn-xs operate-edit-house' warehouseid='"
													+ result[index].warehouseId
													+ "' warehousestatus='使用' warehousename='"
													+ result[index].warehouseName
													+ "' warehousememo='' warehousetype='自有仓库' qimenvendor='' qimencustomerid='' qimenwarehousecode='' "
													+ "type='button' data-target='#warehouseinfoModal' data-toggle='modal'>"
													+ "<span class='glyphicon glyphicon-align-justify'></span>"
													+ "</button>" + "</span>"
													+ "</h5>" + "</a>");
						} else if ($("#freeRadio")[0].checked == true
								&& result[index].goodCount == 0) {
							$(div)
									.append(
											"<a href='javascript:void(0)' onclick='showPartthree(this)' warehouseid='"
													+ result[index].warehouseId
													+ "' warehousetype='自有仓库' class='list-group-item operate-reservoir'>"
													+ "<h5 class='list-group-item-heading'>"
													+ result[index].warehouseName
													+ "<i class='glyphicon '>"
													+ warehouseStatus
													+ "</i>"
													+ "<span class='pull-right'> <span class='c9 mr20'>"
													+ "自有仓库"
													+ "</span>"
													+ "<button type='button' warehouseid='"
													+ result[index].warehouseId
													+ "' class='btn btn-primary btn-xs operate-delete-location' style='visibility: hidden'>"
													+ "<span class='glyphicon glyphicon-remove'></span>"
													+ "</button>"
													+ "<button class='btn btn-default btn-xs operate-edit-house' warehouseid='"
													+ result[index].warehouseId
													+ "' warehousestatus='空闲' warehousename='"
													+ result[index].warehouseName

													+ "' warehousememo='系统预置默认仓库' "
													+ "warehousetype='自有仓库' qimenvendor='' qimencustomerid='' qimenwarehousecode='' "
													+ "type='button' data-target='#warehouseinfoModal' data-toggle='modal'>"
													+ "<span class='glyphicon glyphicon-align-justify'></span>"
													+ "</button>" + "</span>"
													+ "</h5>" + "</a>");
						}
					}
				}
			});
}

// 添加库区信息
function addReservoirInfo() {
	alert($("#partthree").attr("warehouseid") + "~~~" + $("#vname").val());
	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/CangKuXinxiMethodServlet",
		type : "post",
		data : {
			method : "addReservoirMethod",
			warehouseId : $("#partthree").attr("warehouseid"),
			reservoirName : $("#vname").val()
		},
		datatype : "json",
		success : function(result) {
			if (result[0] == true) {
				$("#hideWarehouseZone").click();
				queryReservoirInfo();
			}
		}
	});
}

// 删除库区信息
function removeReservoirInfo(event) {
	// alert($(event).attr("zoneid"));
	onclick = "javascript:return del();"
	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/CangKuXinxiMethodServlet",
		type : "post",
		data : {
			method : "removeReservoirMethod",
			reservoirId : $(event).attr("zoneid")
		},
		datatype : "json",
		success : function(result) {
			if (result[0] = true) {
				$("#hideWarehouseZone").click();
				queryReservoirInfo();
			}
		}
	});
}

// 修改库区信息
function updateReservoirInfo() {
	// alert($("#kqName").val());
	console.log($("#reservoirinfoModal").val());
	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/CangKuXinxiMethodServlet",
		type : "post",
		data : {
			method : "updateReservoirMethod",
			reservoirId : $("#reservoirinfoModal").val(),
			reservoirName : $("#kqName").val()
		},
		datatype : "json",
		success : function(result) {
			if (result[0] == true) {
				$("#reservoirinfoModal").modal("hide");
				queryReservoirInfo();
			}
		}
	});
}
function getId2(event) {
	$("#reservoirinfoModal").val($(event).attr("id"));
}

// 查询库区信息
function queryReservoirInfo() {
	$
			.ajax({
				url : window.document.location.pathname.substring(0,
						window.document.location.pathname.substr(1)
								.indexOf('/') + 1)
						+ "/CangKuXinxiMethodServlet",
				type : "post",
				data : {
					method : "queryReservoirMethod",
					warehouseId : $("#partthree").attr("warehouseid")
				},
				datatype : "json",
				success : function(result) {
					// console.log($("#partthree").attr("warehouseid"));
					var div = $("#reservoirInfo");
					$(div).html("");
					for ( var index in result) {
						// console.log(result);
						$(div)
								.append(
										"<a href='javascript:void(0)' onclick='showPartfour(this)' warehouseid='"
												+ result[index].warehouseId
												+ "' zoneid='"
												+ result[index].reservoirId
												+ "' zonename='"
												+ result[index].reservoirName
												+ "' zonememo='' zonestatus='空闲' class='list-group-item operate-zone'>"
												+ "<h5 class='list-group-item-heading'>"
												+ result[index].reservoirName
												+ "<span class='pull-right'>"

												+ "<button class='btn btn-primary btn-xs operate-delete-zone' onclick='del2(this)' style='display:inline-block;height:22px;width:24px;' warehouseid='"
												+ result[index].warehouseId
												+ "' zoneid='"
												+ result[index].reservoirId
												+ "' type='button'><span class='glyphicon glyphicon-remove'></span></button>&nbsp;"
												+ "<button onclick='getId2(this)' id="
												+ result[index].reservoirId
												+ " data-target='#reservoirinfoModal' style='height:22px;width:24px;' data-toggle='modal' warehouseid='"
												+ result[index].wareHouseId
												+ " zoneid='"
												+ result[index].reservoirId
												+ "zonename='"
												+ result[index].reserviorName
												+ " zonememo='' zonestatus='空闲' class='btn btn-default btn-xs operate-edit-zone' type='button'>"
												+ "<span class='glyphicon glyphicon-align-justify'></span>"
												+ "</button>" + "</span>"
												+ "</h5>" + "</a>")
					}
				}
			});
}

// 添加库位信息
function addLocationInfo() {
	var zoneid = $("#partfour").attr("zoneid");
	var reservoirId = $("#partfour").attr("zoneid");// 库区id
	var locationNum = $("#kwNum").val();// 批量生成的数量
	var startName = $("#startName").val();// 起始库位名称
	var nameFront = startName.substr(0, startName.length - 2);// 起始库位名称后两位前的字符串
	var nameAfter = startName.substr(startName.length - 2, 2) - 1;// 起始库位名称后两位
	var locationArr = new Array();// 库位名称数组
	for (var index = 0; index < locationNum; index++) {
		var nameAfter = eval(nameAfter + "+" + 1);
		if (nameAfter < 10) {
			var newNameAfter = "0" + nameAfter;
			locationArr.push(nameFront + newNameAfter);
		} else if (nameAfter >= 10) {
			locationArr.push(nameFront + nameAfter);
		}
	}

	// console.log(zoneid);
	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/CangKuXinxiMethodServlet",
		type : "post",
		data : {
			method : "addLocationMethod",
			reservoirId : $("#partfour").attr("zoneid"),
			locationName : $("#startName").val(),
			locationNum : $("#kwNum").val(),
			locationArr : JSON.stringify(locationArr)
		},
		datatype : "json",
		success : function(result) {
			// console.log(result[0]);
			if (result[0] == true) {
				$("#hideReservoirZone").click();
				queryLocationInfo();
			}
		}
	});
}

// 删除库位信息
function removeLocationInfo(event) {
	// alert($(event).attr("locationid"));
	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/CangKuXinxiMethodServlet",
		type : "post",
		data : {
			method : "removeLocationMethod",
			locationId : $(event).attr("locationid")
		},
		datatype : "json",
		success : function(result) {
			if (result[0] = true) {
				$("#hideWarehouseZone").click();
				queryLocationInfo();
			}
		}
	});
}

// 修改库位信息
function updateLocationInfo() {
	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/CangKuXinxiMethodServlet",
		type : "post",
		data : {
			method : "updateLocationMethod",
			locationId : $("#locationinfoModal").val(),
			locationName : $("#kwName").val()
		},
		datatype : "json",
		success : function(result) {
			if (result[0] == true) {
				queryLocationInfo();
			}
		}
	});
}

function getId3(event) {
	$("#locationinfoModal").val($(event).attr("id"));
}

// 查询库位信息
function queryLocationInfo() {
	$
			.ajax({
				url : window.document.location.pathname.substring(0,
						window.document.location.pathname.substr(1)
								.indexOf('/') + 1)
						+ "/CangKuXinxiMethodServlet",
				type : "post",
				data : {
					method : "queryLocationMethod",
					reservoirId : $("#partfour").attr("zoneid"),
					warehouseId : $("#partthree").attr("warehouseid")
				},
				datatype : "json",
				success : function(result) {
					// alert(JSON.stringify(result));
					// console.log($("#partthree").attr("warehouseid"));
					var div = $("#locationInfo");
					$(div).html("");
					for ( var index in result) {
						var wid = $("#partthree").attr("warehouseid");
						// console.log("warehouseId："+$("#partthree").attr("warehouseid"));
						// console.log("wid="+wid);
						div
								.append("<a href='javascript:void(0);' onclick='showPartfive(this)' class='list-group-item operate-location'>"
										+ "<h5 class='list-group-item-heading'>"
										+ result[index].locationName
										+ "<span class='pull-right'>"
										+ "<button class='btn btn-primary btn-xs operate-delete-location' onclick='del3(this)' style='height:22px;width:24px' warehouseid='"
										+ result[index].warehouseId
										+ "' zoneid='"
										+ result[index].reservoirId
										+ "' locationid='"
										+ result[index].locationId
										+ "' type='button'><span class='glyphicon glyphicon-remove'></span></button>&nbsp;"
										+ "<button data-target='#locationinfoModal' id="
										+ result[index].locationId
										+ " onclick='getId3(this)' data-toggle='modal' style='height:22px;width:24px' warehouseid='"
										+ result[index].warehouseId
										+ "' zoneid='"
										+ result[index].reservoirId
										+ "' locationid='"
										+ result[index].locationId
										+ "' locationname= '"
										+ result[index].locationName
										+ "' locationmemo='' locationstatus='空闲' class='btn btn-default btn-xs operate-location-edit' type='button'>"
										+ "<span class='glyphicon glyphicon-align-justify'></span></button>"
										+ "</span>" + "</h5>" + "</a>")
					}
				}

			});
}

// 删除时提醒框
function del1(event) {
	var msg = "确认删除仓库么？";
	if (confirm(msg) == true) {
		removeWarehouseInfo(event);
	} else {
		return false;
	}
}
function del2(event) {
	var msg = "确认删除库区么？";
	if (confirm(msg) == true) {
		removeReservoirInfo(event);
	} else {
		return false;
	}
}
function del3(event) {
	var msg = "确认删除库区么？";
	if (confirm(msg) == true) {
		removeLocationInfo(event);
	} else {
		return false;
	}
}

// 显示左边区域中的选中行
function aimPartthree(event) {
	var parent = $(event).parent();
	var as = $(parent).find("a");
	// console.log(as.length);
	for (var index = 0; index < as.length; index++) {
		$(as[index]).attr("class", "list-group-item operate-reservoir");
	}
	$(event).attr("class", "list-group-item operate-reservoir active");
}

// 显示中间区域中的选中行
function aimPartfour(event) {
	var parent = $(event).parent();
	var as = $(parent).find("a");
	// console.log(as.length);
	for (var index = 0; index < as.length; index++) {
		$(as[index]).attr("class", "list-group-item operate-zone");
	}
	$(event).attr("class", "list-group-item operate-zone active");
}

// 显示右边区域中的选中行
function aimPartfive(event) {
	var parent = $(event).parent();
	var as = $(parent).find("a");
	// console.log(as);
	for (var index = 0; index < as.length; index++) {
		$(as[index]).attr("class", "list-group-item operate-location");
	}
	$(event).attr("class", "list-group-item operate-location active");
}

// 将隐藏的库区信息显示出来
function showPartthree(event) {
	aimPartthree(event);
	// hidePartthree();
	hidePartfour();
	$("#partthree").show();
	$("#partthree").attr("warehouseid", $(event).attr("warehouseid"));
	queryReservoirInfo();
}

// 将隐藏的库位信息显示出来
function showPartfour(event) {
	aimPartfour(event);
	$("#partfour").show();
	$("#partfour").attr("zoneid", $(event).attr("zoneid"));
	queryLocationInfo();
}

// 将隐藏的库区信息不显示出来
function hidePartthree() {
	$("#partthree").hide();
}

// 将隐藏的库位信息不显示出来
function hidePartfour() {
	$("#partfour").hide();
}

// 显示库位信息
function showPartfive(event) {
	aimPartfive(event);
}

function warehouseExist() {
	$("#existedWarehouse").style.display = "block";
}

// 自由仓库信息
function ziyoucangku() {
	$("#qimenRemark").hide();
	$("#ziyouWarehouse").show();
	$("#qimenWarehouse").hide();
}

// 奇门仓库信息
function qimencangku() {
	$("#ziyouWarehouse").hide();
	$("#qimenWarehouse").show();
	$("#qimenRemark").show();
}