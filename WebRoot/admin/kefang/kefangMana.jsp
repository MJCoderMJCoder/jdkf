<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<script type="text/javascript" src="<%=path %>/js/popup_shuaxin.js"></script>
		
        <script language="javascript">
           function kefangDel(id)
           {
                var url="<%=path %>/kefangDel.action?id="+id;
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:200,height:120});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","操作窗口");
	            pop.build();
	            pop.show();
           }
           function kefangEditPre(id)
           {
                var url="<%=path %>/kefangEditPre.action?id="+id;
                window.location.href=url;
           }
           function over(picPath)
	       {
			  if (picPath=="")picPath="/images/default.jpg";
			  x = event.clientX;
			  y = event.clientY;      
			  document.all.tip.style.display = "block";
			  document.all.tip.style.top = y;
			  document.all.tip.style.left = x+10;
			  document.all.photo.src = ".."+picPath; 
		   }
		   function out()
	       {
			  document.all.tip.style.display = "none";
		   }	
		   
		   function kefangAdd()
           {
              var url="<%=path %>/admin/kefang/kefangAdd.jsp";
              window.location.href=url;
           }
           
           function kefangPinglun(id)
	       {
	            var url="<%=path %>/pinglunMana.action?kefangId="+id;
	            var pop=new Popup({ contentType:1,isReloadOnClose:false,width:650,height:450});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","评论管理");
	            pop.build();
	            pop.show();
	       }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="10" background="<%=path %>/img/tbg.gif">&nbsp;客房管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">客房类型</td>
					<td width="10%">房间号</td>
					<td width="10%">房间面积</td>
					<td width="30%">房间介绍</td>
					<td width="10%">房间图片</td>
					<td width="7%">房间费(一天)</td>
					<td width="13%">操作</td>
		        </tr>	
				<s:iterator value="#request.kefangList" id="kefang">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#kefang.catelog.catelogName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#kefang.fangjianhao"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#kefang.area"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#kefang.jieshao" escape="false"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   <div onmouseover = "over('<%=path %>/<s:property value="#kefang.fujian"/>')" onmouseout = "out()" style="cursor:hand;">
						   客房图片
					   </div>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#kefang.qianshu"/>
					</td>
					<td  bgcolor="#FFFFFF" align="center" >
						<a style="color: red" href="#" onclick="kefangDel(<s:property value="#kefang.id"/>)" class="pn-loperator">删除</a>
						
						<a style="color: red" href="#" onclick="kefangEditPre(<s:property value="#kefang.id"/>)" class="pn-loperator">编辑</a>
						
						<a style="color: red" href="#" onclick="kefangPinglun(<s:property value="#kefang.id"/>)" class="pn-loperator">评论管理</a>
					</td>
				</tr>
				</s:iterator>
			</table>
			<div id="tip" style="position:absolute;display:none;border:0px;width:80px; height:80px;">
			<TABLE id="tipTable" border="0" bgcolor="#ffffee">
				<TR align="center">
					<TD><img id="photo" src="" height="80" width="80"></TD>
				</TR>
			</TABLE>
			</div>
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加客房" style="width: 80px;" onclick="kefangAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
