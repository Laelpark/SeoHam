package com.lael.infra.modules.share;

import java.util.List;

public interface ShareService {

	public List<Share> selectList(ShareVo vo) throws Exception;  // list 로 담아주기
	public List<Share> selectListFav(ShareVo vo) throws Exception;  // list 로 담아주기
	public List<Share> favList(ShareVo vo) throws Exception;  // list 로 담아주기
	public List<Share> nowList(ShareVo vo) throws Exception;  // list 로 담아주기
	public List<Share> selectList() throws Exception;			
	public List<Share> selectList1() throws Exception;
	public List<Share> selectList2(ShareVo svo) throws Exception;
	public List<Share> selectMyList(ShareVo vo) throws Exception;
	
	public int selectMyCount(ShareVo vo) throws Exception;
	public int selectOneCount2(ShareVo svo) throws Exception;
	public Share selectOne(ShareVo vo) throws Exception;
	public int selectOneCount(ShareVo vo) throws Exception;
	public int likeCount(Share dto) throws Exception;
	public int likeUpdt(Share dto) throws Exception;
	public int likeCountUpdt(Share dto) throws Exception;
	public Share likeOne(Share dto) throws Exception;			
	public int insert(Share dto) throws Exception;
	public int update(Share dto) throws Exception;
	public int idCheck(Share dto) throws Exception;
}
