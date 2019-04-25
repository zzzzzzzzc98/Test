<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
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
<SCRIPT type=text/javascript src="files/search_train.js"></SCRIPT>
  </head>
  
  <body>
  <center>
  <jsp:include page="top.jsp"></jsp:include>
    <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" align=center>
  <TBODY>
  <TR>
    <TD align=middle>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=960>
        <TBODY>
        <TR>
          <TD vAlign=top rowSpan=2 width=232 align=middle>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
              <TR>
                <TD align=middle>
                <DIV class=news_left>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
                    <TBODY>
                    <TR>
                      <TD class=ltitle height=34 
                      background=files/leftbj.jpg>
                        <P>最新新闻</P></TD></TR>
                    <TR>
                      <TD bgColor=#f4f4f4 height=277 vAlign=top align=left>
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
                    if(t.length()>15){
                    	t = t.substring(0,15);
                    	out.print(t+"...");
                    }else{
                    	out.print(t);
                    }
                     %></A><SPAN>
                    
                    </SPAN></LI>
                    <%}} %>
                         </UL></TD></TR></TBODY></TABLE>
                  </DIV>
                  </TD></TR></TBODY></TABLE></TD>
          <TD vAlign=top align=middle>
            <DIV class=news>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
              <TR>
                <TD bgColor=#f5f3f4 height=590 vAlign=top align=middle>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="98%">
                    <TBODY>
                    <TR>
                      <TD height=120 vAlign=top align=middle>
                        <TABLE border=0 cellSpacing=0 cellPadding=0 
width="100%">
                          <TBODY>
                          <TR>
                            <TD class=list_title height=31>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%">
                                <TBODY>
                                <TR>
                                <TD width=40 align=middle><IMG 
                                src="files/gt.jpg" width=30 
                                height=21> </TD>
                                <TD class=list_t_f width=77>新闻列表 </TD>
                                <TD class=list_t_f width=437>&nbsp; </TD>
                                <TD class=list_zi width=168 
                                align=middle></TD></TR></TBODY></TABLE></TD></TR>
                          <TR>
                            <TD class=news_list vAlign=top>
                              <UL>
                               <%
                               String url="/trainsp/news.jsp?1=1";
                  PageManager pageManager = PageManager.getPage(url,10, request);
	   			  pageManager.doList("select * from news where type=0 order by id desc limit 0,10 ");
	    		  PageManager bean= (PageManager)request.getAttribute("page");
	    		  ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
	    		  for(HashMap map:nlist)
	    		  {
                  %>
                                <LI><A title=<%=map.get("title") %> 
                                href="newsx.jsp?id=<%=map.get("id") %>" 
                                target=_blank>·<%=map.get("title") %></A><SPAN><%=map.get("savetime") %></SPAN></LI>
                       <%}%>         
                                
                                </UL></TD></TR></TBODY></TABLE><BR>
                        <DIV id=AspNetPager1>
                        <DIV style="WIDTH: 100%; FLOAT: left">${page.info }</DIV>
                       </DIV></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD class=news_xx bgColor=#f5f3f4 height=5 vAlign=top 
                align=middle></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
<DIV class=clearfloat></DIV>
  <jsp:include page="foot.jsp"></jsp:include>
</center>
  </body>
</html>
