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
                
                  <TABLE id=checidate class=tblist border=0 cellSpacing=0 cellPadding=0 width="100%">
  <TBODY>
  
  <TR id=thead align="center">
    <TD class=tdw vAlign=top>车次</TD>
    <TD>发站-到站 </TD>
    <TD class=tdw vAlign=top>发车时间</TD>
    <TD>到时 </TD>
    <TD>运行时间 </TD>
    <TD style="PADDING-LEFT: 15px">参考票价（元） </TD>
    <TD>车票时间 </TD>
    <TD>操作 </TD>
    </TR>
    <%
    String url="/trainsp/search.jsp?1=1";
    String ssql = "select * from pw where 1=1 and delstatus='0' ";
    	
    	String start = request.getParameter("start")==null?"":request.getParameter("start");
    	String end = request.getParameter("end")==null?"":request.getParameter("end");
    	String train = request.getParameter("train")==null?"":request.getParameter("train");
    	if(!start.equals(""))
		{
			url+="&start="+start;
			ssql+=" and (saddr ='"+start+"') ";
		}if(!end.equals(""))
		{
			url+="&end="+end;
			ssql+=" and (eaddr ='"+end+"') ";
		}if(!train.equals(""))
		{
			url+="&train="+train;
			ssql+=" and (checi ='"+train+"') ";
		}
        //PageManager pageManager = PageManager.getPage(url,10, request);
	    //pageManager.doList(ssql);
	    
	    //PageManager bean= (PageManager)request.getAttribute("page");
	    //ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
	    ArrayList<HashMap> nlist = (ArrayList)dao.select(ssql);
	    for(HashMap map:nlist)
	    {
    %>
  <TR style="CURSOR: pointer" id=tr6 class=trbgoff align="center">
    <TD class=tdw><B><%=map.get("checi") %></B></TD>
    <TD class=tatxtl><%=map.get("saddr") %>-<%=map.get("eaddr") %></TD>
    <TD><%=map.get("stime") %> </TD>
    <TD><%=map.get("etime") %></TD>
    <TD><%=map.get("yxsj") %>小时</TD>
    <TD class=tatxt2>
    	特等座：余<%=map.get("tdzsl") %>个(<%=map.get("tdzjg") %>元)&nbsp;|&nbsp;一等座：余<%=map.get("ydzsl") %>个(<%=map.get("ydzjg") %>元)&nbsp;|&nbsp;二等座：余<%=map.get("edzsl") %>个(<%=map.get("edzjg") %>元)
    </TD>
    <TD><%=map.get("sj") %> </TD>
    <TD>
    <%HashMap user = (HashMap)request.getSession().getAttribute("user"); 
    if(user!=null){
     %>
    <a href="buy.jsp?id=<%=map.get("id") %>">订票</a>
    <%}else{ %>
    <a href="login.jsp">请先登陆</a>
    <%} %>
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