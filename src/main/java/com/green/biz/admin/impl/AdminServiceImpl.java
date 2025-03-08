package com.green.biz.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.biz.admin.AdminService;
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


@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDao;
	
	@Override
	public AdminVO getAdmin(AdminVO vo) {
		
		return adminDao.getAdmin(vo);
	}

	@Override
	public List<SingerVO> singerAll() {
		
		return adminDao.singerAll();
	}
	
	@Override
	public List<SingerVO> listSingerPaging(String keyword, Criteria cri) {
		
		return adminDao.listSingerPaging(keyword, cri);
	}
	
	@Override
	public int listSingerCnt(String keyword) {
		
		return adminDao.listSingerCnt(keyword);
	}
	
	@Override
	public void singerWrite(SingerVO vo) {
		
		adminDao.singerWrite(vo);
	}

	@Override
	public void singerUpdate(SingerVO vo) {
		
		adminDao.singerUpdate(vo);
	}
	
	@Override
	public void singerDelete(int pseq) {
		
		adminDao.singerDelete(pseq);
	}

	@Override
	public Integer findAlbumBySinger(int pseq) {
		
		return adminDao.findAlbumBySinger(pseq);
	}
	
	@Override
	public List<AlbumVO> albumAll(AlbumVO vo) {
		
		return adminDao.albumAll(vo);
	}

	@Override
	public void albumWrite(AlbumVO vo) {

		adminDao.albumWrite(vo);
		
	}
	
	@Override
	public void albumUpdate(AlbumVO vo) {
		
		adminDao.albumUpdate(vo);
	}



	@Override
	public void albumDelete(int aseq) {
		
		adminDao.albumDelete(aseq);
	}
	
	@Override
	public List<AlbumVO> listAlbumPaging(String keyword, Criteria cri) {
		
		return adminDao.listAlbumPaging(keyword, cri);
	}
	
	@Override
	public int listAlbumCnt(String keyword) {
		
		return adminDao.listAlbumCnt(keyword);
	}

	@Override
	public Integer findSongByAlbum(int aseq) {
		
		return adminDao.findSongByAlbum(aseq);
	}
	
	@Override
	public List<SongVO> songAll() {
		
		return adminDao.songAll();
	}
	
	@Override
	public List<SongVO> listSongPaging(String keyword, Criteria cri) {
		
		return adminDao.listSongPaging(keyword, cri);
	}
	
	@Override
	public int listSongCnt(String keyword) {
	
		return adminDao.listSongCnt(keyword);
	}

	
	@Override
	public void songWrite(SongVO vo) {
		
		adminDao.songWrite(vo);
	}

	@Override
	public void songUpdate(SongVO vo) {
		
		adminDao.songUpdate(vo);
		
	}

	@Override
	public void songDelete(int sseq) {
		
		adminDao.songDelete(sseq);
	
	}
	
	@Override
	public void deleteGood(int sseq) {
		
		adminDao.deleteGood(sseq);
	}
	
	@Override
	public void deleteListen(int sseq) {
	
		adminDao.deleteListen(sseq);
	}
	
	@Override
	public List<CmtVO> cmtAll() {
		
		return adminDao.cmtAll();
	}
	
	@Override
	public List<CmtVO> listCmtPaging(String keyword, Criteria cri) {
		
		return adminDao.listCmtPaging(keyword, cri);
	}
	
	@Override
	public int listCmtCnt(String keyword) {
		
		return adminDao.listCmtCnt(keyword);
	}

	@Override
	public void admin_cmtDelete(int cseq) {
		
		adminDao.admin_cmtDelete(cseq);
	}
	
	@Override
	public void admin_cmtDeleteAll(int aseq) {
	
		adminDao.admin_cmtDeleteAll(aseq);
	}
	
	@Override
	public List<CmtVO> adminSearchCmt(String keyword) {
		
		return adminDao.adminSearchCmt(keyword);
	}
	
	@Override
	public List<MemberVO> memberAll() {

		return adminDao.memberAll();
	}
	
	@Override
	public List<MemberVO> listMemberPaging(String keyword, Criteria cri) {
		
		return adminDao.listMemberPaging(keyword, cri);
	}
	
	@Override
	public int listMemberCnt(String keyword) {
		
		return adminDao.listMemberCnt(keyword);
	}

	@Override
	public List<QnaVO> qnaAll() {
		
		return adminDao.qnaAll();
	}

	@Override
	public void qnaUpdate(QnaVO vo) {
		
		adminDao.qnaUpdate(vo);
	}
	

	@Override
	public List<QnaVO> listQnaPaging(String keyword, Criteria cri) {
		
		return adminDao.listQnaPaging(keyword, cri);
	}
	
	@Override
	public int listQnaCnt(String keyword) {
		
		return adminDao.listQnaCnt(keyword);
	}

	@Override
	public List<DelRate> getDelReasons() {
		
		return adminDao.getDelReasons();
	}

	@Override
	public List<DelVO> getDelReasonEtc() {
		
		return adminDao.getDelReasonEtc();
	}

	


}
