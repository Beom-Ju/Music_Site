package com.green.biz.album;

import lombok.Data;

//lombok 라이브러리 사용
@Data
public class KeyVO {
	private int ro;
	private int kseq;
	private String keyword;
	private int search_cnt;
}
