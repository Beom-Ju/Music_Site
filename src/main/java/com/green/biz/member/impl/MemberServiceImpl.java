package com.green.biz.member.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.biz.member.AddressVO;
import com.green.biz.member.DelVO;
import com.green.biz.member.MemberService;
import com.green.biz.member.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDao;
	
	@Override
	public MemberVO findMember(String id) {
		
		return memberDao.findMember(id);
	}
	
	@Override
	public void insertMember(MemberVO vo) {

		memberDao.insertMember(vo);
	}

	@Override
	public List<AddressVO> findAddress(String dong) {

		return memberDao.findAddress(dong);
	}

	@Override
	public MemberVO getMember(MemberVO vo) {
		
		return memberDao.getMember(vo);
	}

	@Override
	public MemberVO getId_Email(MemberVO vo) {
		
		return memberDao.getId_Email(vo);
	}

	@Override
	public MemberVO getId_Phone(MemberVO vo) {

		return memberDao.getId_Phone(vo);
	}

	@Override
	public MemberVO getPwd_Email(MemberVO vo) {

		return memberDao.getPwd_Email(vo);
	}

	@Override
	public MemberVO getPwd_Phone(MemberVO vo) {

		return memberDao.getPwd_Phone(vo);
	}

	@Override
	public void updatePwd(MemberVO vo) {
		
		memberDao.updatePwd(vo);
	}

	@Override
	public void deleteMember(String id) {
		
		memberDao.deleteMember(id);
	}

	@Override
	public void updateMember(MemberVO vo) {
		
		memberDao.updateMember(vo);
	}
	
	@Override
	public int findDelReason(String reason) {
		
		return memberDao.findDelReason(reason);
	}

	@Override
	public void insertDelReason(DelVO vo) {
		
		memberDao.insertDelReason(vo);
	}

	@Override
	public void updateDelReason(String reason) {
		
		memberDao.updateDelReason(reason);
	}
	@Override
	public void updateIntro(MemberVO vo) {

		memberDao.updateIntro(vo);
	}





}
