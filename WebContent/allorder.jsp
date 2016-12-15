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
		if (!flag.equals("1")) {
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
						ArrayList<TradeInfo> list = new ArrayList<TradeInfo>();
						list.addAll(db.allorder());
						int size = list.size();
						int PAGESIZE = 10;
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
				<span class="changfont">没有订单!</span>
				<%
					db.close();
							response.setHeader("refresh", "1.5;URL=Newwork.jsp");
						} else {
							int count = 0;
							if (curpage == 0) {
				%>
				<span class="changfont">已经是第一页</span>
				<%
					db.close();
								response.setHeader("refresh", "1.5;URL=allorder.jsp");
							} else {
				%>
				<table class="table">
					<thead>
						<tr>
							<th>房间编号</th>
							<th>房间类型</th>
							<th>入住时间</th>
							<th>退房时间</th>
							<th>入住天数</th>
							<th>房间价格</th>
							<th>总共价格</th>
							<th>房间租户</th>
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
									out.print(list.get(i).getroom_num());
								%>
							</td>
							<%
								String type = db.type(list.get(i).getroom_num());
							%>
							<td>
								<%
									out.print(type);
								%>
							</td>
							<td>
								<%
									out.print(list.get(i).getentertime());
								%>
							</td>
							<td>
								<%
									out.print(list.get(i).getlasttime());
								%>
							</td>
							<td>
								<%
									out.print(list.get(i).getday());
								%>
							</td>
							<td>
								<%
									out.print(list.get(i).getprice());
								%>
							</td>
							<td>
								<%
									out.print(list.get(i).getpay());
								%>
							</td>
							<td>
								<%
									out.print(list.get(i).getusername());
								%>
							</td>
							<td><a
								href="ad_changeorder.jsp?roomid=<%=list.get(i).getroom_num()%>&entertime=<%=list.get(i).getentertime()%>&lasttime=<%=list.get(i).getlasttime()%>&type=<%=type%>&price=<%=list.get(i).getprice() %>">修改</a>
								<a
								href="deleteorder.jsp?roomnum=<%=list.get(i).getroom_num()%>&entertime=<%=list.get(i).getentertime()%>&money=<%=list.get(i).getpay()%>">删除</a>
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
						<li><a href="allorder.jsp?curpage=1">首页</a></li>
						<li><a href="allorder.jsp?curpage=<%=curpage - 1%>">上一页</a></li>
						<li><a href="allorder.jsp?curpage=<%=curpage + 1%>">下一页</a></li>
						<li><a href="allorder.jsp?curpage=<%=pagecount%>">尾页 </a></li>
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