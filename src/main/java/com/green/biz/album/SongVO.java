package com.green.biz.album;

import lombok.Data;

//lombok 라이브러리 사용
@Data
public class SongVO {
	private int num;
	private int sseq;
	private int pseq;
	private int aseq;
	private int song_num;
	private String album_image;
	private String subject;
	private String singer_name;
	private String album_name;
	private String genre;
	private String regdate;
	private int good_cnt;
	private int listen_cnt;
	private int down_cnt;
	private String title;
	private String kpop;
	private String goodClick;
	private int gseq;
	private String id;
	private int click_cnt;
	private int lseq;
	private int listen_click_cnt;
}
