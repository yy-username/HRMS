<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工首页</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script type="text/javascript" src="js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<style type="text/css">
	tr{height: 40px;}
	td{width: 200px;}
	table{text-align: center;}
</style>
<script type="text/javascript">	
	$(function () {
		$('#myTabs a').click(function (e) {
			e.preventDefault();
			$(this).tab('show');
		})
		
		function showChange(){
	    		if($("#change").text()=="修改"){
	    			//显示输入框
	    			$("#change").text("确认修改");
	    			$(".modify_info").prev("td").hide();
	        		$(".modify_info").show();	
	    		}else{
	    			//确认修改
	    			$.ajax({
	    				url: "changeInfo.action",
	    				type: "post",
	    				data: {
	    					idNo: $("#idNo").val(),
	    					mobile:$("#mobile").val(),
	    					email:$("#email").val()
	    				},
	    				dataType: "text",
	    				success:function(data){
	    					if(data!=""){
	    						alert(data);
	    						return;
	    					}
	    					//更新成功，刷新页面
	    					$("#idNo").parent().prev().text($("#idNo").val());
	    					$("#mobile").parent().prev().text($("#mobile").val());
	    					$("#email").parent().prev().text($("#email").val());
	    					//隐藏输入框所在的td，显示前一个td
	    					$(".modify_info").hide();
	    					$(".modify_info").prev().show();
	    					
	    					$("#change").text("修改");
	    				}
	    			});
	    		}
	    	}
		
		/* 上班打卡 */
		$("#wt").click(function () {
			var w = $(this)
			if (confirm("请确认是否打卡")) {
				$.ajax({
					url : "clockIn.action",
					type : "post",
					dataType : "json",
					data : {
						attendanceId : $("input[name=hidden]").val()
					},
					success : function (data) {
						if (data != null) {
							var input = "<br>"+
								"<input type='button' class='btn btn-primary btn-lg' id='aw' value='下班打卡'>";

							w.remove();
							$("#inClockTime").text(data.inClockTime);
							$("#inClockTime").append(input);
						}
					}
				});
			}
		})
		
		/* 下班打卡 */
		$("#aw").click(function () {
			var a = $(this)
			if (confirm("确认下班打卡？")) {
				$.ajax({
					url : "clockOut.action",
					type : "post",
					dataType : "json",
					data : {
						attendanceId : $("input[name=hidden]").val()
					},
					success : function (data) {
						if (data != null) {
							a.remove();
							$("#outClockTime").text(data.outClockTime);
						}
					}
				})
			}
		})
		
		
		$("#checkTrainDetailTable").on("click", "input[name=checkTrainDetail]", function () {
			var ctd = $(this)
			$.ajax({
				url : "checkTrainDetail.action",
				type : "post",
				dataType : "json",
				data : {
					trainId : ctd.parent().children().eq(0).val()
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
		
		
		$("#checkAttendanceRecord").click(function () {
			$("#attrTable").hide();
			$.ajax({
				url : "checkAttendanceRecord.action",
				type : "post",
				dataType : "json",
				data : {
					userId : $("input[name=userIdHidden]").val(),
					startTime : $("input[name=startTime]").val(),
					endTime : $("input[name=endTime]").val(),
				},
				success : function (data) {
					if (data != null) {
						for (var i = 0; i < data.length; i++) {
							var table = "<br><br>"+
							"<table border='1' cellspacing='0' id='addTable'>"+
								"<tr>"+
									"<td>ID</td>"+
									"<td>上班时间</td>"+
									"<td>上班打卡时间</td>"+
									"<td>下班时间</td>"+
									"<td>下班打卡时间</td>"+
									"<td>记录创建时间</td>"+
								"</tr>"+
								"<c:forEach items='data[i]' var='attendance'>"+
									"<tr>"+
										"<td>"+data.attendanceId+"</td>"+
										"<td>"+data.officeHours+"</td>"+
										"<td>"+data.inClockTime+"</td>"+
										"<td>"+data.overOfficeHours+"</td>"+
										"<td>"+data.outClockTime+"</td>"+
										"<td>"+data.createTime+"</td>"+
									"</tr>"+
								"</c:forEach>"+
							"</table><br>";
				
							$("#foot").before(table);
						}
					}
				}
			})
		})
	})
	
</script>
</head>
<body>
	<br/>
	<ul class="nav nav-tabs" role="tablist">
	  <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">考勤打卡</a></li>
	  <li role="presentation"><a href="#attendance" aria-controls="attendance" role="tab" data-toggle="tab">考勤记录</a></li>
	  <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">奖惩信息</a></li>
	  <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">个人薪资</a></li>
	  <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">相关培训信息</a></li>
	  <li role="presentation"><a href="#personal" aria-controls="personal" role="tab" data-toggle="tab">个人信息</a></li>
	</ul>
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="home">
			<div>
				<input type="hidden" name="hidden" value="${attendance.attendanceId}"/>
				<c:if test="${attendance.puchIn==0}">
					<input type="button" class="btn btn-primary btn-lg" id="wt" value="上班打卡">
				</c:if>
				<div>上班打卡时间：<span id="inClockTime">${attendance.inClockTime}</span></div>
				<c:if test="${attendance.puchIn==1&&attendance.punchOut==0}">
					<input type="button" class="btn btn-primary btn-lg" id="aw" value="下班打卡">
				</c:if>
				<div>下班打卡时间：<span id="outClockTime">${attendance.outClockTime}</span></div>
			</div>
		</div>
		<div role="tabpanel" class="tab-pane" id="attendance">
			<br/>
			<input type="hidden" name="userIdHidden" value="${user1.userId}"/>
			<input type="date" name="startTime"/>——<input type="date" name="endTime">&nbsp;<input type="button" class="btn btn-default" id="checkAttendanceRecord" value="查询"/>
			<br/><br>
			<table border="1" cellspacing="0" id="attrTable">
				<tr>
					<td>ID</td>
					<td>上班时间</td>
					<td>上班打卡时间</td>
					<td>下班时间</td>
					<td>下班打卡时间</td>
					<td>记录创建时间</td>
				</tr>
				<c:forEach items="${listAttendance}" var="attendance">
					<tr>
						<td>${attendance.attendanceId}</td>
						<td>${attendance.officeHours}</td>
						<td>${attendance.inClockTime}</td>
						<td>${attendance.overOfficeHours}</td>
						<td>${attendance.outClockTime}</td>
						<td>${attendance.createTime}</td>
					</tr> 
				</c:forEach>
			</table><br>
			<div id="foot" style="font-size: 1.5em;text-align: center;"><span>${user1.userName}考勤详情表</span></div>
		</div>
		<!-- 奖惩 -->
		<div role="tabpanel" class="tab-pane" id="profile">
			<table border="1" cellspacing="0" style="margin: 50px 100px;">
				<tr>
					<td>员工姓名</td>
					<td>迟到、早退次数</td>
					<td>迟到、早退扣款</td>
					<td>记录创建时间</td>
				</tr>
				<c:forEach items="${listFin}" var="fine">
					<tr>
						<td>${fine.user.userName}</td>
						<td>${fine.lateLeaveEarly}</td>
						<td>${fine.lateEarlyMoney}</td>
						<td>${fine.createTime}</td>
					</tr>
				</c:forEach>
			</table>
		<h4 style="text-align: center;">备注：奖惩详情表</h4>
		</div>
		<!-- 薪资 -->
		<div role="tabpanel" class="tab-pane" id="messages">
			<div>
				<table border="1" cellspacing="0" style="margin: 50px 100px;">
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
					</tr>
					<c:forEach items="${personalSalary}" var="salary">
						<tr>
							<td>${user1.userName}</td>
							<td>${salary.baseSalary}</td>
							<td>${salary.trafficAllowance}</td>
							<td>${salary.communicationAllowance}</td>
							<td>${salary.performanceBonus}</td>
							<td>${salary.fine.totalFine}</td>
							<td>${salary.endowmentInsurance}</td>
							<td>${salary.medicalInsurance}</td>
							<td>${salary.unemploymentInsurance}</td>
							<td>${salary.injuryInsurance}</td>
							<td>${salary.birthInsurance}</td>
							<td>${salary.housingFund}</td>
							<td>${salary.totalSalary}</td>
							<td>${salary.createTime}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- 培训信息 -->
		<div role="tabpanel" class="tab-pane" id="settings" style="margin: 50px 300px;">
			<table border="1" cellspacing="0" id="checkTrainDetailTable">
				<tr>
					<td>标题</td>
					<td>内容</td>
					<td>发布时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${listTrain}" var="train">
					<tr>
						<td>${train.trainName}</td>
						<td>${train.trainContent}</td>
						<td>${train.releaseTime}</td>
						<td>
							<input type="hidden" name="trainId" value="${train.trainId}"/>
							<input type="button" name="checkTrainDetail" class="btn btn-primary" data-toggle="modal" data-target="#checkTrainDetail" value="查看详情"/>
						</td>
					</tr>
				</c:forEach>
				<div class="modal fade" id="checkTrainDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content" style="text-align: center;"><br/>
				      <p>ID：<input type="text" name="trainIdCheck" disabled="disabled" readonly="readonly"/></p>
				      <p>标题：<input type="text" name="trainNameCheck" disabled="disabled" readonly="readonly"/></p>
				      <p>内容：<textarea name="trainContentCheck" disabled="disabled" readonly="readonly"></textarea></p>
				      
				      <p>
				      	<input type="button" class="btn btn-default" data-dismiss="modal" value="关闭">
				      </p>
				    </div>
				  </div>
				</div>
			</table>
		</div>
		<!-- 个人信息 -->
		<div role="tabpanel" class="tab-pane" id="personal">
			<br/><br/><br/>
			<div>
				<div class="mem_t">账号信息&nbsp;&nbsp;<!-- <a href="javascript:showChange();" id="change">修改</a> --></div>
				<table border="0" class="acc_tab" style="width:870px;" cellspacing="0" cellpadding="0">
					<tr>
						<td class="td_l">用户ID： </td>
						<td>
							${user1.userId}
						</td>
					</tr>
					<tr>
						<td class="td_l">用户真实姓名： </td>
						<td>
							${user1.userName}
						</td>
					</tr>
					<tr>
						<td class="td_l b_none">身份证号：</td>
						<td>
							${user1.IDCard}
						</td>
					</tr>
					<tr>
						<td class="td_l b_none">电  话：</td>
						<td>${user1.mobile}</td>
					</tr>
					<tr>
						<td class="td_l">邮   箱： </td>
						<td>${user1.email}</td>
					</tr>
					<tr>
						<td class="td_l b_none">注册时间：</td>
						<td>${user1.createTime}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>