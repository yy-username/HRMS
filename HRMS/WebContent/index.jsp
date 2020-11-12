<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script type="text/javascript" src="js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<style type="text/css">
	.container {
	  margin: 200px 200px;
	  padding-left: 15px;
	  padding-right: 15px;
	}
	.color{
		color:red;
	}
	.size{
		font-size: 1.1em;
		color:gray;
	}
	.div{
		margin-bottom: 30px;
	}
</style>

<script type="text/javascript">
	$(function () {
		
		$("#loginBtn").click(function () {
			var name = $("#nickName").val();
			var pwd = $("#pwd").val();
			if (name.trim() != "" && pwd.trim() != "") {
				$("#loginForm").submit();
			}else {
				
				var nextDiv = "<div>"+$("#hiden").val()+"</div>";
				$("#loginButton").append(nextDiv);
			}
		});
	});
	
</script>
</head>
<body>
	
	<div class="container">
		<form class="form-horizontal" id="loginForm" action="login" method="post">
			<div class="form-group div">
		    	<span class="col-sm-3 control-label size">登录</span>
		    	<span class="col-sm-3 control-label size">没有账号，请<a class="color" href="register.jsp">立即注册</a></span>
			</div>
			<div class="form-group">
		    	<label class="col-sm-2 control-label">用户名</label>
		    	<div class="col-sm-4">
		      		<input type="text" id="nickName" name="nickName" class="form-control" placeholder="Username">
				</div>
				<input type="hidden" id="hiden" value="${message}"/>
			</div>
		  	<div class="form-group">
		    	<label class="col-sm-2 control-label">密码</label>
		    	<div class="col-sm-4">
		      		<input type="password" id="pwd" name="password" class="form-control" placeholder="Password">
		    	</div>
		  	</div>
		  	<div class="form-group">
		    	<div class="col-sm-offset-2 col-sm-10">
		      		<div >
		      			<div class="row">
      						<div class="col-xs-6 col-sm-3">
        						<input type="checkbox"> 记住密码
      						</div>
      						<div class="col-xs-4 col-sm-3">
        						<a class="color">忘记密码</a>
      						</div>
    					</div>
		      		</div>
		    	</div>
		  	</div>
		  	<div class="form-group">
		    	<div class="col-sm-offset-2 col-sm-4" id="loginButton">
		      		<input type="button" id="loginBtn" class="form-control btn-warning" value="登录">
		    	</div>
		  	</div>
		</form>
	</div>
</body>
</html>