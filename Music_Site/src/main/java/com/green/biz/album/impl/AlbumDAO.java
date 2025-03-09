package com.green.biz.album.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.biz.album.AlbumVO;
import com.green.biz.album.CmtVO;
import com.green.biz.album.GoodVO;
import com.green.biz.album.GradeVO;
import com.green.biz.album.KeyVO;
import com.green.biz.album.ListenVO;
import com.green.biz.album.SingerVO;
import com.green.biz.album.SongVO;
import com.green.biz.utils.Criteria;

@Repository
public class AlbumDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	////////최신 앨범////////////
	
	//최신 앨범 조회 (8개)
	public List<AlbumVO> listAlbum() {
		
		return mybatis.selectList("AlbumDAO.listAlbum");
	}
	
	//최신 앨범 조회 (전체)
	public List<SongVO> listAlbumAll() {
		
		return mybatis.selectList("AlbumDAO.listAlbumAll");
	}
	
	//최신 앨범 조회 (전체, 국내)
	public List<SongVO> listAlbumKor() {
			
		return mybatis.selectList("AlbumDAO.listAlbumKor");
	}
	
	//최신 앨범 조회 (전체, 해외)
	public List<SongVO> listAlbumOver() {
		
		return mybatis.selectList("AlbumDAO.listAlbumOver");
	}

	
	//앨범 상세 정보
	public AlbumVO albumInfo(AlbumVO vo) {
		return mybatis.selectOne("AlbumDAO.albumInfo", vo);
	}
	
	//범에 해당하는 노래 리스트 조회
	public List<SongVO> songList(SongVO vo) {
		return mybatis.selectList("AlbumDAO.songList", vo);
	}
	
	//노래 상세 정보
	public SongVO songInfo(SongVO vo) {
		return mybatis.selectOne("AlbumDAO.songInfo", vo);
	}
	
	//해당 가수 정보 조회
	public SingerVO getSinger(int pseq) {
		return mybatis.selectOne("AlbumDAO.getSinger", pseq);
	}
	
	//가수에 해당하는 앨범 조회
	public List<AlbumVO> albumListBySinger(Criteria cri, int pseq) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", cri);
		map.put("pseq", pseq);
		
		return mybatis.selectList("AlbumDAO.albumListBySinger", map);
	}
	
	public int albumListBySingerCnt(int pseq) {
		
		return mybatis.selectOne("AlbumDAO.albumListBySingerCnt", pseq);
	}
	
	//가수에 해당하는 노래 조회
	public List<SongVO> songListBySinger(Criteria cri, int pseq) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", cri);
		map.put("pseq", pseq);
		
		return mybatis.selectList("AlbumDAO.songListBySinger", map);
	}
	
	public int songListBySingerCnt(int pseq) {
		
		return mybatis.selectOne("AlbumDAO.songListBySingerCnt", pseq);
	}
	
	/////////////노래 순위/////////////////////
	
	//순위에 따른 노래 리스트 조회 (상위 10개)
	public List<SongVO> songListByCnt() {
		
		return mybatis.selectList("AlbumDAO.songListByCnt");
	}
	
	//순위에 따른 노래 리스트 조회 (상위 100개, 전체)
	public List<SongVO> songListByCntAll(Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", cri);
			
		return mybatis.selectList("AlbumDAO.songListByCntAll", map);
	}
	
	//순위에 따른 노래 리스트 조회 (상위 100개, 국내)
	public List<SongVO> songListByCntKor(Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", cri);
		
		return mybatis.selectList("AlbumDAO.songListByCntKor", map);
	}
	
	//순위에 따른 노래 리스트 조회 (상위 100개, 해외)
	public List<SongVO> songListByCntOver(Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", cri);
			
		return mybatis.selectList("AlbumDAO.songListByCntOver", map);
	}
	
	
	//발라드 장로 조회
	public List<SongVO> genreBallad() {
		
		return mybatis.selectList("AlbumDAO.genreBallad");
	}
	
	//락 장르 조회
	public List<SongVO> genreRock() {
		
		return mybatis.selectList("AlbumDAO.genreRock");
	}
	
	//댄스 장르 조회
	public List<SongVO> genreDance() {
		
		return mybatis.selectList("AlbumDAO.genreDance");
	}
	
	//Ost 장르 조회
	public List<SongVO> genreOst() {
			
		return mybatis.selectList("AlbumDAO.genreOst");
	}
	
	//Pop 장르 조회
	public List<SongVO> genrePop() {
		
		return mybatis.selectList("AlbumDAO.genrePop");
	}
	
	//Rap 장르 조회
	public List<SongVO> genreRap() {
		
		return mybatis.selectList("AlbumDAO.genreRap");
	}
	
	//R&B/Soul 장르 조회
	public List<SongVO> genreRnb() {
		
		return mybatis.selectList("AlbumDAO.genreRnb");
	}
	
	//트로트 장르 조회
	public List<SongVO> genreTrot() {
		
		return mybatis.selectList("AlbumDAO.genreTrot");
	}
	
	//인디 장르 조회
	public List<SongVO> genreIndie() {
		
		return mybatis.selectList("AlbumDAO.genreIndie");
	}
	
	//포크 장르 조회
	public List<SongVO> genreFolk() {
		
		return mybatis.selectList("AlbumDAO.genreFolk");
	}
	
	
	
	///////////////////평점 기능////////////////////////
	// 앨범 평점 누른 앨범 번호 및 계정 찾기
	public int findGradeCnt(GradeVO vo) {
		
		return mybatis.selectOne("AlbumDAO.findGradeCnt", vo);
	}
	
	//앨범 평점 누른 앨범 사람 수
	public Integer findGradeMemberCnt(int aseq) {
		
		return mybatis.selectOne("AlbumDAO.findGradeMemberCnt", aseq);
	}
	
	//앨범 평점 등록
	public void addGradeCnt(GradeVO vo) {
		
		mybatis.insert("AlbumDAO.addGradeCnt", vo);
	}
	
	//앨범 평점 계산
	public double gradeRate(int aseq) {
		
		return mybatis.selectOne("AlbumDAO.gradeRate", aseq);
	}
	
	//앨범 평점 업데이트
	public void updateScore(AlbumVO vo) {
		
		mybatis.update("AlbumDAO.updateScore", vo);
	}
	
	
	
	////////////////////좋아요 기능 ////////////////////////
	//노래 좋아요 누른 노래 번호 및 계정 찾기
	public int findClickCnt(GoodVO vo) {
		
		return mybatis.selectOne("AlbumDAO.findClickCnt", vo);
	}
	
	//노래 좋아요 등록
	public void addClickCnt(GoodVO vo) {
		
		mybatis.insert("AlbumDAO.addClickCnt", vo);
	}
	
	//노래 좋아요 취소
	public void deleteClickCnt(GoodVO vo) {
		
		mybatis.delete("AlbumDAO.deleteClickCnt", vo);
	}
	
	//각 노래 좋아요 합계
	public Integer sumClickCnt(int sseq) {
		
		return mybatis.selectOne("AlbumDAO.sumClickCnt", sseq);
	}
	
	//노래 좋아요 대입
	public void updateGoodCnt(SongVO vo) {
		
		mybatis.update("AlbumDAO.updateGoodCnt", vo);
	}
	
	//아이디에 해당하는 노래 좋아요 찾기
	public List<GoodVO> findClickId(String id) {
		
		return mybatis.selectList("AlbumDAO.findClickId", id);
	}
	
	//아이디에 따른 좋아요 체크한 리스트
	public List<SongVO> goodSongListById(String id, Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("criteria", cri);
		
		
		return mybatis.selectList("AlbumDAO.goodSongListById", map);
	}
	
	public int goodSongListByIdCnt(String id) {
		
		return mybatis.selectOne("AlbumDAO.goodSongListByIdCnt", id);
	}
	
	
	
	//노래 듣기 추가
	public void addListenCnt(ListenVO vo) {
		mybatis.insert("AlbumDAO.addListenCnt", vo);
	}
	
	//노래 들은 횟수 있는지 확인 
	public int findListenCntById(ListenVO vo) {
		
		return mybatis.selectOne("AlbumDAO.findListenCntById", vo);
	}
	
	//각 노래 듣은 횟수 합
	public Integer sumListenClickCnt(int sseq) {
			
		return mybatis.selectOne("AlbumDAO.sumListenClickCnt", sseq);
	}
	
	//노래 좋아요 대입
	public void updateListenCnt(SongVO vo) {
		
		mybatis.update("AlbumDAO.updateListenCnt", vo);
	}
	
	public void listenCntById (ListenVO vo) {
		
		mybatis.update("AlbumDAO.listenCntById", vo);
	}
	
	public List<SongVO> listenSongListById(String id, Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("criteria", cri);
		
		return mybatis.selectList("AlbumDAO.listenSongListById", map);
	}
	
	public int listenSongListByIdCnt(String id) {
		
		return mybatis.selectOne("AlbumDAO.listenSongListByIdCnt", id);
	}
	
	////////////////// 댓글 기능///////////////////
	
	//앨범에 해당하는 댓글 조회
	public List<CmtVO> cmtList(int aseq) {
		return mybatis.selectList("CmtDAO.cmtList", aseq);
	}
	
	//댓글 페이지별 조회
	public List<CmtVO> cmtListPaging(Criteria criteria, int aseq) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("criteria", criteria);
		map.put("aseq", aseq);
		
		return mybatis.selectList("CmtDAO.cmtListPaging", map);
	}
	
	//댓글 작성
	public int writeCmt(CmtVO vo) {
		return mybatis.insert("CmtDAO.writeCmt", vo);
	}
	
	//댓글 삭제
	public int deleteCmt(CmtVO vo) {
		return mybatis.delete("CmtDAO.deleteCmt", vo);
	}
	
	//댓글 업데이트
	public int updateCmt(CmtVO vo) {
		return mybatis.update("CmtDAO.updateCmt", vo);
	}
	
	//해당 앨범 레코드 수 조회
	public int countCmtList(int aseq) {
		return mybatis.selectOne("CmtDAO.countCmtList", aseq);
	}
	
	// * insert, delete, update ���� int�� return
	//	- �߰�, ����, ������ ���� ���� ���� ���ϵǰ� �� �Ǹ� 0�� ���ϵ�
	
	

	public List<SingerVO> searchSinger(String keyword) {
		return mybatis.selectList("AlbumDAO.searchSinger", keyword);
	}
	
	public List<SongVO> searchSongBySong(String keyword) {
		
		return mybatis.selectList("AlbumDAO.searchSongBySong", keyword);
	}
	
	public List<SongVO> searchSongBySinger(String keyword) {
		
		return mybatis.selectList("AlbumDAO.searchSongBySinger", keyword);
	}
	
	public List<SongVO> searchSongByAlbum(String keyword) {
		
		return mybatis.selectList("AlbumDAO.searchSongByAlbum", keyword);
	}
	
	public List<AlbumVO> searchAlbum(String keyword) {
		
		return mybatis.selectList("AlbumDAO.searchAlbum", keyword);
	}
	
	public void insertKey(KeyVO vo) {
		
		mybatis.insert("AlbumDAO.insertKey", vo);
	}
	
	public int findKey(String keyword) {
		
		return mybatis.selectOne("AlbumDAO.findKey", keyword);
	}
	
	public void updateKey(KeyVO vo) {
		
		mybatis.update("AlbumDAO.updateKey", vo);
	}
	
	public List<KeyVO> popularKey(KeyVO vo) {
		
		return mybatis.selectList("AlbumDAO.popularKey", vo);
	}
}
