<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
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
<%CommDAO dao = new CommDAO();
String id = request.getParameter("id");
HashMap map = dao.select("select * from pw where id="+id).get(0);
 %>
<form action="/trainsp/train?ac=uppw" name="f1" method="post" onsubmit="return check()">
<input type="hidden" id="id" name="id"/>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
 
  <TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">车次号</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="80%" 
      height=24><label>
      <input name="checi" type="text" id="checi" >
    </label>
    </TD>
  </TR>
  <TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">始发站</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="80%" height=24>
		<input name="saddr" type="text" id="saddr" >
	</TD></TR>
  <TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">到达站</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="80%" height=24>
		<input name="eaddr" type="text" id="eaddr">
	</TD></TR>
  <TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">开车时间</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="80%" height=24>
		<input name="stime" type="text" id="stime" >
	</TD></TR>
  <TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">到站时间</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="80%" height=24>
		<input name="etime" type="text" id="etime" >
	</TD></TR>
  <TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">特等座位</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="80%" height=24>
		座位数：<input name="tdzsl" type="text" id="tdzsl" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
		票价：<input name="tdzjg" type="text" id="tdzjg" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
	</TD></TR>
	<TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">一等座位</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="80%" height=24>
		座位数：<input name="ydzsl" type="text" id="ydzsl" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
		票价：<input name="ydzjg" type="text" id="ydzjg" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
	</TD></TR>
	<TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">二等座位</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="80%" height=24>
		座位数：<input name="edzsl" type="text" id="edzsl" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
		票价：<input name="edzjg" type="text" id="edzjg" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
	</TD></TR>
	<TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">运行时间</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="80%" height=24>
		<input name="yxsj" type="text" id="yxsj" > 小时
	</TD></TR>
	<TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">车票日期</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="80%" height=24>
		<input name="sj" type="text" id="sj" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly==true>
	<script type="text/javascript" src="/trainsp/commfiles/js/calendar/WdatePicker.js"></script>
	</TD></TR>
  <TR>
    <TD height=31 colspan="2" align="center" bgcolor="#FFFFFF" class="STYLE19">
      <input type="submit" name="Submit"  value="提交信息">&nbsp;&nbsp;&nbsp;<input type="reset" name="Submit" value="重新填写">    </TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">




function check()
{
if(f1.checi.value=="")
{
alert("请输入车次");
return false;
}
if(f1.saddr.value=="")
{
alert("请输入始发站");
return false;
}
if(f1.eaddr.value=="")
{
alert("请输入到达站");
return false;
}if(f1.stime.value=="")
{
alert("请输入开车时间");
return false;
}if(f1.etime.value=="")
{
alert("请输入到站时间");
return false;
}if(f1.tdzsl.value=="")
{
alert("请输入特等座位数");
return false;
}if(f1.tdzjg.value=="")
{
alert("请输入特等座价格");
return false;
}if(f1.ydzsl.value=="")
{
alert("请输入一等座位数");
return false;
}if(f1.ydzjg.value=="")
{
alert("请输入一等座价格");
return false;
}if(f1.edzsl.value=="")
{
alert("请输入二等座位数");
return false;
}if(f1.edzjg.value=="")
{
alert("请输入二等座价格");
return false;
}if(f1.sj.value=="")
{
alert("请输入车票日期");
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
location.replace("/trainsp/admin/pwgl.jsp");
 <%}%>
 </script>
<%=Info.tform(map)%>