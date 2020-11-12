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
	
	$(function () {
		$("#positionDetail").hide();
		$("#employeeDetail").hide();
		$("#attendanceDetail").hide();
		$("#fineDetail").hide();
		$("#salaryDetail").hide();
		$("#trainDetail").hide();
		$("#recruitmentDetail").hide();
		$("#resumeDetail").hide();
		$("#pd").click(function () {
			$("#deptDetail").hide();
			$("#positionDetail").show();
			$("#employeeDetail").hide();
			$("#attendanceDetail").hide();
			$("#fineDetail").hide();
			$("#salaryDetail").hide();
			$("#trainDetail").hide();
			$("#recruitmentDetail").hide();
			$("#resumeDetail").hide();
		});
		$("#ed").click(function () {
			$("#deptDetail").hide();
			$("#positionDetail").hide();
			$("#employeeDetail").show();
			$("#attendanceDetail").hide();
			$("#fineDetail").hide();
			$("#salaryDetail").hide();
			$("#trainDetail").hide();
			$("#recruitmentDetail").hide();
			$("#resumeDetail").hide();
		});
		$("#ad").click(function () {
			$("#deptDetail").hide();
			$("#positionDetail").hide();
			$("#employeeDetail").hide();
			$("#attendanceDetail").show();
			$("#fineDetail").hide();
			$("#salaryDetail").hide();
			$("#trainDetail").hide();
			$("#recruitmentDetail").hide();
			$("#resumeDetail").hide();
		});
		$("#fd").click(function () {
			$("#deptDetail").hide();
			$("#positionDetail").hide();
			$("#employeeDetail").hide();
			$("#attendanceDetail").hide();
			$("#fineDetail").show();
			$("#salaryDetail").hide();
			$("#trainDetail").hide();
			$("#recruitmentDetail").hide();
			$("#resumeDetail").hide();
		});
		$("#sd").click(function () {
			$("#deptDetail").hide();
			$("#positionDetail").hide();
			$("#employeeDetail").hide();
			$("#attendanceDetail").hide();
			$("#fineDetail").hide();
			$("#salaryDetail").show();
			$("#trainDetail").hide();
			$("#recruitmentDetail").hide();
			$("#resumeDetail").hide();
		});
		$("#td").click(function () {
			$("#deptDetail").hide();
			$("#positionDetail").hide();
			$("#employeeDetail").hide();
			$("#attendanceDetail").hide();
			$("#fineDetail").hide();
			$("#salaryDetail").hide();
			$("#trainDetail").show();
			$("#recruitmentDetail").hide();
			$("#resumeDetail").hide();
		});
		$("#rd").click(function () {
			$("#deptDetail").hide();
			$("#positionDetail").hide();
			$("#employeeDetail").hide();
			$("#attendanceDetail").hide();
			$("#fineDetail").hide();
			$("#salaryDetail").hide();
			$("#trainDetail").hide();
			$("#recruitmentDetail").show();
			$("#resumeDetail").hide();
		});
		$("#dd").click(function () {
			$("#deptDetail").show();
			$("#positionDetail").hide();
			$("#employeeDetail").hide();
			$("#attendanceDetail").hide();
			$("#fineDetail").hide();
			$("#salaryDetail").hide();
			$("#trainDetail").hide();
			$("#recruitmentDetail").hide();
			$("#resumeDetail").hide();
		});
		$("#rsd").click(function () {
			$("#deptDetail").hide();
			$("#positionDetail").hide();
			$("#employeeDetail").hide();
			$("#attendanceDetail").hide();
			$("#fineDetail").hide();
			$("#salaryDetail").hide();
			$("#trainDetail").hide();
			$("#recruitmentDetail").hide();
			$("#resumeDetail").show();
		});
		/* 添加部门 */
		$("#deptBtn").click(function () {
			if (confirm("确定保存该条信息吗？")) {
				$.ajax({
					url : "saveDept",
					type : "post",
					dataType : "json",
					data : {
						deptName : $("input[name=deptName]").val(),
						deptIntroduction : $("input[name=deptIntroduction]").val()
					},
					success : function (data) {
						if (data != null) {
							var tr = "<tr>"+
										"<td>"+data.deptId+"</td>"+
										"<td>"+data.deptName+"</td>"+
										"<td>"+data.createTime+"</td>"+
										"<td>"+data.updateTime+"</td>"+
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
		
		/* 修改部门 */
		$("#deptTable").on("click", ".modify", function () {
			var d=$(this);
			$.ajax({
				url : "checkDept",
				type : "post",
				dataType : "json",
				data : {
					deptId : d.parent().children().eq(0).val()
				},
				success : function (data) {
				 	$("input[name=deptId1]").val(data.deptId);
					$("input[name=deptName1]").val(data.deptName);
					$("input[name=deptIntroduction1]").val(data.deptIntroduction);
				}
			});
		})
		$("#save").click(function () {
			if (confirm("请确定是否保存？")) {
				$.ajax({
					url : "modifyDept.action",
					type : "post",
					dataType : "json",
					data : {
						deptId : $("input[name=deptId1]").val(), 
						deptName : $("input[name=deptName1]").val(),
						deptIntroduction : $("input[name=deptIntroduction1]").val()
					},
					success : function (data) {
						if (data == "true") {
							alert("修改成功，请刷新页面查看");
						}else {
							alert("该部门有员工不可修改");
						}
					}
				});
			}
		})
		
		
		/* 删除部门 */
		$("#deptTable").on("click", ".delete", function () {
			if (confirm("确定删除该条记录吗？")) {
				var de = $(this)
				$.ajax({
					url : "deleteDept",
					type : "post",
					dataType : "text",
					data : {
						deptId : de.parent().children().eq(0).val(),
						
					},
					success : function (data) {
						if (data == "true") {
							de.parent().parent().remove();
						}else {
							alert("删除失败！！请先删除该部门的所有员工")
						}
					}
				});
			}
		})
		
		/* 查看部门 */
		$("#deptTable").on("click", ".check", function () {
			var d=$(this);
			$.ajax({
				url : "checkDept",
				type : "post",
				dataType : "json",
				data : {
					deptId : d.parent().children().eq(0).val()
				},
				success : function (data) {
				 	$("input[name=deptId1]").val(data.deptId);
					$("input[name=deptName1]").val(data.deptName);
					$("input[name=deptIntroduction1]").val(data.deptIntroduction);
				}
			});
		})
		
		/* 添加职位 */
		$("#positionBtn").click(function () {
			if (confirm("确定添加该条信息?")) {
				$.ajax({
					url : "addPosition",
					type : "post",
					dataType : "json",
					data : {
						positionName : $("input[name='positionName']").val()
					},
					success : function (data) {
						if (data != null) {
							var tr = "<tr>"+
										"<td>"+data.positionId+"</td>"+
										"<td>"+data.positionName+"</td>"+
										"<td>"+data.createTime+"</td>"+
										"<td>"+
											"<button type='button' class='modifyPosition' data-toggle='modal' data-target='.bs-example-modal-lg-checkP'>查看</button>"+
											"<input type='button' value='修改'/>"+
											"<input type='button' class='position' value='删除'/>"+
										"</td>"+
									"</tr>";
							$("#positionTable").append(tr);
						}
					}
				});
			}
		})
		
		
		/* 删除职位 */
		$("#positionTable").on("click", ".position", function () {
			if (confirm("确定删除该职位？")) {
				var p = $(this)
				$.ajax({
					url : "deletePosition",
					type : "post",
					dataType : "text",
					data : {
						positionId : p.parent().parent().children().eq(0).text()
					},
					success : function (data) {
						if (data == "true") {
							p.parent().parent().remove();
						}else {
							alert("删除失败！！请先删除该职位的所有员工")
						}
					}
				});
			}
		})
		
		/* 修改职位信息 */
		$("#positionTable").on("click", ".modifyPosition", function () {
			var mdp = $(this)
			$.ajax({
				url : "checkPositionById",
				type : "post",
				dataType : "json",
				data : {
					positionId : mdp.parent().parent().children().eq(0).text()
				},
				success : function (data) {
					if (data != null) {
						
						$("input[name=positionNameMd]").val(data.positionName);
						$("input[name=positionIdMd]").val(data.positionId);
					}
				}
			})
		})
		
		$("#modifyBtn").click(function () {
			$.ajax({
				url : "modifyPosition.action",
				type : "post",
				dataType : "json",
				data : {
					positionId : $("input[name=positionIdMd]").val(),
					positionName : $("input[name=positionNameMd]").val()
				},
				success : function (data) {
					if (data != null) {
						alert("修改成功，请刷新查看！")
						$("input[class=modifyPosition]").parent().parent().children().eq(1).text(data.positionName);
					}else{
						alert("该职位有员工，请先删除员工！！");
					}
				}
			});
		})
		
		
		
		/* 添加员工 */
		$("#submit").click(function () {
			if (confirm("确定添加该员工信息？")) {
				
				$.ajax({
					url : "addEmployee",
					type : "post",
					dataType : "json",
					data : {
						nickName : $("input[name=nickName]").val(),
						userName : $("input[name=userName]").val(),
						deptName : $("select[name=deptName]").val(),
						positionName : $("select[name=positionName]").val()
					},
					success : function (data) {
						var tr = "<tr>"+
									"<td>"+data.userId+"</td>"+
									"<td>"+data.userName+"</td>"+
									"<td>"+data.deptId+"</td>"+
									"<td>"+data.positionId+"</td>"+
									"<td>"+
										"<button type='button' class='checkEmployee' data-toggle='modal' data-target='.bs-example-modal-lg-checkEmpl'>查看</button>"+
										"<button type='button' class='modifyEmployee' data-toggle='modal' data-target='.bs-example-modal-lg-modifyEmpl'>修改</button>"+
										"<input type='button' class='deleteEmployee' value='删除'/>"+
									"</td>"+
								"</tr>";
						$("#userTable").append(tr);
					}
				});
			}
		})
		
		
		/* 删除员工 */
		$("#userTable").on("click", ".deleteEmployee", function () {
			var de = $(this)
			if (confirm("确认删除该员工信息？")) {
				$.ajax({
					url : "deleEmployee",
					type : "post",
					dataType : "text",
					data : {
						userId : de.parent().parent().children().eq(0).text()
					},
					success : function (data) {
						if (data == "true") {
							de.parent().parent().remove();
						}
					}
				});
			}
		})
		
		/* 人员查看 */
		$("#userTable").on("click", ".checkEmployee", function () {
			var cp = $(this)
			if (confirm("查看")) {
				$.ajax({
					url : "checkEmployee.action",
					type : "post",
					dataType : "json",
					data : {
						userId : cp.parent().parent().children().eq(0).text()
					},
					success : function (data) {
						if (data != null) {
							$("input[name=userId]").val(data.userId);
							$("input[name=nickName]").val(data.nickName);
							$("input[name=userName]").val(data.userName);
							$("input[name=deptId]").val(data.deptId);
							$("input[name=deptName]").val(data.dept.deptName);
							$("input[name=positionId]").val(data.positionId);
							$("input[name=positionName]").val(data.position.positionName);
						}
					}
				})
			}
			
		})
		
		
		/* 人员修改 */
		$("#userTable").on("click", ".modifyEmployee", function () {
			var cp = $(this)
			$.ajax({
				url : "checkEmployee.action",
				type : "post",
				dataType : "json",
				data : {
					userId : cp.parent().parent().children().eq(0).text()
				},
				success : function (data) {
					if (data != null) {
						$("input[name=userIdMd]").val(data.userId),
						$("input[name=nickNameMd]").val(data.nickName),
						$("input[name=userNameMd]").val(data.userName),
						$("select[name=deptNameMd]").val(data.dept.deptName),
						$("select[name=positionNameMd]").val(data.position.positionName)
					}
				}
			})
		})
		
		$("#saveEmplMd").click(function () {
			$.ajax({
				url : "modifyEmpl.action",
				type : "post",
				dataType : "text",
				data : {
					userId : $("input[name=userIdMd]").val(),
					nickName : $("input[name=nickNameMd]").val(),
					userName : $("input[name=userNameMd]").val(),
					deptName : $("select[name=deptNameMd]").val(),
					positionName : $("select[name=positionNameMd]").val()
				},
				success : function (data) {
					if (data == "true") {
						alert("修改成功，请刷新页面查看！");
					}else {
						alert("修改失败");
					}
				}
			})
		})
		
		/* 添加招聘信息 */
		$("#publishInformation").click(function () {
			if (confirm("确认保存该条信息吗？")) {
				$.ajax({
					url : "saveRecruitment",
					type : "post",
					dataType : "json",
					data : {
						recruitmentTitle : $("input[name=recruitmentTitle]").val(),
						salaryRange : $("input[name=salaryRange]").val(),
						jobRequirement : $("input[name=jobRequirement]").val(),
						companyName : $("input[name=companyName]").val(),
						companyState : $("input[name=companyState]").val(),
						companyArea : $("input[name=companyArea]").val(),
						companyIntroduction : $("input[name=companyIntroduction]").val(),
						recruitmentContent : $("textarea[name=recruitmentContent]").val(),
						welfareTreatment : $("input[name=welfareTreatment]").val(),
					},
					success : function (data) {
						
						if (data != null) {
							var tr = $("<tr>"+
										"<td>"+data.recruitmentTitle+"</td>"+
										"<td>"+data.recruitmentTime+"</td>"+
										"<td>"+data.releaseTime+"</td>"+
										"<td>"+data.updateTime+"</td>"+
										"<td>"+
											"<input type='hidden' value='"+data.recruitmentId+"'/>"+
											
											"<input type='button' name='release' class='isRelease' value='发布'/>"+
											"<button type='button' name='mdf' class='mdf' data-toggle='modal' data-target='.bs-example-modal-lg-mdf'>修改</button>"+
											"<br>"+
											"<input type='button' name='checkRecruitment' value='查看' class='checkRecruitment' data-toggle='modal' data-target='.bs-example-modal-lg-checkRecruitment'/>"+
											"<input type='button' name='delete' class='isDelete' value='删除'/>"+
										"</td>"+
									"</tr>");
							$("#recruitmentTable").append(tr);
						}
					}
				});
			}
		});
		
		/* 发布招聘信息 */
		$("#recruitmentTable").on("click",".isRelease",function () {
			var a=$(this)
			if (confirm("发布后不可修改，确认发布？")) {
				$.ajax({
					url : "releaseInfo.action",
					type : "post",
					dataType : "text",
					data : {
						recruitId : a.parent().children().eq(0).val(),
					},
					success : function (data) {
						if (data == "true") {
							a.val("已发布");
							a.next().text("不可修改");
							a.attr('disabled', true);
							a.next().attr('disabled', true);
						}
					}
				});
				
			}
		});
		 
		/* 删除招聘信息 */
		
		$("#recruitmentTable").on("click",".isDelete",function () {
			var a=$(this);
			if (confirm("确认删除该条信息？")) {
				$.ajax({
					url : "deleteInfo",
					type : "post",
					dataType : "text",
					data : {
						recruitmentId : a.parent().children().eq(0).val()
					},
					success : function (data) {
						if (data == "true") {
							a.parent().parent().remove();
						}
					}
				});
			}
			
		});
		
		/* 查看招聘信息 */
		$("#recruitmentTable").on("click",".checkRecruitment",function () {
			var cr = $(this)
			$.ajax({
				url : "checkRecruitment.action",
				type : "post",
				dataType : "json",
				data : {
					recruitmentId : cr.parent().children().eq(0).val()
				},
				success : function (data) {
					if (data != null) {
						$("input[name=recruitmentId]").val(data.recruitmentId),
						$("input[name=recruitmentTitle]").val(data.recruitmentTitle),
						$("input[name=salaryRange]").val(data.salaryRange),
						$("input[name=jobRequirement]").val(data.jobRequirement),
						$("input[name=companyName]").val(data.companyName),
						$("input[name=companyState]").val(data.companyState),
						$("input[name=companyArea]").val(data.companyArea),
						$("input[name=companyIntroduction]").val(data.companyIntroduction),
						$("textarea[name=recruitmentContent]").val(data.recruitmentContent),
						$("input[name=welfareTreatment]").val(data.welfareTreatment)
					}
				}
			})
		})
		/* 修改招聘信息 */
		$("#recruitmentTable").on("click",".mdf",function () {
			var mdf = $(this)
			$.ajax({
				url : "checkRecruitment.action",
				type : "post",
				dataType : "json",
				data : {
					recruitmentId : mdf.parent().children().eq(0).val()
				},
				success : function (data) {
					if (data != null) {
						$("input[name=recruitmentIdMdf]").val(data.recruitmentId),
						$("input[name=recruitmentTitleMdf]").val(data.recruitmentTitle),
						$("input[name=salaryRangeMdf]").val(data.salaryRange),
						$("input[name=jobRequirementMdf]").val(data.jobRequirement),
						$("input[name=companyNameMdf]").val(data.companyName),
						$("input[name=companyStateMdf]").val(data.companyState),
						$("input[name=companyAreaMdf]").val(data.companyArea),
						$("input[name=companyIntroductionMdf]").val(data.companyIntroduction),
						$("textarea[name=recruitmentContentMdf]").val(data.recruitmentContent),
						$("input[name=welfareTreatmentMdf]").val(data.welfareTreatment)
					}
				}
			})
		})
		
		$("#saveModifyRecruitment").click(function () {
			if (confirm("确定修改该条信息？")) {
				$.ajax({
					url : "modifyRecruitment.action",
					type : "post",
					dataType : "text",
					data : {
						recruitmentId : $("input[name=recruitmentIdMdf]").val(),
						recruitmentTitle : $("input[name=recruitmentTitleMdf]").val(),
						salaryRange : $("input[name=salaryRangeMdf]").val(),
						jobRequirement : $("input[name=jobRequirementMdf]").val(),
						companyName : $("input[name=companyNameMdf]").val(),
						companyState : $("input[name=companyStateMdf]").val(),
						companyArea : $("input[name=companyAreaMdf]").val(),
						companyIntroduction : $("input[name=companyIntroductionMdf]").val(),
						recruitmentContent : $("textarea[name=recruitmentContentMdf]").val(),
						welfareTreatment : $("input[name=welfareTreatmentMdf]").val(),
					},
					success : function (data) {
						if (data == "true") {
							alert("修改成功！请刷新页面查看");
						}else {
							alert("修改失败！");
						}
					}
				});
			}
		})
		/* 添加培训信息 */
		$("#saveTrain").click(function () {
			if (confirm("确定保存该条信息？")) {
				$.ajax({
					url : "saveTrain.action",
					type : "post",
					dataType : "json",
					data : {
						trainName : $("input[name=trainName]").val(),
						trainContent : $("textarea[name=trainContent]").val()
					},
					success : function (data) {
						if (data != null) {
							var tr = "<tr>"+
										"<td>"+data.trainId+"</td>"+
										"<td>"+data.trainName+"</td>"+
										"<td>"+data.trainContent+"</td>"+
										"<td>"+data.createTime+"</td>"+
										"<td>"+data.releaseTime+"</td>"+
										"<td>"+
											"<input type='button' class='releaseTrain' value='发布'/>"+
											"<input type='button' class='modifyTrain' data-toggle='modal' data-target='.bs-example-modal-lg-modifyTrain' value='修改'/>"+
											"<br>"+
											"<input type='button' class='checkTrain' data-toggle='modal' data-target='.bs-example-modal-lg-checkTrain' value='查看'/>"+
											"<input type='button' class='deleteTrain' value='删除'/>"+
										"</td>"+
									"</tr>";
							$("#trainTable").append(tr);
							
						}
					}
				});
			}
		})
		
		/* 删除培训信息 */
		$("#trainTable").on("click", ".deleteTrain", function () {
			if (confirm("确认删除该条信息？")) {
				var dt = $(this)
				$.ajax({
					url : "deleteTrain.action",
					type : "post",
					dataType : "text",
					data : {
						trainId : dt.parent().parent().children().eq(0).text()
					},
					success : function (data) {
						if (data == "true") {
							dt.parent().parent().remove();
						}
					}
				})
			}
		})
		
		/* 查看培训信息 */
		$("#trainTable").on("click", ".checkTrain", function () {
			var ct = $(this)
			$.ajax({
				url : "checkTrain.action",
				type : "post",
				dataType : "json",
				data : {
					trainId : ct.parent().parent().children().eq(0).text()
				},
				success : function (data) {
					if (data != null) {
						$("input[name=trainIdCheck]").val(data.trainId);
						$("input[name=trainNameCheck]").val(data.trainName);
						$("textarea[name=trainContentCheck]").val(data.trainContent);
					}
				}
			});
		})
		
		/* 修改培训内容 */
		$("#trainTable").on("click", ".modifyTrain", function () {
			var mt = $(this)
			$.ajax({
				url : "checkTrain.action",
				type : "post",
				dataType : "json",
				data : {
					trainId : mt.parent().parent().children().eq(0).text()
				},
				success : function (data) {
					if (data != null) {
						$("input[name=trainIdModify]").val(data.trainId);
						$("input[name=trainNameModify]").val(data.trainName);
						$("textarea[name=trainContentModify]").val(data.trainContent);
					}
				}
			});
		})
		
		$("#saveModifyTrain").click(function () {
			if (confirm("是否保存？")) {
				$.ajax({
					url : "saveModifyTrain.action",
					type : "post",
					dataType : "text",
					data : {
						trainId : $("input[name=trainIdModify]").val(),
						trainName : $("input[name=trainNameModify]").val(),
						trainContent : $("textarea[name=trainContentModify]").val(),
					},
					success : function (data) {
						if (data == "true") {
							alert("修改成功，请刷新页面查看");
						}else{
							alert("修改失败");
						}
					}
				});
			}
		})
		
		/* 发布培训信息 */
		
		$("#trainTable").on("click", ".releaseTrain", function (){
			var rt = $(this)
			if (confirm("发布后不可修改，是否确认发布？")) {
				$.ajax({
					url : "releaseTrain.action",
					type : "post",
					dataType : "text",
					data : {
						trainId : rt.parent().parent().children().eq(0).text()
					},
					success : function (data) {
						if (data != null) {
							rt.val("已发布");
							rt.next().val("不可修改");
							rt.attr('disabled', true);
							rt.next().attr('disabled', true);
							rt.parent().prev().text(data.releaseTime);
						}
					}
				});
			}
		})
		
		
		/* 查看应聘简历 */
		$("#resumeTable").on("click", ".checkResume", function () {
			var cr = $(this)
			alert(cr.parent().children().eq(1).val())
			alert(cr.parent().children().eq(0).val())
			$.ajax({
				url : "checkResume.action",
				type : "post",
				dataType : "json",
				data : {
					resumeId : cr.parent().children().eq(1).val(),
					userId : cr.parent().children().eq(0).val()
				},
				success : function (data) {
					if (data != null) {
						$("input[name=resumeNameCheck]").val(data.resumeName);
						$("input[name=educationCheck]").val(data.user.education);
						$("input[name=userNameCheck]").val(data.user.userName);
						$("input[name=foreignLevelCheck]").val(data.user.foreignLevel);
						$("input[name=sexCheck]").val(data.user.sex);
						$("input[name=birthCheck]").val(data.user.birth);
						$("input[name=nationCheck]").val(data.user.nation);
						$("input[name=politicalLandscapeCheck]").val(data.user.politicalLandscape);
						$("input[name=marriageCheck]").val(data.user.marriage);
						$("input[name=mobileCheck]").val(data.user.mobile);
						$("input[name=emailCheck]").val(data.user.email);
						$("input[name=graduateSchoolCheck]").val(data.user.graduateSchool);
						$("input[name=jobIntensionCheck]").val(data.jobIntension);
						$("textarea[name=resumeEducationCheck]").val(data.resumeEducation);
						$("textarea[name=workExperienceCheck]").val(data.workExperience);
						$("textarea[name=selfAssessmentCheck]").val(data.selfAssessment);	
					}
				}
			});
		})
		
		
		/* 添加面试邀请 */
		$("#resumeTable").on("click", ".send", function () {
			var s = $(this)
			alert(s.parent().children().eq(1).val())
			alert(s.parent().children().eq(0).val())
			$.ajax({
				url : "checkResume.action",
				type : "post",
				dataType : "json",
				data : {
					resumeId : s.parent().children().eq(1).val(),
					userId : s.parent().children().eq(0).val()
				},
				success : function (data) {
					if (data != null) {
						$("input[name=userId]").val(data.userId);
						$("input[name=resumeId]").val(data.resumeId);
						$("textarea[name=interviewContent]").val(data.interview.interviewContent);
					}
				}
			});
		})
		
		$("#saveInterview").click(function () {
			if (confirm("确定发送面试邀请？")) {
				$.ajax({
					url : "sendInterview.action",
					type : "post",
					dataType : "text",
					data : {
						userId : $("input[name=userId]").val(),
						resumeId : $("input[name=resumeId]").val(),
						interviewContent : $("textarea[name=interviewContent]").val()
					},
					success : function (data) {
						if (data == "true") {
							alert("发送成功！");
						}
					}
				});
			}
		})
		
		/* 查看面试分数 */
		$("#resumeTable").on("click", ".score", function () {
			var sc = $(this)
			alert(sc.parent().children().eq(1).val())
			alert(sc.parent().children().eq(0).val())
			$.ajax({
				url : "checkScore.action",
				type : "post",
				dataType : "json",
				data : {
					resumeId : sc.parent().children().eq(1).val(),
					userId : sc.parent().children().eq(0).val()
				},
				success : function (data) {
					if (data != null) {
						$("input[name=interviewId]").val(data.interviewId);
						$("input[name=writeScore]").val(data.writeScore);
						$("input[name=interviewScore]").val(data.interviewScore);
						$("input[name=totalScore]").val(data.totalScore);
					}
				}
			});
		})
		
		/* 面试打分通过并发送入职邀请 */
		$("#saveInterviewS").click(function () {
			if (confirm("确认发送？")) {
				$.ajax({
					url : "saveInterviewS.action",
					type : "post",
					dataType : "text",
					data : {
						interviewId : $("input[name=interviewId]").val(),
						writeScore : $("input[name=writeScore]").val(),
						interviewScore : $("input[name=interviewScore]").val()
					},
					success : function (data) {
						if (data == "true") {
							alert("面试通过！刷新查看！！");
						}else {
							alert("面试失败！！");
						}
					}
				});
			}
		})
		
		/* 入职 */
		$("#resumeTable").on("click", ".employed", function () {
			var empl = $(this)
			if (confirm("确认录用？")) {
				$.ajax({
					url : "employed.action",
					type : "post",
					dataType : "text",
					data : {
						userId : empl.parent().children().eq(0).val(),
						resumeId : empl.parent().children().eq(1).val()
					},
					success : function (data) {
						if (data == "true") {
							alert("录用成功！！");
							empl.parent().prev().prev().text("已录用");
						}
					}
				});
			}
		})
		
		/* 奖惩明细 */
		$("#checkFineDetail").click(function () {
			$.ajax({
				url : "checkFineDetail.action",
				type : "post",
				dataType : "json",
				success : function (data) {
					if (data != null) {
						
					}
				}
			});
		})
		
		/* 新增薪资 */
		$("#salaryTable").on("click", ".submitBttn", function () {
			if (confirm("确定提交？")) {
				$.ajax({
					url : "addSalary.action",
					type : "post",
					dataType : "text",
					data : {
						
					},
					success : function (data) {
						if (data == "true") {
							
						}
						
					}
				})
			}
		})
	})
</script>
</head>
<body>
	<!-- page top -->
	<div class="soubg">
		<div class="sou">
			<span class="fr">
	            <span class="fl font" id="font">
	    			<a>${user.nickName}</a>
	    			<a href="exit">退出</a>
	    		</span>
	        </span>  
	    </div>
	</div>
	<div class="position">
		<ul class="nav nav-pills">
		  <li role="presentation" class="active"><a href="#deptDetail" id="dd">部门</a></li>
		  <li role="presentation" class="active"><a href="#positionDetail" id="pd">职位</a></li>
		  <li role="presentation" class="active"><a href="#employeeDetail" id="ed">员工</a></li>  
		  <li role="presentation" class="active"><a href="#fineDetail" id="fd">奖惩</a></li>
		  <li role="presentation" class="active"><a href="#attendanceDetail" id="ad">考勤</a></li>
		  <li role="presentation" class="active"><a href="#salaryDetail" id="sd">薪资</a></li>
		  <li role="presentation" class="active"><a href="#trainDetail" id="td">培训</a></li>
		  <li role="presentation" class="active"><a href="#recruitmentDetail" id="rd">招聘</a></li>
		  <li role="presentation" class="active"><a href="#resumeDetail" id="rsd">求职简历</a></li>
		</ul>
	</div>
	<hr/>
	
	
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
	
	
	<!-- 职位详情 -->
	<div id="positionDetail">
		<form method="post">
		<!-- Large modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg4">添加职位</button>
			
			<div class="modal fade bs-example-modal-lg4" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			  <div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content"><br/>
			       	<p>职位名称：<input type="text" name="positionName"/></p>
					<p>
						<input type="button" class="btn btn-default" id="positionBtn" data-dismiss="modal" value="保存"/>
						<input type="reset" class="btn btn-default" data-dismiss="modal" value="关闭"/>
					</p>
			    </div>
			  </div>
			</div>
			<table border="1" cellspacing="0" id="positionTable">
				<tr>
					<td>职位ID</td>
					<td>职位名称</td>
					<td>创建时间</td>
					<td>操作</td>
				</tr>
				<!-- 遍历现有的所有职位 -->
				<c:forEach items="${positionList}" var="position">
					<tr>
						<td>${position.positionId}</td>
						<td>${position.positionName}</td>
						<td>${position.createTime}</td>
						<td>
							<!-- Large modal -->
							<button type="button" class="modifyPosition" data-toggle="modal" data-target=".bs-example-modal-lg-checkP">查看</button>
							<button type="button" class="modifyPosition" data-toggle="modal" data-target=".bs-example-modal-lg-modify">修改</button>

							<input type="button" class="position" value="删除"/>
						</td>
					</tr>
				</c:forEach>
				<div class='modal fade bs-example-modal-lg-modify' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel'>
					<div class='modal-dialog modal-lg' role='document'>
						<div class='modal-content'><br>
							<p>职位ID：<input type="text" name="positionIdMd" disabled="disabled"/></p>
							<p>职位名称：<input type="text" name="positionNameMd"/></p>
							<p>
								<input type="button" class="btn btn-default" id="modifyBtn" data-dismiss="modal" value="保存"/>
								<input type="reset" class="btn btn-default" data-dismiss="modal" value="关闭"/>
							</p>
						</div>
					</div>
				</div>
				<div class='modal fade bs-example-modal-lg-checkP' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel'>
					<div class='modal-dialog modal-lg' role='document'>
						<div class='modal-content'><br>
							<p>职位ID：<input type="text" name="positionIdMd" disabled="disabled"/></p>
							<p>职位名称：<input type="text" name="positionNameMd" disabled="disabled" readonly="readonly"/></p>
							<p>
								<input type="reset" class="btn btn-default" data-dismiss="modal" value="关闭"/>
							</p>
						</div>
					</div>
				</div>
			</table>
		</form>
		<h4>备注：职位详情表</h4>	
	</div>
	
	<!-- 员工信息 -->
	<div id="employeeDetail">
	
		<!-- Large modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg-employee">添加员工</button>
		
		<div class="modal fade bs-example-modal-lg-employee" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content"><br/>
		      <p>昵　　称：<input type="text" name="nickName"/></p>
		      <p>真实姓名：<input type="text" name="userName"/></p>
		      <p>部　　门：
			      <select id="dept" style="width: 36%; height: 26px;" name="deptName">
			      	<c:forEach items="${deptList}" var="dept">
			      		<option value="${dept.deptName}">${dept.deptName}</option>
			      	</c:forEach>
			      </select>
		      </p>
		      <p>职　　位：
		      		<select id="position" style="width: 36%; height: 26px;" name="positionName">
		      			<c:forEach items="${positionList}" var="position">
		      				<option value="${position.positionName}">${position.positionName}</option>
		      			</c:forEach>
		      		</select>
		      </p>
		      <p>
		      	<input type="button" class="btn btn-default" id="submit" data-dismiss="modal" value="提交"/>
		      	<input type="button"  class="btn btn-default" data-dismiss="modal" value="关闭"/>
		      </p>
		    </div>
		  </div>
		</div>
	
		<table border="1" cellspacing="0" id="userTable">
			<tr>
				<td>员工ID</td>
				<td>员工姓名</td>
				<td>所在部门</td>
				<td>所属职位</td>
				<td>操作</td>
			</tr>
			<!-- 遍历现有的所有部门 -->
			<c:forEach items="${employeeList}" var="employee">
				<tr>
					<td>${employee.userId}</td>
					<td>${employee.userName}</td>
					<td>${employee.deptId}</td>
					<td>${employee.positionId}</td>
					<td>
						<button type="button" class="checkEmployee" data-toggle="modal" data-target=".bs-example-modal-lg-checkEmpl">查看</button>
						<button type="button" class="modifyEmployee" data-toggle="modal" data-target=".bs-example-modal-lg-modifyEmpl">修改</button>
						<input type="button" class="deleteEmployee" value="删除"/>
					</td>
				</tr>
			</c:forEach>
			<div class='modal fade bs-example-modal-lg-checkEmpl' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel'>
				<div class='modal-dialog modal-lg' role='document'>
					<div class='modal-content'><br>
						<p>员工ID：<input type="text" name="userId" readonly="readonly" disabled="disabled"/></p>
						<p>昵称：<input type="text" name="nickName" readonly="readonly" disabled="disabled"/></p>
						<p>姓名：<input type="text" name="userName" readonly="readonly" disabled="disabled"/></p>
						<p>部门ID：<input type="text" name="deptId" readonly="readonly" disabled="disabled"/></p>
						<p>部门名称：<input type="text" name="deptName" readonly="readonly" disabled="disabled"/></p>
						<p>职位ID：<input type="text" name="positionId" readonly="readonly" disabled="disabled"/></p>
						<p>职位名称：<input type="text" name="positionName" readonly="readonly" disabled="disabled"/></p>
						<p>
							<input type="reset" class="btn btn-default" data-dismiss="modal" value="关闭"/>
						</p>
					</div>
				</div>
			</div>
			<div class='modal fade bs-example-modal-lg-modifyEmpl' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel'>
				<div class='modal-dialog modal-lg' role='document'>
					<div class='modal-content'><br>
						<p>员工ID：<input type="text" name="userIdMd" readonly="readonly" disabled="disabled"/></p>
						<p>昵称：<input type="text" name="nickNameMd" readonly="readonly" disabled="disabled" /></p>
						<p>姓名：<input type="text" name="userNameMd" readonly="readonly" disabled="disabled" /></p>
						<p>部门名称：
							<select id="deptMd" style="width: 36%; height: 26px;" name="deptNameMd">
						      	<c:forEach items="${deptList}" var="dept">
						      		<option value="${dept.deptName}">${dept.deptName}</option>
						      	</c:forEach>
					        </select>
					    </p>
					    <p>职位名称：
					        <select id="positionMd" style="width: 36%; height: 26px;" name="positionNameMd">
				      			<c:forEach items="${positionList}" var="position">
				      				<option value="${position.positionName}">${position.positionName}</option>
				      			</c:forEach>
				      		</select>
				      	</p>
						<p>
							<input type="button" id="saveEmplMd" class="btn btn-default" data-dismiss="modal" value="保存"/>
							<input type="reset" class="btn btn-default" data-dismiss="modal" value="关闭"/>
						</p>
					</div>
				</div>
			</div>
		</table>
		<h4>备注：员工详情表</h4>
	</div>
	
	<!-- 考勤情况 -->
	<div id="attendanceDetail">
		<table border="1" cellspacing="0" id="attrTable">
			<tr>
				<td>用户ID</td>
				<td>用户名</td>
				<td>上班打卡时间</td>
				<td>上班时间</td>
				<td>下班打卡时间</td>
				<td>下班时间</td>
				<td>记录创建时间</td>
			</tr>
			<c:forEach items="${attendanceList}" var="attendance">
				<tr>
					<td>${attendance.userId}</td>
					<td>${attendance.user.userName}</td>
					<td>${attendance.inClockTime}</td>
					<td>${attendance.officeHours}</td>
					<td>${attendance.outClockTime}</td>
					<td>${attendance.overOfficeHours}</td>
					<td>${attendance.createTime}</td>
				</tr> 
			</c:forEach>
		</table><br>
		
		<h4>备注：考勤详情表</h4>
	</div>
	
	<!-- 奖惩 -->
	<div id="fineDetail">
	<!-- <button type="button" class="btn btn-primary btn-lg" id="checkFineDetail">
		查看奖惩明细
	</button> -->
		<table border="1" cellspacing="0">
			<thead>
				<tr>
					<td>员工姓名</td>
					<td>迟到、早退次数</td>
					<td>迟到、早退扣款</td>
					<td>记录创建时间</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${Finelist}" var="fine">
					<tr>
						<td>${fine.user.userName}</td>
						<td>${fine.lateLeaveEarly}</td>
						<td>${fine.lateEarlyMoney}</td>
						<td>${fine.createTime}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						员工（N）月奖惩详情表
					</td>
				</tr>	
			</tfoot>
		</table>
		<h4>备注：奖惩详情表</h4>
	</div>
	
	<!-- 薪资详情 -->
	<div id="salaryDetail">
	<form method="post">
		<!-- Large modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg-salary">新增工资</button>
		
		<div class="modal fade bs-example-modal-lg-salary" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		        <select >
		        	<c:forEach items="${userList}" var="user">
		        		<option value="${user.userId}">${user.userName}</option>
		        	</c:forEach>
		        </select>
		        <p>基本薪资：<input type="text" name="baseSalary"></p>
		        <p>交通补贴：<input type="text" name="trafficAllowance"></p>
		        <p>通讯补贴：<input type="text" name="communicationAllowance"></p>
		        <p>绩效奖金：<input type="text" name="performanceBonus"></p>
		        <p>罚　　款：<input type="text" name="totalFine"></p>
		        <p>养老保险：<input type="text" name="endowmentInsurance"></p>
		        <p>医疗保险：<input type="text" name="medicalInsurance"></p>
		        <p>失业保险：<input type="text" name="unemploymentInsurance"></p>
		        <p>工伤保险：<input type="text" name="injuryInsurance"></p>
		        <p>生育保险：<input type="text" name="birthInsurance"></p>
		        <p>公  积  金：<input type="text" name="housingFund"></p>
		        <p>
		        	<input type="button" id="submitBttnSalary" class="btn btn-default" data-dismiss="modal" value="提交">
		        	<input type="button" id="closeBttn" class="btn btn-default" data-dismiss="modal" value="关闭">
		        </p>
		    </div>
		  </div>
		</div>
		
	<br>
		<table border="1" cellspacing="0" id="salaryTable">
			<tr>
				<td>员工姓名</td>
				<td>基本薪资</td>
				<td>交通补贴</td>
				<td>通讯补贴</td>
				<td>绩效奖金</td>
				<td>罚款</td>
				<td>养老保险</td>
				<td>医疗保险</td>
				<td>失业保险</td>
				<td>工伤保险</td>
				<td>生育保险</td>
				<td>住房公积金</td>
				<td>总薪资</td>
				<td>记录创建时间</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${userList}" var="user">
				<tr style="width: auto;">
					<td style="width: auto;">${user.userName}</td>
					<td style="width: 100px;">${user.salary.baseSalary}</td>
					<td style="width: 100px;">${user.salary.trafficAllowance}</td>
					<td style="width: 100px;">${user.salary.communicationAllowance}</td>
					<td style="width: 100px;">${user.salary.performanceBonus}</td>
					<td style="width: 100px;">${user.salary.totalFine}</td>
					<td style="width: 100px;">${user.salary.endowmentInsurance}</td>
					<td style="width: 100px;">${user.salary.medicalInsurance}</td>
					<td style="width: 100px;">${user.salary.unemploymentInsurance}</td>
					<td style="width: 100px;">${user.salary.injuryInsurance}</td>
					<td style="width: 100px;">${user.salary.birthInsurance}</td>
					<td style="width: 100px;">${user.salary.housingFund}</td>
					<td style="width: 100px;">${user.salary.totalSalary}</td>
					<td style="width: 100px;">${user.salary.createTime}</td>
					<td style="width: 100px;">
						<input type="button" class="submitBttn" value="提交">
						<input type="button" class="checkSalaryBttn" value="查看">
						<input type="button" class="deleteSalaryBttn" value="删除">
					</td>
				</tr>
			</c:forEach>
		</table>
		</form>
	</div>
	
	<!-- 培训 -->
	<div id="trainDetail">
		<!-- Large modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg-train">添加培训信息</button>
		
		<div class="modal fade bs-example-modal-lg-train" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content"><br/>
		      <p>标题：<input type="text" name="trainName"/></p>
		      <p>内容：<textarea type="text" name="trainContent"></textarea></p>
		      <p>
		      	<input type="button" class="btn btn-default" data-dismiss="modal" id="saveTrain" value="保存"/>
		      	<input type="button" class="btn btn-default" data-dismiss="modal" value="关闭">
		      </p>
		    </div>
		  </div>
		</div>
		
		<table border="1" cellspacing="0" id="trainTable">
			<tr>
				<td>ID</td>
				<td>标题</td>
				<td>内容</td>
				<td>创建时间</td>
				<td>发布时间</td>
				<td>操作</td>
			</tr> 
			<!-- 遍历现有的所有培训信息 -->
			<c:forEach items="${trainList}" var="train">
				<tr>
					<td>${train.trainId}</td>
					<td>${train.trainName}</td>
					<td>${train.trainContent}</td>
					<td>${train.createTime}</td>
					<td>${train.releaseTime}</td>
					<td>
						<c:if test="${train.status==0}">
							<input type="button" class="releaseTrain" value="发布"/>
							<input type="button" class="modifyTrain" data-toggle="modal" data-target=".bs-example-modal-lg-modifyTrain" value="修改"/>
						</c:if>
						<c:if test="${train.status==1}">
							<input type="button" class="releaseTrain" disabled="disabled" value="已发布"/>
							<input type="button" class="modifyTrain" disabled="disabled" data-toggle="modal" data-target=".bs-example-modal-lg-modifyTrain" value="不可修改"/>
						
						</c:if>
						<br>
						<input type="button" class="checkTrain" data-toggle="modal" data-target=".bs-example-modal-lg-checkTrain" value="查看"/>
						<input type="button" class="deleteTrain" value="删除"/>
					</td>
				</tr>
			</c:forEach>
			<div class="modal fade bs-example-modal-lg-checkTrain" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			  <div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content"><br/>
			      <p>ID：<input type="text" name="trainIdCheck" disabled="disabled" readonly="readonly"/></p>
			      <p>标题：<input type="text" name="trainNameCheck" disabled="disabled" readonly="readonly"/></p>
			      <p>内容：<textarea name="trainContentCheck" disabled="disabled" readonly="readonly"></textarea></p>
			      
			      <p>
			      	<input type="button" class="btn btn-default" data-dismiss="modal" value="关闭">
			      </p>
			    </div>
			  </div>
			</div>
			<div class="modal fade bs-example-modal-lg-modifyTrain" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			  <div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content"><br/>
			      <p>ID：<input type="text" name="trainIdModify" disabled="disabled" readonly="readonly"/></p>
			      <p>标题：<input type="text" name="trainNameModify"/></p>
			      <p>内容：<textarea name="trainContentModify"></textarea></p>
			      <p>
			      	<input type="button" class="btn btn-default" id="saveModifyTrain" data-dismiss="modal" value="保存"/>
			      	<input type="button" class="btn btn-default" data-dismiss="modal" value="关闭">
			      </p>
			    </div>
			  </div>
			</div>
		</table>
		
	</div>
	
	<!-- 招聘 -->
	<div role="tabpanel" class="tab-pane" id="recruitmentDetail">
		<form method="post">
			<!-- Large modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">添加招聘信息</button>
			
			<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			  <div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content"><br/>
			    	<p>
			    		<input type="text" name="recruitmentTitle" placeholder="请输入标题"/>
			    	</p>
			    	<p>
			    		<input type="text" name="salaryRange" placeholder="请输入薪资范围"/> 
			    	</p>
			    	<p>
			    		<input type="text" name="jobRequirement" placeholder="招聘人数、学历、工作经验年限">
			    	</p>
			    	<p>
			    		<input type="text" name="companyName" placeholder="公司名称"/>
			    	</p>
			    	<p>
			    		<input type="text" name="companyState" placeholder="公司状态"/>
			    	</p>
			    	<p>
			    		<input type="text" name="companyArea" placeholder="公司地址"/>
			    	</p>
			    	<p>
			    		<textarea rows="15" cols="30" name="recruitmentContent" placeholder="招聘信息内容"></textarea>
			    	</p>
			    	<p>
			    		<input type="text" name="welfareTreatment" placeholder="福利待遇"/>
			    	</p>
			    	<p>
			    		<input type="button" class="btn btn-default" id="publishInformation" data-dismiss="modal" value="保存"/>
			    		<input type="reset" class="btn btn-default" data-dismiss="modal" value="关闭"/>
			    	</p>
			    </div>
			  </div>
			</div>
		</form>
		
	
		<table border="1" cellspacing="0" id="recruitmentTable">
			<tr>
				<td>标题</td>
				<td>创建时间</td>
				<td>发布时间</td>
				<td>修改时间</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${recruitmentList}" var="recruitment">
				<tr>
					<td>${recruitment.recruitmentTitle}</td>
					<td>${recruitment.recruitmentTime}</td>
					<td>${recruitment.releaseTime}</td>
					<td>${recruitment.modifyTime}</td>
					<td>
						<input type="hidden" value="${recruitment.recruitmentId}"/>
						<c:if test="${recruitment.isRelease==0}">
							<input type="button" name="release" class="isRelease" value="发布"/>
							<button type="button" name="mdf" class="mdf" data-toggle="modal" data-target=".bs-example-modal-lg-mdf">修改</button>
							
						</c:if>
						<c:if test="${recruitment.isRelease==1}">
							<input type="button" name="release" class="isRelease" disabled="disabled" value="已发布"/>
							<button type="button" name="mdf" class="mdf" disabled="disabled" data-toggle="modal" data-target=".bs-example-modal-lg-mdf">不可修改</button>
						</c:if><br>
						<input type="button" name="checkRecruitment" value="查看" class="checkRecruitment" data-toggle="modal" data-target=".bs-example-modal-lg-checkRecruitment"/>
						<input type="button" name="delete" class="isDelete" value="删除"/>
					</td>
				</tr>
			</c:forEach>
			
			<div class="modal fade bs-example-modal-lg-checkRecruitment" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			  <div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content"><br/>
			   	 	<p>
		    			ID：<input type="text" name="recruitmentId" disabled="disabled" readonly="readonly"/>
		    		</p>
			    	<p>
		    			标题：<input type="text" name="recruitmentTitle" disabled="disabled" readonly="readonly"/>
		    		</p>
			    	<p>
			    		薪资范围：<input type="text" name="salaryRange" disabled="disabled" readonly="readonly"/> 
			    	</p>
			    	<p>
			    		要求：<input type="text" name="jobRequirement" disabled="disabled" readonly="readonly"/>
			    	</p>
			    	<p>
			    		公司名称：<input type="text" name="companyName" disabled="disabled" readonly="readonly"/>
			    	</p>
			    	<p>
			    		公司状态：<input type="text" name="companyState" disabled="disabled" readonly="readonly"/>
			    	</p>
			    	<p>
			    		公司地址：<input type="text" name="companyArea" disabled="disabled" readonly="readonly"/>
			    	</p>
			    	<p>
			    		招聘内容：<textarea rows="15" cols="30" name="recruitmentContent" disabled="disabled" readonly="readonly"></textarea>
			    	</p>
			    	<p>
			    		福利待遇：<input type="text" name="welfareTreatment" disabled="disabled" readonly="readonly"/>
			    	</p>
			    	<p>
			    		<input type="reset" class="btn btn-default" data-dismiss="modal" value="关闭"/>
			    	</p>
			    </div>
			  </div>
			</div>
			
			<div class="modal fade bs-example-modal-lg-mdf" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			  <div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content"><br/>
			    	<p>
		    			ID：<input type="text" name="recruitmentIdMdf" disabled="disabled" readonly="readonly"/>
		    		</p>
			      	<p>
		    			标题：<input type="text" name="recruitmentTitleMdf"/>
		    		</p>
			    	<p>
			    		薪资范围：<input type="text" name="salaryRangeMdf"/> 
			    	</p>
			    	<p>
			    		要求：<input type="text" name="jobRequirementMdf"/>
			    	</p>
			    	<p>
			    		公司名称：<input type="text" name="companyNameMdf"/>
			    	</p>
			    	<p>
			    		公司状态：<input type="text" name="companyStateMdf"/>
			    	</p>
			    	<p>
			    		公司地址：<input type="text" name="companyAreaMdf"/>
			    	</p>
			    	<p>
			    		招聘内容：<textarea rows="15" cols="30" name="recruitmentContentMdf"></textarea>
			    	</p>
			    	<p>
			    		福利待遇：<input type="text" name="welfareTreatmentMdf"/>
			    	</p>
			    	<p>
			    		<input type="button" id="saveModifyRecruitment" class="btn btn-default" data-dismiss="modal" value="保存" />
			    		<input type="reset" class="btn btn-default" data-dismiss="modal" value="关闭"/>
			    	</p>
			    </div>
			  </div>
			</div>
		</table>
	</div>

	<!-- 求职简历 -->
	<div id="resumeDetail">
		<table border="1" cellspacing="0" id="resumeTable">
			<tr>
				<td>应聘职位</td>
				<td>工作经验</td>
				<td>投递时间</td>
				<td>面试邀请</td>
				<td>确认面试</td>
				<td>面试通过</td>
				<td>录用</td>
				<td>入职</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${resumeAllList}" var="resume">
				<tr>
					<td>${resume.jobIntension}</td>
					<td>${resume.workExperience}</td>
					<td>${resume.deliveryTime}</td>
					<c:if test="${resume.interview.sendInterview==0}">
						<td>未发送</td>
					</c:if>
					<c:if test="${resume.interview.sendInterview==1}">
						<td>已发送</td>
					</c:if>
					<c:if test="${resume.interview.confirmInterview==0}">
						<td>未确认</td>
					</c:if>
					<c:if test="${resume.interview.confirmInterview==1}">
						<td>已确认</td>
					</c:if>
					
					<c:if test="${resume.interview.interviewPass==0}">
						<td>未通过</td>
					</c:if>
					<c:if test="${resume.interview.interviewPass==1}">
						<td>已通过</td>
					</c:if>
					<c:if test="${resume.interview.employed==0}">
						<td>未录用</td>
					</c:if>
					<c:if test="${resume.interview.employed==1}">
						<td>已录用</td>
					</c:if>
					<c:if test="${resume.interview.entry==0}">
						<td>未确认入职</td>
					</c:if>
					<c:if test="${resume.interview.entry==1}">
						<td>已确认入职</td>
					</c:if>

					<td>
						<input type="hidden" name="userIdHidden" value="${resume.userId}">
						<input type="hidden" name="resumeIdHidden" value="${resume.resumeId}">
						<input type="button" class="checkResume" data-toggle="modal" data-target=".bs-example-modal-lg-admin" value="简历详情"/>
						<input type="button" class="send" data-toggle="modal" data-target=".bs-example-modal-lg-send" value="面试邀请">
						<input type="button" class="score" data-toggle="modal" data-target=".bs-example-modal-lg-score" value="面试打分">
						<input type="button" class="employed" data-toggle="modal" data-target=".bs-example-modal-lg-employed" value="确认录用">
					</td>
				</tr>
			</c:forEach>
			<!-- Modal 简历详情-->
				<div class="modal fade bs-example-modal-lg-admin" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
				  <div class="modal-dialog modal-lg" role="document">
				    <div class="modal-content"><br>
				      <br>
				        <p>简历名称：<input type="text" name="resumeNameCheck" readonly="readonly"/></p>
						<p>学　　历: <input type="text" name="educationCheck" readonly="readonly"></p>
						<p>姓　　名：<input type="text" name="userNameCheck" readonly="readonly"></p>
						<p>外语水平：<input type="text" name="foreignLevelCheck" readonly="readonly"></p>
						<p>性　　别：<input type="text" name="sexCheck" readonly="readonly"></p>
						<p>出生年月：<input type="text" name="birthCheck" readonly="readonly"></p>
						<p>民　　族：<input type="text" name="nationCheck" readonly="readonly"></p>
						<p>政治面貌：<input type="text" name="politicalLandscapeCheck" readonly="readonly"></p>
						<p>婚姻状况：<input type="text" name="marriageCheck" readonly="readonly"></p>
						<p>电　　话：<input type="text" name="mobileCheck" readonly="readonly"></p>
						<p>邮　　箱：<input type="text" name="emailCheck" readonly="readonly"></p>
						<p>毕业院校：<input type="text" name="graduateSchoolCheck" readonly="readonly"></p>
						<p>应聘职位：<input type="text" name="jobIntensionCheck" readonly="readonly"></p>
						<p>教育背景：<textarea cols="50" rows="10" name="resumeEducationCheck" readonly="readonly"></textarea></p>
						<p>工作经历：<textarea cols="50" rows="10" name="workExperienceCheck" readonly="readonly"></textarea></p>
						<p>自我评价：<textarea cols="50" rows="10" name="selfAssessmentCheck" readonly="readonly"></textarea></p>				
				      	<br>
				      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				    	<br><br>
				    </div>
				  </div>
				</div>
				
				<!-- Modal 面试邀请-->
				<div class="modal fade bs-example-modal-lg-send" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
				  <div class="modal-dialog modal-lg" role="document">
				    <div class="modal-content"><br>
				      <br>
				      	<p>用户ID：<input type="text" name="userId"></p>
				      	<p>简历ID：<input type="text" name="resumeId"></p>
				      	<p>面试邀请内容：<textarea rows="10" cols="20" name="interviewContent"></textarea></p>
				      <br>
				      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				      	<button type="button" id="saveInterview" class="btn btn-default" data-dismiss="modal">保存</button>
				    	<br><br>
				    </div>
				  </div>
				</div>
				
				
				<!-- Modal 面试打分-->
				<div class="modal fade bs-example-modal-lg-score" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
				  <div class="modal-dialog modal-lg" role="document">
				    <div class="modal-content"><br>
				      <br>
				      	<p>ID: <input type="text" name="interviewId" readonly="readonly"></p>
				      	<p>笔试分数：<input type="text" name="writeScore"></p>
				      	<p>面试分数：<input type="text" name="interviewScore"></p>
				      	<p>总分数：<input type="text" name="totalScore"/></p>
				      <br>
				      	
				      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				      	<button type="button" id="saveInterviewS" class="btn btn-default" data-dismiss="modal">提交</button>
				    	<br><br>
				    </div>
				  </div>
				</div>
				
				
				<!-- Modal 确认录用-->
				<!-- <div class="modal fade bs-example-modal-lg-employed" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
				  <div class="modal-dialog modal-lg" role="document">
				    <div class="modal-content"><br>
				      <br>
				      	<p>ID: <input type="text" name="interviewId" readonly="readonly"></p>
				      	<p>笔试分数：<input type="text" name="writeScore"></p>
				      	<p>面试分数：<input type="text" name="interviewScore"></p>
				      	<p>总分数：<input type="text" name="totalScore"/></p>
				      <br>
				      	
				      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				      	<button type="button" id="saveInterviewS" class="btn btn-default" data-dismiss="modal">提交</button>
				    	<br><br>
				    </div>
				  </div>
				</div> -->
		</table>
	</div>
</body>
</html>