package com.green.biz.admin;

import java.util.List;

import com.green.biz.album.AlbumVO;
import com.green.biz.album.CmtVO;
import com.green.biz.album.SingerVO;
import com.green.biz.album.SongVO;
import com.green.biz.member.DelRate;
import com.green.biz.member.DelVO;
import com.green.biz.member.MemberVO;
import com.green.biz.qna.QnaVO;
import com.green.biz.utils.Criteria;

public interface AdminService {

	AdminVO getAdmin(AdminVO vo);
	
	List<SingerVO> singerAll();
	
	public List<SingerVO> listSingerPaging(String keyword, Criteria cri);
	
	public int listSingerCnt(String keyword);
	
	void singerWrite(SingerVO vo);
	
	void singerUpdate(SingerVO vo);
	
	void singerDelete(int pseq);
	
	Integer findAlbumBySinger(int pseq);
	
	public List<SongVO> songAll();
	
	public List<SongVO> listSongPaging(String keyword, Criteria cri);
	
	public int listSongCnt(String keyword);
	
	List<AlbumVO> albumAll(AlbumVO vo);

	void albumWrite(AlbumVO vo);
	
	void albumUpdate(AlbumVO vo);
	
	public void albumDelete(int aseq);
	
	public List<AlbumVO> listAlbumPaging(String keyword, Criteria cri);
	
	public int listAlbumCnt(String keyword);
	
	public Integer findSongByAlbum(int aseq);
	
	void songWrite(SongVO vo);
	
	public void songUpdate(SongVO vo);
	
	public void songDelete(int sseq);
	
	public void deleteGood(int sseq);
	
	public void deleteListen(int sseq);
	
	public List<CmtVO> cmtAll();
	
	public List<CmtVO> listCmtPaging(String keyword, Criteria cri);
	
	public int listCmtCnt(String keyword);
	
	public void admin_cmtDelete(int cseq);
	
	public void admin_cmtDeleteAll(int aseq);
	
	public List<CmtVO> adminSearchCmt(String keyword);
	
	public List<MemberVO> memberAll();
	
	public List<MemberVO> listMemberPaging(String keyword, Criteria cri);
	
	public int listMemberCnt(String keyword);
	
	public List<QnaVO> qnaAll();
	
	public void qnaUpdate(QnaVO vo);
	
	public List<QnaVO> listQnaPaging(String keyword, Criteria cri);
	
	public int listQnaCnt(String keyword);
	
	//Â÷Æ®
	
	public List<DelRate> getDelReasons();
	
	public List<DelVO> getDelReasonEtc();
}