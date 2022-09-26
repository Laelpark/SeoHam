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
	List<Share> list = sqlSession.selectList("com.lael.infra.modules.share.ShareMapper.selectList", vo);
	return list; 								
}

	public List<Share> selectList(){ 
	List<Share> list = sqlSession.selectList("com.lael.infra.modules.share.ShareMapper.selectList", "");
	return list; 								
}

	public List<Share> selectList1(){ 
	List<Share> list = sqlSession.selectList(namespace + ".selectList1", "");
	return list; 								
}
	
	public int selectOneCount(ShareVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}

public int insert(Share dto) {return sqlSession.insert(namespace + ".insert", dto); }
public int update(Share dto) {return sqlSession.update(namespace + ".update", dto); }

public int idCheck(Share dto) {
		return sqlSession.selectOne(namespace + ".idCheck", dto);
	}
	
}
