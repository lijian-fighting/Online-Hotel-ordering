<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Infor.RoomInfo"%>
<%@ page import="Infor.database"%>
<%@ page import="Infor.UserInfo"%>
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
<title>预定界面</title>
</head>
<body>
	<%
		String value = (String) session.getAttribute("user");
		function f = new function();
		String flag = f.judge(value);
		if (!flag.equals("0")) {
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
							<a class="brand">东五酒店</a>
							<div class="nav-collapse collapse navbar-responsive-collapse">
								<ul class="nav">
									<li class="active"><a href="Newroom.jsp">首页</a></li>
									<li class="dropdown"><a class="dropdown-toggle"
										data-toggle="dropdown">个人中心</a>
										<ul class="dropdown-menu">
											<li><a href="Newuserinfo.jsp">用户信息</a></li>
											<li><a href="myroom.jsp">订单信息</a></li>
										</ul></li>
									<li class="dropdown"><a class="dropdown-toggle"
										data-toggle="dropdown">酒店预订</a>
										<ul class="dropdown-menu">
											<li><a href="Neworder.jsp">房间预订</a></li>
											<li><a href="Newdisorder.jsp">房间退订</a></li>
										</ul></li>
									<li><a href="Newroom.jsp">关于我们</a></li>
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
				<div>
					<form action="searchroom.jsp">
						<fieldset>
							<div>
								<div style="float: left">
									<span>房间类型:</span> <select id="select1" name="select1">
										<option id="单人间">单人间</option>
										<option id="双人间">双人间</option>
										<option id="三人间">三人间</option>
										<option id="会议室">会议室</option>
										<option id="所有房间">所有房间</option>
									</select>
								</div>
								<div style="float: left; margin-left: 20px">
									<span>房间价格:</span> <select id="select2" name="select2">
										<option id="0~100" value="0~100">100以内</option>
										<option id="101~300" value="101~300">101到300</option>
										<option id="301~" value="300~">300以上</option>
										<option id="所有价位" value="~">所有价位</option>
									</select>
								</div>
								<div style="float: left; margin-left: 10px">
									<button type="submit" class="btn">搜索</button>
								</div>

							</div>
						</fieldset>
					</form>
				</div>
				<%
					database db = new database();
						ArrayList<RoomInfo> list = new ArrayList<RoomInfo>();
						list.addAll(db.freeroom());
						int size = list.size();
						int PAGESIZE = 6;
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
				<span class="changfont">无空闲房间!</span>
				<%
					db.close();
							response.setHeader("refresh", "1.5;URL=Newroom.jsp");
						} else {
							int count = 0;
							if (curpage == 0) {
				%>
				<span class="changfont">已经是第一页</span>
				<%
					db.close();
								response.setHeader("refresh", "1.5;URL=Neworder.jsp");
							} else {
				%>
				<table class="table">
					<thead>
						<tr>
							<th>房间编号</th>
							<th>房间类型</th>
							<th>房间价格</th>
							<th>房间状态</th>
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
						<li><a href="search.jsp?curpage=1">首页</a></li>
						<li><a href="search.jsp?curpage=<%=curpage - 1%>">上一页</a></li>
						<li><a href="search.jsp?curpage=<%=curpage + 1%>">下一页</a></li>
						<li><a href="search.jsp?curpage=<%=pagecount%>">尾页 </a></li>
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