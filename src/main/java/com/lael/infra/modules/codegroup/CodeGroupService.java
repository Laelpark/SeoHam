package com.lael.infra.modules.codegroup;

import java.util.List;

public interface CodeGroupService {
	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception;
	public List<CodeGroup> selectList() throws Exception;
	public int insert(CodeGroup dto) throws Exception;
	public CodeGroup selecteOne(CodeGroupVo vo) throws Exception;
}
