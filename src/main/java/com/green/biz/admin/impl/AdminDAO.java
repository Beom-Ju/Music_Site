package com.green.biz.admin.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.biz.admin.AdminVO;
import com.green.biz.album.AlbumVO;
import com.green.biz.album.CmtVO;
import com.green.biz.album.SingerVO;
import com.green.biz.album.SongVO;
import com.green.biz.member.DelRate;
import com.green.biz.member.DelVO;
import com.green.biz.member.MemberVO;

import com.green.biz.qna.QnaVO;
import com.green.biz.utils.Criteria;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public AdminVO getAdmin(AdminVO vo) {
		
		return mybatis.selectOne("AdminDAO.getAdmin", vo);
	}
	
	public List<SingerVO> singerAll() {
		
		return mybatis.selectList("AdminDAO.singerAll");
	}
	
	public List<SingerVO> listSingerPaging(String keyword, Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("criteria", cri);
		
		return mybatis.selectList("AdminDAO.listSingerPaging", map);
	}
	
	public int listSingerCnt(String keyword) {
		
		return mybatis.selectOne("AdminDAO.listSingerCnt", keyword);
	}
	
	public void singerWrite(SingerVO vo) {
		
		mybatis.insert("AdminDAO.singerWrite", vo);
	}
	
	public void singerUpdate(SingerVO vo) {
		
		mybatis.update("AdminDAO.singerUpdate", vo);
	}
	
	public void singerDelete(int pseq) {
		
		mybatis.delete("AdminDAO.singerDelete", pseq);
	}
	
	public Integer findAlbumBySinger(int pseq) {
		
		return mybatis.selectOne("AdminDAO.findAlbumBySinger", pseq);
	}
	
	public List<AlbumVO> albumAll(AlbumVO vo ) {
		
		return mybatis.selectList("AdminDAO.albumAll", vo);
	}
	
	public void albumWrite(AlbumVO vo) {
		mybatis.insert("AdminDAO.albumWrite", vo);
	}
	
	public void albumUpdate(AlbumVO vo) {
		mybatis.update("AdminDAO.albumUpdate", vo);
	}
	
	public void albumDelete(int aseq) {
		mybatis.delete("AdminDAO.albumDelete", aseq);
	}
	
	public List<AlbumVO> listAlbumPaging(String keyword, Criteria cri) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("criteria", cri);
		return mybatis.selectList("AdminDAO.listAlbumPaging", map);
	}
	
	public int listAlbumCnt(String keyword) {
		
		return mybatis.selectOne("AdminDAO.listAlbumCnt", keyword);
	}
	
	public Integer findSongByAlbum(int aseq) {
		return mybatis.selectOne("AdminDAO.findSongByAlbum", aseq);
	}
	
	public List<SongVO> songAll() {
		return mybatis.selectList("AdminDAO.songAll");
	}
	
	public List<SongVO> listSongPaging(String keyword, Criteria cri) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("criteria", cri);
		
		return mybatis.selectList("AdminDAO.listSongPaging", map);
		
	}
	
	public int listSongCnt(String keyword) {
		
		return mybatis.selectOne("AdminDAO.listSongCnt", keyword);
	}
	
	public void songWrite(SongVO vo) {
		mybatis.insert("AdminDAO.songWrite", vo);
	}
	
	public void songUpdate(SongVO vo) {
		mybatis.update("AdminDAO.songUpdate", vo);
	}
	
	public void songDelete(int sseq) {
		
		mybatis.delete("AdminDAO.songDelete", sseq);
	}
	
	public void deleteGood(int sseq) {
		mybatis.delete("AdminDAO.deleteGood", sseq);
	}
	
	public void deleteListen(int sseq) {
		mybatis.delete("AdminDAO.deleteListen", sseq);
	}
	
	public List<CmtVO> cmtAll() {
		
		return mybatis.selectList("AdminDAO.cmtAll");
	}
	
	public List<CmtVO> listCmtPaging(String keyword, Criteria cri) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("criteria", cri);
		
		return mybatis.selectList("AdminDAO.listCmtPaging", map);
	}
	
	public int listCmtCnt(String keyword) {
		
		return mybatis.selectOne("AdminDAO.listCmtCnt", keyword);
	}
	
	public void admin_cmtDelete(int cseq) {
		mybatis.delete("AdminDAO.admin_cmtDelete", cseq);
	}
	
	public void admin_cmtDeleteAll(int aseq) {
		mybatis.delete("AdminDAO.admin_cmtDeleteAll", aseq);
	}
	
	public List<CmtVO> adminSearchCmt(String keyword) {
		return mybatis.selectList("AdminDAO.adminSearchCmt", keyword);
	}
	
	public List<MemberVO> memberAll() {
		return mybatis.selectList("AdminDAO.memberAll");
	}
	
	public List<MemberVO> listMemberPaging(String keyword, Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("criteria", cri);
		
		return mybatis.selectList("AdminDAO.listMemberPaging", map);
	}
	
	public int listMemberCnt(String keyword) {
		
		return mybatis.selectOne("AdminDAO.listMemberCnt", keyword);
	}
	
	
	
	public List<QnaVO> qnaAll() {
		
		return mybatis.selectList("AdminDAO.qnaAll");
	}
	
	public void qnaUpdate(QnaVO vo) {
		
		mybatis.update("AdminDAO.qnaUpdate", vo);
	}
	
	public List<QnaVO> listQnaPaging(String keyword, Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("criteria", cri);
		
		return mybatis.selectList("AdminDAO.listQnaPaging", map);
	}
	
	public int listQnaCnt(String keyword) {
		
		return mybatis.selectOne("AdminDAO.listQnaCnt", keyword);
	}
	
	////// Â÷Æ® ///////
	public List<DelRate> getDelReasons() {
		
		return mybatis.selectList("AdminDAO.getDelReasons");
	}
	
	public List<DelVO> getDelReasonEtc() {
		
		return mybatis.selectList("AdminDAO.getDelReasonsEtc");
	}
}
