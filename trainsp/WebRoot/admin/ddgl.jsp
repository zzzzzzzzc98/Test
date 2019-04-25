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
String url="/trainsp/admin/ddgl.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String sql = "select * from mydd where 1=1  ";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (tname like'%"+key+"%' or sfzh like '%"+key+"%') ";
}
sql+=" order by id desc ";
 %>
     <form action="/trainsp/admin/ddgl.jsp?f=f" method="post" name="f1">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="/trainsp/images/mail_leftbg.gif"><img src="/trainsp/images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="/trainsp/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">订单统计</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="/trainsp/images/mail_rightbg.gif"><img src="/trainsp/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
   <tr>
  <td valign="middle" background="/trainsp/images/mail_leftbg.gif">&nbsp;</td>
  	<td   bgcolor="#F7F8F9">
  		     <table width="98%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" class="left_txt">
      	<tr bgcolor="#FFFFFF">
      		<td align="left" colspan="2">按姓名或身份证号查询:<input type="text" id="key" name="key"/>&nbsp;&nbsp;&nbsp;<input type="submit" value="查询"/>
      		<A href="/trainsp/train?ac=ddbb">生成订单报表</A>
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
      	<td align="center" bgcolor="#f2f2f2">订单号</td>
      		<td align="center" bgcolor="#f2f2f2">起始站</td>
      		<td align="center" bgcolor="#f2f2f2">票种</td>
      		<td align="center" bgcolor="#f2f2f2">价格</td>
      		<td align="center" bgcolor="#f2f2f2">姓名</td>
      		<td align="center" bgcolor="#f2f2f2">身份证号</td>
      	<!--  	<td align="center" bgcolor="#f2f2f2">操作</td>-->
      	</tr>
      	  <%
  CommDAO dao = new CommDAO();
  String did = request.getParameter("did");
  if(did!=null)
  {
  dao.commOper("delete from mydd where  id="+did);
  }
  PageManager pageManager = PageManager.getPage(url,10, request);
	    pageManager.doList(sql);
	    
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
	    for(HashMap map:nlist)
	    {
   %>
        <tr bgcolor="#FFFFFF">
        <td align="center"><%=map.get("id") %></td>
      		<td align="center">
      		<%String ppid = map.get("pid").toString();
      		HashMap pm = dao.select("select * from pw where  id="+ppid).get(0);
      		out.print(pm.get("saddr")+ "--" +pm.get("eaddr")+ "(" +pm.get("sj")+" "+pm.get("stime")+ ")" );
      		 %>
      		</td>
      		<td align="center">
      		<%String pzhong = map.get("pz").toString();
      		if(pzhong.equals("0")){
      			out.print("特等座");
      		}if(pzhong.equals("1")){
      			out.print("一等座");
      		}if(pzhong.equals("2")){
      			out.print("二等座");
      		}
      		 %>
      		</td>
      		<td align="center"><%=map.get("jg") %></td>
      		<td align="center"><%=map.get("tname") %></td>
      		<td align="center"><%=map.get("sfzh") %></td>
      	<!--  	<td align="center">
      		<a href="/trainsp/admin/notice.jsp?did=<%=map.get("id") %>">删除</a></td>-->
      	</tr>
      	<%} %>
      	
      	 <tr>
      		<td align="center" colspan="8" bgcolor="#FFFFFF">${page.info }</td>
      	</tr>
      	
      	<SCRIPT language=javascript src="/trainsp/commfiles/js/popup.js"></SCRIPT>
<script type="text/javascript">
  function add()
  {
  location.href("noticeadd.jsp");
  }
  
  function up(no)
  {
  location.href("noticeup.jsp?id="+no);
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
