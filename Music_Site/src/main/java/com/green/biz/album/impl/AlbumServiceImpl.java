package com.green.biz.album.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.biz.album.AlbumService;
import com.green.biz.album.AlbumVO;
import com.green.biz.album.CmtVO;
import com.green.biz.album.GoodVO;
import com.green.biz.album.GradeVO;
import com.green.biz.album.KeyVO;
import com.green.biz.album.ListenVO;
import com.green.biz.album.SingerVO;
import com.green.biz.album.SongVO;
import com.green.biz.utils.Criteria;

@Service("albumService")
public class AlbumServiceImpl implements AlbumService {

	@Autowired
	private AlbumDAO albumDao;
	
	@Override
	public List<AlbumVO> listAlbum() {
		
		return albumDao.listAlbum();
	}
	
	@Override
	public List<SongVO> listAlbumAll() {
		
		return albumDao.listAlbumAll();
	}

	@Override
	public List<SongVO> listAlbumKor() {
	
		return albumDao.listAlbumKor();
	}
	
	@Override
	public List<SongVO> listAlbumOver() {
	
		return albumDao.listAlbumOver();
	}
	
	@Override
	public AlbumVO albumInfo(AlbumVO vo) {
		
		return albumDao.albumInfo(vo);
	}

	@Override
	public List<SongVO> songList(SongVO vo) {
		
		

		return albumDao.songList(vo);
	}
	
	@Override
	public SongVO songInfo(SongVO vo) {
		
		return albumDao.songInfo(vo);
	}
	
	@Override
	public SingerVO getSinger(int pseq) {
		
		return albumDao.getSinger(pseq);
	}
	
	@Override
	public List<AlbumVO> albumListBySinger(Criteria cri, int pseq) {
		
		return albumDao.albumListBySinger(cri, pseq);
	}
	
	@Override
	public int albumListBySingerCnt(int pseq) {
		
		return albumDao.albumListBySingerCnt(pseq);
	}
	
	@Override
	public List<SongVO> songListBySinger(Criteria cri, int pseq) {
		
		return albumDao.songListBySinger(cri, pseq);
	}
	
	@Override
	public int songListBySingerCnt(int pseq) {
		
		return albumDao.songListBySingerCnt(pseq);
	}


	
	@Override
	public List<SongVO> songListByCnt() {

		return albumDao.songListByCnt();
	}

	@Override
	public List<SongVO> songListByCntAll(Criteria cri) {
		
		return albumDao.songListByCntAll(cri);
	}

	@Override
	public List<SongVO> songListByCntKor(Criteria cri) {
		
		return albumDao.songListByCntKor(cri);
	}

	@Override
	public List<SongVO> songListByCntOver(Criteria cri) {
		
		return albumDao.songListByCntOver(cri);
	}
	
	@Override
	public List<SongVO> genreBallad() {
		
		return albumDao.genreBallad();
	}
	
	@Override
	public List<SongVO> genreRock() {

		return  albumDao.genreRock();
	}

	@Override
	public List<SongVO> genreDance() {

		return  albumDao.genreDance();
	}
	
	@Override
	public List<SongVO> genreOst() {

		return albumDao.genreOst();
	}

	@Override
	public List<SongVO> genrePop() {

		return  albumDao.genrePop();
	}

	@Override
	public List<SongVO> genreRap() {

		return  albumDao.genreRap();
	}
	
	@Override
	public List<SongVO> genreRnb() {
		
		return albumDao.genreRnb();
	}

	@Override
	public List<SongVO> genreTrot() {
		
		return albumDao.genreTrot();
	}

	@Override
	public List<SongVO> genreIndie() {
		
		return albumDao.genreIndie();
	}

	@Override
	public List<SongVO> genreFolk() {
		
		return albumDao.genreFolk();
	}
	
	@Override
	public int findGradeCnt(GradeVO vo) {
		
		return albumDao.findGradeCnt(vo);
	}
	
	@Override
	public Integer findGradeMemberCnt(int aseq) {
		
		return albumDao.findGradeMemberCnt(aseq);
	}
	
	@Override
	public void addGradeCnt(GradeVO vo) {
		
		albumDao.addGradeCnt(vo);
	}
	
	@Override
	public double gradeRate(int aseq) {
		
		return albumDao.gradeRate(aseq);
	}

	@Override
	public void updateScore(AlbumVO vo) {
		
		albumDao.updateScore(vo);
	}
	
	@Override
	public int findClickCnt(GoodVO vo) {
		
		return albumDao.findClickCnt(vo);
	}
	
	@Override
	public void addClickCnt(GoodVO vo) {
		
		albumDao.addClickCnt(vo);
	}
	
	@Override
	public void deleteClickCnt(GoodVO vo) {
		
		albumDao.deleteClickCnt(vo);
	}
	
	@Override
	public Integer sumClickCnt(int sseq) {
		
		return albumDao.sumClickCnt(sseq);
	}
	
	@Override
	public void updateGoodCnt(SongVO vo) {
		
		albumDao.updateGoodCnt(vo);
	}
	
	@Override
	public List<SongVO> goodSongListById(String id, Criteria cri) {
		
		return albumDao.goodSongListById(id, cri);
	}
	
	@Override
	public int goodSongListByIdCnt(String id) {
		
		return albumDao.goodSongListByIdCnt(id);
	}


	@Override
	public List<GoodVO> findClickId(String id) {

		return albumDao.findClickId(id);
	}

	
	@Override
	public void addListenCnt(ListenVO vo) {
	
		albumDao.addListenCnt(vo);
	}
	
	@Override
	public int findListenCntById(ListenVO vo) {
		
		return albumDao.findListenCntById(vo);
	}

	
	@Override
	public Integer sumListenClickCnt(int sseq) {
		
		return albumDao.sumListenClickCnt(sseq);
	}
	
	@Override
	public void updateListenCnt(SongVO vo) {
		
		albumDao.updateListenCnt(vo);
	}
	
	@Override
	public void listenCntById(ListenVO vo) {
		
		albumDao.listenCntById(vo);
	}
	
	@Override
	public List<SongVO> listenSongListById(String id, Criteria cri) {
		
		return albumDao.listenSongListById(id, cri);
	}
	
	@Override
	public int listenSongListByIdCnt(String id) {
		
		return albumDao.listenSongListByIdCnt(id);
	}
	
	@Override
	public List<CmtVO> cmtList(int aseq) {
	
		return albumDao.cmtList(aseq);
	}
	
	@Override
	public List<CmtVO> cmtListPaging(Criteria criteria, int aseq) {
		
		return albumDao.cmtListPaging(criteria, aseq);
	}

	@Override
	public int writeCmt(CmtVO vo) {
		
		return albumDao.writeCmt(vo);
	}
	
	@Override
	public int deleteCmt(CmtVO vo) {
		
		return albumDao.deleteCmt(vo);
	}
	
	@Override
	public int updateCmt(CmtVO vo) {
		
		return albumDao.updateCmt(vo);
	}

	@Override
	public int countCmtList(int aseq) {
		
		return albumDao.countCmtList(aseq);
	}

	@Override
	public List<SingerVO> searchSinger(String keyword) {
		
		return albumDao.searchSinger(keyword);
	}

	@Override
	public List<SongVO> searchSongBySong(String keyword) {

		return albumDao.searchSongBySong(keyword);
	}

	@Override
	public List<SongVO> searchSongBySinger(String keyword) {

		return albumDao.searchSongBySinger(keyword);
	}

	@Override
	public List<SongVO> searchSongByAlbum(String keyword) {
		
		return albumDao.searchSongByAlbum(keyword);
	}

	@Override
	public List<AlbumVO> searchAlbum(String keyword) {
		
		return albumDao.searchAlbum(keyword);
	}

	@Override
	public void insertKey(KeyVO vo) {
		
		albumDao.insertKey(vo);
	}

	@Override
	public int findKey(String keyword) {
		
		return albumDao.findKey(keyword);
	}

	@Override
	public void updateKey(KeyVO vo) {

		albumDao.updateKey(vo);
	}

	@Override
	public List<KeyVO> popularKey(KeyVO vo) {

		return albumDao.popularKey(vo);
	}

	


	

}
