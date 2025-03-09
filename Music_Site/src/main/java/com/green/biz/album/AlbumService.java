package com.green.biz.album;

import java.util.List;

import com.green.biz.utils.Criteria;

public interface AlbumService {

	List<AlbumVO> listAlbum();
	
	public List<SongVO> listAlbumAll();
	
	public List<SongVO> listAlbumKor(); 
	
	public List<SongVO> listAlbumOver();
	
	public AlbumVO albumInfo(AlbumVO vo);
	
	public List<SongVO> songList(SongVO vo);
	
	public SongVO songInfo(SongVO vo);
	
	public SingerVO getSinger(int pseq);
	
	public List<AlbumVO> albumListBySinger(Criteria cri, int pseq);
	
	public int albumListBySingerCnt(int pseq);
	
	public List<SongVO> songListBySinger(Criteria cri, int pseq);
	
	public int songListBySingerCnt(int pseq);
	
	public List<SongVO> songListByCnt();
	
	public List<SongVO> songListByCntAll(Criteria cri);
	
	public List<SongVO> songListByCntKor(Criteria cri);
	
	public List<SongVO> songListByCntOver(Criteria cri);
	
	public List<SongVO> genreBallad();
	
	public List<SongVO> genreRock();
	
	public List<SongVO> genreDance();
	
	public List<SongVO> genreOst();
	
	public List<SongVO> genrePop();

	public List<SongVO> genreRap();
	
	public List<SongVO> genreRnb();
	
	public List<SongVO> genreTrot();
	
	public List<SongVO> genreIndie();
	
	public List<SongVO> genreFolk();
	
	public int findGradeCnt(GradeVO vo);
	
	public Integer findGradeMemberCnt(int aseq);
	
	public void addGradeCnt(GradeVO vo);
	
	public double gradeRate(int aseq);
	
	public void updateScore(AlbumVO vo); 
	
	public int findClickCnt(GoodVO vo);
	
	public void addClickCnt(GoodVO vo);
	
	public void deleteClickCnt(GoodVO vo);
	
	public Integer sumClickCnt(int sseq);
	
	public void updateGoodCnt(SongVO vo);
	
	public List<SongVO> goodSongListById(String id, Criteria cri);
	
	public int goodSongListByIdCnt(String id);
	
	public List<GoodVO> findClickId(String id);
	
	public void addListenCnt(ListenVO vo);
	
	public int findListenCntById(ListenVO vo);
	
	public Integer sumListenClickCnt(int sseq);
	
	public void updateListenCnt(SongVO vo);
	
	public void listenCntById (ListenVO vo);
	
	public List<SongVO> listenSongListById(String id, Criteria cri);
	
	public int listenSongListByIdCnt(String id);
	
	public List<CmtVO> cmtList(int aseq);
	
	public List<CmtVO> cmtListPaging(Criteria criteria, int aseq);
	
	public int writeCmt(CmtVO vo);
	
	public int deleteCmt(CmtVO vo);
	
	public int updateCmt(CmtVO vo);
	
	public int countCmtList(int aseq) ;
	
	public List<SingerVO> searchSinger(String keyword);
	
	public List<SongVO> searchSongBySong(String keyword);
	
	public List<SongVO> searchSongBySinger(String keyword);
	
	public List<SongVO> searchSongByAlbum(String keyword);
	
	public List<AlbumVO> searchAlbum(String keyword);

	
	public void insertKey(KeyVO vo);
	
	public int findKey(String keyword);
	
	public void updateKey(KeyVO vo);
	
	public List<KeyVO> popularKey(KeyVO vo);
}