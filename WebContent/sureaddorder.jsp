<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="Infor.RoomInfo"%>
<%@ page import="Infor.database"%>
<%@ page import="Infor.UserInfo"%>
<%@ page import="Infor.TradeInfo"%>
<%@ page import="Infor.function"%>
<%@ page import="Infor.money"%>
<%@ page import="Infor.Time"%>

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
<title>预定房间</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		Time time=new Time();
		String value = (String) session.getAttribute("user");
		value=value+"代办";
		String roomid = (String) session.getAttribute("roomid");
		String entertime = (String) session.getAttribute("entertime");
		String lasttime = (String) session.getAttribute("lasttime");
		String day = (String) session.getAttribute("day");
		String price = (String) session.getAttribute("price");
		String pay = (String) session.getAttribute("pay");
		int m = Integer.parseInt(pay);
		TradeInfo trade = new TradeInfo(time.tradeid(), entertime, lasttime, value, roomid, day, price, pay);
		function f = new function();
		money sale = new money();
		database db = new database();
		String money = db.sale(f.months(entertime));
		m = Integer.parseInt(money) + m;

			if ((db.trading(trade)) && (db.insertsale(f.months(entertime), m))) {
				db.close();
				out.print("新建订单成功");
				response.setHeader("refresh", "1.5;URL=Newwork.jsp");
			}else{
				db.close();
				out.print("新建订单失败");
				response.setHeader("refresh", "1.5;URL=Newwork.jsp");
			}
	%>
</body>
</html>