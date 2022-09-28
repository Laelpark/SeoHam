package com.lael.infra.modules.share;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ShareController {

	@Autowired
	ShareServiceImpl service;
	
	  private void setSearchAndPaging(ShareVo vo) throws Exception {
		  vo.setShDelNy(vo.getShDelNy() == null ? 0: vo.getShDelNy()); //
		  vo.setParamsPaging(service.selectOneCount(vo)); 
	  }
	
	@RequestMapping(value = "/share")
	public String main(HttpSession httpSession) throws Exception {
		System.out.println("seq : " + httpSession.getAttribute("sessSeq"));
		System.out.println("id : " + httpSession.getAttribute("sessId"));
		System.out.println("name : " + httpSession.getAttribute("sessName"));
		System.out.println("email : " + httpSession.getAttribute("sessEmail"));
		return "infra/share/user/shareLogDone";
	}
	
	@RequestMapping(value = "/shareHot")
	public String shareHot(Locale locale, Model model) throws Exception {
		return "infra/share/user/shareHot";
	}

	
	@RequestMapping(value = "/sharePot")
	public String sharePot( @ModelAttribute("vo") ShareVo vo, Model model) throws Exception {
		
		 setSearchAndPaging(vo); 
		 
		List<Share> list = service.selectList(vo);
		model.addAttribute("list", list); 
		return "infra/share/user/sharePot";
	}
	
	@RequestMapping(value = "/shareNow")
	public String shareContent(Locale locale, Model model) throws Exception {
		return "infra/share/user/shareNow";
	}
	
}