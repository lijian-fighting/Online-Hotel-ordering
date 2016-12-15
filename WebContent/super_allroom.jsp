<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Infor.RoomInfo"%>
<%@ page import="Infor.database"%>
<%@ page import="Infor.UserInfo"%>
<%@ page import="Infor.TradeInfo"%>
<%@ page import="Infor.function"%>
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
<title>订单增加</title>
</head>
<body>
	<%
		String value = (String) session.getAttribute("user");
		function f = new function();
		String flag = f.judge(value);
		if (!flag.equals("2")) {
			out.print("显示错误");
			response.setHeader("refresh", "1.5;URL=login.jsp");
		} else {
			int curpage = 1;
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
							<a class="brand">超级管理员</a>
							<div class="nav-collapse collapse navbar-responsive-collapse">
								<ul class="nav">
									<li class="active"><a href="Newsuper.jsp">首页</a></li>
									<li class="dropdown"><a class="dropdown-toggle"
										data-toggle="dropdown">管理员信息</a>
										<ul class="dropdown-menu">
											<li><a href="addadmin.jsp">新增管理员</a></li>
											<li><a href="alladmin.jsp">所有管理员</a></li>
										</ul></li>
									<li class="dropdown"><a class="dropdown-toggle"
										data-toggle="dropdown">房间管理</a>
										<ul class="dropdown-menu">
											<li><a href="super_addroom.jsp">新增房间</a></li>
											<li><a href="super_allroom.jsp">查看房间</a></li>
										</ul></li>
									<li><a href="profit.jsp">查看营业额</a></li>
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
						ArrayList<RoomInfo> list = new ArrayList<RoomInfo>();
						list.addAll(db.allroom());
						int size = list.size();
						int PAGESIZE = 7;
						int pagecount = (size % PAGESIZE == 0) ? (size / PAGESIZE) : (size / PAGESIZE + 1);
						String tmp = request.getParameter("curpage");
						if (tmp == null) {
							tmp = "1";
						}
						curpage = Integer.parseInt(tmp);
						if (curpage >= pagecount)
							curpage = pagecount;
						if (list.isEmpty()) {
				%>
				<span class="changfont">无任何房间!</span>
				<%
					db.close();
							response.setHeader("refresh", "1.5;URL=Newsuper.jsp");
						} else {
							int count = 0;
							if (curpage == 0) {
				%>
				<span class="changfont">已经是第一页</span>
				<%
					db.close();
								response.setHeader("refresh", "1.5;URL=super_allroom.jsp");
							} else {
				%>
				<table class="table">
					<thead>
						<tr>
							<th>房间编号</th>
							<th>房间类型</th>
							<th>房间价格</th>
							<th>房间状态</th>
							<th>租户</th>
							<th>修改删除</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (int i = (curpage - 1) * PAGESIZE; i < list.size(); i++) {
											if (count >= PAGESIZE)
												break;
						%>
						<tr>
							<td>
								<%
									out.print(list.get(i).getroomNum());
								%>
							</td>
							<td>
								<%
									out.print(list.get(i).getroomType());
								%>
							</td>
							<td>
								<%
									out.print(list.get(i).getroomPrice());
								%>
							</td>
							<td>
								<%
									out.print(list.get(i).getroomState());
								%>
							</td>
							<%
								String user = null;
												if ((list.get(i).getroomState().equals("空闲"))
														|| (list.get(i).getroomState().equals("维修"))) {
													user = "无";
												} else {
													user = db.room_user(list.get(i).getroomNum());
												}
							%>
							<td>
								<%
									out.print(user);
								%>
							</td>
							<td><a
								href="super_changeroom.jsp?roomid=<%=list.get(i).getroomNum()%>">修改</a>
								<a href="super_delete.jsp?roomid=<%=list.get(i).getroomNum()%>">删除</a>
							</td>
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
						<li><a href="super_allroom.jsp?curpage=1">首页</a></li>
						<li><a href="super_allroom.jsp?curpage=<%=curpage - 1%>">上一页</a></li>
						<li><a href="super_allroom.jsp?curpage=<%=curpage + 1%>">下一页</a></li>
						<li><a href="super_allroom.jsp?curpage=<%=pagecount%>">尾页
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
	%>
</body>
</html>