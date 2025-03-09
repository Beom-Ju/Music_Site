package com.green.biz.qna;

import java.sql.Timestamp;

import lombok.Data;

//lombok 라이브러리 사용
@Data
public class QnaVO {
	private int num;
	private int qseq;
	private String id;
	private String kind;
	private String subject;
	private String content;
	private String picture;
	private String reply;
	private String rep;
	private Timestamp regdate;
}
