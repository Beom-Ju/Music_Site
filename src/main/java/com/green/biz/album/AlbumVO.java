package com.green.biz.album;

import lombok.Data;

//lombok 라이브러리 사용
@Data
public class AlbumVO {
	private int num;
	private int aseq;	//�ٹ� ��ȣ
	private int pseq;	//���� ��ȣ
	private int sseq; //�뷡 ��ȣ
	private String album_image;	//�ٹ� �̹���
	private String album_kind;	//�ٹ� ����
	private String singer_name;	//���� �̸�
	private String album_name;	//�ٹ� �̸�
	private String regdate;	//�߸� ��¥
	private String genre;	//�帣
	private String content;	//�ٹ� ����
	private String kpop;	//�߸� ����(���� or �ؿ�)
	private double score;	//����
	private int score_cnt;
	private String subject; //�뷡
	private int good_cnt;
	private int listen_cnt;
	private String title;	//Ÿ��Ʋ�� ����
}
