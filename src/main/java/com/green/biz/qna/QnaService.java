package com.green.biz.qna;

import java.util.List;

import com.green.biz.utils.Criteria;

public interface QnaService {

	public List<QnaVO> getQnaList(String id, Criteria cri);
	
	public int getQnaListCnt(String id);
	
	QnaVO qnaDetail (int qseq);
	
	void qnaWrite (QnaVO vo);

}