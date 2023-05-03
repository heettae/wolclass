package com.wolclass.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class FileServiceImpl implements FileService{
	
	private static final Logger logger = LoggerFactory.getLogger(FileServiceImpl.class);
	
	@Override
	public String fileProcess(MultipartHttpServletRequest multiRequest) throws Exception {
		List<String> fileList = new ArrayList<String>();

		// input-file 파라메터정보를 가져오기
		Iterator<String> fileNames = multiRequest.getFileNames();
		while (fileNames.hasNext()) {
			// input file 이름 정보를 저장
			String fileName = fileNames.next();
			
			// 이름에 해당하는 실제 파일의 데이터를 저장(임시저장)
			MultipartFile mFile = multiRequest.getFile(fileName); // file1,file2,....
			// 파일의 이름
			String oFileName = mFile.getOriginalFilename();
			logger.info("file이름 저장 완료! ");
			
			 // 파일 이름에 고유한 값을 추가하여 파일 이름 변경
	        String fileExtension = oFileName.substring(oFileName.lastIndexOf(".")); // 파일 확장자 추출
	        String uniqueFileName = new SimpleDateFormat("HHmmss").format(new Date()) + UUID.randomUUID().toString() + fileExtension;
	        String uploadPath = getClass().getResource("/").getPath().split("WEB-INF")[0]+"resources/img/";
			fileList.add(uniqueFileName);

			// 파일생성 => 파일업로드
			File file = new File(uploadPath + uniqueFileName);

			// 파일의 내용 추가
			// 업로드한 파일이 있을때
			if (mFile.getSize() != 0) {
				// 해당 경로에 파일이 없을경우
				if (!file.exists()) {
					// 해당하는 디렉터리 생성후 파일을 업로드
					if (file.getParentFile().mkdirs()) {
						file.createNewFile();
					} // mkdirs
				} // exists
					// 임시로 생성(저장) MultipartFile을 실제 파일로 전송
				mFile.transferTo(file);
			} // getSize
		} // while
		logger.info("file 업로드 완료! ");

		logger.info("fileList@@@@@@@@@@@ : "+fileList.toString());
		return String.join(",", fileList);
	}

}
