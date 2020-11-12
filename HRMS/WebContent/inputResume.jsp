<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>简历表</title>
<style type="text/css">
		tr{height: 40px;}
		td{width: 200px;}
		input{width: 95%;}
		table{text-align: center;margin-left: 80px;}
		.button{text-align: center;}
		.foot{margin: 40px 240px;padding-top: 50px;width: 800px;height: 1000px;background-color:white;}
		.top{text-align: center;margin-top: 50px;}
		.tdd{text-align: center;width: 100px;}
		.sex{width: 20%;}
</style>
</head>
<body style="background-color: #4E7181;">
	<form action="inputResume" method="post">
		<div class="top">
			<h1>个人简历</h1>
		</div>
		<div class="foot">
			<table border="1" cellspacing="0">
				<tr>
					<td colspan="2"><font color="red">(基本信息)</font></td>
					<td class="tdd">学　　历:</td>
					<td><input type="text" name="education"></td>
				</tr>
				<tr>
					<td align="right" class="tdd">姓　　名：</td>
					<td><input type="text" name="userName" placeholder="请填写真实姓名"></td>
					<td rowspan="4" colspan="2" class="button"><input type="file" name=""><br/>请上传一寸照片</td>
				</tr>
				<tr>
					<td align="right" class="tdd">外语水平：</td>
					<td><input type="text" name="foreignLevel"></td>
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
					<td><input type="date" name="birth"></td>
				</tr>
				<tr>
					<td align="right" class="tdd">民　　族：</td>
					<td><input type="text" name="nation"></td>
					<td align="right" class="tdd">政治面貌：</td>
					<td><input type="text" name="politicalLandscape"></td>
				</tr>
				<tr>
					<td align="right" class="tdd">婚姻状况：</td>
					<td>
						<span>未婚<input type="radio" name="marriage" checked="checked" class="sex"></span>
						<span>已婚<input type="radio" name="marriage" class="sex"></span>
					</td>
					<td align="right" class="tdd">电　　话：</td>
					<td><input type="text" name="mobile"></td>
				</tr>
				<tr>
					<td align="right" class="tdd">邮　　箱：</td>
					<td><input type="text" name="email"></td>
					<td align="right" class="tdd">毕业院校：</td>
					<td><input type="text" name="graduateSchool"></td>
				</tr>
				<tr>
					<td align="right" class="tdd">求职意向：</td>
					<td colspan="3"><input type="text" name=""></td>
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
					<td align="right" class="tdd">技能证书：</td>
					<td colspan="3">
						<textarea cols="70" rows="10" name="skillsertificate">
						
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
				<tr>
					<td colspan="4" style="height: 50px;" class="button">
						<button  type="submit">保存</button>
						<button type="reset">取消</button>
					</td>
				</tr>
			</table>
		</div>
	</form>	
</body>
</html>