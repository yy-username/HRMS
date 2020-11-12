package com.yy.service;

import java.util.List;

import com.yy.entity.Company;

public interface CompanyService {

	//添加公司
	boolean addCompany(Company company);
	
	//查找所有的公司
	List<Company> queryAllCompany();
	
	//查找公司
	Company queryCompany();
}
