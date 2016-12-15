<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="Infor.RoomInfo"%>
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
String roomid= request.getParameter("roomid");
database db=new database();
if(!db.room_trade(roomid)){
	if(db.deleteroom(roomid)){
		out.print("删除成功");
		db.close();
 		response.setHeader("refresh", "1.5;URL=super_allroom.jsp");
	}else{
		out.print("删除失败");
		db.close();
 		response.setHeader("refresh", "1.5;URL=super_allroom.jsp");
	}
}
else{
	out.print("请之后删除，已有用户订此房间");
	db.close();
 	response.setHeader("refresh", "1.5;URL=super_allroom.jsp");
}
%>
</body>
</html>