/* camera.js代码 */
$(function() {
	var w = 320, h = 240;
	var pos = 0, ctx = null, saveCB;

	var canvas = document.getElementById("canvas")
	if (canvas.toDataURL) {
		ctx = canvas.getContext("2d");
		var image = ctx.getImageData(0, 0, w, h);

		saveCB = function(data) {
			var col = data.split(";");
			var img = image;

			for (var i = 0; i < 320; i++) {
				var tmp = parseInt(col[i]);
				img.data[pos + 0] = (tmp >> 16) & 0xff;
				img.data[pos + 1] = (tmp >> 8) & 0xff;
				img.data[pos + 2] = tmp & 0xff;
				img.data[pos + 3] = 0xff;
				pos += 4;
			}

			if (pos >= 4 * 320 * 240) {
				ctx.putImageData(img, 0, 0);
				var Imagedata = canvas.toDataURL().substring(22); // 上传给后台的图片数据

				pos = 0;
			}
		};
	} else {
		var image = [];
		saveCB = function(data) {
			image.push(data);
			pos += 4 * 320;
			if (pos >= 4 * 320 * 240) {
				$.post(URL, {
					briStr : image.join(';')
				}, function(data) {
					console.log(data);
					// 在页面显示base64图片处理
					pos = 0;
					image = [];
				});
			}
		};
	}

	$("#camera").webcam({
		width : w,
		height : h,
		mode : "callback",
		swffile : "./jscam.swf",
		onSave : saveCB,
		onCapture : function() { // 捕获图像
			webcam.save();
		},
		debug : function(type, string) { // 控制台信息
			console.log(type + ": " + string);
		},
		onLoad : function() { // flash 加载完毕执行
			console.log('加载完毕！')
		}
	});

	$(".play").click(function() {
		webcam.capture();
	});

});
