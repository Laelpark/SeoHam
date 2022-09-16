package com.lael.infra.modules.code;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CodeDAO {

	@Inject
	
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.lael.infra.modules.code.CodeMapper";
	
//	public List<Code> selectList(CodeVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }

	public List<Code> selectList(CodeVo vo){
		List<Code> list = sqlSession.selectList("com.lael.infra.modules.code.CodeMapper.selectList", vo);
		return list;
	}
	
	public int insert (Code dto) {
		return sqlSession.insert(namespace + ".insert", dto);
	}
	
	public Code selectOne(CodeVo vo) {
		Code result = sqlSession.selectOne(namespace + ".selectOne", vo);
		return result;
	}
	
	public int selectOneCount(CodeVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
//	public int update(CodeGroup dto) {return sqlSession.update(namespace + ".update", dto);}
//	public int uelete(CodeGroup dto) {return sqlSession.update(namespace + ".uelete", dto);}
//	public int delete(CodeGroupVo vo) {return sqlSession.delete(namespace + ".delete", vo);}
	

}
