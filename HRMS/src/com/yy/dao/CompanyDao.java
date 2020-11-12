package com.yy.dao;

import java.util.List;

import com.yy.entity.Company;

public interface CompanyDao {

	//添加公司
	boolean addCompany(Company company);
	
	//查找所有的公司
	List<Company> queryAllCompany();
	
	//查找公司
	Company queryCompany();
	
	//通过公司ID查找公司
	Company queryCompanyById(int CompantId);
}
