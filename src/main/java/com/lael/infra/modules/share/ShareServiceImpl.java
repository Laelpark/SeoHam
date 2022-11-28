package com.lael.infra.modules.share;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

	@Service
	public class ShareServiceImpl implements ShareService{
	
	@Autowired
	ShareDao dao;
	
	@Override
	public int selectOneCount2(ShareVo svo) throws Exception {
		return dao.selectOneCount2(svo);
	}
	@Override
	public int selectMyCount(ShareVo vo) throws Exception {
		return dao.selectMyCount(vo);
	}
	@Override
	public int selectOneCount(ShareVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}
	@Override
	public List<Share> selectMyList(ShareVo vo) throws Exception {
		return dao.selectMyList(vo);
	}

	@Override
	public List<Share> nowList(ShareVo vo) throws Exception {
		return dao.nowList(vo);
	}
	
	@Override
	public List<Share> selectList2(ShareVo svo) throws Exception {
		List<Share> sList = dao.selectList2(svo);
		return sList;
	}

	@Override
	public List<Share> selectList(ShareVo vo) throws Exception {
		List<Share> list = dao.selectList(vo);
		return list;
	}

	@Override
	public List<Share> selectListFav(ShareVo vo) throws Exception {
		List<Share> list = dao.selectListFav(vo);
		return list;
	}

	@Override
	public List<Share> favList(ShareVo vo) throws Exception {
		return dao.favList(vo);
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
	public int likeCount(Share dto) throws Exception {
		return dao.likeCount(dto);
	}

	@Override
	public int likeUpdt(Share dto) throws Exception {
		return dao.likeUpdt(dto);
	}
	
	@Override
	public int likeCountUpdt(Share dto) throws Exception {
		return dao.likeCountUpdt(dto);
	}

	@Override
	public Share likeOne(Share dto) throws Exception {
		return dao.likeOne(dto);
	}
	
	@Override
	public int update(Share dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int idCheck(Share dto) throws Exception {
		return dao.idCheck(dto);
	}
	
	@Override
	public Share selectOne(ShareVo vo) throws Exception {
		return dao.selectOne(vo);
	}
	
	public void likeInst(Share dto) throws Exception {
		System.out.println("insert 여기 맞음?");
		likeCount(dto); // favorite insert
		System.out.println("likeCount 확인");
		likeCountUpdt(dto); // share likecount update
		System.out.println("likeCountUpdt 확인");
	}
	
	public void likeUpdt2(Share dto) throws Exception {
		System.out.println("update 여기 맞음?");
		likeUpdt(dto); // favorite update
		System.out.println("likeCount 확인");
		likeCountUpdt(dto); // share likeCount update
		System.out.println("likeCountUpdt 확인");
	}
}
