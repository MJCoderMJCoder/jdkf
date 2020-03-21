<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
       String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <style type="text/css">
        .Header {background: url(<%=path %>/img/banner.jpg) #d10e00 repeat-x left top; height: 70px;width: 966px;}
        .HeaderTop {margin: 0px auto;}
     </style>
     <script type="text/javascript" src="<%=path %>/js/public.js"></script>
     <script type="text/javascript">
         function myxinxi()
         {
                <c:if test="${sessionScope.userType!=1}">
	               alert("请先登录");
	            </c:if>
	            <c:if test="${sessionScope.userType==1}">
	                var url="<%=path %>/qiantai/userinfo/userXinxi.jsp";
	                var n="";
	                var w="480px";
	                var h="500px";
	                var s="resizable:no;help:no;status:no;scroll:yes";
				    openWin(url,n,w,h,s);
	            </c:if>
         }
         function liuyanAll()
         {
                <c:if test="${sessionScope.userType!=1}">
	               alert("请先登录");
	            </c:if>
	            <c:if test="${sessionScope.userType==1}">
                    var targetWinUrl="<%=path %>/liuyanAll.action";
					var targetWinName="newWin";
					var features="width=700,height=800,toolbar=no, top=0, left=0, menubar=no, scrollbars=no, resizable=no,location=no, status=no"
					var new_win=window.open(targetWinUrl,targetWinName,features);
	            </c:if>
         }
         
         function reg()
         {
                var url="<%=path %>/qiantai/userinfo/userReg.jsp";
                var n="";
                var w="480px";
                var h="500px";
                var s="resizable:no;help:no;status:no;scroll:yes";
			    openWin(url,n,w,h,s);
         }
     </script>
  </head>
  
  <body>
        <div class="Header HeaderTop">
			<br/>
			<font style="font-size: 40px;color: white;font-weight: bolder;display: block;text-align: center;">基于java的酒店管理系统的设计与实现</font>
		</div>
		<div class="topmenu cbody1">
			<ul>
				<li class="thisclass">
					<A href="<%=path %>/qiantai/default.jsp">网站首页</A>
				</li>
				<c:forEach items="${sessionScope.cateLogList}" var="catelog">
				<li class="thisclass">
					<A href="<%=path %>/kefangByCatelog.action?catelogId=${catelog.catelogId}">${catelog.catelogName}</A>
				</li>    
				</c:forEach>
				<li class="thisclass">
					<A href="#" onclick="reg()">在线注册</A>
				</li>
				<li class="thisclass">
					<A href="#" onclick="myxinxi()">我的信息</A>
				</li>
				<li class="thisclass">
					<A href="#" onclick="liuyanAll()">留言板</A>
				</li>
			</ul>
		</div>
		<form id="searchForm" action="<%=path %>/kefangSearch.action" method="post">
			<div class="topsearch">
				<div class="title"></div>
				<div id="page_search_left">
					价格区间：
					<input onfocus="this.value=''" class="inputText" id="" size="5" name="qianshu1" type="text" value="50" onpropertychange="onchange1(this.value)" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
					--
					<input onfocus="this.value=''" class="inputText" id="" size="5" name="qianshu2" type="text" value="1000" onpropertychange="onchange1(this.value)" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
				</div>
				<div id="page_search_btn">
					<input type="submit" value="搜索">
				</div>
				<div id="page_search_right">
					<script>
						<!--var day="";
						var month="";
						var ampm="";
						var ampmhour="";
						var myweekday="";
						var year="";
						mydate=new Date();
						myweekday=mydate.getDay();
						mymonth=mydate.getMonth()+1;
						myday= mydate.getDate();
						year= mydate.getFullYear();
						if(myweekday == 0)
						weekday=" 星期日 ";
						else if(myweekday == 1)
						weekday=" 星期一 ";
						else if(myweekday == 2)
						weekday=" 星期二 ";
						else if(myweekday == 3)
						weekday=" 星期三 ";
						else if(myweekday == 4)
						weekday=" 星期四 ";
						else if(myweekday == 5)
						weekday=" 星期五 ";
						else if(myweekday == 6)
						weekday=" 星期六 ";
						document.write(year+"年"+mymonth+"月"+myday+"日 "+weekday);
						//-->
					</script>
				</div>
				<div style="clear: both"></div>
			</div>
		</form>
  </body>
</html>
