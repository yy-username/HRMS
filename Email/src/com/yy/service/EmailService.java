package com.yy.service;

import java.util.List;

import com.yy.entity.Email;

public interface EmailService {
	List<Email> queryMailList(String recipient);
}
