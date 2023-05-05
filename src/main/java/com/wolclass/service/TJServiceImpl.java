package com.wolclass.service;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wolclass.domain.AlertVO;
import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.domain.WishVO;
import com.wolclass.persistance.TJDAO;
import com.wolclass.utils.TypeParser;

@Service
public class TJServiceImpl implements TJService {
	private static final Logger logger = LoggerFactory.getLogger(TJServiceImpl.class);
	@Autowired
	TJDAO dao;

	// 클래스 등록
	@Override
	public int addClass(ClassVO vo) throws Exception {

		return dao.addClass(vo);
	}
	// 클래스 등록

	// 클래스 시간 등록
	@Override
	public void addTime(Map<String, Object> map) throws Exception {
		String c_no = (String) map.get("c_no");
		String t_rem_p = (String) map.get("t_rem_p");
		String t_start = (String) map.get("t_start");
		String t_end = (String) map.get("t_end");
		String t_date = (String) map.get("t_date");
		
		map.put("c_no", Integer.parseInt(c_no));
		map.put("t_rem_p", Integer.parseInt(t_rem_p));
		map.put("t_start", TypeParser.stringToTime(t_start));
		map.put("t_end", TypeParser.stringToTime(t_end));
		map.put("t_date", TypeParser.stringToDate(t_date));

		dao.addTime(map);

	}
	// 클래스 시간 등록

	// 파일 처리
	@Override
	public List<String> fileProcess(MultipartHttpServletRequest multiRequest) throws Exception {
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

		return fileList;
	}
	// 파일 처리

	// 등록 완료 클래스 리스트
	@Override
	public List<ClassVO> registerClassList(String m_id) throws Exception {
		return dao.registerClassList(m_id);
	}
	// 등록 완료 클래스 리스트

	// 회원정보 조회
	@Override
	public MemberVO getMemberInfo(String m_id) throws Exception {

		return dao.getMemberInfo(m_id);
	}
	// 회원정보 조회

	// 카테고리별 클래스 리스트 조회
	@Override
	public List<ClassVO> getCategoryClassList() throws Exception {
		return dao.getCategoryClassList();
	}
	// 카테고리별 클래스 리스트 조회

	// 키워드별 추천
	@Override
	public List<ClassVO> findByKeyword(String keyword) throws Exception {

		return dao.findByKeyword(keyword);
	}
	// 키워드별 추천

	// 생일 1주일 전
	@Override
	public int oneWeekBeforeBirth(String m_id) throws Exception {
		return dao.oneWeekBeforeBirth(m_id);
	}
	// 생일 1주일 전

	// 반려견 나이 계산
	@Override
	public Integer calculateAge(Timestamp m_dogbirth) throws Exception {
		LocalDate birthDate = m_dogbirth.toLocalDateTime().toLocalDate();
		logger.info("Service - birthDate @@@@@@@@@@@@ " + m_dogbirth);
		LocalDate now = LocalDate.now();
		return Period.between(birthDate, now).getYears();
	}
	// 반려견 나이 계산

	
	// 알림 목록
	@Override
	public List<AlertVO> getAlertList(String m_id) throws Exception {
		return dao.getAlertList(m_id);
	}
	// 알림 목록

	// 알림 체크
	@Override
	public void alertCheck(Integer a_no) throws Exception {
		dao.alertCheck(a_no);
	}
	// 알림 체크

	// 알림 전체 체크
	@Override
	public void alertCheckAll(String m_id) throws Exception {
		dao.alertCheckAll(m_id);
	}
	// 알림 전체 체크
	
	

}
