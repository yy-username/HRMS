package com.yy.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yy.service.SalaryService;

@Controller
public class SalaryController {

	@Autowired
	private SalaryService salaryService;
	
	
}
