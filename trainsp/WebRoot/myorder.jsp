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
<SCRIPT language=javascript src="/trainsp/commfiles/js/popup.js"></SCRIPT>
  </head>
  
  <body>
  
   <center>
  <jsp:include page="top.jsp"></jsp:include>
  
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
                
                  <TABLE id=checidate class=tblist border=0 cellSpacing=0 cellPadding=0 width="100%">
  <TBODY>
  
  <TR id=thead align="center">
  <TD class=tdw vAlign=top>订单号</TD>
    <TD class=tdw vAlign=top>车次</TD>
    <TD>发站-到站 </TD>
    <TD class=tdw vAlign=top>发车时间</TD>
    <TD>到时 </TD>
    <TD>运行时间 </TD>
    <TD style="PADDING-LEFT: 15px">价格（元） </TD>
    <TD>车票时间 </TD>
    <TD>操作 </TD>
    </TR>
    <%
    HashMap user = (HashMap)request.getSession().getAttribute("user"); 
    String ssql = "select * from mydd where 1=1 and uid= "+user.get("id");

	    ArrayList<HashMap> nlist = (ArrayList)dao.select(ssql);
	    for(HashMap map:nlist)
	    {
    %>
  <TR style="CURSOR: pointer" id=tr6 class=trbgoff align="center">
  <TD><%=map.get("id") %> </TD>
    <TD class=tdw><B>
    <%HashMap mmm = dao.select("select * from pw where id="+map.get("pid")).get(0); %>
    <%=mmm.get("checi") %>
    </B></TD>
    <TD class=tatxtl><%=mmm.get("saddr") %>-<%=mmm.get("eaddr") %></TD>
    <TD><%=mmm.get("stime") %> </TD>
    <TD><%=mmm.get("etime") %></TD>
    <TD><%=mmm.get("yxsj") %>小时</TD>
    <TD class=tatxt2>
    	<%=map.get("jg") %>
    </TD>
    <TD><%=mmm.get("sj") %> </TD>
    <TD>
    <a href="/trainsp/train?ac=tp&pid=<%=map.get("pid") %>&id=<%=map.get("id") %>&pz=<%=map.get("pz") %>">退票</a> 
     &nbsp;|&nbsp;
   
    <a href="javascript: update('<%=map.get("pid") %>','<%=map.get("id") %>','<%=map.get("pz") %>')">改签</a>

    </TD>
    </TR>
    <%} %>
    </TBODY></TABLE>

				</TD></TR>
              <TR>
                <TD class=news_xx bgColor=#f5f3f4 height=5 vAlign=top 
                align=middle></TD>
              <TR>
                <TD bgColor=#f5f3f4 height=30 vAlign=center 
              align=right></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
  <jsp:include page="foot.jsp"></jsp:include>
  </center>
  
  </body>
</html>
<script type="text/javascript">
  function update(pid,ddid,pz)
  {
  pop("gq.jsp?pid="+pid+"&ddid="+ddid+"&pz="+pz,"改签",400,115);
  }
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
 alert("操作成功");
location.replace("/trainsp/myorder.jsp");
 <%}%>
 </script>