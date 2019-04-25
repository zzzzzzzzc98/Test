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
  <form action="/trainsp/pay.jsp" method="post" name="f1" onsubmit="return ck()" >
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
                      <TD class=n_biaoti align=middle>网上订票
                      </TD></TR>
                    <TR>
                      <TD style="LINE-HEIGHT: 22px" align=left>
                      
                        <TABLE border=0 cellSpacing=1 cellPadding=4 width="100%" 
                        bgColor=#f1f1f1>
                          <TBODY>
    <TR id=thead align="center">
    <TD class=tdw vAlign=top>车次</TD>
    <TD>发站-到站 </TD>
    <TD class=tdw vAlign=top>发车时间</TD>
    <TD>到时 </TD>
    <TD>运行时间 </TD>
     <TD>车票时间 </TD>
    <TD style="PADDING-LEFT: 15px">参考票价（元） </TD>
    </TR>
    <%String id = request.getParameter("id");
    String ss = "select * from pw where id="+id;
    HashMap mm = dao.select(ss).get(0);
     %>
     <TR style="CURSOR: pointer" id=tr6 class=trbgoff align="center">
    <TD class=tdw><B><%=mm.get("checi") %></B></TD>
    <TD class=tatxtl><%=mm.get("saddr") %>-<%=mm.get("eaddr") %></TD>
    <TD><%=mm.get("stime") %> </TD>
    <TD><%=mm.get("etime") %></TD>
    <TD><%=mm.get("yxsj") %>小时</TD>
    <TD><%=mm.get("sj") %></TD>
    <TD class=tatxt2>
    	特等座：余<%=mm.get("tdzsl") %>个(<%=mm.get("tdzjg") %>元)&nbsp;|&nbsp;一等座：余<%=mm.get("ydzsl") %>个(<%=mm.get("ydzjg") %>元)&nbsp;|&nbsp;二等座：余<%=mm.get("edzsl") %>个(<%=mm.get("edzjg") %>元)
    </TD>
    </TR>
    <Tr>
    	<Td colspan="6">选择车票</Td>
    </Tr>
    
    <Tr>
    	<td colspan="6">
    	<input type="hidden" id="pid" name="pid" value="<%=mm.get("id") %>" />
    	  票种<select id="pz" name="pz">
    	  		<option value="0">特等座</option>
    	  		<option value="1">一等座</option>
    	  		<option value="2">二等座</option>
    	  </select><input type="submit" value="支付"/>
    	</td>
    </Tr>
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
	if(f1.pz.value=="0"){
		if(<%=mm.get("tdzsl") %>=="0"){
		alert("特等座位数已售完");
		return false;
		}
	}if(f1.pz.value=="1"){
		if(<%=mm.get("ydzsl") %>=="0"){
		alert("一等座位数已售完");
		return false;
		}
	}if(f1.pz.value=="2"){
		if(<%=mm.get("edzsl") %>=="0"){
		alert("二等座位数已售完");
		return false;
		}
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