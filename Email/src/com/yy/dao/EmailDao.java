package com.yy.dao;

import java.util.List;

import com.yy.entity.Email;

public interface EmailDao {
	//�����ռ��˲����ʼ��б�
	List<Email> queryMailList(String recipient);
	
	//�����ʼ�ID�����ʼ�
	Email queryMail(int mailId);
}
