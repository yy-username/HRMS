package com.yy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.dao.DeptDao;
import com.yy.entity.Dept;
import com.yy.service.DeptService;

@Service
public class DeptServiceImpl implements DeptService {

	@Autowired
	private DeptDao deptDao;
	
	/**
	 * 添加部门
	 */
	@Override
	public boolean addDept(Dept dept) {
		
		if (deptDao.queryDeptByDeptName(dept.getDeptName()) == null) {
			return deptDao.addDept(dept);
		}
		return false;
	}

	/**
	 * 通过部门ID查找部门
	 */
	@Override
	public Dept queryDeptByDeptId(int deptId) {
		
		return deptDao.queryDeptByDeptId(deptId);
	}

	
	/**
	 * 遍历部门表
	 */
	@Override
	public List<Dept> queryAllDept() {
		
		return deptDao.queryAllDept();
	}

	/**
	 * 通过部门名称查找部门
	 */
	@Override
	public Dept queryDeptByDeptName(String deptName) {
	
		return deptDao.queryDeptByDeptName(deptName);
	}

	/**
	 * 通过部门ID删除部门
	 * 
	 */
	@Override
	public boolean deleteDeptByDeptId(int deptId) {
		
		return deptDao.deleteDeptByDeptId(deptId);
		/*try {
			deptDao.deleteDeptByDeptId(deptId);
		}catch (Exception e) {
//			e.printStackTrace();
		}
		return false;*/
	}

	@Override
	public boolean updateDept(Dept dept) {
		
		return deptDao.updateDept(dept);
		
	}

	@Override
	public boolean deleteAllDept() {

		return deptDao.deleteAllDept();
	}

}
