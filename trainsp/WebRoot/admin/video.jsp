<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">

<!--
body {
font:12px Arial, Helvetica, sans-serif;
	color: #000;
	background-color: #EEF2FB;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #EEF2FB;
}
-->
</style>
<script type="text/javascript" src="/trainsp/js/popup.js"></script>
<link href="/trainsp/images/skin.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
   <%
String url="/trainsp/admin/video.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String type = request.getParameter("type")==null?"":request.getParameter("type");
String stime = request.getParameter("stime")==null?"":request.getParameter("stime");
String etime = request.getParameter("etime")==null?"":request.getParameter("etime");
String sql = "select * from videoinfo where 1=1  ";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (title like'%"+key+"%' or uname like'%"+key+"%' ) ";
}if(!type.equals(""))
{
url+="&type="+type;
sql+=" and ( type='"+type+"' ) ";
}if(!stime.equals(""))
{
url+="&stime="+stime;
sql+=" and ( savetime>='"+stime+"' ) ";
}if(!etime.equals(""))
{
url+="&etime="+etime;
sql+=" and ( savetime<='"+etime+"' ) ";
}
sql+=" order by id desc ";
 %>
     <form action="/trainsp/admin/video.jsp?f=f" method="post" name="f1">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="/trainsp/images/mail_leftbg.gif"><img src="/trainsp/images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="/trainsp/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">视频信息</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="/trainsp/images/mail_rightbg.gif"><img src="/trainsp/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
  <td valign="middle" background="/trainsp/images/mail_leftbg.gif">&nbsp;</td>
  	<td   bgcolor="#F7F8F9">
  		    <table width="98%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" class="left_txt">
      	<tr bgcolor="#FFFFFF">
      		<td align="left" colspan="2">按 关键字:<input type="text" id="key" name="key"/>&nbsp;&nbsp;&nbsp;
      		类型:<select id="type" name="type">
      				<option value="">-全部-</option>
      				<option value="1">风景</option>
      				<option value="2">人文</option>
      				<option value="3">动物</option>
      				<option value="4">建筑</option>
      				<option value="5">随拍</option>
      			</select>
      		&nbsp;&nbsp;&nbsp;发布日期
      		<input type="text" id="stime" name="stime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly==true/>--
<input type="text" id="etime" name="etime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly==true/>
<script type="text/javascript" src="/trainsp/commfiles/js/calendar/WdatePicker.js"></script>&nbsp;
      		(按标题、作者用户名、类型、发布日期查询)
      		<input type="submit" value="查询"/>
      		<input type="button" value="新增" onclick="add()" >
      		</td>
      	</tr>
    </table>
  	</td>
  	<td background="/trainsp/images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" background="/trainsp/images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">

    <table width="98%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" class="left_txt">
      	<tr >
      		<td align="center" bgcolor="#f2f2f2">类型</td>
      		<td align="center" bgcolor="#f2f2f2">标题</td>
      		<td align="center" bgcolor="#f2f2f2">创建日期</td>
      		<td align="center" bgcolor="#f2f2f2">操作</td>
      	</tr>
      	  <%
  CommDAO dao = new CommDAO();
  String did = request.getParameter("did");
  if(did!=null)
  {
  dao.commOper("delete from videoinfo where  id="+did);
  }
  PageManager pageManager = PageManager.getPage(url,10, request);
	    pageManager.doList(sql);
	    
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
	    for(HashMap map:nlist)
	    {
   %>
        <tr bgcolor="#FFFFFF">
        <td align="center">
      		<%String tt = map.get("type").toString();
      		if(tt.equals("1")){
      			out.print("风景");
      		}      		if(tt.equals("2")){
      			out.print("人文");
      		}      		if(tt.equals("3")){
      			out.print("动物");
      		}      		if(tt.equals("4")){
      			out.print("建筑");
      		}      		if(tt.equals("5")){
      			out.print("随拍");
      		}
      		 %>
      		
      		</td>
      		<td align="center"><%=map.get("title") %></td>
      		<td align="center"><%=map.get("savetime") %></td>
      		<td align="center"><a href="javascript:up(<%=map.get("id") %>)">编辑</a>&nbsp;&nbsp;|&nbsp;&nbsp;
      		<a href="/trainsp/admin/video.jsp?did=<%=map.get("id") %>">删除</a></td>
      	</tr>
      	<%} %>
      	
      	 <tr>
      		<td align="center" colspan="8" bgcolor="#FFFFFF">${page.info }</td>
      	</tr>
      	
      	<SCRIPT language=javascript src="/trainsp/commfiles/js/popup.js"></SCRIPT>
<script type="text/javascript">
  function add()
  {
  pop("/trainsp/admin/videoadd.jsp","新增",800,370);
  }
  
  function up(no)
  {
  pop("/trainsp/admin/videoup.jsp?id="+no,"修改",800,370);
  }
  </script>
      	
    </table>
    </td>
    <td background="/trainsp/images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="/trainsp/images/mail_leftbg.gif"><img src="/trainsp/images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="/trainsp/images/buttom_bgs.gif"><img src="/trainsp/images/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="/trainsp/images/mail_rightbg.gif"><img src="/trainsp/images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
</form>
  </body>
</html>
