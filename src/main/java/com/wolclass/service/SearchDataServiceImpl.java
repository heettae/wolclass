package com.wolclass.service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.persistance.SearchDataDAO;

import kr.co.shineware.nlp.komoran.constant.DEFAULT_MODEL;
import kr.co.shineware.nlp.komoran.core.Komoran;
import kr.co.shineware.nlp.komoran.model.KomoranResult;
import kr.co.shineware.nlp.komoran.model.Token;

@Service
public class SearchDataServiceImpl implements SearchDataService{

	@Autowired
	private SearchDataDAO dao;
	
	@Override
	public List<String> getPSList() throws Exception {
		return dao.getPSList();
	}
	
	@Override
	public void analyze(Map<String,Object> srchMap) throws Exception {
		String searchData = (String)srchMap.get("search");
		if(searchData == null || searchData.equals("")) return;
		
		Komoran komoran = new Komoran(DEFAULT_MODEL.FULL);
		
		KomoranResult analyzeResultList = komoran.analyze(searchData);
		List<Token> tokenList = analyzeResultList.getTokenList();
		
		// 고유명사, 일반명사 추출
		Set<String> set = new HashSet<>();
		for(Token t : tokenList) if(t.getPos().equals("NNG") || t.getPos().equals("NNP")) set.add(t.getMorph());

		// 데이터 베이스에 존재하는 키워드인지 확인
		Iterator<String> iter = set.iterator();
		while(iter.hasNext()) {
			Map<String,Object> map = new HashMap<>();
			String word = iter.next();
			map.put("word",word);
			map.put("userAddr", srchMap.get("userAddr") == null ? "" : (String)srchMap.get("userAddr"));
			if(dao.getClassCount(word)) map.put("exist",'Y');
			else map.put("exist",'N');
			dao.insert(map);
		}
	}

}
