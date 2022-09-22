package com.lael.infra.modules.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping(value = "/memberForm")
	public String memberForm(Model model) throws Exception {
		return "infra/member/xdmin/memberForm";
	}
}
	