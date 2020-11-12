package com.yy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.CompanyDao;
import com.yy.entity.Company;
import com.yy.service.CompanyService;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyDao companyDao;
	
	/**
	 * 添加公司
	 */
	@Override
	public boolean addCompany(Company company) {
		
		return companyDao.addCompany(company);
	}

	/**
	 * 遍历所有公司
	 */
	@Override
	public List<Company> queryAllCompany() {
		
		return companyDao.queryAllCompany();
	}

	/**
	 * 查找公司
	 */
	@Override
	public Company queryCompany() {
		
		return companyDao.queryCompany();
	}

}
