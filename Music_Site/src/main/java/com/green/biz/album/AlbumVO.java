package com.green.biz.album;

import lombok.Data;

//lombok 라이브러리 사용
@Data
public class AlbumVO {
	private int num;
	private int aseq;
	private int pseq;
	private int sseq;
	private String album_image;
	private String album_kind;
	private String singer_name;
	private String album_name;
	private String regdate;
	private String genre;
	private String content;
	private String kpop;
	private double score;
	private int score_cnt;
	private String subject;
	private int good_cnt;
	private int listen_cnt;
	private String title;
}
