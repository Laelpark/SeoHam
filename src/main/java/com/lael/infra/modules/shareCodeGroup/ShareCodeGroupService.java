package com.lael.infra.modules.shareCodeGroup;

import java.util.List;

public interface ShareCodeGroupService {
	public List<ShareCodeGroup> selectList(ShareCodeGroupVo vo) throws Exception;  // list 로 담아주기
	public List<ShareCodeGroup> selectList() throws Exception;			
	public List<ShareCodeGroup> selectList1() throws Exception;	
	public int insert(ShareCodeGroup dto) throws Exception;
	public ShareCodeGroup selectOne(ShareCodeGroupVo vo) throws Exception;	    // item 로 담아주기
	public int update(ShareCodeGroup dto) throws Exception;
	public int uelete(ShareCodeGroup dto) throws Exception;
	public int delete(ShareCodeGroupVo vo) throws Exception;
	public int selectOneCount(ShareCodeGroupVo vo) throws Exception;
	
	public int idCheck(ShareCodeGroup dto) throws Exception;
}
