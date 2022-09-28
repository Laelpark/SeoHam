package com.lael.infra.modules.member;

import java.util.List;

public interface MemberService {
	public List<Member> selectList(MemberVo vo) throws Exception;  // list 로 담아주기
	public List<Member> selectList() throws Exception;			
	public List<Member> selectList1() throws Exception;	
	public int insert(Member dto) throws Exception;
	public Member selectOne(MemberVo vo) throws Exception;	    // item 로 담아주기
	public int update(Member dto) throws Exception;
	public int uelete(Member dto) throws Exception;
	public int delete(MemberVo vo) throws Exception;
	public int selectOneCount(MemberVo vo) throws Exception;
	
	public int idCheck(Member dto) throws Exception;
	
//	public int pwCheck(Member dto) throws Exception;
	
	public Member selectOneLogin(Member dto) throws Exception;

}
