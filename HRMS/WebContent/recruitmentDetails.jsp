<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>招聘详情</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<style type="text/css">
	#recruitDetial{margin: 100px 200px;text-align: center;}
	.font{font-size: 1.2em;}
</style>
<script type="text/javascript">
	$(function () {
		$("#div").on("click", ".submit", function () {
			var s = $(this);
			var info = ${recruitmentInfo.recruitmentId};
			alert(s.prev().prev().val())
			alert(info)
			$.ajax({
				url : "submitResume",
				type : "post",
				dataType : "text",
				data : {
					resumeId : s.prev().prev().val(),
					recruitmentId : info
				},
				success : function (data) {
					if (data == "true") {
						alert("简历投递成功");
					}else {
						alert("简历投递失败");
					}
				}
			});
		});
	})
</script>
</head>
<body>
	<div id="recruitDetial">职位详情
		<div>
			<span>${recruitmentInfo.recruitmentTitle}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;v
			<span>${recruitmentInfo.salaryRange}</span>
		</div>
		<div>
			${recruitmentInfo.jobRequirement}
		</div><hr/>
		<div>
			${recruitmentInfo.companyArea}
		</div><hr/>
		<div>
			${recruitmentInfo.companyName}
			${recruitmentInfo.companySize}
		</div>
		<div>
			${recruitmentInfo.companyIntroduction}
		</div><hr/>
		<div>
			${recruitmentInfo.recruitmentContent}
		</div><hr/>
		<div>
			${recruitmentInfo.welfareTreatment}
		</div>
		<div>
			<!-- Small modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">申请职位</button>
			
			<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content font">

			    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			    	<br/>
			    	请选择相匹配的简历
			    	<br/>
			    	<div id="div">
			    		<c:forEach items="${resumeList}" var="resume">
			    	
			    			<div style="text-align: left; padding-left: 50px;">
			    				<input type="hidden" name="resumeId" value="${resume.resumeId}"/>
			    				${resume.resumeId}：<input type="radio" name="title" />${resume.jobIntension}
			    				<input type="button" class="submit" value="提交"/>
			    				<input type="button" data-dismiss="modal" aria-label="Close" aria-hidden="true" value="关闭"/>
			    			</div><br/>
			    		</c:forEach>
			    	</div><br/>
			    </div>
			  </div>
			</div>
		</div>
	</div>
</body>
</html>