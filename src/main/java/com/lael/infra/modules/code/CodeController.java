package com.lael.infra.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lael.infra.modules.codegroup.CodeGroup;
import com.lael.infra.modules.codegroup.CodeGroupServiceImpl;

@Controller
@RequestMapping(value = "/code/")
public class CodeController {

	@Autowired
	CodeServiceImpl service;
	
	@Autowired
	CodeGroupServiceImpl service2;
	
	

	@RequestMapping(value = "codeList")
	public String codeList(Model model, CodeVo vo) throws Exception {

		System.out.println("vo.getshValue(): " + vo.getShValue());
		System.out.println("vo.getshOption(): " + vo.getShOption());
		System.out.println("vo.getcdDelNy(): " + vo.getCdDelNy());
		
		List<Code> list = service.selectList(vo);
		model.addAttribute("list", list);

		return "infra/code/xdmin/codeList";
	}
	
	@RequestMapping(value = "codeForm")
	public String codeForm(Model model) throws Exception {
		List<CodeGroup> list1 = service2.selectList();
		model.addAttribute("list1", list1);
		return "infra/code/xdmin/codeForm";
	}
	
	@RequestMapping(value = "codeInst")
	public String codeInst(Code dto) throws Exception {
		int result = service.insert(dto);
		System.out.println("service.result : " + result);
		
		return "redirect:/code/codeList";
	}
	
	@RequestMapping(value = "codeView")
	public String codeView(Model model, CodeVo vo) throws Exception {
		Code result = service.selectOne(vo);
		model.addAttribute("code", result);

		List<CodeGroup> list1 = service2.selectList();
		model.addAttribute("list1", list1);
		return "infra/code/xdmin/codeForm";
		
		
	}
	
	
	//
	
//	@RequestMapping(value = "codeGroupView")
//	public String codeGroupView(Model model, CodeGroupVo vo) throws Exception {
//		CodeGroup result = service.selectOne(vo);
//		model.addAttribute("code", result);
//		return "infra/code/xdmin/codeForm";
//	}
	
	
}