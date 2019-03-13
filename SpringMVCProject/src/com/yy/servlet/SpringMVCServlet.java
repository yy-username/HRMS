package com.yy.servlet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//把普通类变成有特定功能的类
//实现接口，继承类     加注解   通过配置文件配置
@Controller
@RequestMapping("/user")
public class SpringMVCServlet {

	@RequestMapping("/welcom")
	public String welcom() {
		return "success";
	}
}
