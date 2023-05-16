package com.wolclass.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.domain.ClassVO;
import com.wolclass.persistance.ClassDAO;

@Service
public class ClassServiceImpl implements ClassService {
	private static final Logger logger = LoggerFactory.getLogger(ClassServiceImpl.class);
	
	@Autowired
	private ClassDAO dao;
	
	@Override
	public List<ClassVO> getOnlineList() throws Exception {
		return dao.getOnlineList();
	}
	
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
	
	@Override
	public void addClass(ClassVO vo) throws Exception {
		// 온라인 클래스 예외처리
		if(vo.getC_addr1().length() > 1) {
			vo.setC_addrdetails(vo.getC_addr2()+" "+vo.getC_addrdetails());
			String addr2tmp = vo.getC_addr1();
			vo.setC_addr1(addr2tmp.split(" ")[0]);
			vo.setC_addr2(addr2tmp.substring(vo.getC_addr1().length()+1));
		}
		dao.addClass(vo);
	}
	
	@Override
	public List<ClassVO> registerClassList(String m_id) throws Exception {
		return dao.registerClassList(m_id);
	}
	
	@Override
	public ClassVO getClassDetail(Integer c_no) throws Exception {
		logger.info("service-dao호출");
		return dao.selectClass(c_no);
	}
	
	@Override
	public List<ClassVO> getNearbyClassList(Object lat, Object lng, Object addr) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("userLat",Double.parseDouble(lat.toString()));
		map.put("userLng",Double.parseDouble(lng.toString()));
		map.put("userAddr",addr == null ? addr : addr.toString());
		return dao.getNearbyClassList(map);
	}

	@Override
	public List<ClassVO> getClassList(Map<String, Object> map) throws Exception {
		// 데이터 전처리
		if(!map.containsKey("timestart") || ((String)map.get("timestart")).equals("")) map.put("timestart", "00:00");
		if(!map.containsKey("timeend") || ((String)map.get("timeend")).equals("")) map.put("timeend", "24:00");
		if(!map.containsKey("lowlv")) map.put("lowlv", 0);
		if(!map.containsKey("midlv")) map.put("midlv", 0);
		if(!map.containsKey("highlv")) map.put("highlv", 0);
		if(!map.containsKey("category")) map.put("category", "");
		if(!map.containsKey("addr")) map.put("addr", "");
		if(!map.containsKey("order") || ((String)map.get("order")).equals("")) map.put("order", 0);
		if(!map.containsKey("search")) map.put("search", "");
		if(!map.containsKey("pageNum") || ((String)map.get("pageNum")).equals("")) map.put("pageNum", "1");
		map.put("userLat", Double.parseDouble(map.get("userLat").toString()));
		map.put("userLng", Double.parseDouble(map.get("userLng").toString()));
		// 데이터 전처리

		// 페이징 계산
		int count = dao.getClassListCnt(map);
		int pageSize = 12;
		int pageBlock = 10;
		int currentPage = Integer.parseInt((String)map.get("pageNum"));
		int startRow = (currentPage - 1) * pageSize + 1;
//		int endRow = currentPage * pageSize;
		List<ClassVO> list = new ArrayList<>();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		if(count > 0) list = dao.getClassList(map);
		int pageCount = count/pageSize + (count%pageSize==0? 0:1);
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		// 페이징 계산
		
		// 페이징 처리에 필요한 데이터 셋팅
		map.put("count", count);
		map.put("pageCount", pageCount);
		map.put("pageBlock", pageBlock);
		map.put("pageSize", pageSize);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		// 페이징 처리에 필요한 데이터 셋팅
		
		return list;
	}

}
