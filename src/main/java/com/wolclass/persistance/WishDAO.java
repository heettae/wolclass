package com.wolclass.persistance;

import java.util.List;

import com.wolclass.domain.ClassVO;
import com.wolclass.domain.WishVO;

public interface WishDAO {
	String NAMESPACE = "com.wolclass.mappers.WishMapper";
	
	// 위시리스트에 등록된 클래스번호만 가져오는 동작 HJ
	public List<Integer> getCnoList(String m_id);
	
	// 위시리스트에 등록된 클래스정보 가져오기 HJ
	public List<ClassVO> getClassList(String m_id);
	
	// 위시리스트 추가 HJ
	public void add(WishVO vo);
	
	// 위시리스트 삭제 HJ
	public void delete(WishVO vo);
}
