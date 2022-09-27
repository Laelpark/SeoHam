package com.lael.infra.modules.share;

import java.util.List;

public interface ShareService {

	public List<Share> selectList(ShareVo vo) throws Exception;  // list 로 담아주기
	public List<Share> selectList() throws Exception;			
	public List<Share> selectList1() throws Exception;
	
	public int selectOneCount(ShareVo vo) throws Exception;
	public int insert(Share dto) throws Exception;
	public int update(Share dto) throws Exception;
	public int idCheck(Share dto) throws Exception;
	
}
