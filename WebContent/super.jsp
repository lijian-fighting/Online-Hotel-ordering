<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录表</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="time.js">
</script>
</head>

<body onload="time()" class="loginbody">
<div class="mid">
	<span class="timefont" id="info1"></span>
</div>

<div class="mid">
	<span class="hotelfont">东五大酒店欢迎您</span>
</div>

<form action=s_adminlogin.jsp class="formstyle">
<span class="titlefont">超级管理员登录</span>
<br>
<br>
<table>
	<tr>
		<td align="left">
			<span class="wordfont">admin:</span>
		</td>
		<td align="right">
			<input name="s_adminid" type="text"  size="20" maxlength="20">
		</td>
	</tr>
	<tr>
		<td align="left">
			<span class="wordfont">password:</span>
		</td>
		<td align="right">
			<input name="s_adminpasswd" type="text" size="20" maxlength="20">
		</td>
	</tr>
	<tr>
		<td align="left">
			<input name="button1" class="buttonfont" type="submit" value="登录">
		</td>
		<td align="right">
			<input name="button2" class="buttonfont" type="reset" value="重置">
		</td>
	</tr>
</table>
</form>
</body>
</html>