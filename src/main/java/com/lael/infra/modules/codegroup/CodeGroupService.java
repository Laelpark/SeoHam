package com.lael.infra.modules.codegroup;

import java.util.List;

public interface CodeGroupService {
	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception;  // list 로 담아주기
	public List<CodeGroup> selectList() throws Exception;			
	public List<CodeGroup> selectList1() throws Exception;	
	public int insert(CodeGroup dto) throws Exception;
	public CodeGroup selectOne(CodeGroupVo vo) throws Exception;	    // item 로 담아주기
	public int update(CodeGroup dto) throws Exception;
	public int uelete(CodeGroup dto) throws Exception;
	public int delete(CodeGroupVo vo) throws Exception;
	public int selectOneCount(CodeGroupVo vo) throws Exception;
	
	public int idCheck(CodeGroup dto) throws Exception;
}
