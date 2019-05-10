package pers.hmc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pers.hmc.bean.User;
import pers.hmc.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(@RequestParam String username, @RequestParam String password, Model model) {
		User user = userService.login(username);
		if(user != null) {
			if(user.getPassword().equals(password)) {
				return "page/page";
			}else {
				model.addAttribute("message", "登录失败！");
				return "page/loginInfo";
			}
		}else {
			model.addAttribute("message", "你输入的用户名或密码有误!");
			return "page/loginInfo";
		}
		
	}
	@RequestMapping("/index")
	public String index() {
		return "index";
		
	}
	@RequestMapping("/exit")
	public String exit() {
		return "index";
		
	}
	
}
