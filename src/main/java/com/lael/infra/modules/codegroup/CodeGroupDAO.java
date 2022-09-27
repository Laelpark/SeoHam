//package com.lael.infra.modules.codegroup;
//
//import java.util.List;
//import javax.annotation.Resource;
//import javax.inject.Inject;
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.stereotype.Repository;
//
//@Repository
//public class CodeGroupDAO {
//
//	@Inject // Autowired와 비슷한 개념
//	@Resource(name = "sqlSession") //여러개의 db와 물렸을 때 어떤 커넥션인지 이름을 정해줌
//	private SqlSession sqlSession; // SqlSession 객체에 의존
//	
//	private static String namespace = "com.lael.infra.modules.codegroup.CodeGroupMapper";
//	
//	// public List<CodeGroup> selectList(CodeGroupVo vo){ return sqlSession.selectList(namespace + ".selectList", vo);}  
//	
//	public List<CodeGroup> selectList(CodeGroupVo vo){ 
//			// 향상된 사다리 <코드그룹 dto>
//	// List<CodeGroup> list = sqlSession.selectList(namespace + ".selectList", vo)
//																	// 쿼리 아이디
//		List<CodeGroup> list = sqlSession.selectList("com.lael.infra.modules.codegroup.CodeGroupMapper.selectList", vo);
//		return list; 								
//	}
//	
//	public List<CodeGroup> selectList(){ 
//		List<CodeGroup> list = sqlSession.selectList("com.lael.infra.modules.codegroup.CodeGroupMapper.selectList", "");
//		return list; 								
//	}
//	
//	public List<CodeGroup> selectList1(){ 
//		List<CodeGroup> list = sqlSession.selectList(namespace + ".selectList1", "");
//		return list; 								
//	}
//	
//	public CodeGroup selectOne(CodeGroupVo vo) {
//		CodeGroup result = sqlSession.selectOne(namespace + ".selectOne", vo);
//		return result;
//	}
//	
//	public int selectOneCount(CodeGroupVo vo) {
//		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
//	}
//
//	
//	public int insert(CodeGroup dto) {return sqlSession.insert(namespace + ".insert", dto); }
//	public int update(CodeGroup dto) {return sqlSession.update(namespace + ".update", dto); }
//	public int uelete(CodeGroup dto) {return sqlSession.update(namespace + ".uelete", dto); }
//	public int delete(CodeGroupVo vo) {return sqlSession.delete(namespace + ".delete", vo); }
//	
//	public int idCheck(CodeGroup dto) {
//		return sqlSession.selectOne(namespace + ".idCheck", dto);
//	}
//}
