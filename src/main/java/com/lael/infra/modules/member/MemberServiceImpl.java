package com.lael.infra.modules.member;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.lael.infra.common.util.UtilSecurity;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao dao;

	
	
	@Override
	public List<Member> selectList2(MemberVo vo) throws Exception {
		return dao.selectList2(vo);
	}

	@Override
	public List<Member> selectList(MemberVo vo) throws Exception {
		List<Member> list = dao.selectList(vo);
		return list;
	}
	
	@Override
	public List<Member> selectList1() throws Exception {
		return dao.selectList1();
	}

	@Override
	public List<Member> selectList() throws Exception {
		List<Member> list = dao.selectList();
		return list;
	}
	
	@Override
	public int insert(Member dto) throws Exception {
	    	dto.setPw(UtilSecurity.encryptSha256(dto.getPw()));
		return dao.insert(dto);
	}

	@Override
	public Member selectOne(MemberVo vo) throws Exception {
		return dao.selectOne(vo);
	}

	@Override
	public int update(Member dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int uelete(Member dto) throws Exception {
		return dao.uelete(dto);
	}

	@Override
	public int delete(MemberVo vo) throws Exception {
		return dao.delete(vo);
	}

	@Override
	public int selectOneCount(MemberVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}
	
	
	@Override
	public int selectOneCount2(MemberVo vo) throws Exception {
		return dao.selectOneCount2(vo);
	}

	@Override
	public int idCheck(Member dto) throws Exception {
		return dao.idCheck(dto);
	}

	@Override
	public Member selectOneLogin(Member dto) throws Exception {
		return dao.selectOneLogin(dto);
	}

	@Override
	public int selectOneId(Member dto) throws Exception {
		return dao.selectOneId(dto);
	}

	
}
