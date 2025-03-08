package com.green.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;

import com.green.biz.album.AlbumService;
import com.green.biz.album.AlbumVO;
import com.green.biz.album.CmtVO;
import com.green.biz.album.GoodVO;
import com.green.biz.album.GradeVO;
import com.green.biz.album.KeyVO;
import com.green.biz.album.ListenVO;
import com.green.biz.album.SingerVO;
import com.green.biz.album.SongVO;
import com.green.biz.member.MemberService;
import com.green.biz.member.MemberVO;
import com.green.biz.utils.Criteria;
import com.green.biz.utils.PageMaker;


@SessionAttributes("loginUser")
@Controller
public class AlbumController {

	@Autowired
	private AlbumService albumService;
	@Autowired
	private MemberService memberService;
	
	/*
	 인기검색어 조회
	 */

	@ResponseBody
	@RequestMapping(value = "popularKey", method=RequestMethod.GET)
	public List<KeyVO> popularKey(KeyVO vo, HttpServletRequest request, Model model) throws Exception {
		 
		List<KeyVO> popularKeyList = albumService.popularKey(vo);

		/*
		 * Map<String, Object> resultMap = new HashMap<String, Object>();
		 * resultMap.put("popularKeyList", popularKeyList);
		 */
	      
	    //ModelAndView modelAndView = new ModelAndView("jsonView",resultMap);
		
		return popularKeyList;
	}

	
	
	/*
	 * �ٹ� ���� �̵� �� ������ ����
	 */
	@RequestMapping(value="album_info")
	public String albumInfo(AlbumVO vo, SongVO vo2, int aseq,
							Model model, HttpSession session) {
		
		
		//�ٹ� ���� �� �뷡 ����Ʈ �迭
		AlbumVO album = albumService.albumInfo(vo);
		
		List<SongVO> songList = albumService.songList(vo2);
		
		
		//�ٹ� ����
		if (album.getScore() == 5) {
			model.addAttribute("star", 5);
		} else if (4.5 <= album.getScore() &&  album.getScore() < 5) {
			model.addAttribute("star", 4.5);
		} else if (4 <= album.getScore() &&  album.getScore() < 4.5) {
			model.addAttribute("star", 4);
		} else if (3.5 <= album.getScore() &&  album.getScore() < 4) {
			model.addAttribute("star", 3.5);
		} else if (3 <= album.getScore() &&  album.getScore() < 3.5) {
			model.addAttribute("star", 3);
		} else if (2.5 < album.getScore() &&  album.getScore() < 3 ){
			model.addAttribute("star", 2.5);
		} else if (2 <= album.getScore() &&  album.getScore() < 2.5) {
			model.addAttribute("star", 2);
		} else if (1.5 <= album.getScore() &&  album.getScore() < 2) {
			model.addAttribute("star", 1.5);
		} else if (1 <= album.getScore() &&  album.getScore() < 1.5) {
			model.addAttribute("star", 1);
		} else if (0 < album.getScore() &&  album.getScore() < 1) {
			model.addAttribute("star", 0.5);
		} else {
			model.addAttribute("star", 0);
		}
		
		Integer gradeClickCnt = albumService.findGradeMemberCnt(aseq);
		
		if (gradeClickCnt == null ) {
			gradeClickCnt = 0;
		}
		
		album.setScore_cnt(gradeClickCnt);
		
		
		model.addAttribute("albumInfo", album);
		
		model.addAttribute("songList", songList);

		
		
		

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {

			
			return "album/album_info";
		
		} else {
			
			List<GoodVO> goodList = albumService.findClickId(loginUser.getId());
			
			
			
			
			for (int i = 0; i < songList.size() ; i++) {
				int rankSongNum = songList.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum = goodList.get(j).getSseq();
				
					if (rankSongNum == goodSongNum) {
						
						songList.get(i).setGoodClick("y");

					}
				}
			}
			return "album/album_info";
		}
		
	}
	
	/*
	 * �ٹ� ���� â ����
	 */
	@RequestMapping(value="grade_check", method=RequestMethod.GET)
	public String gradeView(@RequestParam(value="aseq") int aseq,
							GradeVO gradeVO, Model model, HttpSession session) {
		
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		
			gradeVO.setId(loginUser.getId());
			
			int gradeCnt = albumService.findGradeCnt(gradeVO);
			
			if (gradeCnt > 0) {
				
				return "member/action/already_grade";
				
			} else {
				
				model.addAttribute("aseq", aseq);

				return "album/grade";
			}
		
			

	}
	
	/*
	 * �ٹ� ���� ���
	 */
	@RequestMapping(value="grade_check", method=RequestMethod.POST)
	public String gradeAction(int aseq, GradeVO gradeVO, AlbumVO albumVO, HttpSession session) {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		gradeVO.setId(loginUser.getId());
		
		albumService.addGradeCnt(gradeVO);
		
		
		double totalGrade = albumService.gradeRate(aseq);
		
		albumVO.setScore(totalGrade);
		
		albumVO.setAseq(aseq);
		
		albumService.updateScore(albumVO);
		
		return "member/action/insert_grade";
	}
	
	/*
	 * ���� ���� �̵�
	 */
	@RequestMapping(value="singer_info")
	public String singerInfo(@RequestParam(value="check", defaultValue="", required=false) String check,
							int pseq,
							Criteria cri1, Criteria cri2,
							Model model, HttpSession session) {
		cri1.setNumPerPage(8);
		
		SingerVO singer = albumService.getSinger(pseq);
		
		List<AlbumVO> albumList = albumService.albumListBySinger(cri1, pseq);
		
		cri2.setNumPerPage(10);
		
		List<SongVO> songList = albumService.songListBySinger(cri2, pseq);
		
		PageMaker pageMaker1 = new PageMaker();
		PageMaker pageMaker2 = new PageMaker();
		
		pageMaker1.setCri(cri1);
		pageMaker2.setCri(cri2);
		
		
		
		if (check.equals("check1")) {
			cri2.setPageNum(1);
			
			songList = albumService.songListBySinger(cri2, pseq);
			
			pageMaker1.setCri(cri1);
			pageMaker2.setCri(cri2);

		} else if (check.equals("check2"))  {
			cri1.setPageNum(1);
			cri1.setNumPerPage(8);
			albumList = albumService.albumListBySinger(cri1, pseq);
			
			pageMaker1.setCri(cri1);
			pageMaker2.setCri(cri2);
			
		} else {
			pageMaker1.setCri(cri1);
			pageMaker2.setCri(cri2);
		}
		
		//System.out.println(check);
		
		int albumCnt = albumService.albumListBySingerCnt(pseq);
		pageMaker1.setTotalCount(albumCnt);
		
		int songCnt = albumService.songListBySingerCnt(pseq);
		pageMaker2.setTotalCount(songCnt);

		model.addAttribute("pageMaker1", pageMaker1);
		model.addAttribute("pageMaker2", pageMaker2);
		model.addAttribute("singerDetail", singer);
		model.addAttribute("albumListBySinger", albumList);
		model.addAttribute("songListBySinger", songList);
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "album/singer_info";
		} else {
			

			List<GoodVO> goodList = albumService.findClickId(loginUser.getId());
			
			for (int i = 0; i < songList.size() ; i++) {
				int rankSongNum = songList.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum = goodList.get(j).getSseq();
				
					if (rankSongNum == goodSongNum) {
						
						songList.get(i).setGoodClick("y");
	
					}
				}
			}
		
		
		
			return "album/singer_info";
		}
		
		
		
	}
	
	
	
	/*
	 *  ���� ��Ʈ �̵�
	 */
	@RequestMapping(value="chartList")
	public String chartList(@RequestParam(value="check", defaultValue="", required=false) String check,
							Model model, Criteria cri1, Criteria cri2, Criteria cri3, HttpSession session) {
		
		cri1.setNumPerPage(50);
		cri2.setNumPerPage(50);
		cri3.setNumPerPage(50);
		
		List<SongVO> songList = albumService.songListByCntAll(cri1);
		List<SongVO> songListKor = albumService.songListByCntKor(cri2);
		List<SongVO> songListOver = albumService.songListByCntOver(cri3);
		
		PageMaker pageMaker1 = new PageMaker();
		PageMaker pageMaker2 = new PageMaker();
		PageMaker pageMaker3 = new PageMaker();
		

		if (check.equals("check1")) {
			cri2.setPageNum(1);
			cri3.setPageNum(1);
			
			songListKor = albumService.songListByCntKor(cri2);
			songListOver = albumService.songListByCntOver(cri3);
			
			pageMaker1.setCri(cri1);
			pageMaker2.setCri(cri2);
			pageMaker3.setCri(cri3);
		} else if (check.equals("check2")) {
			cri1.setPageNum(1);
			cri3.setPageNum(1);
			
			songList = albumService.songListByCntAll(cri1);
			songListOver = albumService.songListByCntOver(cri3);			
			
			pageMaker1.setCri(cri1);
			pageMaker2.setCri(cri2);
			pageMaker3.setCri(cri3);
		} else if (check.equals("check3")) {
			cri1.setPageNum(1);
			cri2.setPageNum(1);
			
			songList = albumService.songListByCntAll(cri1);
			songListKor = albumService.songListByCntKor(cri2);
			
			pageMaker1.setCri(cri1);
			pageMaker2.setCri(cri2);
			pageMaker3.setCri(cri3);
		} else {
			pageMaker1.setCri(cri1);
			pageMaker2.setCri(cri2);
			pageMaker3.setCri(cri3);
		}

		pageMaker1.setTotalCount(100);
		pageMaker2.setTotalCount(100);
		pageMaker3.setTotalCount(100);
		
		//System.out.println("check�� = " + check);
		
		model.addAttribute("check", check);
		model.addAttribute("pageMaker1", pageMaker1);
		model.addAttribute("pageMaker2", pageMaker2);
		model.addAttribute("pageMaker3", pageMaker3);
		model.addAttribute("songList", songList);
		model.addAttribute("songListKor", songListKor);
		model.addAttribute("songListOver", songListOver);
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "album/chartList";
		} else {
			

			List<GoodVO> goodList = albumService.findClickId(loginUser.getId());
			
			for (int i = 0; i < songList.size() ; i++) {
				int rankSongNum1 = songList.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum1 = goodList.get(j).getSseq();
				
					if (rankSongNum1 == goodSongNum1) {
						
						songList.get(i).setGoodClick("y");
	
					}
				}
			}
			
			for (int i = 0; i < songListKor.size() ; i++) {
				int rankSongNum2 = songListKor.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum2 = goodList.get(j).getSseq();
				
					if (rankSongNum2 == goodSongNum2) {
						
						songListKor.get(i).setGoodClick("y");
	
					}
				}
			}
			
			for (int i = 0; i < songListOver.size() ; i++) {
				int rankSongNum3 = songListOver.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum3 = goodList.get(j).getSseq();
				
					if (rankSongNum3 == goodSongNum3) {
						
						songListOver.get(i).setGoodClick("y");
	
					}
				}
			}
			
			return "album/chartList";
		}
		
	}
	
	/*
	 *  �ֽ� ������ �̵�
	 */
	@RequestMapping(value="newSong")
	public String newSongView(Model model, HttpSession session) {
		
		List<SongVO> newAlbumListAll = albumService.listAlbumAll();
		List<SongVO> newAlbumListKor = albumService.listAlbumKor();
		List<SongVO> newAlbumListOver = albumService.listAlbumOver();
		
		model.addAttribute("newAlbumListAll", newAlbumListAll);
		model.addAttribute("newAlbumListKor", newAlbumListKor);
		model.addAttribute("newAlbumListOver", newAlbumListOver);
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "album/newSong";
		} else {
			

			List<GoodVO> goodList = albumService.findClickId(loginUser.getId());
			
			for (int i = 0; i < newAlbumListAll.size() ; i++) {
				int rankSongNum1 = newAlbumListAll.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum1 = goodList.get(j).getSseq();
				
					if (rankSongNum1 == goodSongNum1) {
						
						newAlbumListAll.get(i).setGoodClick("y");
	
					}
				}
			}
			
			for (int i = 0; i < newAlbumListKor.size() ; i++) {
				int rankSongNum2 = newAlbumListKor.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum2 = goodList.get(j).getSseq();
				
					if (rankSongNum2 == goodSongNum2) {
						
						newAlbumListKor.get(i).setGoodClick("y");
	
					}
				}
			}
			
			for (int i = 0; i < newAlbumListOver.size() ; i++) {
				int rankSongNum3 = newAlbumListOver.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum3 = goodList.get(j).getSseq();
				
					if (rankSongNum3 == goodSongNum3) {
						
						newAlbumListOver.get(i).setGoodClick("y");
	
					}
				}
			}
		
		
		
			return "album/newSong";
		}
	}
	
	/*
	 *  �ֽ� �ٹ����� �̵�
	 */
	@RequestMapping(value="newAlbum")
	public String newAlbumView(Model model) {
		
		List<SongVO> newAlbumListAll = albumService.listAlbumAll();
		List<SongVO> newAlbumListKor = albumService.listAlbumKor();
		List<SongVO> newAlbumListOver = albumService.listAlbumOver();
		
		model.addAttribute("newAlbumListAll", newAlbumListAll);
		model.addAttribute("newAlbumListKor", newAlbumListKor);
		model.addAttribute("newAlbumListOver", newAlbumListOver);
		
		return "album/newAlbum";
	}
	
	/*
	 * �帣�� �̵�
	 */
	@RequestMapping(value="genre")
	public String genreView(Model model, HttpSession session) {
		
		List<SongVO> genreBalladList = albumService.genreBallad();
		List<SongVO> genreRockList = albumService.genreRock();
		List<SongVO> genreDanceList = albumService.genreDance();
		List<SongVO> genreOstList = albumService.genreOst();
		List<SongVO> genrePopList = albumService.genrePop();
		List<SongVO> genreRapList = albumService.genreRap();
		List<SongVO> genreRnbList = albumService.genreRnb();
		List<SongVO> genreTrotList = albumService.genreTrot();
		List<SongVO> genreIndieList = albumService.genreIndie();
		List<SongVO> genreFolkList = albumService.genreFolk();
		
		model.addAttribute("genreBalladList", genreBalladList);
		model.addAttribute("genreRockList", genreRockList);
		model.addAttribute("genreDanceList", genreDanceList);
		model.addAttribute("genreOstList", genreOstList);
		model.addAttribute("genrePopList", genrePopList);
		model.addAttribute("genreRapList", genreRapList);
		model.addAttribute("genreRnbList", genreRnbList);
		model.addAttribute("genreTrotList", genreTrotList);
		model.addAttribute("genreIndieList", genreIndieList);
		model.addAttribute("genreFolkList", genreFolkList);
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "album/genreList";
		} else {
			

			List<GoodVO> goodList = albumService.findClickId(loginUser.getId());
			
			for (int i = 0; i < genreBalladList.size() ; i++) {
				int rankSongNum1 = genreBalladList.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum1 = goodList.get(j).getSseq();
				
					if (rankSongNum1 == goodSongNum1) {
						
						genreBalladList.get(i).setGoodClick("y");
	
					}
				}
			}
			
			for (int i = 0; i < genreRockList.size() ; i++) {
				int rankSongNum2 = genreRockList.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum2 = goodList.get(j).getSseq();
				
					if (rankSongNum2 == goodSongNum2) {
						
						genreRockList.get(i).setGoodClick("y");
	
					}
				}
			}
			
			for (int i = 0; i < genreDanceList.size() ; i++) {
				int rankSongNum3 = genreDanceList.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum3 = goodList.get(j).getSseq();
				
					if (rankSongNum3 == goodSongNum3) {
						
						genreDanceList.get(i).setGoodClick("y");
	
					}
				}
			}
			
			for (int i = 0; i < genreOstList.size() ; i++) {
				int rankSongNum4 = genreOstList.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum4 = goodList.get(j).getSseq();
				
					if (rankSongNum4 == goodSongNum4) {
						
						genreOstList.get(i).setGoodClick("y");
	
					}
				}
			}
			
			for (int i = 0; i < genrePopList.size() ; i++) {
				int rankSongNum5 = genrePopList.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum5 = goodList.get(j).getSseq();
				
					if (rankSongNum5 == goodSongNum5) {
						
						genrePopList.get(i).setGoodClick("y");
	
					}
				}
			}
			
			for (int i = 0; i < genreRapList.size() ; i++) {
				int rankSongNum6 = genreRapList.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum6 = goodList.get(j).getSseq();
				
					if (rankSongNum6 == goodSongNum6) {
						
						genreRapList.get(i).setGoodClick("y");
	
					}
				}
			}
			
			for (int i = 0; i < genreRnbList.size() ; i++) {
				int rankSongNum7 = genreRnbList.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum7 = goodList.get(j).getSseq();
				
					if (rankSongNum7 == goodSongNum7) {
						
						genreRnbList.get(i).setGoodClick("y");
	
					}
				}
			}
			
			for (int i = 0; i < genreTrotList.size() ; i++) {
				int rankSongNum8 = genreTrotList.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum8 = goodList.get(j).getSseq();
				
					if (rankSongNum8 == goodSongNum8) {
						
						genreTrotList.get(i).setGoodClick("y");
	
					}
				}
			}
			
			for (int i = 0; i < genreIndieList.size() ; i++) {
				int rankSongNum9 = genreIndieList.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum9 = goodList.get(j).getSseq();
				
					if (rankSongNum9 == goodSongNum9) {
						
						genreIndieList.get(i).setGoodClick("y");
	
					}
				}
			}
			
			for (int i = 0; i < genreFolkList.size() ; i++) {
				int rankSongNum10 = genreFolkList.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum10 = goodList.get(j).getSseq();
				
					if (rankSongNum10 == goodSongNum10) {
						
						genreFolkList.get(i).setGoodClick("y");
	
					}
				}
			}
			
			return "album/genreList";
		}
		
		
		
	}
	
	/*
	 * �뷡 ���ƿ� ǥ�� - ����
	 */
	@RequestMapping(value="listen_good")
	public String listenGood(int sseq,  GoodVO vo1, SongVO vo2,
							Model model, HttpSession session) {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		

		if (loginUser != null) {
			
			//good ���̺� �α����� ������ ���ƿ� ���� Ƚ�� 1 �߰�
			vo1.setId(loginUser.getId());
			albumService.addClickCnt(vo1);
			
			//�뷡�� �ش��ϴ� ���ƿ� ����
			int totalGood = albumService.sumClickCnt(sseq);
			
			vo2.setGood_cnt(totalGood);
			
			albumService.updateGoodCnt(vo2);
			return "redirect:/index";
		} else {
			return "member/action/no_login";
		}
		
	}
	
	/*
	 * �뷡 ���ƿ� ǥ�� - �ٹ���������
	 */
	@RequestMapping(value="listen_good2")
	public String listenGoodAlbumInfo(int sseq,  GoodVO vo1, AlbumVO albumVO, SongVO songVO,
							Model model, HttpSession session) {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		

		if (loginUser != null) {
			
			//good ���̺� �α����� ������ ���ƿ� ���� Ƚ�� 1 �߰�
			vo1.setId(loginUser.getId());
			albumService.addClickCnt(vo1);
			
			//�뷡�� �ش��ϴ� ���ƿ� ����
			int totalGood = albumService.sumClickCnt(sseq);
			
			songVO.setGood_cnt(totalGood);
			
			albumService.updateGoodCnt(songVO);
			
			
			
			AlbumVO album = albumService.albumInfo(albumVO);
			
			List<SongVO> songList = albumService.songList(songVO);
			
			
			
			model.addAttribute("albumInfo", album);
			
			model.addAttribute("songList", songList);
			
			List<GoodVO> goodList = albumService.findClickId(loginUser.getId());
			
			
			for (int i = 0; i < songList.size() ; i++) {
				int rankSongNum = songList.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum = goodList.get(j).getSseq();
				
					if (rankSongNum == goodSongNum) {
						
						songList.get(i).setGoodClick("y");

					}
				}
			}
			return "album/album_info";
		} else {
			return "member/action/no_login";
		}
		
	}
	

	/*
	 * �뷡 ���ƿ� ���
	 */
	@RequestMapping(value="listen_good_cancel")
	public String listenGoodCancel(int sseq,  GoodVO vo1, SongVO vo2,
							Model model, HttpSession session) {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		

		if (loginUser != null) {
			
			
			vo1.setId(loginUser.getId());
			albumService.deleteClickCnt(vo1);
			
			Integer totalGood = albumService.sumClickCnt(sseq);
			
			if (totalGood == null) {
				totalGood = 0;
			}
			
			vo2.setGood_cnt(totalGood);
			
			albumService.updateGoodCnt(vo2);
			
			
			System.out.println(totalGood);
			return "redirect:/index";
		} else {
			return "member/action/no_login";
		}
		
	}
	
	/*
	 * �뷡 ���
	 */
	@RequestMapping(value="listen_music")
	public String listenMusic(int sseq, ListenVO listenVO, SongVO songVO, HttpSession session) {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser != null) {
			
			
			listenVO.setId(loginUser.getId());
			int listenCnt = albumService.findListenCntById(listenVO);
			
			if (listenCnt > 0) {
				albumService.listenCntById(listenVO);
			} else {
				albumService.addListenCnt(listenVO);
			}
			
			
			
			
			Integer totalListen = albumService.sumListenClickCnt(sseq);
			
			if (totalListen == null) {
				totalListen = 0;
			}
			
			
			songVO.setListen_cnt(totalListen);
			
			albumService.updateListenCnt(songVO);
			
			return "redirect:/index";
		} else {
			
			return "member/action/no_login";
		}
	}

	
	/*
	 * ��� �ۼ�
	 */
	@RequestMapping(value="cmt")
	public String cmtAction(CmtVO vo, HttpSession session) {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser != null) {
			
			vo.setId(loginUser.getId());
			
			albumService.writeCmt(vo);
			
			return "redirect:/index";
		} else {
			
			return "member/action/no_login";
		}
		
	}
	
	/*
	 * �˻�
	 */
	@RequestMapping(value="searchList")
	public String searchView(@RequestParam(value="keyword") String keyword,
							 KeyVO vo,	Model model, HttpSession session) {
		
		//기존에 검색했던 검색어인지 찾기
		int cnt = albumService.findKey(keyword);
		
		if (cnt > 0) { //검색했던 검색어면 카운트
			albumService.updateKey(vo);
			
		} else { //검색하지 않았던 검색어면 새로 추가
		
			albumService.insertKey(vo);	
			
		}
		

		
		//�˻� ���
		List<SingerVO> s_singer = albumService.searchSinger(keyword);
		List<SongVO> s_song1 = albumService.searchSongBySong(keyword);
		List<SongVO> s_song2 = albumService.searchSongBySinger(keyword);
		List<SongVO> s_song3 = albumService.searchSongByAlbum(keyword);
		List<AlbumVO> s_album = albumService.searchAlbum(keyword);
		
		//�˻� ��� Ƚ��
		int singerCnt = s_singer.size();
		int songCnt1 = s_song1.size();
		int songCnt2 = s_song2.size();
		int songCnt3 = s_song3.size();
		int albumCnt = s_album.size();
		
		int totalsongCnt = songCnt1 + songCnt2 + songCnt3;
		
		int total = singerCnt + totalsongCnt + albumCnt;
		
		model.addAttribute("keyword", keyword);
		
		model.addAttribute("singerCnt", singerCnt);
		model.addAttribute("songCnt1", songCnt1);
		model.addAttribute("songCnt2", songCnt2);
		model.addAttribute("songCnt3", songCnt3);
		model.addAttribute("totalsongCnt", totalsongCnt);
		model.addAttribute("albumCnt", albumCnt);
		model.addAttribute("total", total);
		
		
		model.addAttribute("searchSinger", s_singer);
		model.addAttribute("searchSong1", s_song1);
		model.addAttribute("searchSong2", s_song2);
		model.addAttribute("searchSong3", s_song3);
		model.addAttribute("searchAlbum", s_album);
		
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "album/searchList";
		} else {
			

			List<GoodVO> goodList = albumService.findClickId(loginUser.getId());
			
			for (int i = 0; i < s_song1.size() ; i++) {
				int rankSongNum = s_song1.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum = goodList.get(j).getSseq();
				
					if (rankSongNum == goodSongNum) {
						
						s_song1.get(i).setGoodClick("y");
	
					}
				}
			}
			
			for (int i = 0; i < s_song2.size() ; i++) {
				int rankSongNum = s_song2.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum = goodList.get(j).getSseq();
				
					if (rankSongNum == goodSongNum) {
						
						s_song2.get(i).setGoodClick("y");
	
					}
				}
			}
			
			for (int i = 0; i < s_song3.size() ; i++) {
				int rankSongNum = s_song3.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum = goodList.get(j).getSseq();
				
					if (rankSongNum == goodSongNum) {
						
						s_song3.get(i).setGoodClick("y");
	
					}
				}
			}

			return "album/searchList";
		}
		
	}
}
