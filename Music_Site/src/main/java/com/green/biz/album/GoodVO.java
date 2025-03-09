package com.green.biz.album;

import lombok.Data;

//lombok 라이브러리 사용
@Data
public class GoodVO {
	private int gseq;
	private int sseq;
	private String id;
	private int click_cnt;
}
