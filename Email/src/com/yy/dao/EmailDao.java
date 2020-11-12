package com.yy.dao;

import java.util.List;

import com.yy.entity.Email;

public interface EmailDao {
	//根据收件人查找邮件列表
	List<Email> queryMailList(String recipient);
	
	//根据邮件ID查找邮件
	Email queryMail(int mailId);
}
