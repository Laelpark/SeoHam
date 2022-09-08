package com.lael.infra.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CodeServiceImpl implements CodeService{

	@Autowired
	CodeDAO dao;

	@Override
	public List<Code> selectList(CodeVo vo) throws Exception {
		List<Code> list = dao.selectList(vo); 
		return list;
	}

	@Override
	public int insert(Code dto) throws Exception {
		return dao.insert(dto);
	}

	@Override
	public Code selectOne(CodeVo vo) throws Exception {
		Code result = dao.selectOne(vo);
		return result;
	}

	//
	
//	@Override
//	public CodeGroup selectOne(CodeGroupVo vo) throws Exception {
//		CodeGroup result = dao.selectOne(vo);
//		return result;
//	}
		
}
