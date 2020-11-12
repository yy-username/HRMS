<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员首页</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script type="text/javascript" src="js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

<style type="text/css">
	.position{
		text-align: center;
		margin: 50px 150px;
		
	}
	div{text-align: center;
		margin: 100px 200px;}
	li{
		padding-right: 40px;
	}
	tr{height: 40px;}
	td{width: 250px;}
	#collapseExample{
		width: 800px;
	}
</style>
<script type="text/javascript">
	
	
		/* 添加部门 */
		$("#deptBtn").click(function () {
			if (confirm("确定保存该条信息吗？")) {
				$.ajax({
					url : "http://localhost:8888/cvsWeb/act",
					type : "post",
					dataType : "json",
					/* data : {
						deptName : $("input[name=deptName]").val(),
						deptIntroduction : $("input[name=deptIntroduction]").val()
					}, */
					success : function (data) {
						if (data != null) {
							var tr = "<tr>"+
										"<td>"+data.deviceId+"</td>"+
										"<td>"+data.afcTime+"</td>"+
										"<td>"+data.card+"</td>"+
										"<td>"+data.flag+"</td>"+
										"<td>"+
											"<input type='hidden' name='hidden' value='data.deptId'/>"+
											"<button type='button' class='check' data-toggle='modal' data-target='.bs-example-modal-lg-check'>查看</button>"+
											"<button type='button' class='modify' data-toggle='modal' data-target='.bs-example-modal-lg1'>修改</button>"+
											"<input type='button' class='delete' name='de1' id='de1' value='删除1'/>"+
										"</td>"+
									"</tr>";
							$("#deptTable").append(tr);
						}
					}
				});
			}
		});
</script>
</head>
<body>
	
	<!-- 部门详情 -->
	<div id="deptDetail">
		<form method="post">
			<!-- Large modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg2">添加部门</button>
			
			<div class="modal fade bs-example-modal-lg2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			  <div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content"><br/>
			       	<p>部门名称：<input type="text" name="deptName"/></p>
					<p>部门简介：<input type="text" name="deptIntroduction"/></p>
					<p>
						<input type="button" class="btn btn-default" id="deptBtn" data-dismiss="modal" value="保存"/>
						<input type="reset" class="btn btn-default" data-dismiss="modal" value="关闭"/>
					</p>
			    </div>
			  </div>
			</div>
			
			<table border="1" cellspacing="0" id="deptTable">
				<tr>
					<td>部门ID</td>
					<td>部门名称</td>
					<td>创建时间</td>
					<td>修改时间</td>
					<td>操作</td>
				</tr>
				<!-- 遍历现有的所有部门 -->
				<c:forEach items="${deptList}" var="dept1">
					<tr>
						<td>${dept1.deptId}</td>
						<td>${dept1.deptName}</td>
						<td>${dept1.createTime}</td>
						<td>${dept1.updateTime}</td>
						<td>
							<input type="hidden" name="hidden" value="${dept1.deptId}"/>
							<button type="button" class="check" data-toggle="modal" data-target=".bs-example-modal-lg-check">查看</button>
							<button type="button" class="modify" data-toggle="modal" data-target=".bs-example-modal-lg-dept">修改</button>		
							<input type="button" class="delete" name="de1" id="de1" value="删除"/>
						</td>
					</tr>
				</c:forEach>
				<div class="modal fade bs-example-modal-lg-dept" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
 					<div class="modal-dialog modal-lg" role="document">
   						<div class="modal-content"><br>
	  
   							<p>部门ID：<input id="id" name="deptId1" readonly="readonly"/></p>
  								<p>部门名称：<input id="name"  type="text" name="deptName1" /></p>
  								<p>部门简介：<input id="intro" type="text" name="deptIntroduction1"/></p>
  								<button  id="save" class="btn btn-default" data-dismiss="modal">保存</button>
  								<button id="close" class="btn btn-default" data-dismiss="modal">关闭</button>
	   						<br>
 						</div>
					</div>
				</div>
				<div class="modal fade bs-example-modal-lg-check" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
 					<div class="modal-dialog modal-lg" role="document">
   						<div class="modal-content"><br>
	  
   							<p>部门ID：<input id="id" name="deptId1" readonly="readonly" disabled="disabled"/></p>
  								<p>部门名称：<input id="name"  type="text" name="deptName1" readonly="readonly" disabled="disabled" /></p>
  								<p>部门简介：<input id="intro" type="text" name="deptIntroduction1" readonly="readonly" disabled="disabled"/></p> 
  								
  								<button id="close" class="btn btn-default" data-dismiss="modal">关闭</button>
	   						<br>
 						</div>
					</div>
				</div>
			</table>
		</form>
		<h4>备注：部门详情表</h4>
	</div>
	
</body>
</html>