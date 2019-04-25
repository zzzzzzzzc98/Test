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
<%
CommDAO dao = new CommDAO();
String id = request.getParameter("id");
String sql = "select * from videoinfo where id="+id; 
HashMap map = dao.select(sql).get(0);
%>
<form action="/trainsp/sys.do?action=videoup" name="f1" method="post" onsubmit="return check()"  enctype="multipart/form-data">
<input type="hidden" id="id" name="id" />
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
 
  <TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">请输入标题</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="80%" 
      height=24><label>
      <input name="title" type="text" id="title">
    </label>
   类型:<select id="type" name="type">
      				<option value="1" <%if(map.get("type").equals("1")){out.print("selected==selected");} %>>风景</option>
      				<option value="2" <%if(map.get("type").equals("2")){out.print("selected==selected");} %>>人文</option>
      				<option value="3" <%if(map.get("type").equals("3")){out.print("selected==selected");} %>>动物</option>
      				<option value="4" <%if(map.get("type").equals("4")){out.print("selected==selected");} %>>建筑</option>
      				<option value="5" <%if(map.get("type").equals("5")){out.print("selected==selected");} %>>随拍</option>
      			</select>
    
    </TD></TR>
<TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">视频附件</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="80%" height=24><input name="txt1" type="file" id="txt1"></TD></TR>
   
    <TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">请输入内容</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="80%" height=24> <textarea rows="" cols="" name="mt" id="mt"><%=map.get("content") %></textarea></TD></TR>
  <TR>
    <TD height=31 colspan="2" align="center" bgcolor="#FFFFFF" class="STYLE19">
      <input type="submit" name="Submit"  value="提交信息">&nbsp;&nbsp;&nbsp;<input type="reset" name="Submit" value="重新填写">    </TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script  language=javascript src="/trainsp/fckeditor/fckeditor.js"></script>
<script type="text/javascript">

function window.onload() { 

var of = new FCKeditor("mt");
of.BasePath="/trainsp/fckeditor/";
of.Height = "285";
of.ToolbarSet="Default";
of.ReplaceTextarea();

if(top.location != self.location){ 

var a = window.parent.document.getElementsByTagName('iframe'); 

for (var i=0; i<a.length; i++){ 

if (a[i].name == self.name) {a[i].height = document.body.scrollHeight+150; return;}}} 

}


function check()
{
if(f1.title.value=="")
{
alert("请输入标题");
return false;
}
if(f1.type.value=="")
{
alert("请选择类型");
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
  parent.location.replace("/trainsp/admin/video.jsp");
 <%}%>
 </script>
<%=Info.tform(map)%>