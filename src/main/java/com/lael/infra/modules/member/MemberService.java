package com.lael.infra.modules.member;

import java.util.List;

public interface MemberService {
	public List<Member> selectList(MemberVo vo) throws Exception;  // list 로 담아주기
	public List<Member> selectListLog(MemberVo vo) throws Exception; 
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
	public Member idFind(Member dto) throws Exception;
	
	
	public int pwFind(Member dto) throws Exception;
	public int changePwd(Member dto) throws Exception;

	public Member selectOneLogin(Member dto) throws Exception;

	/* Kakao Login */
	
	public int kakaoInst(Member dto) throws Exception;
	public Member snsLoginCheck(Member dto) throws Exception;

	public int user_divUpdate(Member dto) throws Exception;
	
	public int naverInst(Member dto) throws Exception;
	
	/* shareNowView member info 불러오기 */
	public Member selectOne2(MemberVo vo1) throws Exception;
	
}