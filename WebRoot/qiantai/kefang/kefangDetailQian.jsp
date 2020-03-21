<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<link href="<%=path %>/css/layout.css" type="text/css" rel="stylesheet" />
		
		<script type="text/javascript" src="<%=path %>/js/popup_shuaxin_no.js"></script>
	    <script type="text/javascript">
	        function yuding(kefangId)
	        {
	            <c:if test="${sessionScope.user==null}">
	               alert("请先登录");
	            </c:if>
	            <c:if test="${sessionScope.user !=null}">
	                var url="<%=path %>/qiantai/kefang/yuding.jsp?kefangId="+kefangId;
		            var pop=new Popup({ contentType:1,isReloadOnClose:false,width:450,height:300});
		            pop.setContent("contentUrl",url);
		            pop.setContent("title","预订客房");
		            pop.build();
		            pop.show();
	            </c:if>
	        } 
	        
	        function pinglunAll(id)
	        {
	            var url="<%=path %>/pinglunAll.action?kefangId="+id;
	            var pop=new Popup({ contentType:1,isReloadOnClose:false,width:650,height:450});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","评论");
	            pop.build();
	            pop.show();
	        }
       
	       function pinglunAdd(id)
	       {
	            var url="<%=path %>/qiantai/kefang/pinglunAdd.jsp?kefangId="+id;
	            var pop=new Popup({ contentType:1,isReloadOnClose:false,width:700,height:400});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","写评论");
	            pop.build();
	            pop.show();
	       }
	       
	       function back()
	       {
	           window.history.back();
	       }
	    </script>
	</head>

	<body>
		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
		<div class="page_row">
			<div class="page_main_msg left">
			    <!--新入博主  -->
			    <div class="left_row">
					<div class="list pic_news">
						<div class="list_bar">
							客房详细介绍
						</div>
						<div id="tw" class="list_content">
							<table width="100%" border="0" cellpadding="9" cellspacing="9">
							    <tr>
							       <td align="left">照片：<img src="<%=path %>/${requestScope.kefang.fujian }" width="180" height="150"/></td>
							    </tr>
							    <tr>
							       <td align="left">房间号：${requestScope.kefang.fangjianhao }</td>
							    </tr>
							    <tr>
							       <td align="left">房间面积：${requestScope.kefang.area }</td>
							    </tr>
							    <tr>
							       <td align="left">介绍：${requestScope.kefang.jieshao }</td>
							    </tr>
							    <tr>
							       <td align="left">房间费(一天)：${requestScope.kefang.qianshu }</td>
							    </tr>
							    <tr>
								   <td align="left">
								       <a href="#" style="color: red" onclick="pinglunAll(${requestScope.kefang.id })">客房评论</a>
								       &nbsp;
								       <a href="#" style="color: red" onclick="pinglunAdd(${requestScope.kefang.id })">我要评论</a>
								   </td>
								</tr>
							    <tr>
							       <td align="center">
							           <a href="#" onclick="yuding(${requestScope.kefang.id })"><img src="<%=path %>/img/yuding.jpg" width="60" height="30"/></a>
							           &nbsp;&nbsp;
							           <a href="#" onclick="back()"><img src="<%=path %>/img/123.jpg" width="60" height="30"/></a>
                                   </td>
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
	</body>
</html>
