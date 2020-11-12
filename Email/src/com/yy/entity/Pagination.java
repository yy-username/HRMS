package com.yy.entity;

import java.util.List;

public class Pagination<T> {
	private int pageSize;//ÿҳ��ʾ�ļ�¼�������Լ��趨��
	private int totalRecord;//�ܼ�¼����sql����ѯ��ȡ�����룩
	private int current;//��ǰҳ���ҳ���ţ����룩
	private List<T> resultList;//��ǰҳ����ʾ�����ݣ����룩
	
	private int totalPage;//��ҳ��������õ���
	private boolean firstPage;//�Ƿ�����ҳ�����㣩
	private boolean lastPage;//�Ƿ���βҳ�����㣩
	
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
