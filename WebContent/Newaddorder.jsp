<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Infor.function"%>
<%@ page import="Infor.Time"%>
<%@ page import="Infor.database"%>
<%@ page import="Infor.RoomInfo"%>
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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="style.css" />
<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="time.js"></script>
<script type="text/javascript" src="laydate/laydate.js"></script>
<title>预定信息表</title>
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
			request.setCharacterEncoding("UTF-8");
			String enter = request.getParameter("entertime");
			String last = request.getParameter("lasttime");
			String type = request.getParameter("select1");
			String price = request.getParameter("select2");
			if (enter == null) {
				enter = (String) session.getAttribute("entertime");
				last = (String) session.getAttribute("lasttime");
				type = (String) session.getAttribute("type");
				price = (String) session.getAttribute("price");
			}
			Time time = new Time();
			String now = time.nowtime();
			int curpage = 1;
			if ((enter == "") || (last == "")) {
				out.print("输入有空项");
				response.setHeader("refresh", "1.5;URL=addorder.jsp");
			} else if (time.timejudge(enter, now) == -1) {
				out.print("入住时间在今天之前，错误");
				response.setHeader("refresh", "1.5;URL=addorder.jsp");
			} else if (enter.compareTo(last) >= 0) {
				out.print("退房日期小于或等于入住时间，错误");
				response.setHeader("refresh", "1.5;URL=addorder.jsp");
			} else {
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
					database db = new database();
							String[] range = price.split("~");
							ArrayList<RoomInfo> list = new ArrayList<RoomInfo>();
							list.addAll(db.searchroom(type, range));
							ArrayList<RoomInfo> room = new ArrayList<RoomInfo>();
							for (int i = 0; i < list.size(); i++) {
								if (time.judge(enter, last, list.get(i).getroomNum())) {
									room.add(list.get(i));
								}
							}
							if (room.isEmpty()) {
				%>
				<span>无满足条件房间!</span>
				<%
					db.close();
								response.setHeader("refresh", "1.5;URL=Neworder.jsp");
							} else {
								int size = room.size();
								int PAGESIZE = 6;
								int pagecount = (size % PAGESIZE == 0) ? (size / PAGESIZE) : (size / PAGESIZE + 1);
								String tmp = request.getParameter("curpage");
								if (tmp == null) {
									tmp = "1";
								}
								curpage = Integer.parseInt(tmp);
								if (curpage >= pagecount) {
									curpage = pagecount;
								}
								int count = 0;
								if (curpage == 0) {
				%>
				<span>已经是第一页</span>
				<%
					db.close();
				session.setAttribute("entertime", enter);
				session.setAttribute("lasttime", last);
				session.setAttribute("type", type);
				session.setAttribute("price", price);
									response.setHeader("refresh", "1.5;URL=Neworderroom.jsp");
								} else {
				%>
				<table class="table">
					<thead>
						<tr>
							<th>房间编号</th>
							<th>房间类型</th>
							<th>房间价格</th>
							<th>房间状态</th>
							<th>是否预订</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (int i = (curpage - 1) * PAGESIZE; i < room.size(); i++) {
												if (count >= PAGESIZE) {
													break;
												}
						%>
						<tr>
							<td>
								<%
									out.print(room.get(i).getroomNum());
								%>
							</td>
							<td>
								<%
									out.print(room.get(i).getroomType());
								%>
							</td>
							<td>
								<%
									out.print(room.get(i).getroomPrice());
								%>
							</td>
							<td>
								<%
									out.print(room.get(i).getroomState());
								%>
							</td>
							<td><a href="addorderroom.jsp?roomid=<%=room.get(i).getroomNum() %>&entertime=<%=enter %>&lasttime=<%=last %>">预订</a></td>
						</tr>
						<%
							count++;
											}
						%>
					</tbody>
				</table>
				<%
					db.close();
				%>
				<div class="pagination pagination-centered pagination-small">
					<ul>
						<li><a
							href="Newaddorder.jsp?curpage=1&entertime=<%=enter%>&lasttime=<%=last%>&select1=<%=type%>&select2=<%=price%>">首页</a></li>
						<li><a
							href="Newaddorder.jsp?curpage=<%=curpage - 1%>&entertime=<%=enter%>&lasttime=<%=last%>&select1=<%=type%>&select2=<%=price%>">上一页</a></li>
						<li><a
							href="Newaddorder.jsp?curpage=<%=curpage + 1%>&entertime=<%=enter%>&lasttime=<%=last%>&select1=<%=type%>&select2=<%=price%>">下一页</a></li>
						<li><a
							href="Newaddorder.jsp?curpage=<%=pagecount%>&entertime=<%=enter%>&lasttime=<%=last%>&select1=<%=type%>&select2=<%=price%>">尾页
						</a></li>
						<li><a>第<%=curpage%>页/共<%=pagecount%>页
						</a></li>
					</ul>
				</div>
				<%
					}
							}
				%>
			</div>
		</div>
	</div>
	<%
		}
		}
	%>

</body>
</html>