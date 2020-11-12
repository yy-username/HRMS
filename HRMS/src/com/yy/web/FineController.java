package com.yy.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONObject;
import com.yy.entity.Fine;
import com.yy.service.FineService;

@Controller
public class FineController {

	@Autowired
	private FineService fineService;
	
	/*奖惩记录*/
	public String fineList() {
		List<Fine> listFine = fineService.queryAllFine();
		return JSONObject.toJSONString(listFine);
	}
}
