package com.yy.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yy.entity.Company;
import com.yy.service.CompanyService;

@Controller
public class CompanyController {

	@Autowired
	private CompanyService companyService;
	
	/*@RequestMapping("")
	public String queryCompany(HttpSession session) {
		Company company = companyService.queryCompany();
		session.setAttribute("company", company);
		return "";
	}*/
}
