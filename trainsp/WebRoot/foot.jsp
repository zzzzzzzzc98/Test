<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'foot.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <DIV class=wrap>
<DIV class=link_bk>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
  <TBODY>
  <TR>
    <TD class=news_bg height=32>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
        <TR>
          <TD width=168 align=middle><IMG border=0 src="files/yqlj.jpg" 
            width=118 height=27> </TD>
          <TD class=h_font2></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=link bgColor=#f9f7f9 vAlign=center align=middle>
      <UL class=ullink>
      <%
      CommDAO dao = new CommDAO();
      ArrayList<HashMap> ll = (ArrayList)dao.select("select * from link order by id desc limit 0,5");
      if(ll.size()!=0){
      	for(HashMap map:ll){
        %>
        <LI><A href="<%=map.get("url") %>" target=_blank><%=map.get("name") %></A> </LI>
        <%}} %>
</LI></UL></TD></TR></TBODY></TABLE></DIV></DIV>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" align=center>
  <TBODY>
  <TR>
    <TD class=fg_bg height=8></TD></TR>
  <TR>
    <TD class=news_zi vAlign=center align=middle>
      <P 
      align=center><BR>版权所有&nbsp;ICP备10231142号-2
     
       </P></TD></TR></TBODY></TABLE>
  </body>
</html>
