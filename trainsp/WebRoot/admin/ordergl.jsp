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
String url="/trainsp/admin/ordergl.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String sf = request.getParameter("sf")==null?"":request.getParameter("sf");
String dd = request.getParameter("dd")==null?"":request.getParameter("dd");
String rq = request.getParameter("rq")==null?"":request.getParameter("rq");
String sql = "select * from pw where 1=1 and delstatus=0 ";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (checi ='"+key+"') ";
}if(!sf.equals(""))
{
url+="&sf="+sf;
sql+=" and (saddr ='"+sf+"') ";
}if(!dd.equals(""))
{
url+="&dd="+dd;
sql+=" and (eaddr ='"+dd+"') ";
}if(!rq.equals(""))
{
url+="&rq="+rq;
sql+=" and (sj ='"+rq+"') ";
}
sql+=" order by id desc ";
 %>
     <form action="/trainsp/admin/ordergl.jsp?f=f" method="post" name="f1">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="/trainsp/images/mail_leftbg.gif"><img src="/trainsp/images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="/trainsp/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">销售情况</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="/trainsp/images/mail_rightbg.gif"><img src="/trainsp/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
  <td valign="middle" background="/trainsp/images/mail_leftbg.gif">&nbsp;</td>
  	<td   bgcolor="#F7F8F9">
  		    <table width="98%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" class="left_txt">
      	<tr bgcolor="#FFFFFF">
      		<td align="left" colspan="2">车次:<input type="text" id="key" name="key"/>
      		始发站：<input type="text" id="sf" name="sf"/>
      		到达站：<input type="text" id="dd" name="dd"/>
      		时间：<input type="text" id="rq" name="rq" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" />
      		&nbsp;&nbsp;&nbsp;<input type="submit" value="查询"/>
      		</td>
      	</tr>
      	<script type="text/javascript" src="/trainsp/commfiles/js/calendar/WdatePicker.js"></script>
    </table>
  	</td>
  	<td background="/trainsp/images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" background="/trainsp/images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">

    <table width="98%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" class="left_txt">
      	<tr >
      		<td align="center" bgcolor="#f2f2f2">车次</td>
      		<td align="center" bgcolor="#f2f2f2">起始站</td>
      		<td align="center" bgcolor="#f2f2f2">日期</td>
      		<td align="center" bgcolor="#f2f2f2">销售情况</td>
      	</tr>
      	  <%
  CommDAO dao = new CommDAO();
  String did = request.getParameter("did");
  if(did!=null)
  {
  dao.commOper("update pw set delstatus=1 where  id="+did);
  }
  PageManager pageManager = PageManager.getPage(url,10, request);
	    pageManager.doList(sql);
	    
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
	    for(HashMap map:nlist)
	    {
   %>
        <tr bgcolor="#FFFFFF">
      		<td align="center"><%=map.get("checi") %></td>
      		<td align="center"><%=map.get("saddr") %>--<%=map.get("eaddr") %></td>
      		<td align="center"><%=map.get("sj") %></td>
      		<td align="center">
      		特等座：余<%=map.get("tdzsl") %>张 销售
      		<%String s1 = "select * from mydd where  pz=0 and pid="+map.get("id");
      		ArrayList<HashMap> list1 = (ArrayList)dao.select(s1); 
      		if(list1.size()!=0){
      			HashMap m1 = list1.get(0);
      			out.print(list1.size()+"张");
      		}else{
      			out.print("0张");
      		}
      		 %>
      		&nbsp;|&nbsp;
      		一等座：余<%=map.get("ydzsl") %>张 销售
      		<%String s2 = "select * from mydd where  pz=1 and pid="+map.get("id");
      		ArrayList<HashMap> list2 = (ArrayList)dao.select(s2); 
      		if(list2.size()!=0){
      			HashMap m2 = list2.get(0);
      			out.print(list2.size()+"张");
      		}else{
      			out.print("0张");
      		}
      		 %>
      		&nbsp;|&nbsp;
      		二等座：余<%=map.get("edzsl") %>张 销售
      		<%String s3 = "select * from mydd where  pz=2 and pid="+map.get("id");
      		ArrayList<HashMap> list3 = (ArrayList)dao.select(s3); 
      		if(list3.size()!=0){
      			HashMap m3 = list3.get(0);
      			out.print(list3.size()+"张");
      		}else{
      			out.print("0张");
      		}
      		 %>
</td>
      	</tr>
      	<%} %>
      	
      	 <tr>
      	 	<td align="center" colspan="1" bgcolor="#FFFFFF">销售总金额：
      	 	<%String ss = "select sum(jg)as money from mydd "; 
      	 	HashMap ssm = dao.select(ss).get(0);
      	 	out.println(ssm.get("money"));
      	 	%>
      	 	</td>
      		<td align="center" colspan="7" bgcolor="#FFFFFF">${page.info }</td>
      	</tr>
      	
      	<SCRIPT language=javascript src="/trainsp/commfiles/js/popup.js"></SCRIPT>
<script type="text/javascript">
  function add()
  {
  location.href("pwadd.jsp");
  }
  
  function up(no)
  {
  location.href("pwup.jsp?id="+no);
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
