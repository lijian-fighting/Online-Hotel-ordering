<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%@ page import="Infor.UserInfo"%>
    
<%@ page import="Infor.database"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	database db=new database();
	String adminid= request.getParameter("s_adminid");
	String adminpasswd=request.getParameter("s_adminpasswd");
	if(db.s_adminlogin(adminid,adminpasswd)){
		out.print("登录成功");
		session.setAttribute("user",adminid); 
		response.setHeader("refresh", "1.5;URL=boss.jsp");
	}
	else{
		 out.print("登录失败");
		 response.setHeader("refresh", "1.5;URL=super.jsp");
	}
	db.close();
%>

</body>
</html>