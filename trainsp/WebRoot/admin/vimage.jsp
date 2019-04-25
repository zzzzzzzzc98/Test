<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0040)http://2school.wygk.cn/admin/syscome.asp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>图片预览</TITLE>

<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
-->
</style>

<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY>
<form action="/trainsp/sys.do?action=addsysuser" name="f1" method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
 
  <TR>
    <TD width="100%" height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">
   		<%
   		String url = request.getParameter("url");
   		 %>
   		 <img src="/trainsp/upfile/<%=url %>" />
    </TD>
   </TR>
 
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">
function check()
{
if(f1.uname.value=="")
{
alert("请输入用户名");
return;
}
if(f1.upass.value=="")
{
alert("请输入密码");
return;
}
if(f1.tname.value=="")
{
alert("请输入姓名");
return;
}if(f1.utype.value=="")
{
alert("请选择用户角色");
return;
}
}
</script>
<script type="text/javascript">
<%
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("已存在的用户名");
 <%}%>
 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
  parent.location.replace("/trainsp/admin/sysusers.jsp");
 <%}%>
 </script>
