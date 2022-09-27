package com.lael.infra.modules.shareCode;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.lael.infra.modules.shareCodeGroup.ShareCodeGroup;
import com.lael.infra.modules.shareCodeGroup.ShareCodeGroupServiceImpl;

@Controller
@RequestMapping(value = "/shareShareCode/")
public class ShareCodeController {

	@Autowired
	ShareCodeServiceImpl service;

	@Autowired
	ShareCodeGroupServiceImpl service1;

	private void setSearchAndPaging(ShareCodeVo vo) throws Exception {
		vo.setCdDelNy(vo.getCdDelNy() == null ? 0 : vo.getCdDelNy());
//		vo.setDatepickerS(vo.getDatepickerS() == null || vo.getDatepickerS() == "" ? null : UtilDateTime.add00TimeString(vo.getDatepickerS()));
//		vo.setDatepickerE(vo.getDatepickerE() == null || vo.getDatepickerE() == "" ? null : UtilDateTime.add59TimeString(vo.getDatepickerE()));
//		vo.setShOption(vo.getShOption() == null ? 1 : vo.getShOption());

		vo.setParamsPaging(service.selectOneCount(vo));
	}

	@RequestMapping(value = "shareShareCodeList")
	public String ShareCodeList(Model model, @ModelAttribute("vo") ShareCodeVo vo) throws Exception {

		setSearchAndPaging(vo);

		List<ShareCode> list = service.selectList(vo);
		model.addAttribute("list", list);

		return "infra/ShareCode/xdmin/ShareCodeList";
	}

	@RequestMapping(value = "shareShareCodeForm")
	public String ShareCodeForm(Model model, @ModelAttribute("vo") ShareCodeVo vo) throws Exception {
		List<ShareCodeGroup> list = service1.selectList1();
		model.addAttribute("list", list);

		ShareCode item = service.selectOne(vo);
		model.addAttribute("item", item);

		return "infra/ShareCode/xdmin/ShareCodeForm";
	}

	@RequestMapping(value = "shareShareCodeInst")
	public String ShareCodeInst(ShareCode dto, ShareCodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		service.insert(dto);

		vo.setCdSeq(dto.getCdSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/ShareCode/ShareCodeForm";
	}

	@RequestMapping(value = "shareShareCodeView")
	public String ShareCodeView(Model model, @ModelAttribute("vo") ShareCodeVo vo) throws Exception {
		
		ShareCode item = service.selectOne(vo);
		model.addAttribute("item", item);

		List<ShareCodeGroup> list1 = service1.selectList();
		model.addAttribute("list1", list1);
		return "infra/ShareCode/xdmin/ShareCodeForm";
	}

	@RequestMapping(value = "shareShareCodeUpdt")
	public String ShareCodeUpdt(ShareCode dto, Model model, @ModelAttribute("vo") ShareCodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.update(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/ShareCode/ShareCodeList";

	}

	@RequestMapping(value = "shareShareCodeUele")
	public String ShareCodeUele(ShareCode dto, Model model, @ModelAttribute("vo") ShareCodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.uelete(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/ShareCode/ShareCodeList";
	}

	@RequestMapping(value = "shareShareCodeDele")
	public String ShareCodeDele(ShareCode dto, Model model, @ModelAttribute("vo") ShareCodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.delete(vo);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/ShareCode/ShareCodeList";
	}

}