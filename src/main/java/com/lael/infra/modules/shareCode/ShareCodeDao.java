package com.lael.infra.modules.shareCode;

import java.util.List;
import javax.annotation.Resource;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ShareCodeDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.lael.infra.modules.shareCode.ShareCodeMapper";
	
//	public List<Code> selectList(CodeVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }

	public List<ShareCode> selectList(ShareCodeVo vo){
		List<ShareCode> list = sqlSession.selectList("com.lael.infra.modules.shareCode.ShareCodeMapper.selectList", vo);
		return list;
	}

	public List<ShareCode> selectList(){ 
		List<ShareCode> list = sqlSession.selectList("com.lael.infra.modules.shareCode.ShareCodeMapper.selectList", "");
		return list; 								
	}
	
	public List<ShareCode> selectList1(){ 
		List<ShareCode> list = sqlSession.selectList(namespace + ".selectList1", "");
		return list; 								
	}
	
	public ShareCode selectOne(ShareCodeVo vo) {
		ShareCode result = sqlSession.selectOne(namespace + ".selectOne", vo);
		return result;
	}
	
	public int selectOneCount(ShareCodeVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	public int insert (ShareCode dto) {return sqlSession.insert(namespace + ".insert", dto);}
	public int update(ShareCode dto) {return sqlSession.update(namespace + ".update", dto);}
	public int uelete(ShareCode dto) {return sqlSession.update(namespace + ".uelete", dto);}
	public int delete(ShareCodeVo vo) {return sqlSession.delete(namespace + ".delete", vo);}
	
//	for cache
	public List<ShareCode> selectListCachedCodeArrayList(){ return sqlSession.selectList(namespace + ".selectListCachedCodeArrayList", null); }

}
