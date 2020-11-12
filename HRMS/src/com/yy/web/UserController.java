package com.yy.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.yy.entity.Attendance;
import com.yy.entity.Dept;
import com.yy.entity.Fine;
import com.yy.entity.Interview;
import com.yy.entity.Position;
import com.yy.entity.Recruitment;
import com.yy.entity.Resume;
import com.yy.entity.Salary;
import com.yy.entity.Train;
import com.yy.entity.User;
import com.yy.service.AttendanceService;
import com.yy.service.DeptService;
import com.yy.service.FineService;
import com.yy.service.InterviewService;
import com.yy.service.PositionService;
import com.yy.service.RecruitmentService;
import com.yy.service.ResumeService;
import com.yy.service.SalaryService;
import com.yy.service.TrainService;
import com.yy.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private DeptService deptService;
	
	@Autowired
	private PositionService positionService;
	
	@Autowired
	private ResumeService resumeService;
	
	@Autowired
	private RecruitmentService recruitmentService;
	
	@Autowired
	private TrainService trainService;
	
	@Autowired
	private AttendanceService attendanceService;
	
	@Autowired
	private InterviewService interviewService;
	
	@Autowired
	private FineService fineService;
	
	@Autowired
	private SalaryService salaryService;
	
	@RequestMapping("/")
	public String index() {
		
		return "index";
	}
	
	@RequestMapping("/exit")
	public String exit(Model model) {
		
		return "index";
	}
	
	@RequestMapping("/login")
	public String login(User user, Model model, HttpSession session) {
		List<Resume> resumeList = null;
		if (user == null) {
			return "index";
		}
		
		User u = userService.queryUserByNameAndPwd(user);
		List<User> employee = userService.queryEmployee();
		List<Dept> deptList = deptService.queryAllDept();
		if (u != null) {
			resumeList = resumeService.queryResumeByUserId(u.getUserId());
		}
		
		List<User> userList = userService.queryAllEmployee();
		List<Resume> resumeAllList = resumeService.queryAllResume();
		List<Recruitment> recruitmentList= recruitmentService.queryAllRecruitmentInfo();
		List<Position> positionList= positionService.queryAllPosition();
		List<Train> trainList = trainService.queryAllTrainInfo();
		List<Train> listTrain = trainService.queryReleaseTrainInfo();
		List<Attendance> attendanceList = attendanceService.queryAllAttendance();
		List<Fine> Finelist = fineService.queryAllFine();
		List<Fine> listFin = fineService.queryFine(u.getUserId());
 		List<Attendance> listAttendance = attendanceService.queryAttendance(u.getUserId());
		List<Interview> listInterview = interviewService.queryInterviewInfo(u.getUserId());
		List<Interview> allListInterview = interviewService.iteratorInterview();
		List<Salary> personalSalary = salaryService.queryPersonalSalary(u.getUserId());
		List<Salary> listSalary = salaryService.queryAllSalary();
		session.setAttribute("userList", userList);
		session.setAttribute("personalSalary", personalSalary);
		session.setAttribute("listSalary", listSalary);
		session.setAttribute("listFin", listFin);
		session.setAttribute("Finelist", Finelist);
		session.setAttribute("allListInterview", allListInterview);
		session.setAttribute("listInterview", listInterview);
		session.setAttribute("employeeList", employee);
		session.setAttribute("resumeAllList", resumeAllList);
		session.setAttribute("deptList", deptList);
		session.setAttribute("resumeList", resumeList);
		session.setAttribute("positionList", positionList);
		session.setAttribute("recruitmentList", recruitmentList);
		session.setAttribute("trainList", trainList);
		session.setAttribute("listTrain", listTrain);
		session.setAttribute("attendanceList", attendanceList);
		session.setAttribute("listAttendance", listAttendance);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		Attendance attendance = null;
		Fine fine = null;
		List<Attendance> list = null;
		List<Fine> listFine = null;
		/*if (u == null) {
			model.addAttribute("message", "用户名或密码错误");
			return "index";
		}*/
		
		/*用户session*/
		
		session.setAttribute("user1", u);
		if (u.getUserStatus() == 1) {
			
			return "homePage";
		}else if (u.getUserStatus() == 2) {
			list = attendanceService.queryAttendance(u.getUserId());
			/*listFine = fineService.queryFine(u.getUserId());
			if (listFine.size() > 0) {
				fine = listFine.get(listFine.size() - 1);
			}
			if (fine != null && fine.getCreateTime().substring(0, 10).equals(date.substring(0, 10))) {
				session.setAttribute("fine", fine);
			}else {
				if (fineService.addFine(u.getUserId())) {
					listFine = fineService.queryFine(u.getUserId());
					fine = listFine.get(listFine.size() - 1);
					session.setAttribute("fine", fine);
				}
			}*/
			if (list.size() > 0) {
				attendance = list.get(0);
			}
			
			if (attendance != null && attendance.getCreateTime().substring(0, 10).equals(date.substring(0, 10))) {
				session.setAttribute("attendance", attendance);
			}else {
				if (attendanceService.addAttendanceInfo(u.getUserId()) && fineService.addFine(u.getUserId())) {
					list = attendanceService.queryAttendance(u.getUserId());
					listFine = fineService.queryFine(u.getUserId());
					fine = listFine.get(listFine.size());
					session.setAttribute("fine", fine);
					attendance = list.get(0);
					session.setAttribute("attendance", attendance);
				}
			}
			return "employeeHome";
		}else if (u.getUserStatus() == 3){
			return "adminHome";
		}else {
			return "index";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("/checkNickName")
	public String checkNickName(User user) {
		
		if (userService.queryUserByUserName(user.getNickName()) == null) {
			return "true";
		}
		return "false";
	}
	
	@RequestMapping("/register")
	public String register(User user) {

		if (userService.addUser(user)) {
			return "index";
		}
		return "register";
	}
	
	@ResponseBody
	@RequestMapping("/addEmployee")
	public String addEmployee(User user, String deptName, String positionName) {
		
		User employee = null;
		int deptId = 0;
		int positionId = 0;
		Dept dep = deptService.queryDeptByDeptName(deptName);
		Position posit = positionService.queryPositionByPositionName(positionName);
		if (dep != null && posit != null) {
			deptId = dep.getDeptId();
			positionId = posit.getPositionId();
		}
		
		if (deptId != 0 && positionId != 0) {
			user.setDeptId(deptId);
			user.setPositionId(positionId);
		}
		
		if (userService.addEmployee(user)) {
			List<User> list = userService.queryEmployee();
			employee = list.get(list.size() - 1);
			return JSONObject.toJSONString(employee);
		}
		return null;
	}
	
	@ResponseBody
	@RequestMapping("/deleEmployee")
	public String deleEmployee(int userId) {
		if (userId == 0) {
			return "false";
		}
		if (userService.deleteUserById(userId)) {
			return "true";
		}
		return "false";
	}
	
	@ResponseBody
	@RequestMapping("/checkEmployee.action")
	public String checkEmployee(Integer userId) {
		
		if (userId != 0) {
			 
			return JSONObject.toJSONString(userService.queryUserByUserId(userId));
		}
		return null;
	}
	
	@ResponseBody
	@RequestMapping("/modifyEmpl.action")
	public String modifyEmpl(User user, String deptName, String positionName) {
		
		int deptId = 0;
		int positionId = 0;
		Dept dep = deptService.queryDeptByDeptName(deptName);
		Position posit = positionService.queryPositionByPositionName(positionName);
		if (dep != null && posit != null) {
			deptId = dep.getDeptId();
			positionId = posit.getPositionId();
		}
		
		if (deptId != 0 && positionId != 0) {
			user.setDeptId(deptId);
			user.setPositionId(positionId);
		}
		
		if (userService.updateEmployee(user)) {
			
			return "true";
		}
		return "false";
	}
}
