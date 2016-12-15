<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>超级管理员首页</title>
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
				<div class="carousel slide" id="carousel-51074">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-51074" class="active"></li>
						<li data-slide-to="1" data-target="#carousel-51074"></li>
						<li data-slide-to="2" data-target="#carousel-51074"></li>
						<li data-slide-to="3" data-target="#carousel-51074"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item">
							<img alt="" src="picture/one.jpg" />
							<div class="carousel-caption">
								<h4>单人间</h4>
								<p>
									单人间配置了电视、空调和独立卫浴，占地30平米，但很适合一个人居住，并且价格比较优惠，是一个价格公道，广受好评的房间</p>
							</div>
						</div>
						<div class="item active">
							<img alt="" src="picture/two.jpg" />
							<div class="carousel-caption">
								<h4>双人间</h4>
								<p>双人间本着简约明朗的风格，设备齐全，适合亲朋好友居住，价格公道，属于性价比极高的房</p>
							</div>
						</div>
						<div class="item">
							<img alt="" src="picture/three.jpg" />
							<div class="carousel-caption">
								<h4>三人间</h4>
								<p>三人间是酒店的一大特色，简约明朗，充满温馨，适合一家三口居住，广受好评</p>
							</div>
						</div>
						<div class="item">
							<img alt="" src="picture/four.jpg" />
							<div class="carousel-caption">
								<h4>会议室</h4>
								<p>会议室金碧辉煌，高端大气，而且布局优秀，保密性好，适合工程项目的会议讨论</p>
							</div>
						</div>
					</div>
					<a data-slide="prev" href="#carousel-51074"
						class="left carousel-control">‹</a> <a data-slide="next"
						href="#carousel-51074" class="right carousel-control">›</a>
				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>