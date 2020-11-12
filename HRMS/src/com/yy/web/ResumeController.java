package com.yy.web;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.yy.entity.Resume;
import com.yy.entity.User;
import com.yy.service.InterviewService;
import com.yy.service.ResumeService;
import com.yy.service.UserService;

import oracle.net.aso.e;

@Controller
public class ResumeController {

	@Autowired
	private ResumeService resumeService;
	
	@Autowired
	private UserService userService; 
	
	@Autowired
	private InterviewService interviewService;
	
	@ResponseBody
	@RequestMapping("/inputResume")
	public String addResume(Resume resume,User user, HttpSession session) {
		 Resume resu = null;
		 User u=(User) session.getAttribute("user1");
		 resume.setUserId(u.getUserId());
		 user.setUserId(u.getUserId());
		if (resumeService.addResume(resume, user)) {
			List<Resume> list = resumeService.queryAllResume();
			if (list.size() != 0) {
				resu = list.get(list.size() - 1);
			}
		}
		
		return JSONObject.toJSONString(resu);
	}
	
	@ResponseBody
	@RequestMapping("/deleResume")
	public String deleteResume(int resumeId) {
		if (resumeService.deleteResumeByResumeId(resumeId)) {
			return "true";
		}
		return "false";
	}
	
	/**
	 * 投递简历
	 * @param resumeId 传入简历ID
	 * @return 
	 */
	@ResponseBody
	@RequestMapping("/deliveryResume")
	public String deliveryResume(Resume resume) {
		if (resume == null) {
			return "false";
		}
		if (resumeService.modifyResume(resume)) {
			
			return "true";
		}else {
			return "false";
		}
	}
	
	@ResponseBody
	@RequestMapping("/modifyResume.action")
	public String modifyResume(int resumeId) {
		Resume resume = resumeService.queryResumeByResumeId(resumeId);
		return JSONObject.toJSONString(resume);
	}
	
	@ResponseBody
	@RequestMapping("/checkfyResume.action")
	public String checkfyResume(int resumeId) {
		if (resumeId == 0) {
			return null;
		}
		Resume resume = resumeService.queryResumeByResumeId(resumeId);
		
		return JSONObject.toJSONString(resume);
	}
	
	/*@ResponseBody
	@RequestMapping("/checkResume")
	public String checkResume(int resumeId) {
		Resume resume = resumeService.queryResumeByResumeId(resumeId);
		return JSONObject.toJSONString(resume);
	}*/
	
	@ResponseBody
	@RequestMapping("/saveResumeModify.action")
	public String saveResumeModify(Resume resume, User user, HttpSession session) {
		 Resume resu = null;
		 User u=(User) session.getAttribute("user1");
		 resume.setUserId(u.getUserId());
		 user.setUserId(u.getUserId());
		 if (resumeService.updateResume(resume) && userService.updateUserByUser(user)) {	 
			 return "true";
		}else {
			return "false";
		}
	}
	
	/**
	 * 管理员查看应聘者简历
	 * @param resumeId
	 * @param userId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkResume.action")
	public String checkResume(Resume resume) {
		if (resume == null) {
			return null;
		}
		Resume res = resumeService.queryResumeByResumeIdAndUserId(resume);
		if (res != null) {
			return JSONObject.toJSONString(res);
		}else {
			return null;
		}
		
	}
}
