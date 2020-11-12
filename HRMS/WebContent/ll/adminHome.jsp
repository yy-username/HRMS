<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员首页</title>
<script type="text/javascript" src="../js/jquery-1.11.2.js"></script>

<style type="text/css"></style>
<script type="text/javascript">
	
	$.ajax({
		url : "http://localhost:8888/cvsWeb/act.action",
		type : "post",
		dataType : "json",
		success : function (data) {
			if (data != null) {
				for(var i = 0; i < data.length; i++){
					var tr = "<div>"+
					"<p>"+data[i].deviceId+"</p>"+
					"<p>"+data[i].afcTime+"</p>"+
					"<p>"+data[i].card+"</p>"+
					"<p>"+data[i].flag+"</p>"+
					
				"</div>";
				$("#div").append(tr);
				}
				
			}
		}
	});
			
</script>
</head>
<body>
	
	<div id="div">
	</div>
	
</body>
</html>