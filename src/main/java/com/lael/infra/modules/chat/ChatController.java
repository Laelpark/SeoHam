package com.lael.infra.modules.chat;
//본인에게 맞는 package로 변경하도록 합니다.

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lael.infra.modules.share.Share;

@Controller
public class ChatController {
	
	@Autowired
	ChatServiceImpl service;

	@RequestMapping(value="/chat")
	public String chat(HttpSession httpSession,Model model, Share dto, Chat cDto) throws Exception {
		
		System.out.println("write seq : "+ dto.getWriteSeq());
		model.addAttribute("writeSeq", dto.getWriteSeq());
		List<Chat> list = service.selectChatListFromOne(Integer.parseInt(httpSession.getAttribute("sessSeq").toString()));
		//캐스팅 오류나면 Integer.ParseInt(httpSession.getAttribute("sessSeq").toString())
		model.addAttribute("list", list);
		
		return "infra/chat/chat";
		//본인에게 맞는 jsp경로로 변경하도록 합니다.
	}

	@ResponseBody
	@RequestMapping(value="/insChat")
	public Map<String,Object> insChat(HttpSession httpSession,Chat dto) throws Exception {
		
		Map<String,Object> result = new HashMap<String,Object>();
		
		Chat newChat = service.createChat(Integer.parseInt(httpSession.getAttribute("sessSeq").toString()),dto.getCuMember());
		//캐스팅 오류나면 Integer.ParseInt(httpSession.getAttribute("sessSeq").toString())
		if(newChat != null) {
			result.put("rt", "success");
			result.put("newChat", newChat);
		}
		else
			result.put("rt", "fail");
		
		return result;
	}
}