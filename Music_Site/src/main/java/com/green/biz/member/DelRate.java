package com.green.biz.member;

import lombok.Data;

//lombok 라이브러리 사용
@Data
public class DelRate {
	private String reason;
	private int reason_cnt;
}
