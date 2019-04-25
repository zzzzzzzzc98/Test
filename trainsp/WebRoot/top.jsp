<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
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
    <FORM id=form1 method=post name=form1 action="/trainsp/search.jsp">

<DIV class=headerbg>
<DIV class=header>
<DIV class=headerlogo><A title=高铁网上售票 href=""><IMG 
src="files/logo.gif" width=230 height=60></A> </DIV>
<DIV class=headerright>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" height=99>
  <TBODY>
  <TR>
    <TD vAlign=center align=middle>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" height=40>
        <TBODY>
        <TR>
          <TD class=h_font3 vAlign=bottom width=300>网站宗旨：立足城市高铁，服务城市 高铁
</TD>
          <TD vAlign=bottom align=right>
            <TABLE border=0 cellSpacing=0 cellPadding=0>
              <TBODY>
              <TR>
                <TD style="WIDTH: 230px">
                 </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD height=32 vAlign=bottom>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
        <TR>
          <TD vAlign=bottom width=39></TD>
          <TD class=hm_bg vAlign=bottom>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
              <TR>
                <TD vAlign=center align=middle><A class=menu 
                  href="index.jsp">网站首页</A> </TD>
                <TD vAlign=center align=middle><IMG 
                  src="../files/hm_jg.jpg" width=2 height=25> </TD>
                <TD vAlign=center align=middle><A class=menu title=新闻中心 
                  href="news.jsp">新闻中心</A> </TD>
                <TD vAlign=center align=middle><IMG 
                  src="../files/hm_jg.jpg" width=2 height=25> </TD>
                   <TD vAlign=center align=middle><A class=menu title=订票须知 
                  href="dpxz.jsp">订票须知</A> </TD>
                <TD vAlign=center align=middle><IMG 
                  src="../files/hm_jg.jpg" width=2 height=25> </TD>
                <TD vAlign=center align=middle><A class=menu title=网上订票 
                  href="search.jsp">网上订票</A> </TD>
                <TD vAlign=center align=middle><IMG 
                  src="../files/hm_jg.jpg" width=2 height=25> </TD>
                   <TD vAlign=center align=middle><A class=menu title=留言板 
                  href="msg.jsp">留言板</A> </TD>
                <TD vAlign=center align=middle><IMG 
                  src="../files/hm_jg.jpg" width=2 height=25> </TD>
                <%HashMap user = (HashMap)request.getSession().getAttribute("user"); 
                if(user==null){
                %>
                    <TD vAlign=center align=middle><A class=menu title=注册 
                  href="reg.jsp">注册</A> </TD>
                <TD vAlign=center align=middle><IMG 
                  src="../files/hm_jg.jpg" width=2 height=25> </TD>
                <TD vAlign=center align=middle><A class=menu title=登陆 
                  href="login.jsp">登陆</A> </TD>
                <TD vAlign=center align=middle><IMG 
                  src="../files/hm_jg.jpg" width=2 height=25> </TD>
                  <%}else{ %>
                
                <TD vAlign=center align=middle><A class=menu title=我的预订 
                  href="myorder.jsp">我的预订</A> </TD>
                <TD vAlign=center align=middle><IMG 
                  src="../files/hm_jg.jpg" width=2 height=25> </TD>
                  <TD vAlign=center align=middle><A class=menu title=我的信息 
                  href="myinfo.jsp">我的信息</A> </TD>
                <TD vAlign=center align=middle><IMG 
                  src="../files/hm_jg.jpg" width=2 height=25> </TD>
                  <TD vAlign=center align=middle><A class=menu title=安全退出 
                  href="/trainsp/train?ac=memberexit">安全退出</A> </TD>
                <TD vAlign=center align=middle><IMG 
                  src="../files/hm_jg.jpg" width=2 height=25> </TD>
                  <%} %>
                  <TD vAlign=center align=middle><A class=menu 
                  href="./admin/login.jsp">后台管理</A> </TD>
                <TD vAlign=center align=middle><IMG 
                  src="../files/hm_jg.jpg" width=2 height=25> </TD> 
                  
                  
                  
        </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></DIV></DIV>
<DIV class=headerfg></DIV>
<DIV class=wrap1>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
  <TBODY>
  <TR>
    <TD width=13></TD>
    <TD class=hm_bg1 vAlign=center align=middle>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="98%">
        <TBODY>
        <TR>
          <TD class=h_font width=150 align=middle>
            <SCRIPT language=JavaScript>
                                        dayObj = new Date(); monthStr = dayObj.getMonth() + 1; if (dayObj.getYear() < 99) year2000 = 2000 + dayObj.getYear(); else
                                            year2000 = dayObj.getFullYear(); document.write(year2000 + "年" + monthStr + "月" + dayObj.getDate() + "日" + " "); if (dayObj.getDay() == 1) document.write("星期一");
                                        if (dayObj.getDay() == 2) document.write("星期二"); if (dayObj.getDay() == 3) document.write("星期三"); if (dayObj.getDay() == 4) document.write("星期四");
                                        if (dayObj.getDay() == 5) document.write("星期五"); if (dayObj.getDay() == 6) document.write("星期六"); if (dayObj.getDay() == 0) document.write("星期日");
                                    </SCRIPT>
          </TD>
          <TD width=6></TD>
          <TD width=30 align=middle><IMG src="files/hm_ico.jpg" width=23 
            height=22> </TD>
          <TD class=h_font1 width=70 align=middle>网站公告: </TD>
          <TD width=650>
            <MARQUEE onmouseover=this.stop(); onmouseout=this.start(); 
            direction=left height=22 behavior=scroll width="100%" scrollAmount=2 
            scrollDelay=50>热烈祝贺网上订票系统正式上线！</MARQUEE></TD></TR></TBODY></TABLE></TD>
    <TD width=11> </TD></TR></TBODY></TABLE></DIV>
<DIV class=wrap1>
<TABLE style="MARGIN-TOP: 5px" border=0 cellSpacing=1 cellPadding=0 width="99%" 
bgColor=#cccccc align=center>
  <TBODY>
  <TR>
    <TD bgColor=#f8f8f8 height=30>
      <TABLE border=0 cellSpacing=0 cellPadding=0 align=center>
        <TBODY>
        <TR>
          <TD class=FF width=48>出发站： </TD>
          <TD>&nbsp; </TD>
          <TD><INPUT id=start class=CC name=start type="text"> </TD>
          <TD>&nbsp; </TD>
          <TD class=FF width=48>到达站： </TD>
          <TD>&nbsp; </TD>
          <TD><INPUT id=end class=CC name=end type="text"> </TD>
          <TD>&nbsp; </TD>
          <TD class=FF>| </TD>
          <TD>&nbsp; </TD>
          <TD class=FF width=48>查车次： </TD>
          <TD>&nbsp; </TD>
          <TD><INPUT id=train class=CC name=train type="text"> </TD>
          <TD>&nbsp; </TD>
          <TD><INPUT  class=SS value=查询 type=submit> </TD>
          <TD>&nbsp; </TD>
          
          
         </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<DIV id=divSmartList></DIV></DIV>
</FORM>
  </body>
</html>
<script type="text/javascript">


 <%
String suc2 = (String)request.getAttribute("suc2");
if(suc2!=null)
{
 %>
 alert("安全退出");
location.replace("/trainsp/index.jsp");
 <%}%>
 </script>