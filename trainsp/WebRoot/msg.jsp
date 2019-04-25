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
  <form action="/trainsp/train?ac=fbmsg" method="post" name="f1" onsubmit="return ck()">

<DIV class=clearfloat></DIV>
<DIV class=wrap>
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
                  </DIV></TD></TR></TBODY></TABLE></TD>
          <TD vAlign=top align=middle>
            <DIV class=news>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
              <TR>
                <TD bgColor=#f5f3f4 height=590 vAlign=top align=middle><A 
                  id=top></A>
                
                  <TABLE border=0 cellSpacing=0 cellPadding=4 width="98%" 
                  align=center>
                    <TBODY>
                    <TR>
                      <TD class=n_biaoti align=middle>留言板
                      </TD></TR>
                    <TR>
                      <TD style="LINE-HEIGHT: 22px" align=left>
                        <TABLE border=0 cellSpacing=1 cellPadding=4 width="100%" 
                        bgColor=#f1f1f1>
                          <TBODY>
                    <TR>
                      <TD style="LINE-HEIGHT: 22px" >
                      		留言内容
                      </TD>
                       <TD style="LINE-HEIGHT: 22px" >
                      		留言时间
                      </TD>
                       <TD style="LINE-HEIGHT: 22px">
                      		留言人
                      </TD>
                    </TR>
                    <%ArrayList<HashMap> msglist = (ArrayList)dao.select("select * from msg order by id desc"); 
                    String url = "/trainsp/msg.jsp?1=1";
                     PageManager pageManager = PageManager.getPage(url,10, request);
	    			pageManager.doList("select * from msg order by id desc");
	    
	    			PageManager bean= (PageManager)request.getAttribute("page");
	    			ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
                    	for(HashMap m:nlist){
                    %>
                    <TR>
                      <TD style="LINE-HEIGHT: 22px">
                      		<%=m.get("content") %>
                      </TD>
                      <TD style="LINE-HEIGHT: 22px" >
                      		<%=m.get("savetime") %>
                      </TD>
                      <TD style="LINE-HEIGHT: 22px" >
                      		<%=m.get("uname") %>
                      </TD>
                    </TR>
                    <%} %>
                    <Tr>
                    	<TD style="LINE-HEIGHT: 22px" colspan="3" align="center">
                    	${page.info }
                    	</TD>
                    </Tr>
                     <%HashMap user = (HashMap)request.getSession().getAttribute("user"); 
                if(user!=null){
                %>
                    <TR>
                      <TD style="LINE-HEIGHT: 22px"  colspan="3" align="left">
                      	<textarea rows="5" cols="50" id="content" name="content"></textarea>
                      	<input type="submit" value="发表" />
                      </TD>
                    </TR>
                    <%} %>
                   </TBODY></TABLE></TD></TR>
              <TR>
                <TD class=news_xx bgColor=#f5f3f4 height=5 vAlign=top 
                align=middle></TD>
              <TR>
                <TD bgColor=#f5f3f4 height=30 vAlign=center 
              align=right></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
  </form>
  <jsp:include page="foot.jsp"></jsp:include>
  </center>
  
  </body>
</html>
<script type="text/javascript">
function ck(){
	if(f1.content.value==""){
		alert("内容不能为空");
		return false;
	}
}
<%
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("用户名或密码错误");
 <%}%>
 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
location.replace("/trainsp/msg.jsp");
 <%}%>
 </script>