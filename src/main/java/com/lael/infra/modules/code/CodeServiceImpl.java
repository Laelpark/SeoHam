package com.lael.infra.modules.code;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CodeServiceImpl implements CodeService{

	@Autowired
	CodeDAO dao;

	@Override
	public List<Code> selectList(CodeVo vo) throws Exception {
		List<Code> list = dao.selectList(vo); 
		return list;
	}

	@Override
	public int insert(Code dto) throws Exception {
		return dao.insert(dto);
	}

	@Override
	public Code selectOne(CodeVo vo) throws Exception {
		Code result = dao.selectOne(vo);
		return result;
	}

	@Override
	public int selectOneCount(CodeVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}


	@Override
	public int update(Code dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int uelete(Code dto) throws Exception {
		return dao.uelete(dto);
	}

	@Override
	public int delete(CodeVo vo) throws Exception {
		return dao.delete(vo);
	}
	

	@PostConstruct
	public void selectListCachedCodeArrayList() throws Exception {
		List<Code> codeListFromDb = (ArrayList<Code>) dao.selectListCachedCodeArrayList();
//		codeListFromDb = (ArrayList<Code>) dao.selectListCachedCodeArrayList();
		Code.cachedCodeArrayList.clear(); 
		Code.cachedCodeArrayList.addAll(codeListFromDb);
		System.out.println("cachedCodeArrayList: " + Code.cachedCodeArrayList.size() + " chached !");
	}
		
	public static List<Code> selectListCachedCode(String ccgSeq) throws Exception {
		List<Code> rt = new ArrayList<Code>();
		for (Code codeRow : Code.cachedCodeArrayList) {
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
		for(Code codeRow : Code.cachedCodeArrayList) {
			if (codeRow.getCcgSeq().equals(Integer.toString(code))) {
				rt = codeRow.getCodeName();
			} else {
				// by pass
			}
		}
		return rt;
	}
	
	public static void clear() throws Exception {
		Code.cachedCodeArrayList.clear();
	}
}
