package com.lael.infra.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/codeGroup/")
public class CodeGroupController {

	@Autowired
	CodeGroupServiceImpl service;
	

	@RequestMapping(value = "codeGroupList")
	public String codeGroupList(Model model, CodeGroupVo vo) throws Exception {
								// JSP로 넘길 땐 model 객체로 넘겨야 됨
		
		System.out.println("vo.getshValue(): " + vo.getShValue());
		System.out.println("vo.getshOption(): " + vo.getShOption());
		System.out.println("vo.getDelNy(): " + vo.getDelNy());

		List<CodeGroup> list = service.selectList(vo);
		model.addAttribute("list", list);
						// jsp에서 사용할 객체 이름, 넘겨질 객체 이름
		
		return "infra/codegroup/xdmin/codeGroupList";
	}
	
	@RequestMapping(value = "codeGroupForm")
	public String codeGroupForm() throws Exception {
		return "infra/codegroup/xdmin/codeGroupForm";
	}
	
	@RequestMapping(value = "codeGroupInst")
	public String codeGroupInst(CodeGroup dto) throws Exception {
		int result = service.insert(dto);
		System.out.println("service.result : " + result);
		
		return "redirect:/codeGroup/codeGroupList";
	}
	
	@RequestMapping(value= "codeGroupView")
	public String codeGroupView(Model model, CodeGroupVo vo) throws Exception {
		CodeGroup result = service.selecteOne(vo);
		model.addAttribute("codeGroup", result);
		return "infra/codegroup/xdmin/codeGroupForm";
	}
}
