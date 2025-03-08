package com.green.biz.album;

import java.sql.Timestamp;

import lombok.Data;

//lombok 라이브러리 사용
@Data
public class CmtVO {
	private int num;
	private int cseq;
	private int aseq;
	private String album_name;
	private String id;
	private String contents;
	private Timestamp regdate;
}
