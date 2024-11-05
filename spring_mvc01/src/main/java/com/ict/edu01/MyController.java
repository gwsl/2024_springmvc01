package com.ict.edu01;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyController {
	
	@GetMapping("/start5")
	public ModelAndView test01() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("day01/result5");
		mv.addObject("msg", "Hello");
		return mv;
	}
	@GetMapping("/start6")
	public ModelAndView test02(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("day01/result5");
		mv.addObject("msg", "Hi~~");
		
		return mv;
	}
	@GetMapping("/start7")
	public ModelAndView test03(HttpServletRequest request) {
		request.setAttribute("msg", "안녕하세요~");
		return new ModelAndView("day01/result5");
	}
	@PostMapping("/start8")
	public ModelAndView test04(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("day01/result8");
			String username = request.getParameter("username");
			String userage = request.getParameter("userage");
			
			mv.addObject("username", username);
			mv.addObject("userage", userage);
		return mv;
	}
	@PostMapping("/start9")
	public ModelAndView test05(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("day01/result8");
		String s1 = request.getParameter("s1");
		String s2 = request.getParameter("s2");
		String op = request.getParameter("op");
		int num1 = Integer.parseInt(s1);
		int num2 = Integer.parseInt(s2);
		String result = "";
		double nresult = 0.0;
		if(num2 == 0) {
			result = "error";
		}else {
		switch (op) {
		case "+": nresult = num1 + num2; break;
		case "-": nresult = num1 - num2; break;
		case "*": nresult = num1 * num2; break;
		case "/": nresult = (double)num1 / num2; break;
		}
		result = ""+(nresult);
		}
		
		mv.addObject("s1", s1);
		mv.addObject("s2", s2);
		mv.addObject("op", op);
		mv.addObject("result", result);
		return mv;
	}
	
}
