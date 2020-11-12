package com.yy.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.yy.entity.Interview;
import com.yy.service.InterviewService;

@Controller
public class InterviewController {

	@Autowired
	private InterviewService interviewService;
	
	@ResponseBody
	@RequestMapping("/sendInterview.action")
	public String addInterview(Interview interview) {
		if (interview == null) {
			return "false";
		}
		if (interviewService.addInterview(interview)) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@ResponseBody
	@RequestMapping("/confInterview.action")
	public String confInterview(int interviewId) {
		if (interviewId == 0) {
			return "false";
		}
		if (interviewService.updateConfirmInterview(interviewId)) {
			return "true";
		}else {
			return "false";
		}
	}
	
	/**
	 * 查看面试邀请
	 * @param interview
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkScore.action")
	public String checkScore(Interview interview) {
		if (interview == null) {
			return null;
		}
		Interview interv = interviewService.queryInterviewScore(interview);
		if (interv == null) {
			return null;
		}else {
			return JSONObject.toJSONString(interv);
		}
	}
	
	@ResponseBody
	@RequestMapping("/saveInterviewS.action")
	public String saveInterview(Interview interview) {
		if (interview == null) {
			return "false";
		}
		Interview inter = null;
		if (interviewService.updateInterviewScore(interview)) {
			inter = interviewService.queryInterviewScore(interview);
			if (interviewService.updateInterviewPass(interview.getInterviewId()) && inter.getTotalScore() > 70) {
				return "true";
			}else {
				return "false";
			}
			
		}else {
			return "false";
		}
	}
	
	@ResponseBody
	@RequestMapping("/employed.action")
	public String employed(Interview interview) {
		if (interview == null) {
			return "false";
		}
		if (interviewService.updateEmployed(interview)) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@ResponseBody
	@RequestMapping("/entry.action")
	public String entry(int interviewId) {
		if (interviewId == 0) {
			return "false";
		}
		if (interviewService.updateEntry(interviewId)) {
			return "true";
		}else {
			return "false";
		}
	}
}
