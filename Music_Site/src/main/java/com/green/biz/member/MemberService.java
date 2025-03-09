package com.green.biz.member;

import java.util.List;

public interface MemberService {

	public MemberVO findMember(String id);
	
	public List<AddressVO> findAddress(String dong);
	
	void insertMember(MemberVO vo);
	
	public MemberVO getMember(MemberVO vo);
	
	public MemberVO getId_Email(MemberVO vo);
	
	public MemberVO getId_Phone(MemberVO vo);

	public MemberVO getPwd_Email(MemberVO vo);
	
	public MemberVO getPwd_Phone(MemberVO vo);
	
	public void updatePwd(MemberVO vo);
	
	public void deleteMember(String id);
	
	public void updateMember(MemberVO vo);
	
	public int findDelReason(String reason);

	public void insertDelReason(DelVO vo);

	public void updateDelReason(String reason);
	
	public void updateIntro(MemberVO vo);
}