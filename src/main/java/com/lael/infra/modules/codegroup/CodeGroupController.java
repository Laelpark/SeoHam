package com.lael.infra.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/codeGroup/")
public class CodeGroupController {

	@Autowired
	CodeGroupServiceImpl service;
	

	@RequestMapping(value = "codeGroupList")
	public String codeGroupList(Model model, @ModelAttribute("vo") CodeGroupVo vo) throws Exception {

		System.out.println("vo.getshValue(): " + vo.getShValue());
		System.out.println("vo.getshOption(): " + vo.getShOption());

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
		CodeGroup item = service.selecteOne(vo);
		model.addAttribute("item", item);
		return "infra/codegroup/xdmin/codeGroupForm";
	}
	
//	@SuppressWarnings(value = { "all" })
	@RequestMapping(value= "codeGroupUpdt")
	public String codeGroupUpdt(CodeGroup dto) throws Exception {
		service.update(dto);
		return "redirect:/codeGroup/codeGroupList";
		
	}
	
	@RequestMapping(value= "codeGroupUele")
	public String codeGroupUele(CodeGroup dto) throws Exception {
		service.uelete(dto);
		return "redirect:/codeGroup/codeGroupList";
	}
	

	@RequestMapping(value= "codeGroupDele")
	public String codeGroupDele(CodeGroupVo vo) throws Exception {
		service.delete(vo);
		return "redirect:/codeGroup/codeGroupList";
	}
}

