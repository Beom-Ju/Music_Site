package com.green.biz.qna.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.biz.qna.QnaService;
import com.green.biz.qna.QnaVO;
import com.green.biz.utils.Criteria;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO qnaDao;
	
	@Override
	public List<QnaVO> getQnaList(String id, Criteria cri) {
		
		return qnaDao.getQnaList(id, cri);
	}

	@Override
	public int getQnaListCnt(String id) {
		
		return qnaDao.getQnaListCnt(id);
	}
	
	@Override
	public QnaVO qnaDetail(int qseq) {
		
		return qnaDao.qnaDetail(qseq);
	}

	@Override
	public void qnaWrite(QnaVO vo) {
		
		qnaDao.qnaWrite(vo);
	}

	

}
