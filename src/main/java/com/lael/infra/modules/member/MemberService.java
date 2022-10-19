package com.lael.infra.modules.member;

import java.util.List;

public interface MemberService {
	public List<Member> selectList(MemberVo vo) throws Exception;  // list 로 담아주기
	public List<Member> selectList() throws Exception;			
	public List<Member> selectList1() throws Exception;	
	public List<Member> selectList2(MemberVo vo) throws Exception;	
	public int myInsert(Member dto) throws Exception;
	public int myUpdate(Member dto) throws Exception;
	public int insert(Member dto) throws Exception;
	public int update(Member dto) throws Exception;
	public int uelete(Member dto) throws Exception;
	public int delete(MemberVo vo) throws Exception;
	public Member selectOne(MemberVo vo) throws Exception;	    // item 로 담아주기
	public int selectOneCount(MemberVo vo) throws Exception;
	public int selectOneCount2(MemberVo vo) throws Exception;
	public int selectOneId(Member dto) throws Exception;
	
	public int idCheck(Member dto) throws Exception;
	
	public Member selectOneLogin(Member dto) throws Exception;

}
