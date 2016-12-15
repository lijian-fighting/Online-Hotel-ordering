<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="Infor.RoomInfo"%>
<%@ page import="Infor.database"%>
<%@ page import="Infor.UserInfo"%>
<%@ page import="Infor.TradeInfo"%>
<%@ page import="Infor.function"%>
<%@ page import="Infor.money"%>
<%@ page import="Infor.Time"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="style.css" />
<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="time.js"></script>
<title>生成订单表</title>
</head>
<body>
	<%
		String value = (String) session.getAttribute("user");
		function f = new function();
		String flag = f.judge(value);
		if (!flag.equals("1")) {
			out.print("显示错误");
			response.setHeader("refresh", "1.5;URL=login.jsp");
		} else {
			Time time=new Time();
			database db = new database();
			String now=time.nowtime();
			request.setCharacterEncoding("UTF-8");
			String roomid = (String) session.getAttribute("roomid");
			String f_enter=(String)session.getAttribute("enter");
			String entertime = request.getParameter("entertime");
			String lasttime = request.getParameter("lasttime");
	%>
	<%
		if ((roomid == "") || (entertime == "") || (lasttime == "")) {
				out.print("输入有空项");
				response.setHeader("refresh", "1.5;URL=allorder.jsp");
			} else if (entertime.compareTo(lasttime) >= 0) {
				out.print("退房日期小于入住时间，错误");
				response.setHeader("refresh", "1.5;URL=allorder.jsp");
			} else if(time.timejudge(entertime, now) == -1) {
				out.print("入住时间在今天之前，错误");
				response.setHeader("refresh", "1.5;URL=allorder.jsp");
			} else {
				String temp = db.order_sale(f_enter, roomid);
				String tradeid=db.tradeid(f_enter, roomid);
				System.out.print(tradeid);
				System.out.print(roomid);
				System.out.print(entertime);
				System.out.print(lasttime);
				if(!(time.judge2(entertime, lasttime, roomid,tradeid))){
				out.print("该时间段房间已被租，错误");
				response.setHeader("refresh", "1.5;URL=allorder.jsp");
				}else{
	%>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<h3 class="text-center">酒店欢迎你</h3>
				<div class="navbar navbar-inverse">
					<div class="navbar-inner">
						<div class="container-fluid">
							<a class="btn btn-navbar"
								data-target=".navbar-responsive-collapse" data-toggle="collapse"></a>
							<a class="brand">管理员</a>
							<div class="nav-collapse collapse navbar-responsive-collapse">
								<ul class="nav">
									<li class="active"><a href="Newwork.jsp">首页</a></li>
									<li class="dropdown"><a class="dropdown-toggle"
										data-toggle="dropdown">订单处理</a>
										<ul class="dropdown-menu">
											<li><a href="addorder.jsp">新增订单</a></li>
											<li><a href="allorder.jsp">查看订单</a></li>
										</ul></li>
									<li class="dropdown"><a class="dropdown-toggle"
										data-toggle="dropdown">房间管理</a>
										<ul class="dropdown-menu">
											<li><a href="addroom.jsp">新增房间</a></li>
											<li><a href="allroom.jsp">查看房间</a></li>
										</ul></li>
									<li><a href="alluser.jsp">查看用户</a></li>
								</ul>
								<ul class="nav pull-right">
									<li><a class="brand">欢迎 <%=value%></a></li>
									<li class="divider-vertical"></li>
									<li><a href="login.jsp">切换用户</a></li>
								</ul>
							</div>

						</div>
					</div>
				</div>
				<%
					int day = (int) f.days(entertime, lasttime);
							int price = Integer.parseInt(db.price(roomid));
							int money = price * day;
							session.setAttribute("entertime", entertime);
							session.setAttribute("lasttime", lasttime);
							session.setAttribute("day", Integer.toString(day));
							session.setAttribute("price", Integer.toString(price));
							session.setAttribute("pay", Integer.toString(money));
							session.setAttribute("former_pay", temp);
				%>
				<div class="container-fluid">
					<div class="row-fluid">
						<div class="span12">
							<div class="row-fluid">
								<div class="span4"></div>
								<div class="span4">
									<form class="form-inline" action="surechange.jsp">
										<fieldset>
											<label>办理人员</label><input type="text" value=<%=value%>
												disabled /> <br /> <br /> <label>房间编号</label><input
												type="text" value=<%=roomid%> disabled /> <br /> <br />
											<label>入住时间</label><input type="text" value=<%=entertime%>
												disabled /> <br />
											<br /> <label>退房时间</label><input type="text"
												value=<%=lasttime%> disabled /> <br /> <br />
											<label>入住天数</label><input type="text" value=<%=day%> disabled />
											<br /> <br />
											<label>房间价格</label><input type="text" value=<%=price%>
												disabled /> <br /> <br />
											<label>原来付款</label><input type="text" value=<%=temp%>
												disabled /> <br />
											<br /> <label>现在付款</label><input type="text"
												value=<%=money%> disabled /> <br />
											<div>
												<div style="float: left">
													<button type="submit" class="btn">修改</button>
												</div>
												<div style="float: left; margin-left: 97px">
													<button type="button" class="btn"
														onclick="javascript:window.location.href='Neworder.jsp';">取消</button>
												</div>
											</div>
										</fieldset>
									</form>
								</div>
								<div class="span4"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
		}
		}
	%>
</body>
</html>