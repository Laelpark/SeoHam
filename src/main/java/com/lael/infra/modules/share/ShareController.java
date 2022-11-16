package com.lael.infra.modules.share;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
//	 private void setSearchAndPaging(ShareVo vo) throws Exception {
//		  vo.setShDelNy(vo.getShDelNy() == null ? 0: vo.getShDelNy());
//		  vo.setParamsPaging(service.selectOneCount(vo)); 
//	  }
	 
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
	public String shareHot(@ModelAttribute("vo") ShareVo vo, Model model) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount(vo));
		List<Share> list = service.selectList(vo);
		model.addAttribute("list", list); 
		
		return "infra/share/user/shareHot";
	}

	
	@RequestMapping(value = "/sharePot")
	public String sharePot( @ModelAttribute("vo") ShareVo vo, Model model) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount(vo));
		List<Share> list = service.selectListFav(vo);
		model.addAttribute("list", list); 
		
		List<Share> list1 = service.selectListStar(vo);
		model.addAttribute("list1", list1); 
		
		return "infra/share/user/sharePot";
	}
	
	@ResponseBody
	@RequestMapping(value = "/favorite")
	public Map<String, Object> favorite(Share dto) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Share like = service.likeOne(dto);
		
		if (like.getLikeNy() == null) {
			service.likeInst(dto);
			returnMap.put("rt", "success");
		} else if (like.getLikeNy() != null) {
			service.likeUpdt2(dto);
			returnMap.put("rt", "update");
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}
	
	@RequestMapping(value = "/shareNow")
	public String shareContent(@ModelAttribute("vo") ShareVo vo, Model model) throws Exception {
		
		Share item = service.selectOne(vo);
		  model.addAttribute("item", item);
		
	   List<Share> list = service.nowList(vo);
	   	model.addAttribute("list", list);  
	   
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
	
	@RequestMapping(value = "/shareNowView")
	public String shareNowView(@ModelAttribute("vo") ShareVo vo, Model model) throws Exception {
		
		Share item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		List<Share> list = service.nowList(vo);
		model.addAttribute("list", list);  
		
		return "infra/share/user/shareNowView";
	}
	
	@RequestMapping(value = "/myPage")
	public String shareMyPage(@ModelAttribute("vo") MemberVo vo,  Model model) throws Exception {
		
		Member item = Mservice.selectOne(vo);
		model.addAttribute("item", item); 
		
		return "infra/share/user/myPage";
	}
	
	@RequestMapping(value = "/shareMyInfoUpdt")
	public String shareMyInfoUpdt(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		
		Mservice.myUpdate(dto);
		redirectAttributes.addFlashAttribute("vo", vo); 
		
		return "redirect:/personalInformation";
	}
	
	@RequestMapping(value = "/shareMyInfoInst")
	public String shareMyInfoInst(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		
		Mservice.myInsert(dto);
		
		vo.setSeq(dto.getSeq());
		redirectAttributes.addFlashAttribute("vo", vo); 
		
		return "redirect:/personalInformation";
	}
	
	@RequestMapping(value = "/myList")
	public String MyList(@ModelAttribute("vo") ShareVo vo, Model model, Share dto) throws Exception {
		
		vo.setParamsPaging(service.selectMyCount(vo));
		List<Share> mList = service.selectMyList(vo);
		model.addAttribute("list", mList); 
		
		return "infra/share/user/myList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/likeCount")
	public Map<String, Object> likeCount(Share dto) throws Exception {
	
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		Share one = service.likeOne(dto);
		
		if(one == null) {
		    service.likeInst(dto);
			returnMap.put("rt", "success");
		} else if(one.getLikeNy() == 0) {
		    service.likeUpdt2(dto);
			returnMap.put("rt", "success");
		} else if(one.getLikeNy() == 1){
		    service.likeUpdt2(dto);
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}
	
	@RequestMapping(value = "/likeUpdt")
	public String likeUpdt(ShareVo vo, Share dto, RedirectAttributes redirectAttributes) throws Exception {

		service.likeUpdt(dto);
		return "redirect:/sharePot";
	}
	
	@RequestMapping(value = "/personalInformation")
	public String personalInformation(@ModelAttribute("vo") MemberVo vo,  Model model) throws Exception {
		
		Member item = Mservice.selectOne(vo);
		model.addAttribute("item", item);  
		
		return "infra/share/user/personalInformation";
	}
	
	@RequestMapping(value = "/mySecurity")
	public String mySecurity(@ModelAttribute("vo") MemberVo vo,  Model model) throws Exception {
		
		return "infra/share/user/mySecurity";
	}
	
	@RequestMapping(value = "/shareLikeList")
	public String shareLikeList() throws Exception {
		return "infra/share/user/shareLikeList";
	}
	
	@RequestMapping(value = "/shareFindLogin")
	public String shareFindLogin() throws Exception {
		return "infra/share/user/shareFindLogin";
	}

	@RequestMapping(value = "/shareFindPw")
	public String shareFindPw() throws Exception {
		return "infra/share/user/shareFindPw";
	}
}