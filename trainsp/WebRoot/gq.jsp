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
    
    <title>My JSP 'gq.jsp' starting page</title>
    
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
    <%CommDAO dao =new  CommDAO();
    String ddid = request.getParameter("ddid");
    String oldpid = request.getParameter("pid");
    String oldpz = request.getParameter("pz");
    %>
  <form action="/trainsp/train?ac=gq" method="post" name="f1">
  <input type="hidden" id="oldpid" name="oldpid" value="<%=oldpid %>" />
  <input type="hidden" id="ddid" name="ddid" value="<%=ddid %>" />
  <input type="hidden" id="oldpz" name="oldpz" value="<%=oldpz %>" />
  车次：
  <select id="pid" name="pid">
  <%
    ArrayList<HashMap> list = (ArrayList)dao.select("select * from pw where id not in('"+oldpid+"') ");
    if(list.size()!=0){
    	for(HashMap m:list){%>
    		<option value="<%=m.get("id") %>"><%=m.get("checi") %> <%=m.get("saddr") %>-<%=m.get("eaddr") %> <%=m.get("sj") %></option>
    	<%}
    }
    %>
    </select>
    票种：
    <select id="pz" name="pz">
    			<option value="0">特等座</option>
    	  		<option value="1">一等座</option>
    	  		<option value="2">二等座</option>
    </select>
    <input type="submit" value="改签"/>
    </form>
  </body>
  <script type="text/javascript">
  <%
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("票已售完");
 <%}%>
 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
parent.location.replace("/trainsp/myorder.jsp");
 <%}%>
 </script>
</html>
