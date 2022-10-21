package com.lael.infra.modules.share;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.lael.infra.modules.member.Member;
import com.lael.infra.modules.member.MemberServiceImpl;
import com.lael.infra.modules.member.MemberVo;

@Controller
public class ShareController {

	@Autowired
	ShareServiceImpl service;
	
	@Autowired
	MemberServiceImpl Mservice;
	
	 private void setSearchAndPaging(ShareVo vo) throws Exception {
		  vo.setShDelNy(vo.getShDelNy() == null ? 0: vo.getShDelNy());
		  vo.setParamsPaging(service.selectOneCount(vo)); 
	  }
	 
	 // 유저
	
	 @RequestMapping(value = "/")
	 public String shareMain() throws Exception {
		return "infra/share/main/shareMain";
	}
	 
  @RequestMapping(value = "/share")
	public String main() throws Exception {
		return "infra/share/user/shareLogDone";
	}
	
	@RequestMapping(value = "/shareHot")
	public String shareHot() throws Exception {
		return "infra/share/user/shareHot";
	}

	
	@RequestMapping(value = "/sharePot")
	public String sharePot( @ModelAttribute("vo") ShareVo vo, Model model, Share dto) throws Exception {
		
		setSearchAndPaging(vo); 
		
		List<Share> list = service.selectList(vo);
		model.addAttribute("list", list); 
		
		return "infra/share/user/sharePot";
	}
	
	@RequestMapping(value = "/shareNow")
	public String shareContent(@ModelAttribute("vo") ShareVo vo, Model model) throws Exception {
		
		Share item = service.selectOne(vo);
		  model.addAttribute("item", item);
		
		return "infra/share/user/shareNow";
	}
	
	@RequestMapping(value = "/shareInst")
	public String shareInst(ShareVo vo, Share dto, RedirectAttributes redirectAttributes) throws Exception {

		service.insert(dto);
		
		vo.setSeq(dto.getSeq());
		redirectAttributes.addFlashAttribute("vo", vo); 

		return "redirect:/shareNow";
	}
	
	@RequestMapping(value = "/shareUpdt")
	public String shareUpdt(ShareVo vo, Share dto, RedirectAttributes redirectAttributes) throws Exception {

		service.update(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo); 
		return "redirect:/sharePot";
	}
	
	@RequestMapping(value = "/myPage")
	public String shareMyPage(@ModelAttribute("vo") MemberVo vo,  Model model) throws Exception {
		
		Member item = Mservice.selectOne(vo);
		model.addAttribute("item", item); 
		
		return "infra/share/user/myPage";
	}
	
	@RequestMapping(value = "/shareMyPageUpdt")
	public String shareMyPageUpdt(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		
		Mservice.myUpdate(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo); 
		return "redirect:/myPage";
	}
	
	@RequestMapping(value = "/shareMyPageInst")
	public String shareMyPageInst(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		
		Mservice.myInsert(dto);
		
		vo.setSeq(dto.getSeq());
		redirectAttributes.addFlashAttribute("vo", vo); 
		
		return "redirect:/myPage";
	}
	
	@RequestMapping(value = "/myList")
	public String MyList(@ModelAttribute("vo") ShareVo vo, Model model, Share dto) throws Exception {
		
		
		  System.out.println("mSeq : " +vo.getmSeq()); 
		  System.out.println("Seq : " + vo.getSeq());
		  
		  vo.setParamsPaging(service.selectMyCount(vo));
		 
		
		List<Share> mList = service.selectMyList(vo);
		model.addAttribute("list", mList); 
		
		return "infra/share/user/myList";
	}
	
	@RequestMapping(value = "/mySecurity")
	public String mySecurity(@ModelAttribute("vo") MemberVo vo,  Model model) throws Exception {
		
		Member item = Mservice.selectOne(vo);
		model.addAttribute("item", item);  
		
		return "infra/share/user/mySecurity";
	}
	
	
	@RequestMapping(value = "/shareLikeList")
	public String shareLikeList() throws Exception {
		return "infra/share/user/shareLikeList";
	}
	
}