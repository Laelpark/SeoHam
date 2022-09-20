package com.lael.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping(value = "/member/")
public class MemberController {

	@Autowired
	MemberServiceImpl service;

//	private void setSearchAndPaging(MemberVo vo) throws Exception {
//		vo.setCdDelNy(vo.getCdDelNy() == null ? 0 : vo.getCdDelNy());
//		vo.setDatepickerS(vo.getDatepickerS() == null || vo.getDatepickerS() == "" ? null : UtilDateTime.add00TimeString(vo.getDatepickerS()));
//		vo.setDatepickerE(vo.getDatepickerE() == null || vo.getDatepickerE() == "" ? null : UtilDateTime.add59TimeString(vo.getDatepickerE()));
//		vo.setShOption(vo.getShOption() == null ? 1 : vo.getShOption());

//		vo.setParamsPaging(service.selectOneCount(vo));
//	}

	@RequestMapping(value = "memberList")
	public String MemberList(Model model, @ModelAttribute("vo") MemberVo vo) throws Exception {

//		setSearchAndPaging(vo);

		List<Member> list = service.selectList(vo);
		model.addAttribute("list", list);

		return "infra/code/xdmin/memberList";
	}

	@RequestMapping(value = "memberForm")
	public String memberForm(Model model, @ModelAttribute("vo") MemberVo vo) throws Exception {

		Member item = service.selectOne(vo);
		model.addAttribute("item", item);

		return "infra/code/xdmin/memberForm";
	}

	@RequestMapping(value = "memberInst")
	public String memberInst(Member dto, MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		service.insert(dto);

		vo.setMemSeq(dto.getMemSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/memberForm";
	}

	@RequestMapping(value = "memberView")
	public String codeView(Model model, @ModelAttribute("vo") MemberVo vo) throws Exception {
		
		Member item = service.selectOne(vo);
		model.addAttribute("item", item);
		return "infra/code/xdmin/memberForm";
	}

	@RequestMapping(value = "memberUpdt")
	public String memberUpdt(Member dto, Model model, @ModelAttribute("vo") MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.update(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/memberList";

	}

	@RequestMapping(value = "MemberUele")
	public String MemberUele(Member dto, Model model, @ModelAttribute("vo") MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.uelete(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/memberList";
	}

	@RequestMapping(value = "MemberDele")
	public String memberDele(Member dto, Model model, @ModelAttribute("vo") MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.delete(vo);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/memberList";
	}
	
}
