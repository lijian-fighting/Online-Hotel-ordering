<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="Infor.AdminInfo"%>
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
<title>修改</title>
</head>
<body>
<%
String value=(String)session.getAttribute("user");
request.setCharacterEncoding("UTF-8");
database db=new database();
String adminid=(String)session.getAttribute("adminid");
String adminpasswd=request.getParameter("superpasswd");
String phone=request.getParameter("superphone");
String position=request.getParameter("select1");

if((adminpasswd=="")||(phone=="")||(position=="")){
	out.print("修改内容不能为空");
	response.setHeader("refresh", "1.5;URL=alladmin.jsp");
}else{
	if(db.updateadmin(adminid,adminpasswd,phone,position)){
		out.print("修改成功");
		db.close();
		response.setHeader("refresh", "1.5;URL=alladmin.jsp");
	}else{
		out.print("修改失败");
		db.close();
		response.setHeader("refresh", "1.5;URL=alladmin.jsp");
	}
}
%>

</body>
</html>