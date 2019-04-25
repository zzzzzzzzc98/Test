<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>高铁网上售票门户</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<LINK rel=stylesheet type=text/css href="files/base.css">
<SCRIPT type=text/javascript src="files/jquery.min.js"></SCRIPT>

</HEAD>
<BODY >
<center>
<jsp:include page="top.jsp"></jsp:include>
<DIV class=wrap>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
  <TBODY>
  <TR>
    <TD vAlign=top width=360 align=left><IFRAME height=315 
      src="files/PicNews.jsp" frameBorder=0 width=360 
      scrolling=no>
                        </IFRAME>
      <DIV style="MARGIN-TOP: 5px; MARGIN-LEFT: 2px" class=block>
      <DIV class=block_th5><SPAN class=block_t_lh5></SPAN><SPAN 
      style="WIDTH: 335px" class=block_t_mh5></SPAN><SPAN 
      class=block_t_rh5></SPAN></DIV>
     
      <DIV class=clearfloat></DIV>
      <DIV class=block_b><SPAN class=block_b_l></SPAN><SPAN style="WIDTH: 335px" 
      class=block_b_m></SPAN><SPAN class=block_b_r></SPAN></DIV></DIV></TD>
    <TD vAlign=top width=360 align=left>
      <DIV class=news_k>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
        <TR>
          <TD class=news_bg height=32>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
              <TR>
                <TD width=40 align=middle><IMG src="files/ico4.jpg" 
                  width=32 height=28> </TD>
                <TD class=h_font2>新闻中心 </TD>
                <TD width=70 align=middle><A class=top 
                  href="news.jsp">更多&gt;&gt;</A> 
            </TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD bgColor=#fafafa height=279 vAlign=top align=middle>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="97%">
              <TBODY>
              <TR>
                <TD vAlign=top align=middle>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
                    <TBODY>
                    </TBODY></TABLE></TD></TR>
              <TR>
                <TD class=news_jgx height=5></TD></TR>
              <TR>
                <TD>
                  <DIV class=lie>
                  <UL>
                  <%CommDAO dao  = new  CommDAO();
                  ArrayList<HashMap> list = (ArrayList)dao.select("select * from news where type=0 order by id desc limit 0,10");
                  if(list.size()!=0){
                  	for(HashMap map:list){
                  %>
                    <LI><A title="<%=map.get("title") %>" 
                    href="newsx.jsp?id=<%=map.get("id") %>" 
                    target=_blank>·<%
                    String t = map.get("title").toString();
                    if(t.length()>20){
                    	t = t.substring(0,21);
                    	out.print(t+"...");
                    }else{
                    	out.print(t);
                    }
                     %></A><SPAN>
                    <%String time = map.get("savetime").toString();
                    time = time.substring(5,10);
                    out.print(time);
                     %>
                    </SPAN></LI>
                    <%}} %>
                   </UL></DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></TD>
    <TD vAlign=top width=250 align=middle>
      <DIV class=bm_bk>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
        <TR>
          <TD><IMG src="files/bmfw.jpg" width=250 height=34> </TD></TR>
        <TR>
          <TD vAlign=top align=middle>
            <DIV >
            <UL class=hot_line>
              <LI>
              <A class=tool_ticket 
              href="search.jsp" target=_blank>在线订票</A>
              <A class=tool_yupiao 
              href="search.jsp" 
              target=_blank>余票查询</A></LI>
              </UL></DIV></TD></TR></TBODY></TABLE>
      <DIV style="WIDTH: 250px; FLOAT: left" class=block>
      <DIV class=block_th5><SPAN class=block_t_lh5></SPAN><SPAN 
      style="WIDTH: 230px" class=block_t_mh5></SPAN><SPAN 
      class=block_t_rh5></SPAN></DIV>
      <DIV style="WIDTH: 247px; HEIGHT: 270px" class=block_c>
      <DIV class=block_t><SPAN class=i_p_img></SPAN><SPAN 
      class=block_t_c>热门线路</SPAN><SPAN class=block_t_m_r1></SPAN> </DIV>
      <UL class=hot_line>
        <LI><A style="COLOR: red" 
        href="http://localhost:8080/trainsp" 
        target=_blank>武汉-广州</A> &nbsp;&nbsp;| <A 
        href="http://localhost:8080/trainsp" 
        target=_blank>武汉-上海</A>&nbsp;&nbsp;</LI>
        <LI><A href="http://localhost:8080/trainsp" 
        target=_blank>武汉-北京</A>&nbsp;&nbsp; | <A 
        href="http://localhost:8080/trainsp" 
        target=_blank>武汉-长沙</A>&nbsp;&nbsp;</LI>
        <LI><A href="http://localhost:8080/trainsp" 
        target=_blank>武汉-南京</A>&nbsp;&nbsp; | <A 
        href="http://localhost:8080/trainsp" 
        target=_blank>武汉-深圳</A>&nbsp;&nbsp;</LI>
        <LI><A href="http://localhost:8080/trainsp" 
        target=_blank>武汉-郑州</A>&nbsp;&nbsp; | <A 
        href="http://localhost:8080/trainsp" 
        target=_blank>武汉-成都</A>&nbsp;&nbsp;</LI>
        <LI><A href="http://localhost:8080/trainsp" 
        target=_blank>武汉-合肥</A>&nbsp;&nbsp; | <A 
        href="http://localhost:8080/trainsp" 
        target=_blank>武汉-重庆</A>&nbsp;&nbsp;</LI>
        <LI><A href="http://localhost:8080/trainsp" 
        target=_blank>武汉-宜昌</A>&nbsp;&nbsp; | <A 
        href="http://localhost:8080/trainsp" 
        target=_blank>武汉-杭州</A>&nbsp;&nbsp;</LI>
       </UL></DIV>
      <DIV class=block_b><SPAN class=block_b_l></SPAN><SPAN style="WIDTH: 230px" 
      class=block_b_m></SPAN><SPAN 
  class=block_b_r></SPAN></DIV></DIV></DIV></TD></TR></TBODY></TABLE></DIV>
<DIV class=clearfloat></DIV>
<DIV class=clearfloat></DIV>
<jsp:include page="foot.jsp"></jsp:include>
       </center>
       </BODY></HTML>
