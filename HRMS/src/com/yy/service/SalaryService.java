package com.yy.service;

import java.util.List;

import com.yy.entity.Salary;

public interface SalaryService {


	//添加工资(管理员)
	boolean addSalary(Salary salary);
	
	//查找工资(管理员)
	List<Salary> queryAllSalary();
	
	//查找工资(个人)
	List<Salary> queryPersonalSalary(int userId);
	
	//修改工资
	boolean updateSalary(Salary salary);
}
