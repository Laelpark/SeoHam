package com.lael.infra.modules.shareHot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShareHotController {
	
	@RequestMapping (value = "/shareHot")
	public String main(Model model) throws Exception {
		return "infra/share/xdmin/shareHot";
	}
}