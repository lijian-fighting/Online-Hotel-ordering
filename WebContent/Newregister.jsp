<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>管理员首页</title>
</head>
<body onload="time()">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					<div class="span4">
						<h4>
							<span id="info1"></span>
						</h4>
					</div>
					<div class="span4">
						<h1>酒店欢迎你</h1>
					</div>
					<div class="span4"></div>
				</div>
				<div class="row-fluid">
					<div class="span6">
						<div class="carousel slide" id="carousel-950014">
							<ol class="carousel-indicators">
								<li data-slide-to="0" data-target="#carousel-950014"></li>
								<li data-slide-to="1" data-target="#carousel-950014"></li>
								<li data-slide-to="2" data-target="#carousel-950014"></li>
							</ol>
							<div class="carousel-inner">
								<div class="item">
									<img alt="" src="picture/bg3.jpg" />
									<div class="carousel-caption">
										<h4>东五酒店</h4>
										<p>东五酒店坐落于苏州市东环路，靠近苏州商业中心，地理位置优越</p>
									</div>
								</div>
								<div class="item active left">
									<img alt="" src="picture/bg2.jpg" />
									<div class="carousel-caption">
										<h4>东五酒店</h4>
										<p>
											东五酒店坐落于苏州市东环路，靠近苏州商业中心，地理位置优越
										</p>
									</div>
								</div>
								<div class="item next left">
									<img alt="" src="picture/bg.jpeg" />
									<div class="carousel-caption">
										<h4>东五酒店</h4>
										<p>
											东五酒店坐落于苏州市东环路，靠近苏州商业中心，地理位置优越
										</p>
									</div>
								</div>
							</div>
							<a data-slide="prev" href="#carousel-950014"
								class="left carousel-control">‹</a> <a data-slide="next"
								href="#carousel-950014" class="right carousel-control">›</a>
						</div>
					</div>
					<div class="span6" style="background: #eee;height: 450px">
						<form class="form-inline" action="insert.jsp"
							style="margin-top: 50px; margin-left: 50px">
							<fieldset>
								<div style="margin-left: 110px;">
								<span style="font-size:20px;">用户注册表</span><br /><br/>
								</div>
								<label>用户姓名</label><input type="text" name="name" /> <br />
								<br /> 
								<label>用户年龄</label><input type="text" name="age" /> <br />
								<br />
								<label>用户电话</label><input type="text" name="phone" /> <br />
								<br />
								<label>住宅地址</label><input type="text" name="address" /> <br />
								<br />
								<label>身份证号</label><input type="text" name="identification" /> <br />
								<br />
								<label>登录密码</label><input type="text" name="passwd" /> <br />
								<br />
								<div>
									<div style="float: left">
										<button type="submit" class="btn">注册</button>
									</div>
									<div style="float: left; margin-left: 168px">
										<button type="reset" class="btn">重置</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>