package com.lael.infra.modules.share;

import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class ShareController {

	@Autowired
	ShareServiceImpl service;
	
	  @RequestMapping(value = "/share")
	public String main(HttpSession httpSession) throws Exception {
		return "infra/share/user/shareLogDone";
	}
	
	@RequestMapping(value = "/shareHot")
	public String shareHot(Locale locale, Model model) throws Exception {
		return "infra/share/user/shareHot";
	}

	
	@RequestMapping(value = "/sharePot")
	public String sharePot( @ModelAttribute("vo") ShareVo vo, Model model) throws Exception {
		
		 vo.setParamsPaging(service.selectOneCount(vo)); 
		 
		List<Share> list = service.selectList(vo);
		model.addAttribute("list", list); 
		return "infra/share/user/sharePot";
	}
	
	@RequestMapping(value = "/shareNow")
	public String shareContent() throws Exception {
		return "infra/share/user/shareNow";
	}
	
	@RequestMapping(value = "shareInst")
	public String shareInst(ShareVo vo, Share dto, RedirectAttributes redirectAttributes) throws Exception {

		service.insert(dto);
		
		vo.setSeq(dto.getSeq());
		redirectAttributes.addFlashAttribute("vo", vo); 

		return "redirect:/share/user/shareNow";
	}
	
	@RequestMapping(value = "/shareMyPage")
	public String shareMyPage() throws Exception {
		return "infra/share/user/shareMyPage";
	}
	
	@RequestMapping(value = "/shareLikeList")
	public String shareLikeList() throws Exception {
		return "infra/share/user/shareLikeList";
	}
	
	@RequestMapping(value = "/adminLogin")
	public String shareAdminLogin() throws Exception {
		return "infra/share/admin/adminLogin";
	}
	
}