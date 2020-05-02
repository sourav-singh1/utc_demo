package com.example.utc.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.utc.model.Employee;

@Controller
public class EmployeeController {
	
	@GetMapping("/")
	public String home() {
		return "home";

	}

	@PostMapping("/registration")
	public String preview(@ModelAttribute("employee") Employee emp, Map<String, Object> model) {
		System.out.println(emp.getEmpName());

		return "login";

	}

	@GetMapping("/login")
	public String login(Model model) {
		Employee employee = new Employee();
		model.addAttribute("employee", employee);
		model.addAttribute("title", "Login Page");
		return "login";

	}

	@GetMapping("/directory")
	public String directory(Employee employee) {
		return "directory";
	}
}
