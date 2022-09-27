package com.lael.infra.modules.shareCode;

import java.util.List;

public interface ShareCodeService {
	public List<ShareCode> selectList(ShareCodeVo vo) throws Exception;
	public int insert(ShareCode dto) throws Exception;
	public ShareCode selectOne(ShareCodeVo vo) throws Exception;
	public int update(ShareCode dto) throws Exception;
	public int uelete(ShareCode dto) throws Exception;
	public int delete(ShareCodeVo vo) throws Exception;
	public int selectOneCount(ShareCodeVo vo) throws Exception;

}
