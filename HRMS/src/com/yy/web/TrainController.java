package com.yy.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.yy.entity.Train;
import com.yy.service.TrainService;

@Controller
public class TrainController {

	@Autowired
	private TrainService trainService;
	
	/**
	 * 增加培训信息
	 * @param train
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/saveTrain.action")
	public String saveTrain(Train train) {
		Train t = null;
		if (train != null) {
			if (trainService.addTrainInfo(train)) {
				List<Train> list = trainService.queryAllTrainInfo();
				t = list.get(list.size() - 1);
			}
		}
		return JSONObject.toJSONString(t);
	}
	
	/**
	 * 删除培训信息
	 * @param trainId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteTrain.action")
	public String deleteTrain(int trainId) {
		if (trainId != 0) {
			if (trainService.deleteTrainInfo(trainId)) {
				return "true";
			}
		}
		return "false";
	}
	
	/**
	 * 查看培训信息
	 * @param trainId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkTrain.action")
	public String checkTrain(int trainId) {
		if (trainId == 0) {
			return null;
		}
		Train train = trainService.queryTrainInfo(trainId);
		return JSONObject.toJSONString(train);
	}
	
	/**
	 * 修改培训信息
	 * @param train
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/saveModifyTrain.action")
	public String saveModifyTrain(Train train) {
		if (train == null) {
			return "false";
		}
		
		Train t = null;
		if (trainService.updateTrainInfo(train)) {
			t = trainService.queryTrainInfo(train.getTrainId());
		}
		return JSONObject.toJSONString(t);
	}
	
	/**
	 * 发布培训信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/releaseTrain.action")
	public String releaseTrain(int trainId) {
		if (trainId == 0) {
			return null;
		}
		Train train = null;
		if (trainService.updateTrainRelease(trainId)) {
			train = trainService.queryTrainInfo(trainId);
			return JSONObject.toJSONString(train);
		}else {
			return null;
		}
	}
	
	/**
	 * 员工查看已发布的培训信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkTrainDetail.action")
	public String checkTrainDetail(int trainId) {
		if (trainId == 0) {
			return null;
		}
		Train train = trainService.queryTrainInfo(trainId);
		return JSONObject.toJSONString(train);
	}
}
