package com.green.biz.album;

import lombok.Data;

//lombok 라이브러리 사용
@Data
public class SingerVO {
	private int num;
	private int pseq;
	private String singer_image;
	private String singer_name;
	private int regdate_year;
	private String first_song;
}
