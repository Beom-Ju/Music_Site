package com.green.biz.member.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.biz.member.AddressVO;
import com.green.biz.member.DelVO;
import com.green.biz.member.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//아이디 중복 확인
	public MemberVO findMember(String id) {
		
		return mybatis.selectOne("MemberDAO.findMember", id);
	}
	
	//주소 조회
	public List<AddressVO> findAddress(String dong) {
		
		return mybatis.selectList("MemberDAO.findAddress", dong);
	}
	
	//회원가입
	public void insertMember(MemberVO vo) {
		
		mybatis.insert("MemberDAO.insertMember", vo);
	}
	
	//로그인
	public MemberVO getMember(MemberVO vo) {
		
		return mybatis.selectOne("MemberDAO.getMember", vo);
	}
	
	//아이디 찾기 (이메일로)
	public MemberVO getId_Email(MemberVO vo) {
		
		return mybatis.selectOne("MemberDAO.getId_Email", vo);
	}
	
	//아이디 찾기 (전화번호로)
	public MemberVO getId_Phone(MemberVO vo) {
		System.out.println("MemberDAO�� VO="+vo);
		MemberVO member = mybatis.selectOne("MemberDAO.getId_Phone", vo);
		
		System.out.println("Phone���� Member��ȸ ���="+member);
		
		return member;
	}
	
	//비밀번호 찾기/변경 (이메일로)
	public MemberVO getPwd_Email(MemberVO vo) {
			
		return mybatis.selectOne("MemberDAO.getPwd_Email", vo);
	}
	
	//비밀번호 찾기/변경 (전화번호로)
	public MemberVO getPwd_Phone(MemberVO vo) {
			
		return mybatis.selectOne("MemberDAO.getPwd_Phone", vo);
	}
	
	//비밀번호 수정
	public void updatePwd(MemberVO vo) {
		
		mybatis.update("MemberDAO.updatePwd", vo);
	}
	
	//계정 수정하기
	public void updateMember(MemberVO vo) {
		mybatis.update("MemberDAO.updateMember", vo);
	}
	
	//탈퇴하기 (계정 삭제)
	public void deleteMember(String id) {
		
		mybatis.update("MemberDAO.deleteMember", id);
	}
	
	//탈퇴 이유 횟수 찾기
	public int findDelReason(String reason) {
		
		return mybatis.selectOne("MemberDAO.findDelReason", reason);
	}
	
	//탈퇴 이유 추가
	public void insertDelReason(DelVO vo) {
		
		mybatis.insert("MemberDAO.insertDelReason", vo);
	}
	
	//탈퇴 이유 횟수 업데이트
	public void updateDelReason(String reason) {
		
		mybatis.update("MemberDAO.updateDelReason", reason);
	}
	
	//소개글 수정하기
	public void updateIntro(MemberVO vo) {
		mybatis.update("MemberDAO.updateIntro", vo);
	}
	
}
