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
  <form action="/trainsp/train?ac=memberlogin" method="post" name="f1" onsubmit="return ck()">
  
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
                      <TD class=n_biaoti align=middle>订票须知
                      </TD></TR>
                    <TR>
                      <TD style="LINE-HEIGHT: 22px" align=left>
                        <TABLE border=0 cellSpacing=1 cellPadding=4 width="100%" 
                        bgColor=#f1f1f1>
                          <TBODY>
                    <TR>
                      <TD style="LINE-HEIGHT: 22px" >
                      		<%HashMap map  = dao.select("select * from xz where id=1").get(0);%>
                      		<%=map.get("content") %>
                      </TD>
                      
                    </TR>
                   
                    
                  
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
	if(f1.uname.value==""){
		alert("用户名不能为空");
		return false;
	}if(f1.upass.value==""){
		alert("密码不能为空");
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
 alert("登陆成功");
location.replace("/trainsp/index.jsp");
 <%}%>
 </script>