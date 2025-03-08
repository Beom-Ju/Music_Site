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
	
	////////�ֽ� �뷡////////////
	
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
	
	/////////////�뷡 ��ȸ/////////////////////
	
	//������ ���� �뷡 ����Ʈ ��ȸ (10��)
	public List<SongVO> songListByCnt() {
		
		return mybatis.selectList("AlbumDAO.songListByCnt");
	}
	
	//������ ���� �뷡 ����Ʈ ��ȸ (100��, ��ü)
	public List<SongVO> songListByCntAll(Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", cri);
			
		return mybatis.selectList("AlbumDAO.songListByCntAll", map);
	}
	
	//������ ���� �뷡 ����Ʈ ��ȸ (100��, ����)
	public List<SongVO> songListByCntKor(Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", cri);
		
		return mybatis.selectList("AlbumDAO.songListByCntKor", map);
	}
	
	//������ ���� �뷡 ����Ʈ ��ȸ (100��, �ؿ�)
	public List<SongVO> songListByCntOver(Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", cri);
			
		return mybatis.selectList("AlbumDAO.songListByCntOver", map);
	}
	
	
	//�帣�� ���� �뷡 ��ȸ - �߶��
	public List<SongVO> genreBallad() {
		
		return mybatis.selectList("AlbumDAO.genreBallad");
	}
	
	//�帣�� ���� �뷡 ��ȸ - ��
	public List<SongVO> genreRock() {
		
		return mybatis.selectList("AlbumDAO.genreRock");
	}
	
	//�帣�� ���� �뷡 ��ȸ - ��
	public List<SongVO> genreDance() {
		
		return mybatis.selectList("AlbumDAO.genreDance");
	}
	
	//�帣�� ���� �뷡 ��ȸ - ��
	public List<SongVO> genreOst() {
			
		return mybatis.selectList("AlbumDAO.genreOst");
	}
	
	//�帣�� ���� �뷡 ��ȸ - ��
	public List<SongVO> genrePop() {
		
		return mybatis.selectList("AlbumDAO.genrePop");
	}
	
	//�帣�� ���� �뷡 ��ȸ - ��/����
	public List<SongVO> genreRap() {
		
		return mybatis.selectList("AlbumDAO.genreRap");
	}
	
	//�帣�� ���� �뷡 ��ȸ - R&B/Soul
	public List<SongVO> genreRnb() {
		
		return mybatis.selectList("AlbumDAO.genreRnb");
	}
	
	//�帣�� ���� �뷡 ��ȸ - Ʈ��Ʈ
	public List<SongVO> genreTrot() {
		
		return mybatis.selectList("AlbumDAO.genreTrot");
	}
	
	//�帣�� ���� �뷡 ��ȸ - �ε�
	public List<SongVO> genreIndie() {
		
		return mybatis.selectList("AlbumDAO.genreIndie");
	}
	
	//�帣�� ���� �뷡 ��ȸ - ��/����
	public List<SongVO> genreFolk() {
		
		return mybatis.selectList("AlbumDAO.genreFolk");
	}
	
	
	
	///////////////////�뷡 ����////////////////////////
	//�ٹ� ���� ���� �ٹ� ��ȣ �� ���� ã�� 
	public int findGradeCnt(GradeVO vo) {
		
		return mybatis.selectOne("AlbumDAO.findGradeCnt", vo);
	}
	
	public Integer findGradeMemberCnt(int aseq) {
		
		return mybatis.selectOne("AlbumDAO.findGradeMemberCnt", aseq);
	}
	
	//�ٹ� ���� ���
	public void addGradeCnt(GradeVO vo) {
		
		mybatis.insert("AlbumDAO.addGradeCnt", vo);
	}
	
	//�ٹ� ���� ���
	public double gradeRate(int aseq) {
		
		return mybatis.selectOne("AlbumDAO.gradeRate", aseq);
	}
	
	//�ٹ� ���� ������Ʈ
	public void updateScore(AlbumVO vo) {
		
		mybatis.update("AlbumDAO.updateScore", vo);
	}
	
	
	
	////////////////////�뷡 ���ƿ� ////////////////////////
	//�뷡 ���ƿ� ���� �뷡 ��ȣ �� ���� ã��
	public int findClickCnt(GoodVO vo) {
		
		return mybatis.selectOne("AlbumDAO.findClickCnt", vo);
	}
	
	//�뷡 ���ƿ� ���
	public void addClickCnt(GoodVO vo) {
		
		mybatis.insert("AlbumDAO.addClickCnt", vo);
	}
	
	//�뷡 ���ƿ� ���
	public void deleteClickCnt(GoodVO vo) {
		
		mybatis.delete("AlbumDAO.deleteClickCnt", vo);
	}
	
	//�� �뷡�� ���ƿ� �հ�
	public Integer sumClickCnt(int sseq) {
		
		return mybatis.selectOne("AlbumDAO.sumClickCnt", sseq);
	}
	
	//�뷡 ���ƿ�(����)
	public void updateGoodCnt(SongVO vo) {
		
		mybatis.update("AlbumDAO.updateGoodCnt", vo);
	}
	
	public List<GoodVO> findClickId(String id) {
		
		return mybatis.selectList("AlbumDAO.findClickId", id);
	}
	
	public List<SongVO> goodSongListById(String id, Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("criteria", cri);
		
		
		return mybatis.selectList("AlbumDAO.goodSongListById", map);
	}
	
	public int goodSongListByIdCnt(String id) {
		
		return mybatis.selectOne("AlbumDAO.goodSongListByIdCnt", id);
	}
	
	
	//////////////////�뷡 ���� Ƚ��//////////////////////////////
	
	
	//�뷡 �ѹ� ������ �뷡 ���� Ƚ���� ����
	public void addListenCnt(ListenVO vo) {
		mybatis.insert("AlbumDAO.addListenCnt", vo);
	}
	
	public int findListenCntById(ListenVO vo) {
		
		return mybatis.selectOne("AlbumDAO.findListenCntById", vo);
	}
	
	//�� �뷡�� ���ƿ� �հ�
	public Integer sumListenClickCnt(int sseq) {
			
		return mybatis.selectOne("AlbumDAO.sumListenClickCnt", sseq);
	}
	
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
	
	////////////////// ��� ����///////////////////
	
	//�ٹ��� �ش��ϴ� ��� ��ȸ
	public List<CmtVO> cmtList(int aseq) {
		return mybatis.selectList("CmtDAO.cmtList", aseq);
	}
	
	//�������� ��ȸ
	public List<CmtVO> cmtListPaging(Criteria criteria, int aseq) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("criteria", criteria);
		map.put("aseq", aseq);
		
		return mybatis.selectList("CmtDAO.cmtListPaging", map);
	}
	
	//��� �ۼ�
	public int writeCmt(CmtVO vo) {
		return mybatis.insert("CmtDAO.writeCmt", vo);
	}
	
	//��� ����
	public int deleteCmt(CmtVO vo) {
		return mybatis.delete("CmtDAO.deleteCmt", vo);
	}
	
	//���� ����
	public int updateCmt(CmtVO vo) {
		return mybatis.update("CmtDAO.updateCmt", vo);
	}
	
	//�ش� �ٹ� ��� ���ڵ� ��
	public int countCmtList(int aseq) {
		return mybatis.selectOne("CmtDAO.countCmtList", aseq);
	}
	
	// * insert, delete, update ���� int�� return
	//	- �߰�, ����, ������ ���� ���� ���� ���ϵǰ� �� �Ǹ� 0�� ���ϵ�
	
	
	/////////////�˻� ����//////////////
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
