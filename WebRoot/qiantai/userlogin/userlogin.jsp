<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
	
	<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
    
	<script type="text/javascript">
	        function reg()
	        {
	                var url="<%=path %>/qiantai/userinfo/userReg.jsp";
	                var n="";
	                var w="480px";
	                var h="500px";
	                var s="resizable:no;help:no;status:no;scroll:yes";
				    openWin(url,n,w,h,s);
	        }
	        function login()
	        {
	           if(document.userLogin.userName.value=="")
	           {
	               alert("请输入用户名");
	               return;
	           }
	           if(document.userLogin.userPw.value=="")
	           {
	               alert("请输入密码");
	               return;
	           }
	           document.getElementById("indicator").style.display="block";
	           loginService.login(document.userLogin.userName.value,document.userLogin.userPw.value,1,callback);
	        }
	        
	        function callback(data)
			{
			    document.getElementById("indicator").style.display="none";
			    if(data=="no")
			    {
			        alert("用户名或密码错误");
			    }
			    if(data!="no")//返回的data就是用户的id
			    {
			        //alert("通过验证,系统登录成功");
			        document.getElementById("dialogBg").style.display="block";
			        document.getElementById("dialogContent").style.display="block";
			        //window.location.reload();
			    }
			}
	        
	</script>
  </head>
  
  <body>
	        <s:if test="#session.user==null">
			<form name="userLogin" method="POST" action="">
			      <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
			          <tr>
			            <td align="center" colspan="2" height="10"></td>
			          </tr>
			          <tr>
			            <td align="right" width="31%" height="30" style="font-size: 11px;">用户名：</td>
			            <td align="left" width="69%"><input class="input" id="userName" title="用户名不能为空" size="14" name="userName" type="text" /></td>
			          </tr>
			          <tr>
			            <td align="right" height="30" style="font-size: 11px;">密　码：</td>
			            <td align="left"><input class="input" title="密码不能为空" type="password" size="16" name="userPw"/></td>
			          </tr>
			          <tr>
			            <td align="center" colspan="2" height="10"><font color="red"><s:property value="#request.error"/></font></td>
			          </tr>
			          <tr>
			            <td align="center" colspan="2" height="30">
			               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			               <input type="button" value="登  录" onclick="login()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
						   &nbsp;
						   <input type="button" value="注  册" onclick="reg()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
			               <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
			            </td>
			          </tr>
			      </table>
		    </form>
		    </s:if>
		    <s:else>
		        <br/>
			     欢迎您：<s:property value="#session.user.userRealname"/> &nbsp;&nbsp;
			    <a href="<%=path %>/userLogout.action">安全退出</a> &nbsp;&nbsp;
			    <br/><br/><br/>
			</s:else>
  </body>
</html>
