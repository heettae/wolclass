package com.wolclass.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface FileService {
	
	// 파일 업로드 후 파일명 리턴 TJ
	public String fileProcess(MultipartHttpServletRequest multiRequest) throws Exception;
}
