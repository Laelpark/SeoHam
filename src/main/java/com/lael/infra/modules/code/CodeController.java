//package com.lael.infra.modules.code;
//
//import java.util.List;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//import com.lael.infra.modules.codegroup.CodeGroup;
//import com.lael.infra.modules.codegroup.CodeGroupServiceImpl;
//
//@Controller
//@RequestMapping(value = "/code/")
//public class CodeController {
//
//	@Autowired
//	CodeServiceImpl service;
//
//	@Autowired
//	CodeGroupServiceImpl service1;
//
//	private void setSearchAndPaging(CodeVo vo) throws Exception {
//		vo.setCdDelNy(vo.getCdDelNy() == null ? 0 : vo.getCdDelNy());
////		vo.setDatepickerS(vo.getDatepickerS() == null || vo.getDatepickerS() == "" ? null : UtilDateTime.add00TimeString(vo.getDatepickerS()));
////		vo.setDatepickerE(vo.getDatepickerE() == null || vo.getDatepickerE() == "" ? null : UtilDateTime.add59TimeString(vo.getDatepickerE()));
////		vo.setShOption(vo.getShOption() == null ? 1 : vo.getShOption());
//
//		vo.setParamsPaging(service.selectOneCount(vo));
//	}
//
//	@RequestMapping(value = "codeList")
//	public String codeList(Model model, @ModelAttribute("vo") CodeVo vo) throws Exception {
//
//		setSearchAndPaging(vo);
//
//		List<Code> list = service.selectList(vo);
//		model.addAttribute("list", list);
//
//		return "infra/code/xdmin/codeList";
//	}
//
//	@RequestMapping(value = "codeForm")
//	public String codeForm(Model model, @ModelAttribute("vo") CodeVo vo) throws Exception {
//		List<CodeGroup> list = service1.selectList1();
//		model.addAttribute("list", list);
//
//		Code item = service.selectOne(vo);
//		model.addAttribute("item", item);
//
//		return "infra/code/xdmin/codeForm";
//	}
//
//	@RequestMapping(value = "codeInst")
//	public String codeInst(Code dto, CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
//		
//		service.insert(dto);
//
//		vo.setCdSeq(dto.getCdSeq());
//		redirectAttributes.addFlashAttribute("vo", vo);
//		return "redirect:/code/codeForm";
//	}
//
//	@RequestMapping(value = "codeView")
//	public String codeView(Model model, @ModelAttribute("vo") CodeVo vo) throws Exception {
//		
//		Code item = service.selectOne(vo);
//		model.addAttribute("item", item);
//
//		List<CodeGroup> list1 = service1.selectList();
//		model.addAttribute("list1", list1);
//		return "infra/code/xdmin/codeForm";
//	}
//
//	@RequestMapping(value = "codeUpdt")
//	public String codeUpdt(Code dto, Model model, @ModelAttribute("vo") CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
//		service.update(dto);
//		
//		redirectAttributes.addFlashAttribute("vo", vo);
//		return "redirect:/code/codeList";
//
//	}
//
//	@RequestMapping(value = "codeUele")
//	public String codeUele(Code dto, Model model, @ModelAttribute("vo") CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
//		service.uelete(dto);
//		
//		redirectAttributes.addFlashAttribute("vo", vo);
//		return "redirect:/code/codeList";
//	}
//
//	@RequestMapping(value = "codeDele")
//	public String codeDele(Code dto, Model model, @ModelAttribute("vo") CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
//		service.delete(vo);
//		
//		redirectAttributes.addFlashAttribute("vo", vo);
//		return "redirect:/code/codeList";
//	}
//
//}