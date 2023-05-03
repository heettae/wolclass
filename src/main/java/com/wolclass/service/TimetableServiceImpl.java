package com.wolclass.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.domain.TimetableVO;
import com.wolclass.persistance.TimetableDAO;
import com.wolclass.utils.TypeParser;

@Service
public class TimetableServiceImpl implements TimetableService {

	@Autowired
	private TimetableDAO dao;

	@Override
	public List<TimetableVO> getTimetable(Integer c_no) throws Exception {
		List resultVO = dao.getTimetable(c_no);
		return resultVO;
	}
	
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
}
