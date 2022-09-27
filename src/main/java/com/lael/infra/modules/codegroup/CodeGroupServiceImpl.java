package com.lael.infra.modules.codegroup;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lael.infra.common.util.UtilSecurity;

@Service
public class CodeGroupServiceImpl implements CodeGroupService{

	@Autowired
	CodeGroupDAO dao;

	@Override
	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception {
		List<CodeGroup> list = dao.selectList(vo);
		return list;
	}
	
	@Override
	public List<CodeGroup> selectList1() throws Exception {
		return dao.selectList1();
	}

	@Override
	public List<CodeGroup> selectList() throws Exception {
		List<CodeGroup> list = dao.selectList();
		return list;
	}
	
	@Override
	public int insert(CodeGroup dto) throws Exception {
	    	dto.setCcgPw(UtilSecurity.encryptSha256(dto.getCcgPw()));
		return dao.insert(dto);
	}

	@Override
	public CodeGroup selectOne(CodeGroupVo vo) throws Exception {
		return dao.selectOne(vo);
	}

	@Override
	public int update(CodeGroup dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int uelete(CodeGroup dto) throws Exception {
		return dao.uelete(dto);
	}

	@Override
	public int delete(CodeGroupVo vo) throws Exception {
		return dao.delete(vo);
	}

	@Override
	public int selectOneCount(CodeGroupVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

	@Override
	public int idCheck(CodeGroup dto) throws Exception {
		return dao.idCheck(dto);
	}
	
	public static String getSessionSeqCore(HttpServletRequest httpServletRequest) {
		HttpSession httpSession =  httpServletRequest.getSession();
		String rtSeq = (String) httpSession.getAttribute("sessSeq");
		return rtSeq;
	}

	@Override
	public CodeGroup selectOneId(CodeGroup dto) throws Exception {
		return dao.selectOneId(dto);
	}

	@Override
	public CodeGroup selectOneLogin(CodeGroup dto) throws Exception {
		return null;
	}


	
	
}
