package com.yy.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.yy.entity.Position;
import com.yy.entity.User;
import com.yy.service.PositionService;
import com.yy.service.UserService;

@Controller
public class PositionController {

	@Autowired
	private PositionService positionService;
	
	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping("/addPosition")
	public String addPosition(Position position) {
		Position p = null;
		if (position != null) {
			if (positionService.addPosition(position)) {
				List<Position> list = positionService.queryAllPosition();
				p = list.get(list.size() - 1);
			}
		}
		return JSONObject.toJSONString(p);
	}
	
	@ResponseBody
	@RequestMapping("/deletePosition")
	public String deletePosition(int positionId) {
		
		if (positionId == 0) {
			return "false";
		}
		
		List<User> list = userService.queryUserByPositionId(positionId);
		
		if (list.size() == 0) {
			if (positionService.deletePositionByPositionId(positionId)) {
				return "true";
			}
		}
		return "false";
	}
	
	@ResponseBody
	@RequestMapping("/checkPositionById")
	public String checkPositionById(int positionId) {
		Position position = null;
		if (positionId != 0) {
			position = positionService.queryPositionById(positionId);
		}
		return JSONObject.toJSONString(position);
	}
	
	@ResponseBody
	@RequestMapping("/modifyPosition.action")
	public String modifyPosition(Position position) {
		Position p = null;
		List<User> list = null;
		if (position != null) {
			list = userService.queryUserByPositionId(position.getPositionId());
			if (list.size() == 0) {
				if (positionService.updatePosition(position)) {
					p = positionService.queryPositionById(position.getPositionId());
				}
			}	
		}
		return JSONObject.toJSONString(p);
	}
}
