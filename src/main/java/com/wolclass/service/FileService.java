package com.wolclass.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface FileService {
	
	// 파일 업로드 후 파일명 리턴 TJ
	public List<String> fileProcess(MultipartHttpServletRequest multiRequest) throws Exception;
}
