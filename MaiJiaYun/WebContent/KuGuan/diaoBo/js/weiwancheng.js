
//全选
function checkAll(flag) {
	var diaobodans = document.getElementsByName("diaobodancheck");
	for (var i = 0; i < diaobodans.length; i++) {

		diaobodans[i].checked = flag;
	}
}

// 批量删除
function deletebatch() {
	// var diaobodans=document.getElementsByName("diaobodancheck");
	var tbody = $("#tbody");
	for (var index = 0; index < tbody.length; index++) {
		var input = $(tbody[index]).find("input");

		if (input[0].checked == true) {
			var tds = $(tbody[index]).find("td");
			var diaoboCodes = $(tds[1]).text();
			var diaoboState = $(tds[8]).text();
			
			if(diaoboState=="出库中"||diaoboState=="入库中"){
				$("#pandiantext").text("确认删除盘点单么？");
				$("#batchDelete").attr("data-toggle","modal");
				
				function sure(){
					$("#pandiantext").text("调拨单状态不符合删除条件");
					$("#sure1").attr("data-toggle","modal");
				}
				
			}
			/*
			 * $("#pandiantext").text("确认删除盘点单么？");
			 * $("#batchDelete").attr("data-toggle","modal");
			 */

		}/*
			 * else{ $("#pandiantext").text("请至少选择一个盘点单");
			 * $("#batchDelete").attr("data-toggle","modal"); }
			 */
	}

	console.log(diaoboCodes);
	console.log(diaoboState);
}



// 确认调拨按钮
var diaoboSure = function(event) {

	var btn_id="#diaobo_btn"+event;
	//console.log(ss);
	$(btn_id).css("visibility","hidden");
	//$("#tbody").find(event).css("visibility", "hidden");

	// var bb=document.getElementById("diaobo_btn${st.index }");
	/*var index = ${st.index};
	console.log(index);*/

	var dbCode = "#diaobo_Code" + event;
	//console.log(dbCode);
	var diaobodancode = $(dbCode).text();
	console.log(diaobodancode);
	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/WeiwanchengServlet3",
		data : {
			diaobodancode : diaobodancode
		},
		type : "post",
		dataType : "json",
		success : function(result) {
				//console.log(111);
			var url = window.document.location.pathname
					.substring(0, window.document.location.pathname.substr(1)
							.indexOf('/') + 1)
					+ "/servlet/kg/WeiwanchengServlet1";
			if (result) {
				// alert(url);
				location.href = url;

			}
		}

	});

}

//模糊查询框

function querydiaobo(){
	var queryParam=$("#query1").find("input").val().trim();
	console.log(queryParam);
	
	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/servlet/kg/WeiwanchengServlet1",
		type : "post",
		data:{queryParam:queryParam},
		datatype:"json",
		success:function(result){
			
			location.href = window.document.location.pathname
			.substring(0, window.document.location.pathname.substr(1)
					.indexOf('/') + 1)
			+ "/servlet/kg/WeiwanchengServlet1?queryParam="+queryParam;
		}
		
	});
}



/*var bb=document.getElementById("diaobo_state${st.index }");
console.log(111);
var diaobostate=bb.innerHTML;
console.log(111);
//for (var a = 0; a < cc; a++) {
if(diaobostate=="待审核"){
	var ind=${st.index};
	//console.log(bb);
	var xingqing="#xiangqing"+ind;
	//console.log(ss);
	$(xingqing).attr("href","${pageContext.request.contextPath}/servlet/kg/DiaoboAddServlet");
}*/
