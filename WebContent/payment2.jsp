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
		String number = request.getParameter("number");
		String passwd = request.getParameter("passwd");
		String roomid = (String) session.getAttribute("roomid");
		String f_enter = (String) session.getAttribute("enter");
		String entertime = (String) session.getAttribute("entertime");
		String lasttime = (String) session.getAttribute("lasttime");
		String day = (String) session.getAttribute("day");
		String price = (String) session.getAttribute("price");
		String pay = (String) session.getAttribute("pay");
		String f_pay = (String) session.getAttribute("former_pay");
		if ((number == "") || (passwd == "")) {
			out.print("银行卡号密码有空");
			response.setHeader("refresh", "1.5;URL=paym2.jsp");
		} else {
			int m = Integer.parseInt(pay);
			int f_m = Integer.parseInt(f_pay);
			if (m >= f_m) {
				TradeInfo trade = new TradeInfo(time.tradeid(), entertime, lasttime, value, roomid, day, price, pay);
				function f = new function();
				money sale = new money();
				database db = new database();
				String money = db.sale(f.months(entertime));
				int count=m-f_m;
				m = Integer.parseInt(money) + count;
				db.disorder(roomid, f_enter);
				if ((db.trading(trade)) && (db.insertsale(f.months(entertime), m))) {
					db.close();
					out.print("补款"+count+"元成功");
					response.setHeader("refresh", "1.5;URL=Neworder.jsp");
				}
			} else {
				TradeInfo trade = new TradeInfo(time.tradeid(),entertime, lasttime, value, roomid, day, price, pay);
				function f = new function();
				money sale = new money();
				database db = new database();
				String money = db.sale(f.months(entertime));
				int count=f_m-m;
				m = Integer.parseInt(money) + count;
				db.disorder(roomid, f_enter);
				if ((db.trading(trade)) && (db.insertsale(f.months(entertime), m))) {
					db.close();
					out.print("退款"+count+"元成功");
					response.setHeader("refresh", "1.5;URL=Neworder.jsp");
				}
			}
		}
	%>
</body>
</html>