package com.lael.infra.modules.codegroup;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/codeGroup/")
public class CodeGroupController {

	@Autowired
	CodeGroupServiceImpl service;
	
	
	  private void setSearchAndPaging(CodeGroupVo vo) throws Exception {
		  vo.setShDelNy(vo.getShDelNy() == null ? 0: vo.getShDelNy()); //
		  vo.setParamsPaging(service.selectOneCount(vo)); 
//		  	 vo.setShOption(vo.getShOption() == null ? 1 : vo.getShOption());
	  }
	 
	
	@RequestMapping(value = "codeGroupList")
	public String codeGroupList(Model model, @ModelAttribute("vo") CodeGroupVo vo) throws Exception {

		 setSearchAndPaging(vo); 
		
		List<CodeGroup> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/codegroup/xdmin/codeGroupList";
	}
	
	@RequestMapping(value = "codeGroupForm")
	public String codeGroupForm(@ModelAttribute("vo") CodeGroupVo vo, Model model) throws Exception {
		
		
		  CodeGroup item = service.selectOne(vo);
		  model.addAttribute("item", item);
		 

		return "infra/codegroup/xdmin/codeGroupForm";
	}
	
	
//	@SuppressWarnings(value = { "all" })
	@RequestMapping(value = "codeGroupInst")
	public String codeGroupInst(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {

		service.insert(dto);

		vo.setCcgSeq(dto.getCcgSeq());
		redirectAttributes.addFlashAttribute("vo", vo); 

		return "redirect:/codeGroup/codeGroupForm";
	}
	
	@RequestMapping(value= "codeGroupView")
	public String codeGroupView(Model model, @ModelAttribute("vo") CodeGroupVo vo) throws Exception {
		
		CodeGroup item = service.selectOne(vo);
		model.addAttribute("item", item);
		return "infra/codegroup/xdmin/codeGroupForm";
	}
	

	@RequestMapping(value= "codeGroupUpdt")
	public String codeGroupUpdt(@ModelAttribute("vo") CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		service.update(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/codeGroup/codeGroupList";
		
	}
	
	@RequestMapping(value= "codeGroupUele")
	public String codeGroupUele(@ModelAttribute("vo") CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		service.uelete(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/codeGroup/codeGroupList";
	}
	

	@RequestMapping(value= "codeGroupDele")
	public String codeGroupDele(@ModelAttribute("vo") CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		service.delete(vo);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/codeGroup/codeGroupList";
	}
	

	
}

