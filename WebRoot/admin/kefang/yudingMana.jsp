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
           function yudingDel(id)
           {
                var url="<%=path %>/yudingDel.action?id="+id;
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:200,height:120});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","操作窗口");
	            pop.build();
	            pop.show();
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="10" background="<%=path %>/img/tbg.gif">&nbsp;预订管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">预订房间</td>
					<td width="10%">预订天数</td>
					<td width="10%">会员</td>
					<td width="10%">联系方式</td>
					<td width="10%">预订时间</td>
					<td width="10%">操作</td>
		        </tr>	
				<s:iterator value="#request.yudingList" id="yuding">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#yuding.kefang.fangjianhao"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#yuding.tianshu"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#yuding.user.userName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#yuding.yudingzheTel"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#yuding.shijian"/>
					</td>
					<td  bgcolor="#FFFFFF" align="center" >
						<a style="color: red" href="#" onclick="yudingDel(<s:property value="#yuding.id"/>)" class="pn-loperator">删除</a>
					</td>
				</tr>
				</s:iterator>
			</table>
	</body>
</html>
