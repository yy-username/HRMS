package com.yy.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.yy.entity.Recruitment;
import com.yy.entity.ResumeRecruitment;
import com.yy.service.RecruitmentService;
import com.yy.service.ResumeRecruitmentService;

@Controller
public class RecruitmentController {
	
	@Autowired
	private RecruitmentService recruitmentService;
	
	@Autowired
	private ResumeRecruitmentService resumeRecruitmentService;
	
	/**
	 * 添加招聘信息
	 * @param recruitment 传入招聘信息对象
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/saveRecruitment")
	public String addRecruitment(Recruitment recruitment) {
		Recruitment recruit = null;
		if (recruitmentService.addRecruitmentInfo(recruitment)) {
			List<Recruitment> list = recruitmentService.queryAllRecruitmentInfo();
			if(list.size() != 0) {
				recruit = list.get(list.size() - 1);
			}
		}
		
		return JSONObject.toJSONString(recruit);
	}
	
	/**
	 * 发布招聘信息
	 * @param recruitId 传入招聘信息ID
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/releaseInfo.action")
	public String release(int recruitId) {
		if (recruitId == 0) {
			return "false";
		}
		if (recruitmentService.updateByRecruitmentId(recruitId)) {
			return "true";
		}else {
			return "false";
		}
		
	}
	
	/**
	 * 删除单条招聘信息
	 * @param recruitmentId 传入招聘信息ID
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteInfo")
	public String deleteSingle(int recruitmentId) {
		
		if (recruitmentService.deleteByRecruitmentId(recruitmentId)) {
			return "true";
		}
		return "false";
	}
	
	/**
	 * 修改招聘信息
	 * @param recruitmentId 传入招聘信息ID
	 * @return
	 */
	/*@ResponseBody
	@RequestMapping("/modifyInfo")
	public String modifyInfo(int recruitmentId) {
		Recruitment recruitment = null;
		if (recruitmentService.updateRecruitmentInfoByRecruitmentId(recruitmentId)) {
			recruitment = recruitmentService.queryRecruitmentInfoByRecruitmentId(recruitmentId);
		}
		return JSONObject.toJSONString(recruitment);
	}
	
	@ResponseBody
	@RequestMapping("/queryInfo")
	public String queryInfo(int recruitId) {
		Recruitment recruitment = null;
		recruitment = recruitmentService.queryRecruitmentInfoByRecruitmentId(recruitId);
		return JSONObject.toJSONString(recruitment);
	}
	
	
	@ResponseBody
	@RequestMapping("/recruitmentDetial")
	public String recruitmentDetial(Integer recruitmentId, Model model) {
		
		Recruitment recruitment = null;
		recruitment = recruitmentService.queryRecruitmentInfoByRecruitmentId(recruitmentId);
		model.addAttribute("recruitmentInfo", recruitment);
		return "recruitmentDetails";
	}
	
	
	@ResponseBody
	@RequestMapping("/checkRecruitment")
	public String checkResume(int resumeId) {
		ResumeRecruitment resumeRecruitment = resumeRecruitmentService.queryRecruitment(resumeId);
		int recruitmentId;
		Recruitment recruitment = null;
		if (resumeRecruitment != null) {
			recruitmentId = resumeRecruitment.getRecruitmentId();
			recruitment = recruitmentService.queryRecruitmentInfoByRecruitmentId(recruitmentId);
		}
		
		return JSONObject.toJSONString(recruitment);
	}*/
	
	/**
	 * 查看招聘信息
	 * @param recruitmentId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkRecruitment.action")
	public String checkRecruitment(int recruitmentId) {
		if (recruitmentId == 0) {
			return null;
		}
		Recruitment recruitment = recruitmentService.queryRecruitmentInfoByRecruitmentId(recruitmentId);
		return JSONObject.toJSONString(recruitment);
	}
	
	/**
	 * 修改招聘信息
	 * @param recruitment
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/modifyRecruitment.action")
	public String modifyRecruitment(Recruitment recruitment) {
		if (recruitment == null) {
			return "false";
		}
		
		if (recruitmentService.updateByRecruitment(recruitment)) {
			return "true";
		}else {
			return "false";
		}
		
	}
}
