package com.wolclass.service;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.persistance.TJDAO;

@Service
public class TJServiceImpl implements TJService{
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
		String t_date = (String) map.get("t_date");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = dateFormat.parse(t_date);
		
		map.put("t_start", Time.valueOf(map.get("t_start").toString()));
		map.put("t_end", Time.valueOf(map.get("t_end").toString()));
		map.put("t_date", date);
		dao.addTime(map);
	}	
	// 클래스 시간 등록

	// 회원정보 조회
	@Override
	public MemberVO getMemberInfo(String m_id) throws Exception {

		return dao.getMemberInfo(m_id);
	}
	// 회원정보 조회
	



	// 카테고리별 클래스 리스트 조회
	@Override
	public List<ClassVO> getCategoryClassList() throws Exception{
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
		logger.info("Service - birthDate @@@@@@@@@@@@ "+m_dogbirth);
		LocalDate now = LocalDate.now();
		return Period.between(birthDate, now).getYears();
	}
	// 반려견 나이 계산
	
	
	

	
	
}
