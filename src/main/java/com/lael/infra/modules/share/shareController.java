package com.lael.infra.modules.share;

import java.util.Locale;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class shareController {
	
	
	/*
	 * private static final Logger logger =
	 * LoggerFactory.getLogger(shareController.class);
	 */
	 
	
	@RequestMapping(value = "/shareMain")
	public String main(Model model) throws Exception {
		return "infra/share/xdmin/shareMain";
	}
	
	@RequestMapping(value = "/shareContent")
	public String shareContent(Locale locale, Model model) throws Exception {
		
		return "infra/share/xdmin/shareContent";
	}
	

	@RequestMapping(value = "/shareLogin")
	public String shareLogin(Locale locale, Model model) throws Exception {
		
		return "infra/share/xdmin/shareLogin";
	}
}