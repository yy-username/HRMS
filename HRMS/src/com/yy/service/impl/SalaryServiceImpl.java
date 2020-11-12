package com.yy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.SalaryDao;
import com.yy.entity.Salary;
import com.yy.service.SalaryService;

@Service
public class SalaryServiceImpl implements SalaryService {
	
	@Autowired
	private SalaryDao salaryDao;

	//添加工资(管理员)
	@Override
	public boolean addSalary(Salary salary) {

		if (salary == null) {
			return false;
		}
		return salaryDao.addSalary(salary);
	}

	//查找工资(管理员)
	@Override
	public List<Salary> queryAllSalary() {

		return salaryDao.queryAllSalary();
	}

	//查找工资(个人)
	@Override
	public List<Salary> queryPersonalSalary(int userId) {

		if (userId == 0) {
			return null;
		}
		return salaryDao.queryPersonalSalary(userId);
	}

	//修改工资
	@Override
	public boolean updateSalary(Salary salary) {

		if (salary == null) {
			return false;
		}
		return salaryDao.updateSalary(salary);
	}

}
