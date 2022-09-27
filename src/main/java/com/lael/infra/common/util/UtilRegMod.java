package com.lael.infra.common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class UtilRegMod {
	public static String getSessionSeqCore(HttpServletRequest httpServletRequest) {
		HttpSession httpSession =  httpServletRequest.getSession();
		String rtSeq = (String) httpSession.getAttribute("sessSeq");
		return rtSeq;
	}
}
