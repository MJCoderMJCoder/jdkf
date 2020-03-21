<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>酒店管理系统</title>
		<meta charset="UTF-8">
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<link href="<%=path %>/css/layout.css" type="text/css" rel="stylesheet" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		<script language="JavaScript" src="<%=path %>/jQuery-webcam/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script language="JavaScript" src="<%=path %>/jQuery-webcam/jquery.webcam.min.js" type="text/javascript"></script>
		<script language="JavaScript">
		
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
				swffile : "<%=path %>/jQuery-webcam/jscam.swf",
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
				
				var arr = canvas.toDataURL('image/png').split(','), mime = arr[0].match(/:(.*?);/)[1], bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
				while(n--){
					u8arr[n] = bstr.charCodeAt(n);
				}
				var dataURLtoBlob= new Blob([u8arr], {type:mime});
				console.log('dataURLtoBlob：'+dataURLtoBlob)
				if(dataURLtoBlob){
					var fd = new FormData();
					fd.append("fujian", dataURLtoBlob, "image.png");
                    $.ajax({
                        url: "<%=path %>/compare.action",
                        type: "POST",
                        processData: false,
                        contentType: false,
                        data: fd,
                        success: function(d) {
                        	if(d>75){
            			        document.getElementById("dialogBg").style.display="none";
            			        document.getElementById("dialogContent").style.display="none";
                        		window.location.reload();
                        	}else{
            			        document.getElementById("dialogBg").style.display="none";
            			        document.getElementById("dialogContent").style.display="none";
            			        alert("检测到不是本人，请重新登录");
                        	}
                        }
                    });
				}
			});

		});
		</script>
	    <style type="text/css">
	        /* CSS */
	        .borderstyle {
	            border: 1px solid #b6b6b6;
	            width: 320px;
	            height: 240px;
	            opacity: 1.0;
	            z-index: 999;
	        }
	
	        #camera {
	            float: left;
	            margin: 10px;
	            opacity: 1.0;
	            z-index: 999;
	        }
	
	        #canvas {
	            width: 320px;
	            height: 240px;
	            margin: 10px;
	            opacity: 1.0;
	            z-index: 999;
	            display: none;
	        }
    	</style>
	</head>

	<body>
		<div id="dialogBg" style="display:none; background-color:black;opacity:0.5; z-index: 99; position: absolute; top:0px;right:0px; width: 100%;height: 100%"></div>
		<div  id="dialogContent" style="display:none; z-index: 100; position: absolute; top:30%; right:-40%; width: 100%;height: 100%">
			<div id="camera" class="borderstyle">
			    <button class="play" style="z-index: 999; width: 100%">开始人脸识别</button>
			</div>
		    <canvas id="canvas" class="borderstyle" width="320px" height="240px"></canvas>
		    <div id="showImg" style="display: none; z-index: 999; "></div>
		</div>
  		<div  style="display:block; z-index: 1;position: relative;">
			<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
			<div class="page_row">
				<div class="page_main_msg left">
				    <!--新入博主  -->
				    <div class="left_row">
						<div class="list pic_news">
							<div class="list_bar">
								精品客房
							</div>
							<div id="tw" class="list_content">
								<table cellspacing="9" cellpadding="2">
							          <tr>
							               <c:forEach items="${requestScope.kefangList}" var="kefang" varStatus="sta">
							                  <c:if test="${sta.index%4==0}">
							                     </tr><tr>
							                  </c:if>
							                  <td align="center">
												   <a href="<%=path %>/kefangDetailQian.action?id=${kefang.id}">
												      <img src="<%=path %>/${kefang.fujian}" width="140" height="120"/><br/><br/>
													  ${kefang.catelog.catelogName}(${kefang.fangjianhao})
												   </a>
							                  </td>
							              </c:forEach>
							          </tr>
							    </table>
							</div>
						</div>
					</div>
					<!-- 新入博主 -->
				</div>
				
				<!-- 右边的用户登录。留言。投票 -->
				<div class="page_other_msg right">
					<div class="left_row">
						<div class="list">
							<div class="list_bar">用户登录</div>
							<div class="list_content">
								<div id="div">
									<jsp:include flush="true" page="/qiantai/userlogin/userlogin.jsp"></jsp:include>
								</div>
							</div>
						</div>
					</div>
					<div class="left_row">
					    <div class="list">
					        <div class="list_bar">网站公告</div>
					        <div class="list_content">
					            <div id="div"> 
									<s:action name="gonggaoQian5" executeResult="true" flush="true"></s:action>
						        </div>
						    </div>
					    </div>
					</div>
					<div class="left_row">
					    <div class="list">
					        <div class="list_bar">网站日历表</div>
					        <div class="list_content">
					            <jsp:include flush="true" page="/qiantai/rili/rili.jsp"></jsp:include>
						    </div>
					    </div>
				    </div>
				</div>
				<!-- 右边的用户登录。留言。投票 -->
			</div>
			
			<div class="foot">
			   <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
		    </div>
		    
		</div>
	</body>
</html>
