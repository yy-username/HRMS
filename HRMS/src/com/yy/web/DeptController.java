package com.yy.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.yy.entity.Dept;
import com.yy.entity.User;
import com.yy.service.DeptService;
import com.yy.service.PositionService;
import com.yy.service.UserService;

@Controller
public class DeptController {

	@Autowired
	private DeptService deptService;
	
	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping("/saveDept")
	public String addDept(Dept dept) {
		Dept deptLast = null;
		if (deptService.addDept(dept)) {
			List<Dept> listDept = deptService.queryAllDept();
			deptLast = listDept.get(listDept.size() - 1);
		}
		return JSONObject.toJSONString(deptLast);
	}
	
	@ResponseBody
	@RequestMapping("/checkDept")
	public String modiftDept(int deptId) {
		
		Dept dep = null;
		if (deptId != 0) {
			dep = deptService.queryDeptByDeptId(deptId);
		}
		
		return JSONObject.toJSONString(dep);
	}
	
	@RequestMapping("/modify")
	public String modifyDept(Dept dept) {
		deptService.updateDept(dept);
		return "adminHome";
	}
	
	@ResponseBody
	@RequestMapping("/deleteDept")
	public String deleteDept(int deptId) {
		
		//通过部门ID在用户表中查找用户，找不到删除，找到不删
		List<User> list = userService.queryUserByDeptId(deptId);
		if (list.size() == 0) {
			if (deptService.deleteDeptByDeptId(deptId)) {
				return "true";
			}
		}
		return "false";
	}
	
	@ResponseBody
	@RequestMapping("/modifyDept.action")
	public String modifyDeptAction(Dept dept) {

		List<User> list = null;
		if (dept != null) {
			//通过部门ID在用户表中查找用户，找不到可以修改，找到不可以修改
			list = userService.queryUserByDeptId(dept.getDeptId());
			if (list.size() == 0) {
				if (deptService.updateDept(dept)) {
					return "true";
				}
			}
		}
		return "false";
	}
	
}
