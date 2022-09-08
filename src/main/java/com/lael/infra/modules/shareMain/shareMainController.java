package com.lael.infra.modules.shareMain;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class shareMainController {
	
	@RequestMapping(value = "/")
	public String main(Model model) throws Exception {
		return "infra/share/xdmin/shareMain";
	}
	
}