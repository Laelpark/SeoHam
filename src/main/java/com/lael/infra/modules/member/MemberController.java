package com.lael.infra.modules.member;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.lael.infra.common.constants.Constants;
import com.lael.infra.common.util.UtilSecurity;

@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping(value = "/memberForm")
	public String memberForm(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		
		 Member item = service.selectOne(vo);
		  model.addAttribute("item", item);
		
		return "infra/member/xdmin/memberForm";
	}
	
	@RequestMapping(value = "/shareLogin")
	public String shareLogin() throws Exception {
		return "infra/share/user/shareLogin";
	}
	
	@RequestMapping(value = "/shareSignup")
	public String shareLoginForm() throws Exception {
		return "infra/share/user/shareLoginForm";
	}
	
	@RequestMapping(value = "/MemberInst")
	public String MemberInst(@ModelAttribute("vo") MemberVo vo, Member dto) throws Exception {

		service.insert(dto);

		return "infra/share/user/shareLogin";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck")
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
//		UtilCookie.deleteCookie();
		httpSession.invalidate();
		returnMap.put("rt", "success");
		return returnMap;
	}
}
	