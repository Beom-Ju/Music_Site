package com.green.biz.admin;

import lombok.Data;


//lombok 라이브러리 사용
@Data
public class AdminVO {
	private String id;
	private String pwd;
	private String name;
	private String phone;
	private String email;
}
