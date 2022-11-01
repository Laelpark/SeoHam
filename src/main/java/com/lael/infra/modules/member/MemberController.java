package com.lael.infra.modules.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lael.infra.common.constants.Constants;
import com.lael.infra.common.util.UtilSecurity;
import com.lael.infra.modules.share.Share;
import com.lael.infra.modules.share.ShareServiceImpl;
import com.lael.infra.modules.share.ShareVo;

@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	@Autowired
	ShareServiceImpl sService;
	
	private void setSearchAndPaging(MemberVo vo) throws Exception {
		vo.setShOption(vo.getShOption() == null ? 0: vo.getShOption());
		vo.setShDelNy(vo.getShDelNy() == null ? 0: vo.getShDelNy());
		vo.setParamsPaging(service.selectOneCount(vo)); 
	  }
	
	@RequestMapping(value = "memberForm")
	public String memberForm(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		
		 Member item = service.selectOne(vo);
		 
		 // jsp로 보내는 요소
		  model.addAttribute("item", item);
		
		return "infra/member/xdmin/memberForm";
	}
	
	@RequestMapping(value = "shareLogin")
	public String shareLogin() throws Exception {
		return "infra/share/user/shareLogin";
	}
	
	@RequestMapping(value = "shareSignup")
	public String shareLoginForm() throws Exception {
		return "infra/share/user/shareLoginForm";
	}
	
	@RequestMapping(value = "MemberInst")
	public String MemberInst(Member dto) throws Exception {

		service.insert(dto);

		return "infra/share/user/shareLogin";
	}
	
	@ResponseBody
	@RequestMapping(value = "idCheck")
	public Map<String, Object> idCheck(Member dto) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int result = service.idCheck(dto);
		
		if (result > 0) {
			returnMap.put("rt", "fail");
		} else {
			returnMap.put("rt", "success");
		}
		
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "idFind")
	public Map<String, Object> idFind(Member dto) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		Member result = service.idFind(dto);
		
		if (result != null) {
			returnMap.put("rt", "success");
			returnMap.put("id", result);  // 테이블에 있는 전체 값을 담고 있으므로 하나만 생성
		} else {
			returnMap.put("rt", "fail");
		}
		
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "pwFind")
	public Map<String, Object> pwFind(Member dto) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		Member result = service.pwFind(dto);
		
		if (result != null) {
			returnMap.put("rt", "success");
			returnMap.put("pw", result);  // 테이블에 있는 전체 값을 담고 있으므로 하나만 생성
		} else {
			returnMap.put("rt", "fail");
		}
		
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "loginProc")
	public Map<String, Object> loginProc(Member dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		dto.setPw(UtilSecurity.encryptSha256(dto.getPw()));
		Member result = service.selectOneLogin(dto);
		
		if (result != null) {
			
			httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
			httpSession.setAttribute("sessSeq", result.getSeq());
			httpSession.setAttribute("sessId", result.getId());
			httpSession.setAttribute("sessName", result.getName());
			httpSession.setAttribute("sessEmail", result.getEmail());
	
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "logoutProc")
	public Map<String, Object> logoutProc(HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		httpSession.invalidate();
		returnMap.put("rt", "success");
		return returnMap;
	}
	
	
	
	// 관리자 //
	
	@RequestMapping(value = "/adminLogin")
	public String adminLogin() throws Exception {
		return "infra/share/admin/adminLogin";
	}
	
	@RequestMapping(value = "/adminMain")
	public String adminMain(@ModelAttribute("vo") MemberVo vo, Model model, @ModelAttribute("svo") ShareVo svo, Model smodel) throws Exception {

		//아이디 카운트 && 페이지 네이션도 사용
		// today new member          
		vo.setParamsPaging(service.selectOneCount2(vo));
		// db아이디 불러오기
		List<Member> list = service.selectList2(vo);
		model.addAttribute("list", list);
		
		
		// today new share pot			// 페이지 6개 보여주기
		svo.setParamsPaging(sService.selectOneCount2(svo));
		List<Share> sList = sService.selectList2(svo);
		smodel.addAttribute("sList", sList);
		
		return "infra/share/admin/adminMain";
	}
	
	@RequestMapping(value = "/adminUserList")
	public String adminUser(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		
		setSearchAndPaging(vo);
		
		List<Member> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/share/admin/adminUserList";
	}
	
	@RequestMapping(value = "/adminNewUser")
	public String adminNewUser(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount2(vo));
		List<Member> list = service.selectList2(vo);
		model.addAttribute("list", list);
		
		return "infra/share/admin/adminNewUser";
	}
	
	@RequestMapping(value = "/adminUserAll")
	public String adminUserAll() throws Exception {
		return "infra/share/admin/adminUserAll";
	}
	
	@RequestMapping(value= "/adminUele") 
	  public String adminUele(@ModelAttribute("vo") MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {

		service.uelete(dto);
		
	  redirectAttributes.addFlashAttribute("vo", vo); 
	  return "redirect:/admin/adminUserList"; 
	  
	  }
		
	  @RequestMapping(value= "/adminDele") 
	  public String adminDele(@ModelAttribute("vo") MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {

	  service.delete(vo);
		  
	  redirectAttributes.addFlashAttribute("vo", vo); 
	  return "redirect:/admin/adminUserList"; 
	  
	  }
	
	
  @RequestMapping(value= "/adminMultiUele") 
  public String adminMultiUele(@ModelAttribute("vo") MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {

	  for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			dto.setSeq(checkboxSeq);
			service.uelete(dto);
	}
	  
  redirectAttributes.addFlashAttribute("vo", vo); 
  return "redirect:/admin/adminUserList"; 
  
  }
	
  @RequestMapping(value= "/adminMultiDele") 
  public String adminMultiDele(@ModelAttribute("vo") MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {

	  for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			vo.setSeq(checkboxSeq);
			service.delete(vo);
	}
	  
  redirectAttributes.addFlashAttribute("vo", vo); 
  return "redirect:/admin/adminUserList"; 
  
  }
  
	@RequestMapping(value = "/adminSharePot")
	public String adminSharePot(@ModelAttribute("vo") ShareVo vo, Model model) throws Exception {
		
		vo.setParamsPaging(sService.selectOneCount(vo));
		List<Share> list = sService.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/share/admin/adminSharePotList";
	}
  
  
}