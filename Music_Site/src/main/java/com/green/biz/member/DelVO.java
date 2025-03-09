package com.green.biz.member;

import lombok.Data;

//lombok 라이브러리 사용
@Data
public class DelVO {
	private int dseq;
	private String reason;
	private int reason_cnt;
	private String etcyn;
}
