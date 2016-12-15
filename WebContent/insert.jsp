<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="Infor.RoomInfo"%>
<%@ page import="Infor.UserInfo"%>
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
<title>注册</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
String username= request.getParameter("name");
if((request.getParameter("name") == "")||(request.getParameter("age") == "")||(request.getParameter("phone")=="")||(request.getParameter("address")=="")||(request.getParameter("identification")=="")||(request.getParameter("passwd")=="")){
	out.print("输入有空项");
	response.setHeader("refresh", "1.5;URL=Newregister.jsp");
}else{
	UserInfo user=new UserInfo(request.getParameter("name"),request.getParameter("age"),request.getParameter("phone"),request.getParameter("address"),request.getParameter("identification"),request.getParameter("passwd"));
	database db=new database();
	if(db.judge2(username)){
		if(db.insert(user)){
	 		 out.println("注册成功");
	 		 db.insert2(request.getParameter("name"),request.getParameter("passwd"),"0");
	  	 	 db.close();
	  	 	 response.setHeader("refresh", "1.5;URL=login.jsp");
		}
		else{
	     	out.print("注册失败");
	  	 	db.close();
	  	 	response.setHeader("refresh", "1.5;URL=login.jsp");
		}
	}
	else{
		out.println("此用户已被注册");
 		db.close();
 		response.setHeader("refresh", "1.5;URL=login.jsp");
	}
}
%>

</body>
</html>