<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="Infor.AdminInfo"%>
<%@ page import="Infor.database"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
%>
<% 
if((request.getParameter("superid")=="")||(request.getParameter("superpasswd")=="")||(request.getParameter("superphone")=="")){
	out.print("输入不为空");
	response.setHeader("refresh", "1.5;URL=addadmin.jsp");
}else{
	String adminid= request.getParameter("superid");
	AdminInfo ad=new AdminInfo(request.getParameter("superid"),request.getParameter("superpasswd"),request.getParameter("superphone"),request.getParameter("select1"));
	database db=new database();
	if(db.judge5(adminid)==1){
		if(db.insertadmin(ad)){
			 db.insert2(request.getParameter("superid"),request.getParameter("superpasswd"),"1");
	 		 out.println("添加成功");
	  		 db.close();
	  		 response.setHeader("refresh", "1.5;URL=Newsuper.jsp");
		}else{
	    	 out.print("添加失败");
	  		 db.close();
	  	 	response.setHeader("refresh", "1.5;URL=Newsuper.jsp");
		}
	}
	else{
		out.println("此管理员已存在");
 		db.close();
 		response.setHeader("refresh", "1.5;URL=Newsuper.jsp");
	}
}
%>
</body>
</html>