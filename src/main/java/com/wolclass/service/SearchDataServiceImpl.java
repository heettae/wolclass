package com.wolclass.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public void analyze(Object objStr) throws Exception {
		String searchData = (String)objStr;
		if(searchData == null || searchData.equals("")) return;
		
		Komoran komoran = new Komoran(DEFAULT_MODEL.FULL);
		
		KomoranResult analyzeResultList = komoran.analyze(searchData);
		List<Token> tokenList = analyzeResultList.getTokenList();
		Map<String,Object> map = new HashMap<>();
		
		for(Token t : tokenList) {
			if((t.getPos().equals("NNG") || t.getPos().equals("NNP")) && (t.getMorph() != null)) {
				map.put("word",t.getMorph());
				if(dao.getClassCount(t.getMorph())) map.put("exist",'Y');
				else map.put("exist",'N');
				dao.insert(map);
			}
		}
	}

}
