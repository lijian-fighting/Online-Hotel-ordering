<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%@ page import="Infor.UserInfo"%>
<%@ page import="Infor.database"%>
<%@ page import="Infor.RoomInfo"%>
<%@ page import="Infor.UserInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	database db=new database();
	String username= request.getParameter("user");
	String passwd=request.getParameter("passwd");
	if((username == "")||(passwd == "")){
		out.print("输入有空项");
		response.setHeader("refresh", "1.5;URL=login.jsp");
	}else{
		String flag=db.login(username,passwd);
		if(flag.equals("0")){
			out.print("登录成功");
			session.setAttribute("user",username); 
			response.setHeader("refresh", "1.5;URL=Newroom.jsp");
		}else if(flag.equals("1")){
			out.print("登录成功");
			session.setAttribute("user",username); 
			response.setHeader("refresh", "1.5;URL=Newwork.jsp");
		}
		else if(flag.equals("2")){
			out.print("登录成功");
			session.setAttribute("user",username); 
			response.setHeader("refresh", "1.5;URL=Newsuper.jsp");
		}
		else{
			 out.print("登录失败");
			 response.setHeader("refresh", "1.5;URL=login.jsp");
		}
		db.close();
	}
%>

</body>
</html>