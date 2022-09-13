package com.lael.infra.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<CodeGroup> selectList() throws Exception {
		List<CodeGroup> list = dao.selectList();
		return list;
	}
	
	@Override
	public int insert(CodeGroup dto) throws Exception {
//		setRegMod(dto);
		return dao.insert(dto);
	}

	@Override
	public CodeGroup selecteOne(CodeGroupVo vo) throws Exception {
		CodeGroup result = dao.selectOne(vo);
		return result;
	}

	@Override
	public int update(CodeGroup dto) throws Exception {
//		setRegMod(dto);
		return dao.update(dto);
	}

	@Override
	public int uelete(CodeGroup dto) throws Exception {
//		setRegMod(dto);
		return dao.uelete(dto);
	}

	@Override
	public int delete(CodeGroupVo vo) throws Exception {
		return dao.delete(vo);
	}

	
}
