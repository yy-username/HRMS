<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>游客首页</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<style type="text/css">
	.font{
		font-size: 1.5em;
	}

	tr{height: 40px;}
	td{width: 200px;}
	/* input{width: 95%;} */
	table{text-align: center;}
	.button{text-align: center;}
	/* .foot{margin: 40px 240px;padding-top: 50px;width: 800px;height: 1000px;background-color:white;} */
	.top{text-align: center;margin-top: 50px;}
	.tdd{text-align: center;width: 100px;}
	.sex{width: 20%;}
	.btnn{width: 25%}
	#allDept{font-size: 1.5em;font-weight: bolder;}
	
	#delivery,#modufyBttn,#deleteBtnn{width: 25%;}
</style>

<script type="text/javascript">
	$(function () {

		/* 添加简历 */
		$("#btnSave").click(function () {
			if (confirm("确定保存该简历信息吗？")) {
				$.ajax({
					url : "inputResume",
					type : "post",
					dataType : "json",
					data : {
						resumeName : $("input[name=resumeName]").val(),
						education : $("input[name=education]").val(),
						userName : $("input[name=userName]").val(),
						foreignLevel : $("input[name=foreignLevel]").val(),
						sex : $("input[name=sex]").val(),
						birth : $("input[name=birth]").val(),
						nation : $("input[name=nation]").val(),
						politicalLandscape : $("input[name=politicalLandscape]").val(),
						marriage : $("input[name=marriage]").val(),
						mobile : $("input[name=mobile]").val(),
						email : $("input[name=email]").val(),
						graduateSchool : $("input[name=graduateSchool]").val(),
						jobIntension : $("input[name=jobIntension]").val(),
						resumeEducation : $("textarea[name=resumeEducation]").val(),
						workExperience : $("textarea[name=workExperience]").val(),
						/* skillsertificate : $("textarea[name=skillsertificate]").val(), */
						selfAssessment : $("textarea[name=selfAssessment]").val()
					},
					success : function (data) {
						if (data != null) {
							var tr = "<tr>"+
										"<td>"+data.resumeId+"</td>"+
										"<td>"+data.resumeName+"</td>"+
										"<td>"+data.createTime+"</td>"+
										"<td>"+data.deliveryTime+"</td>"+
										"<td>"+
											"<input type='button' name='deliveryBtnn' class='deliveryBtnn' id='delivery' value='未投递'/>"+
											"<input type='button' name='modifyBttn' value='修改'>"+
											"<br>"+
											"<button type='button' name='checkBttn' class='checkfyBttn' data-toggle='modal' data-target=''#myModalCheck'>查看</button>"+
											"<input type='button' name='deleteBtnn' class='deleteBtnn' id='deleteBtnn' value='删除'/>"+
										"</td>"+
									"</tr>";
							$("#resumeTable").append(tr);
						}
					}
				});
			}
		});
		
		/* 删除简历 */
		$("#resumeTable").on("click", ".deleteBtnn", function () {
			var d = $(this)
			if (confirm("确定删除该条简历？")) {
				$.ajax({
					url : "deleResume",
					type : "post",
					dataType : "text",
					data : {
						resumeId : d.parent().parent().children().eq(0).text()
					},
					success : function (data) {
						if (data == "true") {
							d.parent().parent().remove();
						}
					}
				});
			}
		})
		
		/*投递简历*/
		$("#resumeTable").on("click", ".deliveryBtnn", function () {
			var db = $(this)
			if (confirm("确定投递该条简历")) {
				$.ajax({
					url : "deliveryResume",
					type : "post",
					dataType : "text",
					data : {
						resumeId : db.parent().parent().children().eq(0).text()
					},
					success : function (data) {
						if (data == "true") {
							db.val("已投递");
							db.next().val("不可修改");
							db.attr('disabled', true);
						}
					}
				});
			}
		})
		
		/* 查看简历 */
		$("#resumeTable").on("click", ".checkfyBttn", function () {
			var cfb = $(this)
			$.ajax({
				url : "checkfyResume.action",
				type : "post",
				dataType : "json",
				data : {
					resumeId : cfb.parent().parent().children().eq(0).text()
				},
				success : function (data) {
					if (data != null) {
						$("input[name=resumeNameCheck]").val(data.resumeName),
						$("input[name=jobIntensionCheck]").val(data.jobIntension),
						$("textarea[name=resumeEducationCheck]").val(data.resumeEducation),
						$("textarea[name=workExperienceCheck]").val(data.workExperience),
						/* $("textarea[name=skillsertificateCheck]").val(data.skillsertificate), */
						$("textarea[name=selfAssessmentCheck]").val(data.selfAssessment)
					}
				}
			})
		})
		
		
		/* 修改简历 */
		$("#resumeTable").on("click", ".modifyBttn", function () {
			var mfb = $(this)
			$.ajax({
				url : "checkfyResume.action",
				type : "post",
				dataType : "json",
				data : {
					resumeId : mfb.parent().parent().children().eq(0).text()
				},
				success : function (data) {
					if (data != null) {
						$("input[name=resumeIdModify]").val(data.resumeId),
						$("input[name=resumeNameModify]").val(data.resumeName),
						$("input[name=jobIntensionModify]").val(data.jobIntension),
						$("textarea[name=resumeEducationModify]").val(data.resumeEducation),
						$("textarea[name=workExperienceModify]").val(data.workExperience),
						/* $("textarea[name=skillsertificateModify]").val(data.skillsertificate), */
						$("textarea[name=selfAssessmentModify]").val(data.selfAssessment)
					}
				}
			})
		})
		$("#saveResumeModify").click(function () {
			if (confirm("确定修改简历？")) {
				$.ajax({
					url : "saveResumeModify.action",
					type : "post",
					dataType : "text",
					data : {
						resumeId : $("input[name=resumeIdModify]").val(),
						resumeName : $("input[name=resumeNameModify]").val(),
						education : $("input[name=educationModify]").val(),
						userName : $("input[name=userNameModify]").val(),
						foreignLevel : $("input[name=foreignLevelModify]").val(),
						sex : $("input[name=sexModify]").val(),
						birth : $("input[name=birthModify]").val(),
						nation : $("input[name=nationModify]").val(),
						politicalLandscape : $("input[name=politicalLandscapeModify]").val(),
						marriage : $("input[name=marriageModify]").val(),
						mobile : $("input[name=mobileModify]").val(),
						email : $("input[name=emailModify]").val(),
						graduateSchool : $("input[name=graduateSchoolModify]").val(),
						jobIntension : $("input[name=jobIntensionModify]").val(),
						resumeEducation : $("textarea[name=resumeEducationModify]").val(),
						workExperience : $("textarea[name=workExperienceModify]").val(),
						/* skillsertificate : $("textarea[name=skillsertificateModify]").val(), */
						selfAssessment : $("textarea[name=selfAssessmentModify]").val()
					},
					success : function (data) {
						if (data == "true") {
							alert("修改成功，请刷新查看！！");
						}
					}
				});	
			}
		})
		
		
		
		$("#resumeTable").on("click", ".check", function () {
			var db = $(this)
				$.ajax({
					url : "checkRecruitment",
					type : "post",
					dataType : "text",
					data : {
						resumeId : db.parent().parent().children().eq(0).text()
					},
					success : function (data) {
						if (data != null) {
							var cc = "<div class='modal fade bs-example-modal-lgcheck' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel'>"+
							  			"<div class='modal-dialog modal-lg' role='document'>"+
							    			"<div class='modal-content'>"+
							    			data.recruitmentId+data.recruitmentTitle
							    			"</div>"+
							  			"</div>"+
									 "</div>";
							$("#resumeTable").append(cc);
						}
					}
				});
		})
		
		
		$("input[name=modifyBttn]").click(function () {
			$.ajax({
				url : "modifyResume.action",
				type : "post",
				dataType : "json",
				data : {
					resumeId : $(this).parent().parent().children().eq(0).text()
				},
				success : function (data) {
					if (data != null) {
						/* alert($("input[name=resumeName]").val("data.resumeName")); */
						$("input[name=resumeName]").val("data.resumeName");
					}
				}
			});
		})
		
		/* 查看招聘详情 */
		$("#recruitmentTable").on("click", ".recruitmentDetial", function () {
			var rd = $(this)
			$.ajax({
				url : "checkRecruitment.action",
				type : "post",
				dataType : "json",
				data : {
					recruitmentId : rd.parent().children().eq(0).val()
				},
				success : function (data) {
					if (data != null) {
						
						$("input[name=recruitmentTitles]").val(data.recruitmentTitle),
						$("input[name=salaryRanges]").val(data.salaryRange),
						$("input[name=jobRequirements]").val(data.jobRequirement),
						$("input[name=companyNames]").val(data.companyName),
						$("input[name=companyStates]").val(data.companyState),
						$("input[name=companyAreas]").val(data.companyArea),
						$("input[name=companyIntroductions]").val(data.companyIntroduction),
						$("textarea[name=recruitmentContents]").val(data.recruitmentContent),
						$("input[name=welfareTreatments]").val(data.welfareTreatment)
					}
				}
			});
		})
		
		/* 确认面试 */
		$("#interviewTable").on("click", ".confInterview", function () {
			var ci = $(this)
			if (confirm("确认面试？")) {
				$.ajax({
					url : "confInterview.action",
					type : "post",
					dataType : "text",
					data : {
						interviewId : ci.parent().children().eq(0).val()
					},
					success : function (data) {
						if (data == "true") {
							alert("面试确认成功！！");
							ci.parent().parent().children().eq(1).text("已确认");
						}
					}
				});
			}
		})
		
		/* 查看面试分数 */
		$("#interviewTable").on("click", ".checkScore", function () {
			var cs = $(this)
			$.ajax({
				url : "checkScore.action",
				type : "post",
				dataType : "json",
				data : {
					userId : cs.parent().children().eq(1).val(), 
					resumeId : cs.parent().children().eq(2).val(),
				},
				success : function (data) {
					if (data != null) {
						$("input[name=writeScore]").val(data.writeScore);
						$("input[name=interviewScore]").val(data.interviewScore);
						$("input[name=totalScore]").val(data.totalScore);
					}
				}
			});
		})
		
		/* 确认入职 */
		$("#interviewTable").on("click", ".entry", function () {
			var ent = $(this)
			if (confirm("确定入职？")) {
				$.ajax({
					url : "entry.action",
					type : "post",
					dataType : "text",
					data : {
						interviewId : ent.parent().children().eq(0).val()
					},
					success : function (data) {
						if (data == "true") {
							alert("入职成功！");
							ent.parent().prev().text("已入职");
						}
					}
				})
			}
		})
	})
	
	
	function show (flag) {
		/* var homepage = document.getElementById("homepage");
		var deptTro = document.getElementById("deptTro");
		var employmentInfo = document.getElementById("employmentInfo");
		var resume = document.getElementById("resume"); */
		
		var home = document.getElementById("home");
		var dept = document.getElementById("dept");
		var employment = document.getElementById("employment");
		var personal = document.getElementById("personal");
		var inter = document.getElementById("inter");
		home.style.display="none";
		dept.style.display="none";
		employment.style.display="none";
		personal.style.display="none";
		inter.style.display="none";
		if (flag == 1) {
			home.style.display="block";
		}else if (flag == 2) {
			dept.style.display="block";
		}else if (flag == 3) {
			employment.style.display="block";
		}else if (flag == 4) {
			personal.style.display="block";
		}else if (flag == 5) {
			inter.style.display="block";
		}
	}
	
	
</script>
</head>
<body onload=show(1)>
	<!-- page top -->
	<div class="soubg">
		<div class="sou">
			<span class="fr">
	            <span class="fl font" id="font">
	    			<a>${user1.nickName}</a>
	    			<a href="exit">退出</a>
	    		</span>
	        </span>  
	    </div>
	</div>
	<div class="menu_bg">
		<div class="menu">                                         
    		<ul>                                                                                                                                               
        		<li style="float: left; margin-right: 60px;"><a id="homepage" onclick="show(1)">公司简介</a></li>
        		<li style="float: left; margin-right: 60px;"><a id="deptTro" onclick="show(2)">部门简介</a></li>
            	<li style="float: left; margin-right: 60px;"><a id="employmentInfo" onclick="show(3)">招聘信息</a></li>
            	<li style="float: left; margin-right: 60px;"><a id="resume" onclick="show(4)">个人简历</a></li>
            	<li style="float: left; margin-right: 60px;"><a id="interview" onclick="show(5)">面试邀请</a></li>
        	</ul>
    	</div>
	</div>
	<br/>
	<!-- page foot -->
	<div id="home">
		<div>
			上海海同信息科技有限公司
		</div>
		<div>
			中国（上海）自由贸易试验区松涛路489号1幢B座302-2室
		</div>
		<div>
			存续（在营、开业、在册）
		</div>
		<div>
			100-500人
		</div>
		<div>
			上海海同信息科技有限公司是专注于IT及互联网领域的人才培养(线上+线下)、招聘服务
			和技术解决方案服务提供商，8年来始终专注于互联网、移动互联网、物联网和大数据等
			高新技术领域发展急需的软件人才培养   ， 培训内容主要包括Android、嵌入式开发、
			J2EE、PHP，HTML5、iOS、大数据的开发和UI设计 。上海海同科技作为ARM、微软的嵌入式
			授权合作伙伴，海同科技立足于提供国内高水平的嵌入式培训。在著名嵌入式软件、硬件厂
			商Microsoft、ARM、TI、Altera的大力支持下，推出理论和实践项目相结合的嵌入式系列
			高端课程，帮助学员深入学习嵌入式处理器软件、硬件等基本知识，参照企业项目开发经验，
			组织学员开展项目实践，增强实践开发能力，着眼于满足企业在产品升级换代方面对技术和
			人才的需求。 
			
		</div>
	</div>
	<div id="dept">
		<ul>
			<c:forEach items="${deptList}" var="dept">
				<li id="allDept">${dept.deptName}</li>
				<li>${dept.deptIntroduction}</li>
			</c:forEach>
		</ul>
	</div>
	<div id="employment">
		<!-- 招聘信息 -->
		<table id="recruitmentTable" border="1" cellspacing="0">
			<tr>
				<td>招聘信息标题</td>
				<td>薪资范围</td>
				<td>公司名称</td>
				<td>公司地点</td>
				<td>公司状态</td>
				<td>招聘要求</td>
				<td>发布时间</td>
			</tr>
			<c:forEach items="${recruitmentList}" var="recruitment">
				<c:if test="${recruitment.isRelease == 1}">
					<tr>
						<td>
							<input type="hidden" name="recruitmentId" value="${recruitment.recruitmentId}"/>
							<input type="button" class="recruitmentDetial" data-toggle="modal" data-target="#myModalTitle" value="${recruitment.recruitmentTitle}">
						</td>
						<td>${recruitment.salaryRange}</td>
						<td>${recruitment.companyName}</td>
						<td>${recruitment.companyArea}</td>
						<td>${recruitment.companyState}</td>
						<td>${recruitment.jobRequirement}</td>
						<td>${recruitment.releaseTime}</td>
					 </tr>
				</c:if> 
			</c:forEach>
			<div class="modal fade" id="myModalTitle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			      </div>
			      <div class="modal-body">
			        <br/>
			    	<p>
		    			标题：<input type="text" name="recruitmentTitles" disabled="disabled" readonly="readonly"/>
		    		</p>
			    	<p>
			    		薪资范围：<input type="text" name="salaryRanges" disabled="disabled" readonly="readonly"/> 
			    	</p>
			    	<p>
			    		要求：<input type="text" name="jobRequirements" disabled="disabled" readonly="readonly"/>
			    	</p>
			    	<p>
			    		公司名称：<input type="text" name="companyNames" disabled="disabled" readonly="readonly"/>
			    	</p>
			    	<p>
			    		公司状态：<input type="text" name="companyStates" disabled="disabled" readonly="readonly"/>
			    	</p>
			    	<p>
			    		公司地址：<input type="text" name="companyAreas" disabled="disabled" readonly="readonly"/>
			    	</p>
			    	<p>
			    		招聘内容：<textarea rows="15" cols="30" name="recruitmentContents" disabled="disabled" readonly="readonly"></textarea>
			    	</p>
			    	<p>
			    		福利待遇：<input type="text" name="welfareTreatments" disabled="disabled" readonly="readonly"/>
			    	</p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalDelivery">投递简历</button> -->
			      </div>
			    </div>
			  </div>
			</div>
		</table>
	</div>
	<div id="personal">
		<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
		  新增简历
		</button>
	
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		    	<form method="post" >
		      		<div class="modal-header">
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        		<!-- <h4 class="modal-title" id="myModalLabel"><input type="text" name="resumeName" placeholder="简历名称"/> </h4> -->
		      		</div>
		      		<div class="modal-body">
						<div class="foot">
							<table border="1" cellspacing="0">
								<tr>
									<td class="tdd">简历名称：</td>
									<td><input type="text" name="resumeName"/></td>
									<td class="tdd">学　　历:</td>
									<td><input type="text" name="education" value="${user1.education}"></td>
								</tr>
								<tr>
									<td align="right" class="tdd">姓　　名：</td>
									<td><input type="text" name="userName" value="${user1.userName}"></td>
									<td rowspan="4" colspan="2" class="button"><input type="file" name=""><br/>请上传一寸照片</td>
								</tr>
								<tr>
									<td align="right" class="tdd">外语水平：</td>
									<td><input type="text" name="foreignLevel" value="${user1.foreignLevel}"></td>
								</tr>
								<tr>
									<td align="right" class="tdd">性　　别：</td>
									<td>
										<span>男<input type="radio" name="sex" checked="checked" class="sex"></span>
										<span>女<input type="radio" name="sex" class="sex"></span>
									</td>
								</tr>
								<tr>
									<td align="right" class="tdd">出生年月：</td>
									<td><input type="date" name="birth" value="birth"></td>
								</tr>
								<tr>
									<td align="right" class="tdd">民　　族：</td>
									<td><input type="text" name="nation" value="nation"></td>
									<td align="right" class="tdd">政治面貌：</td>
									<td><input type="text" name="politicalLandscape" value="politicalLandscape"></td>
								</tr>
								<tr>
									<td align="right" class="tdd">婚姻状况：</td>
									<td>
										<span>未婚<input type="radio" name="marriage" checked="checked" class="sex"></span>
										<span>已婚<input type="radio" name="marriage" class="sex"></span>
									</td>
									<td align="right" class="tdd">电　　话：</td>
									<td><input type="text" name="mobile" value="mobile"></td>
								</tr>
								<tr>
									<td align="right" class="tdd">邮　　箱：</td>
									<td><input type="text" name="email" value="email"></td>
									<td align="right" class="tdd">毕业院校：</td>
									<td><input type="text" name="graduateSchool" value="graduateSchool"></td>
								</tr>
								<tr>
									<td align="right" class="tdd">应聘职位：</td>
									<td colspan="3"><input type="text" name="jobIntension"></td>
								</tr>
								<tr>
									<td align="right" class="tdd">教育背景：</td>
									<td colspan="3">
										<textarea cols="70" rows="10" name="resumeEducation">
										
										</textarea>
									</td>
								</tr>
								<tr>
									<td align="right" class="tdd">工作经历：</td>
									<td colspan="3">
										<textarea cols="70" rows="10" name="workExperience">
										
										</textarea>
									</td>
								</tr>
								<tr>
									<td align="right" class="tdd">自我评价：</td>
									<td colspan="3">
										<textarea cols="70" rows="10" name="selfAssessment">
										
										</textarea>
									</td>
								</tr>
							</table>
						</div>
		      	  </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" class="btn btn-primary" data-dismiss="modal" id="btnSave">保存</button>
			      </div>
		      </form>	
		    </div>
		  </div>
		</div>
		<div>
			<table border="1" cellspacing="0"  id="resumeTable">
				<tr>
					<td>简历ID</td>
					<td>简历名称</td>
					<td>创建时间</td>
					<td>投递时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${resumeList}" var="resume">
					<tr>
						<td>${resume.resumeId}</td>
						<td>${resume.resumeName}</td>
						<td>${resume.createTime}</td>
						<td>${resume.deliveryTime}</td>
						<td>
							<c:if test="${resume.deliveryStatus==0}">
								<input type="button" name="deliveryBtnn" class="deliveryBtnn" id="delivery" value="未投递"/>
								<input type="button" name="modifyBttn" class="modifyBttn" data-toggle="modal" data-target="#myModalModify" value="修改">
							</c:if>
							<c:if test="${resume.deliveryStatus==1}">
								<input type="button" name="deliveryBtnn" class="deliveryBtnn" id="delivery" disabled="disabled" value="已投递"/>
								<input type="button" value="不可修改" disabled="disabled" readonly="readonly">
							</c:if>
							<br>
							<button type="button" name="checkBttn" class="checkfyBttn" data-toggle="modal" data-target="#myModalCheck">
	  							查看
							</button>
							<input type="button" name="deleteBtnn" class="deleteBtnn" id="deleteBtnn" value="删除"/>
						</td>
					</tr>
				</c:forEach>
				<!-- Modal -->
				<div class="modal fade" id="myModalCheck" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				      </div>
				      <div class="modal-body">
				      	<p>简历名称：<input type="text" name="resumeNameCheck"/></p>
						<p>学　　历: <input type="text" name="educationCheck" value="${user1.education}"></p>
						<p>姓　　名：<input type="text" name="userNameCheck" value="${user1.userName}"></p>
						<p>外语水平：<input type="text" name="foreignLevelCheck" value="${user1.foreignLevel}"></p>
						<p>性　　别：<input type="text" name="sexCheck" value="${user1.sex}"></p>
						<p>出生年月：<input type="text" name="birthCheck" value="${user1.birth}"></p>
						<p>民　　族：<input type="text" name="nationCheck" value="${user1.nation}"></p>
						<p>政治面貌：<input type="text" name="politicalLandscapeCheck" value="${user1.politicalLandscape}"></p>
						<p>婚姻状况：<input type="text" name="marriageCheck" value="${user1.marriage}"></p>
						<p>电　　话：<input type="text" name="mobileCheck" value="${user1.mobile}"></p>
						<p>邮　　箱：<input type="text" name="emailCheck" value="${user1.email}"></p>
						<p>毕业院校：<input type="text" name="graduateSchoolCheck" value="${user1.graduateSchool}"></p>
						<p>应聘职位：<input type="text" name="jobIntensionCheck"></p>
						<p>教育背景：<textarea cols="70" rows="10" name="resumeEducationCheck"></textarea></p>
						<p>工作经历：<textarea cols="70" rows="10" name="workExperienceCheck"></textarea></p>
						<!-- <p>技能证书：<textarea cols="70" rows="10" name="skillsertificateCheck"></textarea></p> -->
						<p>自我评价：<textarea cols="70" rows="10" name="selfAssessmentCheck"></textarea></p>				
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				<!-- Modal -->
				<div class="modal fade" id="myModalModify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				      </div>
				      <div class="modal-body">
				      	<input type="hidden" name="resumeIdModify"/>
				      	<p>简历名称：<input type="text" name="resumeNameModify"/></p>
						<p>学　　历: <input type="text" name="educationModify" value="${user1.education}"></p>
						<p>姓　　名：<input type="text" name="userNameModify" value="${user1.userName}"></p>
						<p>外语水平：<input type="text" name="foreignLevelModify" value="${user1.foreignLevel}"></p>
						<p>性　　别：<input type="text" name="sexModify" value="${user1.sex}"></p>
						<p>出生年月：<input type="text" name="birthModify" value="${user1.birth}"></p>
						<p>民　　族：<input type="text" name="nationModify" value="${user1.nation}"></p>
						<p>政治面貌：<input type="text" name="politicalLandscapeModify" value="${user1.politicalLandscape}"></p>
						<p>婚姻状况：<input type="text" name="marriageModify" value="${user1.marriage}"></p>
						<p>电　　话：<input type="text" name="mobileModify" value="${user1.mobile}"></p>
						<p>邮　　箱：<input type="text" name="emailModify" value="${user1.email}"></p>
						<p>毕业院校：<input type="text" name="graduateSchoolModify" value="${user1.graduateSchool}"></p>
						<p>应聘职位：<input type="text" name="jobIntensionModify"></p>
						<p>教育背景：<textarea cols="70" rows="10" name="resumeEducationModify"></textarea></p>
						<p>工作经历：<textarea cols="70" rows="10" name="workExperienceModify"></textarea></p>
						<!-- <p>技能证书：<textarea cols="70" rows="10" name="skillsertificateModify"></textarea></p> -->
						<p>自我评价：<textarea cols="70" rows="10" name="selfAssessmentModify"></textarea></p>				
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="button" id="saveResumeModify" class="btn btn-default" data-dismiss="modal">保存</button>
				      </div>
				    </div>
				  </div>
				</div>
			</table>
		</div>
	</div>

	<div id="inter">
		<table border="1" cellspacing="0" id="interviewTable">
			<tr>
				<td>应聘职位</td>
				<td>确认面试</td>
				<td>面试是否通过</td>
				<td>录用</td>
				<td>确认入职</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${listInterview}" var="interview">
				<tr>
					<td>${interview.resume.jobIntension}</td>
					<c:if test="${interview.confirmInterview==0}">
						<td>未确认</td>
					</c:if>
					<c:if test="${interview.confirmInterview==1}">
						<td>已确认</td>
					</c:if>
					<c:if test="${interview.interviewPass==0}">
						<td>未通过</td>
					</c:if>
					<c:if test="${interview.interviewPass==1}">
						<td>通过</td>
					</c:if>
					<c:if test="${interview.employed==0}">
						<td>未录用</td>
					</c:if>
					<c:if test="${interview.employed==1}">
						<td>已录用</td>
					</c:if>
					<c:if test="${interview.entry==0}">
						<td>未入职</td>
					</c:if>
					<c:if test="${interview.entry==1}">
						<td>已入职</td>
					</c:if>
					<td>
						<input type="hidden" name="interviewId" value="${interview.interviewId}">
						<input type="hidden" name="userId" value="${interview.userId}">
						<input type="hidden" name="resumeId" value="${interview.resumeId}">
						<input type="button" class="checkScore" data-toggle="modal" data-target=".bs-example-modal-lg-score" value="查看分数">
						<input type="button" class="confInterview" value="面试">
						<input type="button" class="entry" value="入职">
					</td>
				</tr>
			</c:forEach>
			<div class="modal fade bs-example-modal-lg-score" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
				  <div class="modal-dialog modal-lg" role="document">
				    <div class="modal-content" style="text-align: center;"><br>
				      <br>
				      	<p>笔试分数：<input type="text" name="writeScore"></p>
				      	<p>面试分数：<input type="text" name="interviewScore"></p>
				      	<p>总分数：<input type="text" name="totalScore"/></p>
				      <br>
				      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				    	<br><br>
				    </div>
				  </div>
				</div>
		</table>
	</div>
</body>
</html>