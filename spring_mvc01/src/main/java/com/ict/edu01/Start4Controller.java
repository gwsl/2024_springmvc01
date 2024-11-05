package com.ict.edu01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Start4Controller {
	
	@PostMapping("/start4")
	// @GetMapping("/start4") 포스트 방식이라 오류남
	public ModelAndView test01() {
		ModelAndView mv = new ModelAndView("day01/result4");
			String[] carName = {"제네시스", "k9", "그랜저", "k7"};
			mv.addObject("carName", carName);
		return mv;
	}
}