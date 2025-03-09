package com.green.biz.member;

import java.sql.Timestamp;

import lombok.Data;

//lombok 라이브러리 사용
@Data
public class MemberVO {
	private int num;
	private String id;
	private String pwd;
	private String member_picture;
	private String name;
	private String birth;
	private String gender;
	private String zip_num;
	private String address1;
	private String address2;
	private String phone;
	private String email;
	private Timestamp regdate;
	private String intro;
	private String useyn;
	
}
