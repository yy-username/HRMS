package com.yy.entity;

import java.util.List;

public class Pagination<T> {
	private int pageSize;//每页显示的记录条数（自己设定）
	private int totalRecord;//总记录数（sql语句查询获取，传入）
	private int current;//当前页面的页数号（传入）
	private List<T> resultList;//当前页面显示的内容（传入）
	
	private int totalPage;//总页数（计算得到）
	private boolean firstPage;//是否是首页（计算）
	private boolean lastPage;//是否是尾页（计算）
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalRecord / pageSize + (totalRecord % pageSize > 0 ? 1 : 0);
	}
	
	public int getCurrent() {
		return current;
	}
	public void setCurrent(int current) {
		this.current = current;
	}
	public boolean isFirstPage() {
		return current == 1 ? true : false;
	}
	
	public boolean isLastPage() {
		return current == totalPage ? true : false;
	}
	
	public List<T> getResultList() {
		return resultList;
	}
	public void setResultList(List<T> resultList) {
		this.resultList = resultList;
	}
	
	
}
