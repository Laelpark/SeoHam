package com.lael.infra.modules.share;

import java.util.Locale;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShareController {
	
	
	/*
	 * private static final Logger logger =
	 * LoggerFactory.getLogger(shareController.class);
	 */
	 
	
	@RequestMapping(value = "/share")
	public String main(Model model) throws Exception {
		return "infra/share/user/share";
	}
	
	@RequestMapping(value = "/shareHot")
	public String shareHot(Locale locale, Model model) throws Exception {
		return "infra/share/user/shareHot";
	}
	
	@RequestMapping(value = "/shareNow")
	public String shareContent(Locale locale, Model model) throws Exception {
		return "infra/share/user/shareNow";
	}
	

	@RequestMapping(value = "/shareLogin")
	public String shareLogin(Locale locale, Model model) throws Exception {
		return "infra/share/user/shareLogin";
	}
	
	@RequestMapping(value = "/shareLoginForm")
	public String shareLoginForm(Locale locale, Model model) throws Exception {
		
		return "infra/share/user/shareLoginForm";
	}
}