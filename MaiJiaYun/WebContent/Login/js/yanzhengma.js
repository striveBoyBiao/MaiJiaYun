//根据传入的最大最小值生成随机数
function getnum(min, max) {
	return (Math.random() * (max - min) + min);
}

function getcolor(min, max) {
	return "rgb(" + Math.floor(getnum(min, max)) + "," + Math.floor(getnum(min, max)) + "," + Math.floor(getnum(min, max)) + ")";
}

var str;
function draw() {
	//初始化数据
	var ca = document.getElementById("yanzhengma");
	var w = ca.width;
	var h = ca.height;
	var ctx = ca.getContext("2d");
	ctx.textBaseline = 'bottom';
	//绘制背景色
	ctx.fillStyle = getcolor(188, 240);
	ctx.fillRect(0, 0, w, h);
	//绘制文字
	str = "";//用于存放最后的完整验证码
	for (i = 0; i < 4; i++) {
		var num = Math.floor(getnum(0, 10));
		str = str + num;
		ctx.fillStyle = getcolor(50, 160);//随机字体颜色
		ctx.font = Math.floor(getnum(25, 30)) + "px SimHei";//随机字体大小
		var x = 10 + i * 20;
		var y = getnum(25, 45);
		var deg = getnum(-45, 45);
		ctx.translate(x, y);//偏移
		ctx.rotate(deg * Math.PI / 180);//旋转
		ctx.fillText(num, 0, 0);
		ctx.rotate(-deg * Math.PI / 180);
		ctx.translate(-x, -y);
	}
	ca.className=str;
	//干扰线
	for (i = 0; i < 6; i++) {
		ctx.strokeStyle = getcolor(40, 180);
		ctx.beginPath();
		ctx.moveTo(getnum(0, w), getnum(0, h));
		ctx.lineTo(getnum(0, w), getnum(0, h));
		ctx.stroke();
	}
	//干扰点
	for (i = 0; i < 50; i++) {
		ctx.strokeStyle = getcolor(0, 255);
		ctx.beginPath();
		ctx.arc(getnum(0, w), getnum(0, h), 1, 0, 2 * Math.PI);
		ctx.fill();
	}
}