<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Infor.RoomInfo"%>
<%@ page import="Infor.database"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
		String value = (String) session.getAttribute("user");
	%>
	<%
		request.setCharacterEncoding("UTF-8");
		database db = new database();
		String roomid = (String)session.getAttribute("roomid");
		String type = request.getParameter("select1");
		String price = request.getParameter("select");
		String state = request.getParameter("select2");
		if(!db.room_trade(roomid)){
			if (db.updateroom(roomid, type, price, state)) {
				out.print("修改房间成功");
				db.close();
				response.setHeader("refresh", "1.5;URL=super_allroom.jsp");
			} else {
				out.print("修改房间失败");
				db.close();
				response.setHeader("refresh", "1.5;URL=super_allroom.jsp");
			}
		}else{
			out.print("请之后修改，已有用户订此房间");
			db.close();
			response.setHeader("refresh", "1.5;URL=super_allroom.jsp");
		}
	%>

</body>
</html>