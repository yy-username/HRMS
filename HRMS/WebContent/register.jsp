<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册表</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

<link rel="stylesheet" type="text/css" href="css/bootstrapValidator.css">
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<style type="text/css">
	.container{
		margin: 100px;
  		padding-left: 15px;
  		padding-right: 15px;
	}
	.div{
		margin-top: 30px;
	}
</style>


<script type="text/javascript">
	$(function () {
		$("#nickName").blur(function () {
			$("#spanNickName").text("");
			if ($(this).val() == null) {
				return;
			}
			$.ajax({
				url : "checkNickName",
				type : "post",
				dataType : "text",
				data : {
					nickName : $(this).val(),
				},
				success : function (data) {
					if (data == "true") {
						$("#spanNickName").text("用户名验证通过");
					}else{
						$("#spanNickName").text("用户名已存在，请重新输入");
					}
				}
			})
		});
	});
</script>


</head>
<body>
	<div class="container">
		<form class="form-horizontal" action="register" method="post" role="form" id="form">
			<div class="form-group">
    			<label class="col-sm-2 control-label">用户名</label>
    			<div class="col-sm-4">
      				<input type="text" name="nickName" id="nickName" class="form-control" placeholder="Username">
      				
    			</div>
    			<span id="spanNickName"></span>
  			</div>
  			<div class="form-group">
    			<label class="col-sm-2 control-label">密码</label>
    			<div class="col-sm-4">
      				<input type="password" name="password" class="form-control" placeholder="Password">
    			</div>
  			</div>
  			<div class="form-group">
    			<label class="col-sm-2 control-label">确认密码</label>
    			<div class="col-sm-4">
      				<input class="form-control" name="repassword" placeholder="Confirm Password">
    			</div>
  			</div>
  			<div class="form-group">
    			<label class="col-sm-2 control-label">Email</label>
    			<div class="col-sm-4">
      				<input type="email" name="email" class="form-control" placeholder="Email">
    			</div>
  			</div>
  			<div class="form-group">
    			<label class="col-sm-2 control-label">手机号</label>
    			<div class="col-sm-4">
      				<input type="text" name="moblie" class="form-control" placeholder="Mobile Phone">
    			</div>
  			</div>
  			<div class="form-group">
   		 		<div class="col-sm-offset-3 div">
      				<input type="submit" class="btn btn-default btn-warning" value="注册/Sign in"/>
    			</div>
  			</div>
		</form>
	</div>
</body>
</html>