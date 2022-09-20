package com.lael.infra.modules.member;

import java.util.List;
import javax.annotation.Resource;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.lael.infra.modules.member.MemberMapper";
	
	public List<Member> selectList(MemberVo vo){
		List<Member> list = sqlSession.selectList("com.lael.infra.modules.member.MemberMapper.selectList", vo);
		return list;
	}

	public List<Member> selectList(){ 
		List<Member> list = sqlSession.selectList("com.lael.infra.modules.member.MemberMapper.selectList", "");
		return list; 								
	}
	
	public List<Member> selectList1(){ 
		List<Member> list = sqlSession.selectList(namespace + ".selectList1", "");
		return list; 								
	}
	
	public Member selectOne(MemberVo vo) {
		Member result = sqlSession.selectOne(namespace + ".selectOne", vo);
		return result;
	}
	
	public int selectOneCount(MemberVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	public int insert (Member dto) {return sqlSession.insert(namespace + ".insert", dto);}
	public int update(Member dto) {return sqlSession.update(namespace + ".update", dto);}
	public int uelete(Member dto) {return sqlSession.update(namespace + ".uelete", dto);}
	public int delete(MemberVo vo) {return sqlSession.delete(namespace + ".delete", vo);}

}
