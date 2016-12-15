<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Infor.RoomInfo"%>
<%@ page import="Infor.database"%>
<%@ page import="Infor.UserInfo"%>
<%@ page import="Infor.money"%>
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

<title>营业额界面</title>
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
						ArrayList<money> list = new ArrayList<money>();
						list.addAll(db.profit());
						if (list.isEmpty()) {
				%>
				<span class="changfont">查找失败！</span>
				<%
					db.close();
							response.setHeader("refresh", "1.5;URL=Newsuper.jsp");
						} else {
				%>
				<table class="table">
					<thead>
						<tr>
							<th>一月份</th>
							<th>二月份</th>
							<th>三月份</th>
							<th>四月份</th>
							<th>五月份</th>
							<th>六月份</th>
							<th>七月份</th>
							<th>八月份</th>
							<th>九月份</th>
							<th>十月份</th>
							<th>十一月份</th>
							<th>十二月份</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<%
									out.print(db.sale("01"));
								%>
							</td>
							<td>
								<%
									out.print(db.sale("02"));
								%>
							</td>
							<td>
								<%
									out.print(db.sale("03"));
								%>
							</td>
							<td>
								<%
									out.print(db.sale("04"));
								%>
							</td>
							<td>
								<%
									out.print(db.sale("05"));
								%>
							</td>
							<td>
								<%
									out.print(db.sale("06"));
								%>
							</td>
							<td>
								<%
									out.print(db.sale("07"));
								%>
							</td>
							<td>
								<%
									out.print(db.sale("08"));
								%>
							</td>
							<td>
								<%
									out.print(db.sale("09"));
								%>
							</td>
							<td>
								<%
									out.print(db.sale("10"));
								%>
							</td>
							<td>
								<%
									out.print(db.sale("11"));
								%>
							</td>
							<td>
								<%
									out.print(db.sale("12"));
								%>
							</td>
						</tr>
					</tbody>
				</table>
				<%
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