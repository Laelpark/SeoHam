package com.lael.infra.modules.shareCode;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ShareCodeServiceImpl implements ShareCodeService{

	@Autowired
	ShareCodeDao dao;

	@Override
	public List<ShareCode> selectList(ShareCodeVo vo) throws Exception {
		List<ShareCode> list = dao.selectList(vo); 
		return list;
	}

	@Override
	public int insert(ShareCode dto) throws Exception {
		return dao.insert(dto);
	}

	@Override
	public ShareCode selectOne(ShareCodeVo vo) throws Exception {
		ShareCode result = dao.selectOne(vo);
		return result;
	}

	@Override
	public int selectOneCount(ShareCodeVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}


	@Override
	public int update(ShareCode dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int uelete(ShareCode dto) throws Exception {
		return dao.uelete(dto);
	}

	@Override
	public int delete(ShareCodeVo vo) throws Exception {
		return dao.delete(vo);
	}
	

	@PostConstruct
	public void selectListCachedCodeArrayList() throws Exception {
		List<ShareCode> codeListFromDb = (ArrayList<ShareCode>) dao.selectListCachedCodeArrayList();
//		codeListFromDb = (ArrayList<Code>) dao.selectListCachedCodeArrayList();
		ShareCode.cachedCodeArrayList.clear(); 
		ShareCode.cachedCodeArrayList.addAll(codeListFromDb);
		System.out.println("cachedCodeArrayList: " + ShareCode.cachedCodeArrayList.size() + " chached !");
	}
		
	public static List<ShareCode> selectListCachedCode(String ccgSeq) throws Exception {
		List<ShareCode> rt = new ArrayList<ShareCode>();
		for (ShareCode codeRow : ShareCode.cachedCodeArrayList) {
			if (codeRow.getCcgSeq().equals(ccgSeq)) {
				rt.add(codeRow);
			} else {
				// by pass
			}
		}
		return rt;
	}
	
	public static String selectOneCachedCode(int code) throws Exception {
		String rt = "";
		for(ShareCode codeRow : ShareCode.cachedCodeArrayList) {
			if (codeRow.getCcgSeq().equals(Integer.toString(code))) {
				rt = codeRow.getName();
			} else {
				// by pass
			}
		}
		return rt;
	}
	
	public static void clear() throws Exception {
		ShareCode.cachedCodeArrayList.clear();
	}
}
