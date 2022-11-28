package com.lael.infra.modules.share;

import java.util.List;
import javax.annotation.Resource;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ShareDao {
	
	@Inject // Autowired와 비슷한 개념
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.lael.infra.modules.share.ShareMapper";

	public List<Share> selectList(ShareVo vo){ 
	List<Share> list = sqlSession.selectList(namespace + ".selectList", vo);
	return list; 								
	}
	
	public int selectOneCount(ShareVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}

	public List<Share> selectListFav(ShareVo vo){ 
		List<Share> list = sqlSession.selectList(namespace + ".selectListFav", vo);
		return list; 								
	}

	public List<Share> favList(ShareVo vo){ 
		return sqlSession.selectList(namespace + ".favList", vo);
	}
	

	public List<Share> selectList2(ShareVo svo){ 
		List<Share> sList = sqlSession.selectList(namespace + ".selectList2", svo);
		return sList; 								
	}
	
	public int selectOneCount2(ShareVo svo) {
		return sqlSession.selectOne(namespace + ".selectOneCount2", svo);
	}
	
	public List<Share> selectMyList(ShareVo vo){ 
		return sqlSession.selectList(namespace + ".selectMyList", vo); 								
	}

	public List<Share> nowList(ShareVo vo){ 
		return sqlSession.selectList(namespace + ".nowList", vo); 								
	}
	public int selectMyCount(ShareVo vo) {
		return sqlSession.selectOne(namespace + ".selectMyCount", vo);
	}
	
	public List<Share> selectList(){ 
	List<Share> list = sqlSession.selectList(namespace + ".selectList", "");
	return list; 								
	}

	public List<Share> selectList1(){ 
	List<Share> list = sqlSession.selectList(namespace + ".selectList1", "");
	return list; 								
	}
	
	public Share selectOne(ShareVo vo) {
		return sqlSession.selectOne(namespace + ".selectOne", vo);
	}

	public int likeCount(Share dto) {
		return sqlSession.insert(namespace + ".likeCount", dto); 
	}
	
	public int likeUpdt(Share dto) {
		return sqlSession.update(namespace + ".likeUpdt", dto); 
	}

	public int likeCountUpdt(Share dto) {
		return sqlSession.update(namespace + ".likeCountUpdt", dto); 
	}

	public Share likeOne(Share dto){ 
		return sqlSession.selectOne(namespace + ".likeOne", dto);
	}
	
	public int insert(Share dto) {return sqlSession.insert(namespace + ".insert", dto); }
	public int update(Share dto) {return sqlSession.update(namespace + ".update", dto); }
	
	public int idCheck(Share dto) {
			return sqlSession.selectOne(namespace + ".idCheck", dto);
	}
}
