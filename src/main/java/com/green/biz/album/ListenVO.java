package com.green.biz.album;

import lombok.Data;

//lombok 라이브러리 사용
@Data
public class ListenVO {
	private int lseq;
	private int sseq;
	private String id;
	private int listen_click_cnt;
}
