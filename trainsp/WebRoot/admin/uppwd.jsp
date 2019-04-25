<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0040)http://2school.wygk.cn/admin/syscome.asp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>欢迎进入系统后台</TITLE>

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
<%HashMap admin = (HashMap)request.getSession().getAttribute("admin"); %>
<form action="/trainsp/train?ac=adminuppass" name="f1" method="post" onsubmit="return check()">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
    <TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">请输入新密码</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="80%" height=24>
		<input name="upass1" type="text" id="upass1" >
	</TD></TR>
	    <TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">再次输入新密码</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="80%" height=24>
		<input name="upass" type="text" id="upass" >
	</TD></TR>
  <TR>
    <TD height=31 colspan="2" align="center" bgcolor="#FFFFFF" class="STYLE19">
      <input type="submit" name="Submit"  value="提交信息">&nbsp;&nbsp;&nbsp;<input type="reset" name="Submit" value="重新填写">    </TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script  language=javascript src="/trainsp/fckeditor/fckeditor.js"></script>
<script type="text/javascript">




function check()
{

if(f1.upass1.value=="")
{
alert("请输入新密码");
return false;
}
if(f1.upass.value=="")
{
alert("请再次输入新密码");
return false;
}if(f1.upass1.value!=f1.upass.value)
{
alert("两次密码不一致");
return false;
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
location.replace("/trainsp/admin/uppwd.jsp");
 <%}%>
 </script>
