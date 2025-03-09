package com.green.biz.qna.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.biz.qna.QnaVO;
import com.green.biz.utils.Criteria;

@Repository
public class QnaDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public List<QnaVO> getQnaList(String id, Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("criteria", cri);		
		
		return mybatis.selectList("QnaDAO.getQnaList", map);
	}
	
	public int getQnaListCnt(String id) {
		
		return mybatis.selectOne("QnaDAO.getQnaListCnt", id);
	}
	
	public QnaVO qnaDetail (int qseq) {
		
		return mybatis.selectOne("QnaDAO.qnaDetail", qseq);
	}
	
	public void qnaWrite (QnaVO vo) {
		
		mybatis.insert("QnaDAO.qnaWrite", vo);
	}
}
