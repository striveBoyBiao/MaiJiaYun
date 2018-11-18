


//单击触发事件
function advanced(){
	$("#collapseOne").hide();
	$("#advanced").click(function(){
		$("#search-pro").slideToggle("slow");
	});
	//moreSearchBtn
	$("#moreSearchBtn").click(function(){
		if($("#moreSearchIcon").prop("className")=="caret_down"){
			$("#moreSearchIcon").prop("className","caret");
		}else{
			$("#moreSearchIcon").prop("className","caret_down");
		}
		
		$("#collapseOne").toggle();
	});
	
}
//页面加载时隐藏某些项
/*window.onload = function(){
	var pro = document.getElementById("search-pro");
		pro.style.display="none";
	var collapseOne = document.getElementById("collapseOne");
		collapseOne.style.display = "none";
}*/

//验证手机号是否正确
/*function isPhoneNo(receiverMobile) { 
 var pattern = /^1[34578]\d{9}$/; 
 return pattern.test(receiverMobile); 
}
function phoneCheck(){
	var phone = document.getElementById("receiverMobile");
    if(!(/^1[34578]\d{9}$/.test(phone.value))){ 
        alert("=_=  亲手机号码有误哦，请重填吧");
        return false; 
    }
}

//receiverPhone
//验证电话
 function checkTel(){
	var tel = document.getElementById('receiverPhone').value;
	if(!/^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/.test(tel)){
		alert('(=^ ^=)亲，固定电话有误，请重填');
		return false;
}
}*/