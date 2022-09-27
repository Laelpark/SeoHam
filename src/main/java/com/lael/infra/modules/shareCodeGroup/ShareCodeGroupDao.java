package com.lael.infra.modules.shareCodeGroup;

import java.util.List;
import javax.annotation.Resource;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ShareCodeGroupDao {

	@Inject // Autowired와 비슷한 개념
	@Resource(name = "sqlSession") //여러개의 db와 물렸을 때 어떤 커넥션인지 이름을 정해줌
	private SqlSession sqlSession; // SqlSession 객체에 의존
	
	private static String namespace = "com.lael.infra.modules.shareCodeGroup.ShareCodeGroupMapper";
	
	// public List<CodeGroup> selectList(CodeGroupVo vo){ return sqlSession.selectList(namespace + ".selectList", vo);}  
	
	public List<ShareCodeGroup> selectList(ShareCodeGroupVo vo){ 
			// 향상된 사다리 <코드그룹 dto>
	// List<CodeGroup> list = sqlSession.selectList(namespace + ".selectList", vo)
																	// 쿼리 아이디
		List<ShareCodeGroup> list = sqlSession.selectList("com.lael.infra.modules.shareCodeGroup.ShareCodeGroupMapper.selectList", vo);
		return list; 								
	}
	
	public List<ShareCodeGroup> selectList(){ 
		List<ShareCodeGroup> list = sqlSession.selectList("com.lael.infra.modules.shareCodeGroup.ShareCodeGroupMapper.selectList", "");
		return list; 								
	}
	
	public List<ShareCodeGroup> selectList1(){ 
		List<ShareCodeGroup> list = sqlSession.selectList(namespace + ".selectList1", "");
		return list; 								
	}
	
	public ShareCodeGroup selectOne(ShareCodeGroupVo vo) {
		ShareCodeGroup result = sqlSession.selectOne(namespace + ".selectOne", vo);
		return result;
	}
	
	public int selectOneCount(ShareCodeGroupVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}

	
	public int insert(ShareCodeGroup dto) {return sqlSession.insert(namespace + ".insert", dto); }
	public int update(ShareCodeGroup dto) {return sqlSession.update(namespace + ".update", dto); }
	public int uelete(ShareCodeGroup dto) {return sqlSession.update(namespace + ".uelete", dto); }
	public int delete(ShareCodeGroupVo vo) {return sqlSession.delete(namespace + ".delete", vo); }
	
	public int idCheck(ShareCodeGroup dto) {
		return sqlSession.selectOne(namespace + ".idCheck", dto);
	}
}
