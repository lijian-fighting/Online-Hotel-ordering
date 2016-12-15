<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="laydate/laydate.js"></script>
<title>预定信息表</title>
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
			request.setCharacterEncoding("UTF-8");
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
											<li><a href="search.jsp">房间检索</a></li>
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
				<div class="container-fluid">
					<div class="row-fluid">
						<div class="span12">
							<div class="row-fluid">
								<div class="span4"></div>
								<div class="span4">
									<form class="form-inline" action="Neworderroom.jsp">
										<fieldset>
											<label>房间类型</label>
												<select id="select1" name="select1">
													<option id="单人间">单人间</option>
													<option id="双人间">双人间</option>
													<option id="三人间">三人间</option>
													<option id="会议室">会议室</option>
													<option id="所有房间">所有房间</option>
									</select> <br /> <br /> 
									<label>房间价格</label>
									<select id="select2" name="select2">
										<option id="0~100" value="0~100">100以内</option>
										<option id="101~300" value="101~300">101到300</option>
										<option id="301~" value="300~">300以上</option>
										<option id="所有价位" value="~">所有价位</option>
									</select>
									<br />
									<br />
									<label>入住时间</label><input
												type="text" onclick="laydate()" name="entertime" /> <br />
											<br /> <label>退房时间</label><input type="text" id="demo"
												name="lasttime" /> <br />
											<div>
												<div style="float: left">
													<button type="submit" class="btn">搜索</button>
												</div>
												<div style="float: left; margin-left: 113px">
													<button type="reset" class="btn">重置</button>
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
	%>
	<script>
		;
		!function() {
			laydate({
				elem : '#demo'
			})
		}();
	</script>
</body>
</html>
<div style="display: none">
	<script type="text/javascript">
		var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://"
				: " http://");
		document
				.write(unescape("%3Cscript src='"
						+ _bdhmProtocol
						+ "hm.baidu.com/h.js%3F6f798e51a1cd93937ee8293eece39b1a' type='text/javascript'%3E%3C/script%3E"));
	</script>
	<script type="text/javascript">
		var cnzz_protocol = (("https:" == document.location.protocol) ? " https://"
				: " http://");
		document
				.write(unescape("%3Cspan id='cnzz_stat_icon_5718743'%3E%3C/span%3E%3Cscript src='"
						+ cnzz_protocol
						+ "s9.cnzz.com/stat.php%3Fid%3D5718743%26show%3Dpic2' type='text/javascript'%3E%3C/script%3E"));
	</script>
</div>