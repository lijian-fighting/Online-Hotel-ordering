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
%>
<% 
if(request.getParameter("roomid")==""){
	out.print("房间号不为空");
	response.setHeader("refresh", "1.5;URL=addroom.jsp");
}else{
	String roomid= request.getParameter("roomid");
	RoomInfo room=new RoomInfo(request.getParameter("roomid"),request.getParameter("select2"),request.getParameter("select"),request.getParameter("select1"));
	database db=new database();
	if(db.judge1(roomid)==1){
		if(db.insertroom(room)){
	 		 out.println("添加成功");
	  		 db.close();
	  		 response.setHeader("refresh", "1.5;URL=Newwork.jsp");
		}else{
	    	 out.print("添加失败");
	  		 db.close();
	  	 	response.setHeader("refresh", "1.5;URL=Newwork.jsp");
		}
	}
	else{
		out.println("此房间已存在");
 		db.close();
 		response.setHeader("refresh", "1.5;URL=add.jsp");
	}
}
%>
</body>
</html>