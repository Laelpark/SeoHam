package com.lael.infra.modules.shareCodeGroup;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShareCodeGroupServiceImpl implements ShareCodeGroupService{

	@Autowired
	ShareCodeGroupDao dao;

	@Override
	public List<ShareCodeGroup> selectList(ShareCodeGroupVo vo) throws Exception {
		List<ShareCodeGroup> list = dao.selectList(vo);
		return list;
	}
	
	@Override
	public List<ShareCodeGroup> selectList1() throws Exception {
		return dao.selectList1();
	}

	@Override
	public List<ShareCodeGroup> selectList() throws Exception {
		List<ShareCodeGroup> list = dao.selectList();
		return list;
	}
	
	@Override
	public int insert(ShareCodeGroup dto) throws Exception {
		return dao.insert(dto);
	}

	@Override
	public ShareCodeGroup selectOne(ShareCodeGroupVo vo) throws Exception {
		return dao.selectOne(vo);
	}

	@Override
	public int update(ShareCodeGroup dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int uelete(ShareCodeGroup dto) throws Exception {
		return dao.uelete(dto);
	}

	@Override
	public int delete(ShareCodeGroupVo vo) throws Exception {
		return dao.delete(vo);
	}

	@Override
	public int selectOneCount(ShareCodeGroupVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

	@Override
	public int idCheck(ShareCodeGroup dto) throws Exception {
		return dao.idCheck(dto);
	}
}
