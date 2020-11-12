package com.yy.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yy.entity.ResumeRecruitment;
import com.yy.service.ResumeRecruitmentService;

@Controller
public class ResumeRecruitmentController {

	@Autowired
	private ResumeRecruitmentService resumeRecruitmentService;
	
	@ResponseBody
	@RequestMapping("/submitResume")
	public String submitResume(ResumeRecruitment resumeRecruitment) {
		if (resumeRecruitmentService.addResumeRecruitment(resumeRecruitment)) {
			return "true";
		}
		return "false";
	}
}
