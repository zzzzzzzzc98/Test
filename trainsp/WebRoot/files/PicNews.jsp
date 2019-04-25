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
    
    <title>My JSP 'PicNews.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <SCRIPT language=javascript>


        function $(id) { return document.getElementById(id); }

        function addLoadEvent(func) {
            var oldonload = window.onload;
            if (typeof window.onload != 'function') {
                window.onload = func;
            } else {
                window.onload = function () {
                    oldonload();
                    func();
                }
            }
        }

        function moveElement(elementID, final_x, final_y, interval) {
            if (!document.getElementById) return false;
            if (!document.getElementById(elementID)) return false;
            var elem = document.getElementById(elementID);
            if (elem.movement) {
                clearTimeout(elem.movement);
            }
            if (!elem.style.left) {
                elem.style.left = "0px";
            }
            if (!elem.style.top) {
                elem.style.top = "0px";
            }
            var xpos = parseInt(elem.style.left);
            var ypos = parseInt(elem.style.top);
            if (xpos == final_x && ypos == final_y) {
                return true;
            }
            if (xpos < final_x) {
                var dist = Math.ceil((final_x - xpos) / 10);
                xpos = xpos + dist;
            }
            if (xpos > final_x) {
                var dist = Math.ceil((xpos - final_x) / 10);
                xpos = xpos - dist;
            }
            if (ypos < final_y) {
                var dist = Math.ceil((final_y - ypos) / 10);
                ypos = ypos + dist;
            }
            if (ypos > final_y) {
                var dist = Math.ceil((ypos - final_y) / 10);
                ypos = ypos - dist;
            }
            elem.style.left = xpos + "px";
            elem.style.top = ypos + "px";
            var repeat = "moveElement('" + elementID + "'," + final_x + "," + final_y + "," + interval + ")";
            elem.movement = setTimeout(repeat, interval);
        }

        function classNormal(iFocusBtnID, iFocusTxID) {
            var iFocusBtns = $(iFocusBtnID).getElementsByTagName('li');
            var iFocusTxs = $(iFocusTxID).getElementsByTagName('li');
            for (var i = 0; i < iFocusBtns.length; i++) {
                iFocusBtns[i].className = 'normal';
                iFocusTxs[i].className = 'normal';
            }
        }

        function classCurrent(iFocusBtnID, iFocusTxID, n) {
            var iFocusBtns = $(iFocusBtnID).getElementsByTagName('li');
            var iFocusTxs = $(iFocusTxID).getElementsByTagName('li');
            iFocusBtns[n].className = 'current';
            iFocusTxs[n].className = 'current';
        }

        function iFocusChange() {
            if (!$('ifocus')) return false;
            $('ifocus').onmouseover = function () { atuokey = true };
            $('ifocus').onmouseout = function () { atuokey = false };
            var iFocusBtns = $('ifocus_btn').getElementsByTagName('li');
            var listLength = iFocusBtns.length;
            try {
 iFocusBtns[0].onmouseover = function () {
                moveElement('ifocus_piclist', 0, 0, 5);
                classNormal('ifocus_btn', 'ifocus_tx');
                classCurrent('ifocus_btn', 'ifocus_tx', 0);
            }
            if (listLength >= 2) {
                iFocusBtns[1].onmouseover = function () {
                    moveElement('ifocus_piclist', 0, -225, 5);
                    classNormal('ifocus_btn', 'ifocus_tx');
                    classCurrent('ifocus_btn', 'ifocus_tx', 1);
                }
            }
            if (listLength >= 3) {
                iFocusBtns[2].onmouseover = function () {
                    moveElement('ifocus_piclist', 0, -450, 5);
                    classNormal('ifocus_btn', 'ifocus_tx');
                    classCurrent('ifocus_btn', 'ifocus_tx', 2);
                }
            }
            if (listLength >= 4) {
                iFocusBtns[3].onmouseover = function () {
                    moveElement('ifocus_piclist', 0, -675, 5);
                    classNormal('ifocus_btn', 'ifocus_tx');
                    classCurrent('ifocus_btn', 'ifocus_tx', 3);
                }
            }
            } catch (e) {

            }
           
        }

        setInterval('autoiFocus()', 5000);
        var atuokey = false;
        function autoiFocus() {
            if (!$('ifocus')) return false;
            if (atuokey) return false;
            var focusBtnList = $('ifocus_btn').getElementsByTagName('li');
            var listLength = focusBtnList.length;
            for (var i = 0; i < listLength; i++) {
                if (focusBtnList[i].className == 'current') var currentNum = i;
            }
            if (currentNum == 0 && listLength != 1) {
                moveElement('ifocus_piclist', 0, -225, 5);
                classNormal('ifocus_btn', 'ifocus_tx');
                classCurrent('ifocus_btn', 'ifocus_tx', 1);
            }
            if (currentNum == 1 && listLength != 2) {
                moveElement('ifocus_piclist', 0, -450, 5);
                classNormal('ifocus_btn', 'ifocus_tx');
                classCurrent('ifocus_btn', 'ifocus_tx', 2);
            }
            if (currentNum == 2 && listLength != 3) {
                moveElement('ifocus_piclist', 0, -675, 5);
                classNormal('ifocus_btn', 'ifocus_tx');
                classCurrent('ifocus_btn', 'ifocus_tx', 3);
            }
            if (currentNum == 3) {
                moveElement('ifocus_piclist', 0, 0, 5);
                classNormal('ifocus_btn', 'ifocus_tx');
                classCurrent('ifocus_btn', 'ifocus_tx', 0);
            }
            if (currentNum == 1 && listLength == 2) {
                moveElement('ifocus_piclist', 0, 0, 5);
                classNormal('ifocus_btn', 'ifocus_tx');
                classCurrent('ifocus_btn', 'ifocus_tx', 0);
            }
            if (currentNum == 2 && listLength == 3) {
                moveElement('ifocus_piclist', 0, 0, 5);
                classNormal('ifocus_btn', 'ifocus_tx');
                classCurrent('ifocus_btn', 'ifocus_tx', 0);
            }
        }
        addLoadEvent(iFocusChange);
    
    
    
    </SCRIPT>

<STYLE type=text/css>BODY {
	FONT-FAMILY: "����"; FONT-SIZE: 14px; FONT-WEIGHT: normal
}
* {
	PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px
}
* HTML BODY {
	OVERFLOW: visible
}
* HTML IFRAME {
	OVERFLOW: auto
}
* HTML FRAME {
	OVERFLOW: auto
}
* HTML FRAMESET {
	OVERFLOW: hidden
}
A:link {
	TEXT-DECORATION: none
}
A:visited {
	TEXT-DECORATION: none
}
A:hover {
	COLOR: #ff0000; TEXT-DECORATION: underline
}
A:hover {
	BACKGROUND-COLOR: #ffffaa; COLOR: #cc0000
}
A:active {
	BACKGROUND-COLOR: #ffffaa; COLOR: #cc0000
}
UL {
	LIST-STYLE-TYPE: none
}
LI {
	LIST-STYLE-TYPE: none
}
.shou_js {
	MARGIN-TOP: 2px; WIDTH: 355px; DISPLAY: inline; FLOAT: left; HEIGHT: 315px; MARGIN-LEFT: 5px
}
#ifocus {
	BORDER-BOTTOM: #dedede 1px solid; BORDER-LEFT: #dedede 1px solid; WIDTH: 355px; BACKGROUND: #f8f8f8; HEIGHT: 310px; BORDER-TOP: #dedede 1px solid; BORDER-RIGHT: #dedede 1px solid
}
#ifocus_pic {
	POSITION: relative; MARGIN: 5px 0px 0px 5px; WIDTH: 340px; DISPLAY: inline; FLOAT: left; HEIGHT: 240px; OVERFLOW: hidden
}
#ifocus_piclist {
	POSITION: absolute
}
#ifocus_piclist LI {
	WIDTH: 350px; HEIGHT: 240px; OVERFLOW: hidden
}
#ifocus_piclist IMG {
	WIDTH: 350px; HEIGHT: 240px
}
#ifocus_btn {
	MARGIN: 9px 9px 0px 0px; WIDTH: 80px; DISPLAY: inline; CLEAR: both
}
#ifocus_btn LI {
	FILTER: alpha(opacity=50); WIDTH: 81px; FLOAT: left; HEIGHT: 65px; MARGIN-LEFT: 3px; CURSOR: pointer; MARGIN-RIGHT: 0px; opacity: 0.5; -moz-opacity: 0.5
}
#ifocus_btn IMG {
	MARGIN: 7px 0px 0px; WIDTH: 75px; HEIGHT: 50px
}
#ifocus_btn .current {
	FILTER: alpha(opacity=100); BACKGROUND: no-repeat; opacity: 1; -moz-opacity: 1
}
#ifocus_opdiv {
	POSITION: absolute; FILTER: alpha(opacity=50); WIDTH: 370px; BOTTOM: 0px; BACKGROUND: #fff; HEIGHT: 35px; LEFT: 0px; opacity: 0.5; -moz-opacity: 0.5
}
#ifocus_tx {
	POSITION: absolute; BOTTOM: 8px; COLOR: #fff; LEFT: 8px
}
#ifocus_tx .normal {
	DISPLAY: none
}
IMG {
	BORDER-BOTTOM: 0px; BORDER-LEFT: 0px; VERTICAL-ALIGN: top; BORDER-TOP: 0px; BORDER-RIGHT: 0px
}
A {
	COLOR: #000000
}
</STYLE>
  <body>
   <DIV class=shou_js>
<DIV id=ifocus>
<DIV id=ifocus_pic>
<DIV style="TOP: 0px; LEFT: 0px" id=ifocus_piclist>
<%CommDAO dao = new  CommDAO();
HashMap map = dao.select("select * from news where type='1' order by id desc ").get(0);
%>
<UL>
  <LI><A href="/trainsp/imgnewsx.jsp?id=<%=map.get("id") %>" target=_blank><IMG 
  alt="<%=map.get("title") %>" src="upfile/<%=map.get("img") %>"></A></LI></UL></DIV>
<DIV id=ifocus_opdiv></DIV>
<DIV id=ifocus_tx>
<UL>
  <LI class=current><A href="" 
  target=_blank><%=map.get("title") %></A></LI></UL></DIV></DIV>
<DIV style="CLEAR: both"></DIV>
<DIV id=ifocus_btn>
<UL>
	<%ArrayList<HashMap> list = (ArrayList)dao.select("select * from news where type=1 order by id desc limit 1,5 "); 
	if(list.size()!=0){
		for(HashMap mm:list){

	%>
  <LI class=current><A href="/trainsp/imgnewsx.jsp?id=<%=mm.get("id") %>" 
  target=_blank><IMG alt="<%=mm.get("title") %>" 
  src="upfile/<%=mm.get("img") %>"></A></LI>
  <%}} %>
  </UL></DIV></DIV></DIV>
  </body>
</html>
