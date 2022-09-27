package com.lael.infra.modules.shareCodeGroup;

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

@Controller
@RequestMapping(value = "/shareCodeGroup/")
public class ShareCodeGroupController {

	@Autowired
	ShareCodeGroupServiceImpl service;
	
	
	  private void setSearchAndPaging(ShareCodeGroupVo vo) throws Exception {
		  vo.setShDelNy(vo.getShDelNy() == null ? 0: vo.getShDelNy()); //
			
//			 vo.setDatepickerS(vo.getDatepickerS() == null || vo.getDatepickerS() == "" ? null : UtilDateTime.add00TimeString(vo.getDatepickerS())); //
//			 vo.setDatepickerE(vo.getDatepickerE() == null || vo.getDatepickerE() == "" ? null : UtilDateTime.add59TimeString(vo.getDatepickerE())); //
//		  	 vo.setShOption(vo.getShOption() == null ? 1 : vo.getShOption());
		  
		  vo.setParamsPaging(service.selectOneCount(vo)); 
	  }
	 
	
	@RequestMapping(value = "shareCodeGroupList")
	public String codeGroupList(Model model, @ModelAttribute("vo") ShareCodeGroupVo vo) throws Exception {

		 setSearchAndPaging(vo); 
		
		List<ShareCodeGroup> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/codegroup/xdmin/codeGroupList";
	}
	
	@RequestMapping(value = "shareCodeGroupForm")
	public String codeGroupForm(@ModelAttribute("vo") ShareCodeGroupVo vo, Model model) throws Exception {
		
		
		  ShareCodeGroup item = service.selectOne(vo);
		  model.addAttribute("item", item);
		 

		return "infra/codegroup/xdmin/codeGroupForm";
	}
	
	
//	@SuppressWarnings(value = { "all" })
	@RequestMapping(value = "shareCodeGroupInst")
	public String codeGroupInst(ShareCodeGroupVo vo, ShareCodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {

		service.insert(dto);

		vo.setCcgSeq(dto.getCcgSeq());
		redirectAttributes.addFlashAttribute("vo", vo); 

		return "redirect:/codeGroup/codeGroupForm";
	}
	
	@RequestMapping(value= "shareCodeGroupView")
	public String codeGroupView(Model model, @ModelAttribute("vo") ShareCodeGroupVo vo) throws Exception {
		
		ShareCodeGroup item = service.selectOne(vo);
		model.addAttribute("item", item);
		return "infra/codegroup/xdmin/codeGroupForm";
	}
	

	@RequestMapping(value= "shareCodeGroupUpdt")
	public String codeGroupUpdt(@ModelAttribute("vo") ShareCodeGroupVo vo, ShareCodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		service.update(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/codeGroup/codeGroupList";
		
	}
	
	@RequestMapping(value= "shareCodeGroupUele")
	public String codeGroupUele(@ModelAttribute("vo") ShareCodeGroupVo vo, ShareCodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		service.uelete(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/codeGroup/codeGroupList";
	}
	

	@RequestMapping(value= "shareCodeGroupDele")
	public String codeGroupDele(@ModelAttribute("vo") ShareCodeGroupVo vo, ShareCodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		service.delete(vo);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/codeGroup/codeGroupList";
	}
	
	@ResponseBody
	@RequestMapping(value = "idCheck")
	public Map<String, Object> idCheck(ShareCodeGroup dto) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int result = service.idCheck(dto);
		
		if (result > 0) {
			returnMap.put("rt", "fail");
		} else {
			returnMap.put("rt", "success");
		}
		
		return returnMap;
	}
	

}

