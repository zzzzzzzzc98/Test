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
  <form action="/trainsp/train?ac=memberup" method="post" name="f1" onsubmit="return ck()">
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
                      <TD class=n_biaoti align=middle>我的信息
                      </TD></TR>
                    <TR>
                      <TD style="LINE-HEIGHT: 22px" align=left>
                        <TABLE border=0 cellSpacing=1 cellPadding=4 width="100%" 
                        bgColor=#f1f1f1>
                          <TBODY>
                          <%HashMap user = (HashMap)request.getSession().getAttribute("user");
                          HashMap mmm = dao.select("select * from member where id="+user.get("id")).get(0);
                          %>
                          <input type="hidden" id="id" name="id" value="<%=mmm.get("id") %>" />
                    <TR>
                      <TD style="LINE-HEIGHT: 22px" align=right>
                      		用户名：
                      </TD>
                      <TD style="LINE-HEIGHT: 22px" >
                      		 <input type="text" id="uname" name="uname" value="<%=mmm.get("uname") %>"   disabled=disabled/> *
                      </TD>
                    </TR>
                    
                    <TR>
                      <TD style="LINE-HEIGHT: 22px" align=right>
                      		请再次输入密码：
                      </TD>
                      <TD style="LINE-HEIGHT: 22px" >
                      		 <input type="password" id="upass" name="upass" value="<%=mmm.get("upass") %>"/> *
                      </TD>
                    </TR>
                     <TR>
                      <TD style="LINE-HEIGHT: 22px" align=right>
                      		真实姓名：
                      </TD>
                      <TD style="LINE-HEIGHT: 22px" >
                      		 <input type="text" id="tname" name="tname" value="<%=mmm.get("tname") %>"/> *
                      </TD>
                    </TR>
                    <TR>
                      <TD style="LINE-HEIGHT: 22px" align=right>
                      		性别：
                      </TD>
                      <TD style="LINE-HEIGHT: 22px" >
                      		 <select id="sex" name="sex" >
                      		 	<option value="男"<%if(mmm.get("sex").equals("男")){out.print("selected==selected");} %>>男</option>
                      		 	<option value="女" <%if(mmm.get("sex").equals("女")){out.print("selected==selected");} %>>女</option>
                      		 </select>
                      </TD>
                    </TR>
                    <TR>
                      <TD style="LINE-HEIGHT: 22px" align=right>
                      		身份证号：
                      </TD>
                      <TD style="LINE-HEIGHT: 22px" >
                      		 <input type="text" id="sfzh" name="sfzh" value="<%=mmm.get("sfzh") %>"/> *
                      </TD>
                    </TR>
                    <TR>
                      <TD style="LINE-HEIGHT: 22px" align=right>
                      		联系电话：
                      </TD>
                      <TD style="LINE-HEIGHT: 22px" >
                      		 <input type="text" id="tel" name="tel" value="<%=mmm.get("tel") %>"/> *
                      </TD>
                    </TR>
                    <TR>
                      <TD style="LINE-HEIGHT: 22px" align=right>
                      		邮箱：
                      </TD>
                      <TD style="LINE-HEIGHT: 22px" >
                      		 <input type="text" id="email" name="email" value="<%=mmm.get("email") %>"/>
                      </TD>
                    </TR>
                    <TR>
                      <TD style="LINE-HEIGHT: 22px" align=right>
                      	<input type="submit" value="修改" />
                      </TD>
                      <TD style="LINE-HEIGHT: 22px" >
                      	<input type="reset" value="重置"/> 
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
		alert("请再次输入密码");
		return false;
	}if(f1.upass1.value!=f1.upass.value){
		alert("两次密码不一致");
		return false;
	}if(f1.tname.value==""){
		alert("真实姓名不能为空");
		return false;
	}if(f1.sfzh.value==""){
		alert("身份证号不能为空");
		return false;
	}if(f1.tel.value==""){
		alert("联系电话不能为空");
		return false;
	}
}
<%
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("已存在的用户名");
 <%}%>
 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
location.replace("/trainsp/myinfo.jsp");
 <%}%>
 </script>