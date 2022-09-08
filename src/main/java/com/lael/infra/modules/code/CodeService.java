package com.lael.infra.modules.code;

import java.util.List;

import com.lael.infra.modules.codegroup.CodeGroup;
import com.lael.infra.modules.codegroup.CodeGroupVo;

public interface CodeService {
	public List<Code> selectList(CodeVo vo) throws Exception;
	public int insert(Code dto) throws Exception;
	public Code selectOne(CodeVo vo) throws Exception;
	
	//
//	public CodeGroup selectOne(CodeGroupVo vo) throws Exception;
}
