package com.lael.infra.modules.codegroup;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CodeGroupDAO {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.lael.infra.modules.codegroup.CodeGroupMapper";
	
	public List<CodeGroup> selectList(CodeGroupVo vo){ 
		return sqlSession.selectList(namespace + ".selectList", vo); 
		}
}
