package control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;


import util.Info;

import dao.CommDAO;

public class MainCtrl extends HttpServlet {

	public MainCtrl() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	this.doPost(request, response);
	}

		public void go(String url,HttpServletRequest request, HttpServletResponse response)
		{
		try {
			request.getRequestDispatcher(url).forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		}
		
		public void gor(String url,HttpServletRequest request, HttpServletResponse response)
		{
			try {
				response.sendRedirect(url);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		HashMap admin = (HashMap)session.getAttribute("admin");
		HashMap user = (HashMap)session.getAttribute("user");
		String ac = request.getParameter("ac");
		if(ac==null)ac="";
		CommDAO dao = new CommDAO();
		String date = Info.getDateStr();
		String today = date.substring(0,10);
		String tomonth = date.substring(0,7);
		
		//管理员登录
		if(ac.equals("login"))
		{
			String username = request.getParameter("uname");
			String password = request.getParameter("upass");
			
				String sql = "select * from sysuser where uname='"+username+"' and upass='"+password+"'";
			
			List<HashMap> userlist = dao.select(sql);
			if(userlist.size()!=1)
			{
				request.setAttribute("error", "");
				go("/admin/login.jsp", request, response);
			}else{
				request.getSession(). setAttribute("admin", userlist.get(0));
				gor("/trainsp/admin/index.jsp", request, response);
			}
		}
		
		

		//前台登录
		if(ac.equals("memlogin"))
		{
			String username = request.getParameter("uname");
			String password = request.getParameter("upass");
			
				String sql = "select * from sysuser where uname='"+username+"' and upass='"+password+"'";
			
			List<HashMap> userlist = dao.select(sql);
			if(userlist.size()!=1)
			{
				request.setAttribute("error", "");
				go("/login.jsp", request, response);
			}else{
				request.setAttribute("suc1", "");
				request.getSession(). setAttribute("admin", userlist.get(0));
				go("/login.jsp", request, response);
			}
		}
		
		
		
		//修改密码
		if(ac.equals("uppass"))
		{
			String olduserpass = request.getParameter("olduserpass");
			String userpass = request.getParameter("userpass");
			String copyuserpass = request.getParameter("copyuserpass");   
			
			if(!(((String)user.get("upass")).equals(olduserpass)))
			{
				request.setAttribute("error", "");
				go("/admin/uppass.jsp", request, response);
			}else{
			String id = (String)user.get("id");
			String sql = "update sysuser set upass='"+userpass+"' where id="+id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/uppass.jsp", request, response);
			}
		}
		
		//添加用户
		if(ac.equals("adduser"))
		{
			String uname = request.getParameter("uname");
			String upass = request.getParameter("upass");
			String utype = request.getParameter("utype");
			String sql = "insert into sysuser values('"+uname+"','"+upass+"','"+utype+"')";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/adduser.jsp", request, response);
		}
		
		//修改用户
		if(ac.equals("updateuser"))
		{
			String uname = request.getParameter("uname");
			String upass = request.getParameter("upass");
			String utype = request.getParameter("utype");
			String id = request.getParameter("id");
			String sql = "update sysuser set uname='"+uname+"',upass='"+upass+"',utype='"+utype+"' where id="+id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/adduser.jsp", request, response);
		}
		//订票须知
		if(ac.equals("dpxz"))
		{
			String content = request.getParameter("mt");
			String sql = "update xz set content = '"+content+"' where id=1";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/dpxz.jsp", request, response);
		}
		
		
		
		
		
		
		
		//添加新闻
		if(ac.equals("addnotice"))
		{
			String title = request.getParameter("title");
			String content = request.getParameter("mt");
			String savetime = Info.getDateStr();
			String sql = "insert into news (id,title,content,savetime,type) values(null,'"+title+"','"+content+"','"+savetime+"','0')";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/noticeadd.jsp", request, response);
		}
		
		//修改新闻
		if(ac.equals("upnotice"))
		{
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("mt");
			String sql = "update news set title='"+title+"',content='"+content+"' where id="+id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/noticeadd.jsp", request, response);
		}
		//添加图片新闻
		if(ac.equals("addimgnews")){
			try {
				String title="";
				String filename="";
				String content="";
			request.setCharacterEncoding("utf-8");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			     items = upload.parseRequest(request);
			     title = ((FileItem) items.get(0)).getString();
			     title = Info.getUTFStr(title);
			     content = ((FileItem) items.get(2)).getString();
			     content = Info.getUTFStr(content);
			    FileItem fileItem = (FileItem) items.get(1);
			   if(fileItem.getName()!=null && fileItem.getSize()!=0)
			    {
			    if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      filename = Info.generalFileName(fullFile.getName());
			      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			     }
			    }
			}
			
			String sql = "insert into news (title,content,savetime,img,type) values('"+title+"','"+content+"','"+Info.getDateStr()+"','"+filename+"','1')" ;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/imgnewsadd.jsp", request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
				request.setAttribute("error", "");
			     request.getRequestDispatcher("/admin/imgnewsadd.jsp").forward(request, response);
			    }
			
		}
		//修改图片新闻
		if(ac.equals("upimgnews"))
		{
			try {
				String id ="";
				String title="";
				String filename= "";
				String content="";
			request.setCharacterEncoding("utf-8");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			     items = upload.parseRequest(request);
			     id = ((FileItem) items.get(0)).getString();
			     title = ((FileItem) items.get(1)).getString();
			     title = Info.getUTFStr(title);
			     content = ((FileItem) items.get(3)).getString();
			     content = Info.getUTFStr(content);
			     HashMap map = dao.select("select * from news where id="+id).get(0);
			     filename=map.get("img").toString();
			    FileItem fileItem = (FileItem) items.get(2);
			   if(fileItem.getName()!=null && fileItem.getSize()!=0)
			    {
			    if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      filename = Info.generalFileName(fullFile.getName());
			      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			     }
			    }
			}
			
			String sql = "update news set title='"+title+"',img='"+filename+"',content='"+content+"' where id="+id ;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/imgnewsadd.jsp", request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
				request.setAttribute("error", "");
			     request.getRequestDispatcher("/admin/imgnewsadd.jsp").forward(request, response);
			    }
		}
		//添加友情链接
		if(ac.equals("addlink"))
		{
			String name = request.getParameter("name");
			String url = request.getParameter("url");
			String sql = "insert into link (name,url) values('"+name+"','"+url+"')";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/linkadd.jsp", request, response);
		}
		
		//修改友情链接
		if(ac.equals("uplink"))
		{
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String url = request.getParameter("url");
			String sql = "update link set name='"+name+"',url='"+url+"' where id="+id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/linkup.jsp", request, response);
		}
		//会员注册
		if(ac.equals("memberreg"))
		{
			String uname = request.getParameter("uname");
			String upass = request.getParameter("upass");
			String tname = request.getParameter("tname");
			String sex = request.getParameter("sex");
			String sfzh = request.getParameter("sfzh");
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
			String delstatus = "0";
			String savetime = Info.getDateStr();

			String cksql = "select * from member where uname='"+uname+"' and delstatus=0";
			ArrayList list = (ArrayList)dao.select(cksql);
			if(list.size()==0){
				String sql = "insert into member(uname,upass,tname,sex,sfzh,tel,email,delstatus,savetime) values('"+uname+"','"+upass+"','"+tname+"','"+sex+"','"+sfzh+"','"+tel+"','"+email+"','"+delstatus+"','"+savetime+"')";
				dao.commOper(sql);
				request.setAttribute("suc", "");
				go("/reg.jsp", request, response);
			}else{
				request.setAttribute("no", "");
				go("/reg.jsp", request, response);
			}
			
		}
		//会员修改个人信息
		if(ac.equals("memberup")){
			String id = request.getParameter("id");
			String upass = request.getParameter("upass");
			String tname = request.getParameter("tname");
			String sex = request.getParameter("sex");
			String sfzh = request.getParameter("sfzh");
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
			String sql = "update member set upass='"+upass+"',tname='"+tname+"',sex='"+sex+"',sfzh='"+sfzh+"',tel='"+tel+"',email='"+email+"' where id="+id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/myinfo.jsp", request, response);
		}
		//管理员修改密码
		if(ac.equals("adminuppass"))
		{
			String uid = admin.get("id").toString();
			String upass = request.getParameter("upass");
			String sql = "update sysuser set upass='"+upass+"' where id="+uid;
			System.out.println(sql);
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/uppwd.jsp", request, response);
		}
		//会员登陆
		if(ac.equals("memberlogin"))
		{
			String uname = request.getParameter("uname");
			String upass = request.getParameter("upass");
			String sql = "select * from member where uname='"+uname+"' and upass='"+upass+"' and delstatus=0 ";
			ArrayList list = (ArrayList)dao.select(sql);
			if(list.size()!=0){
				request.getSession(). setAttribute("user", list.get(0));
				request.setAttribute("suc", "");
				go("/login.jsp", request, response);
			}else{
				request.setAttribute("no", "");
				go("/login.jsp", request, response);
			}
			
		}
		
		//会员退出
		if(ac.equals("memberexit"))
		{
			request.getSession().invalidate();
			request.setAttribute("suc2", "");
			go("/index.jsp", request, response);
		}
		
		//新增票务
		if(ac.equals("addpw")){
			String checi = request.getParameter("checi");
			String saddr = request.getParameter("saddr");
			String eaddr = request.getParameter("eaddr");
			String stime = request.getParameter("stime");
			String etime = request.getParameter("etime");
			String tdzsl = request.getParameter("tdzsl");
			String tdzjg = request.getParameter("tdzjg");
			String ydzsl = request.getParameter("ydzsl");
			String ydzjg = request.getParameter("ydzjg");
			String edzsl = request.getParameter("edzsl");
			String edzjg = request.getParameter("edzjg");
			String yxsj = request.getParameter("yxsj");
			String sj = request.getParameter("sj");
			String delstatus = "0";
			String sql = "insert into pw (checi,saddr,eaddr,stime,etime,tdzsl,tdzjg,ydzsl,ydzjg,edzsl,edzjg,yxsj,sj,delstatus) values ('"+checi+"','"+saddr+"','"+eaddr+"','"+stime+"','"+etime+"','"+tdzsl+"','"+tdzjg+"','"+ydzsl+"','"+ydzjg+"','"+edzsl+"','"+edzjg+"','"+yxsj+"','"+sj+"','"+delstatus+"')";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/pwadd.jsp", request, response);
		}
		//修改票务
		if(ac.equals("uppw")){
			String id = request.getParameter("id");
			String checi = request.getParameter("checi");
			String saddr = request.getParameter("saddr");
			String eaddr = request.getParameter("eaddr");
			String stime = request.getParameter("stime");
			String etime = request.getParameter("etime");
			String tdzsl = request.getParameter("tdzsl");
			String tdzjg = request.getParameter("tdzjg");
			String ydzsl = request.getParameter("ydzsl");
			String ydzjg = request.getParameter("ydzjg");
			String edzsl = request.getParameter("edzsl");
			String edzjg = request.getParameter("edzjg");
			String yxsj = request.getParameter("yxsj");
			String sj = request.getParameter("sj");
			String sql = "update pw set checi='"+checi+"',saddr='"+saddr+"',eaddr='"+eaddr+"',stime='"+stime+"',etime='"+etime+"',tdzsl='"+tdzsl+"'" +
					",tdzjg='"+tdzjg+"',ydzsl='"+ydzsl+"',ydzjg='"+ydzjg+"',edzsl='"+edzsl+"',edzjg='"+edzjg+"',yxsj='"+yxsj+"',sj='"+sj+"' where id="+id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/pwadd.jsp", request, response);
		}
		
		//修改新闻
		if(ac.equals("updatenews"))
		{
			String id = request.getParameter("id");
			HashMap map = dao.select("select * from news where id="+id).get(0);
			try {
				String title="";
				String filename=map.get("picurl").toString();
				String content="";
			request.setCharacterEncoding("utf-8");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			    
			     items = upload.parseRequest(request);
			    
			     
			     title = ((FileItem) items.get(0)).getString();
			     title = Info.getUTFStr(title);
			     
			     content = ((FileItem) items.get(2)).getString();
			     content = Info.getUTFStr(content);
			     
			     
			    FileItem fileItem = (FileItem) items.get(1);
			   if(fileItem.getName()!=null && fileItem.getSize()!=0)
			    {
			    if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      filename = Info.generalFileName(fullFile.getName());
			      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			     }
			    }
			}
			
			String sql = "update news set title='"+title+"',picurl='"+filename+"',content='"+content+"' where id="+id ;
		 System.out.println(sql);
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/addnews.jsp", request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
				request.setAttribute("error", "");
			     request.getRequestDispatcher("/admin/spgl.jsp").forward(request, response);
			    }
		}
		
		
		//添加新闻
		if(ac.equals("addnews"))
		{
			try {
				String title="";
				String filename="";
				String content="";
			request.setCharacterEncoding("utf-8");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			    
			     items = upload.parseRequest(request);
			    
			     
			     title = ((FileItem) items.get(0)).getString();
			     title = Info.getUTFStr(title);
			     
			     content = ((FileItem) items.get(2)).getString();
			     content = Info.getUTFStr(content);
			     
			     
			    FileItem fileItem = (FileItem) items.get(1);
			   if(fileItem.getName()!=null && fileItem.getSize()!=0)
			    {
			    if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      filename = Info.generalFileName(fullFile.getName());
			      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			     }
			    }
			}
			
			String sql = "insert into news values('"+title+"','"+filename+"','"+content+"','"+Info.getDateStr()+"')" ;
		 System.out.println(sql);
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/addnews.jsp", request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
				request.setAttribute("error", "");
			     request.getRequestDispatcher("/admin/spgl.jsp").forward(request, response);
			    }
		}
		
		//订票
		if(ac.equals("dp"))
		{
			String tname = request.getParameter("tname");
			String pid = request.getParameter("pid");
			String pz = request.getParameter("pz");
			String sfzh = request.getParameter("sfzh");
			String jg = request.getParameter("jg");
			String bank = request.getParameter("bank");
			String zh = request.getParameter("zh");
			String uid = user.get("id").toString();
			String sql = "insert into mydd (tname,pid,pz,sfzh,jg,bank,zh,uid) values('"+tname+"','"+pid+"','"+pz+"','"+sfzh+"','"+jg+"','"+bank+"','"+zh+"','"+uid+"')";
			String ss = "";
			if(pz.equals("0")){
				ss = "update pw set tdzsl = tdzsl-1 where id= "+pid;
			}if(pz.equals("1")){
				ss = "update pw set ydzsl = ydzsl-1 where id= "+pid;
			}if(pz.equals("2")){
				ss = "update pw set edzsl = edzsl-1 where id= "+pid;
			}
			
			dao.commOper(sql);
			dao.commOper(ss);
			request.setAttribute("suc", "");
			go("/pay.jsp", request, response);
		}
		
		//退票
		if(ac.equals("tp"))
		{
			String pid = request.getParameter("pid");
			String id = request.getParameter("id");
			String pz = request.getParameter("pz");
			String ss = "";
			if(pz.equals("0")){
				ss = "update pw set tdzsl = tdzsl+1 where id= "+pid;
			}if(pz.equals("1")){
				ss = "update pw set tdzsl = ydzsl+1 where id= "+pid;
			}if(pz.equals("2")){
				ss = "update pw set tdzsl = edzsl+1 where id= "+pid;
			}
			String sql = "delete  from mydd where id="+id;
			System.out.println(sql);
			dao.commOper(sql);
			dao.commOper(ss);
			request.setAttribute("suc", "");
			go("/myorder.jsp", request, response);
		}
		//改签
		if(ac.equals("gq"))
		{
			String pid = request.getParameter("pid");
			String pz = request.getParameter("pz");
			String ddid = request.getParameter("ddid");
			String oldpid = request.getParameter("oldpid");
			String oldpz = request.getParameter("oldpz");
			String ss = "select * from pw where id= "+pid;
			String aa = "";
			String jg = "";
			HashMap map = dao.select(ss).get(0);
			if(pz.equals("0")){
				aa = map.get("tdzsl").toString();
				jg = map.get("tdzjg").toString();
			}if(pz.equals("1")){
				aa = map.get("ydzsl").toString();
				jg = map.get("ydzjg").toString();
			}if(pz.equals("2")){
				aa = map.get("edzsl").toString();
				jg = map.get("edzjg").toString();
			}
			if(Integer.parseInt(aa)==0){
				request.setAttribute("ddid", ddid);
				request.setAttribute("pid", oldpid);
				request.setAttribute("pz", oldpz);
				request.setAttribute("no", "");
				go("/gq.jsp", request, response);
			}else{
				String uid = user.get("id").toString();
				String bb = "update mydd set pid='"+pid+"',pz='"+pz+"',jg='"+jg+"' where id='"+ddid+"' ";
				String bbb = "";
				if(pz.equals("0")){
					bbb = "update pw set tdzsl=tdzsl-1 where id="+pid;
				}if(pz.equals("1")){
					bbb = "update pw set ydzsl=ydzsl-1 where id="+pid;
				}if(pz.equals("2")){
					bbb = "update pw set edzsl=edzsl-1 where id="+pid;
				}
				dao.commOper(bb);
				dao.commOper(bbb);
				String cc = ""; 
				if(oldpz.equals("0")){
				cc = "update pw set tdzsl=tdzsl+1 where id="+oldpid;
				}if(oldpz.equals("1")){
				cc = "update pw set ydzsl=ydzsl+1 where id="+oldpid;
				}if(oldpz.equals("2")){
				cc = "update pw set edzsl=edzsl+1 where id="+oldpid;
				}
				dao.commOper(cc);
				request.setAttribute("ddid", ddid);
				request.setAttribute("pid", oldpid);
				request.setAttribute("pz", oldpz);
				request.setAttribute("suc", "");
				go("/gq.jsp", request, response);
			}
		}
//订单报表
		if(ac.equals("ddbb")){
			String sql = "select * from mydd order by id desc ";
			 List<List> list1  = new ArrayList();
			 List<HashMap> list = dao.select(sql);
			 for(HashMap map:list)
			    {
				 List mlist  = new ArrayList();
				 mlist.add(map.get("id").toString());
				 String pid = map.get("pid").toString();
				 HashMap pm = dao.select("select * from pw where  id="+pid).get(0);
				 String pwxx = pm.get("saddr")+ "--" +pm.get("eaddr")+ "(" +pm.get("sj")+" "+pm.get("stime")+ ")";
			    	mlist.add(pwxx);
			    	String pz = map.get("pz").toString();
			    	String pzxx = "";
			    	if(pz.equals("0")){
			    		pzxx = "特等座";
		      		}if(pz.equals("1")){
		      			pzxx = "一等座";
		      		}if(pz.equals("2")){
		      			pzxx = "二等座";
		      		}
			    	mlist.add(pzxx);
			    	mlist.add(map.get("jg").toString());
			    	mlist.add(map.get("tname").toString());
			    	mlist.add(map.get("sfzh").toString());
			    	list1.add(mlist);
			    }
			 String[] pros = {"订单号","车票信息","票种","价格","姓名","身份证"};
				Info.writeExcel(request.getRealPath("/upfile/")+"/orderinfo.xls", pros, list1, request, response);
		}
		//留言
		if(ac.equals("fbmsg")){
			String content = request.getParameter("content");
			String uname = user.get("uname").toString();
			String savetime = Info.getDateStr();
			String sql = "insert into msg (content,savetime,uname) values ('"+content+"','"+savetime+"','"+uname+"')";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/msg.jsp", request, response);
		}
		
		dao.close();
		out.flush();
		out.close();
	}


	public void init() throws ServletException {
		// Put your code here
	}
	
	

}
