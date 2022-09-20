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

	public List<Code> selectList(){ 
		List<Code> list = sqlSession.selectList("com.lael.infra.modules.code.CodeMapper.selectList", "");
		return list; 								
	}
	
	public List<Code> selectList1(){ 
		List<Code> list = sqlSession.selectList(namespace + ".selectList1", "");
		return list; 								
	}
	
	public Code selectOne(CodeVo vo) {
		Code result = sqlSession.selectOne(namespace + ".selectOne", vo);
		return result;
	}
	
	public int selectOneCount(CodeVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	public int insert (Code dto) {return sqlSession.insert(namespace + ".insert", dto);}
	public int update(Code dto) {return sqlSession.update(namespace + ".update", dto);}
	public int uelete(Code dto) {return sqlSession.update(namespace + ".uelete", dto);}
	public int delete(CodeVo vo) {return sqlSession.delete(namespace + ".delete", vo);}
	
//	for cache
	public List<Code> selectListCachedCodeArrayList(){ return sqlSession.selectList(namespace + ".selectListCachedCodeArrayList", null); }

}
