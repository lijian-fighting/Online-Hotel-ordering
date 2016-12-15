<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="Infor.RoomInfo"%>
<%@ page import="Infor.database"%>
<%@ page import="Infor.UserInfo"%>
<%@ page import="Infor.TradeInfo"%>
<%@ page import="Infor.function" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>退订房间</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		function f=new function();
		database db = new database();
		String roomid = request.getParameter("roomnum");
		String entertime = request.getParameter("entertime");
		String money = request.getParameter("money");
		int temp = db.judge1(roomid);
		db.disorder(roomid,entertime);
		String month=f.months(entertime);
		String count=db.sale(month);
		int m=Integer.parseInt(count);
		m=m-Integer.parseInt(money);
		if(db.downsale(f.months(entertime),m)){
			out.print("退房成功，定金已返回");
			db.close();
			response.setHeader("refresh", "1.5;URL=Newwork.jsp");
		}
	%>


</body>
</html>