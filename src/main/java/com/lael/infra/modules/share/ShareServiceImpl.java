package com.lael.infra.modules.share;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

	@Service
	public class ShareServiceImpl implements ShareService{
	
	@Autowired
	ShareDao dao;
	
	@Override
	public int selectOneCount2(ShareVo vo) throws Exception {
		return dao.selectOneCount2(vo);
	}

	@Override
	public Share selectOne(ShareVo vo) throws Exception {
		return dao.selectOne(vo);
	}

	@Override
	public int selectOneCount(ShareVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

	@Override
	public List<Share> selectList(ShareVo vo) throws Exception {
		List<Share> list = dao.selectList(vo);
		return list;
	}
	
	@Override
	public List<Share> selectList2(ShareVo vo) throws Exception {
		List<Share> list = dao.selectList2(vo);
		return list;
	}

	@Override
	public List<Share> selectList() throws Exception {
		List<Share> list = dao.selectList();
		return list;
	}

	@Override
	public List<Share> selectList1() throws Exception {
		return dao.selectList1();
	}

	@Override
	public int insert(Share dto) throws Exception {
		return dao.insert(dto);
	}

	@Override
	public int update(Share dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int idCheck(Share dto) throws Exception {
		return dao.idCheck(dto);
	}

	
	
}
