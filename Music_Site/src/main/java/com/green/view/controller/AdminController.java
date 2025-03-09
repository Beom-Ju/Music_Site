package com.green.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.green.biz.admin.AdminService;
import com.green.biz.admin.AdminVO;
import com.green.biz.album.AlbumService;
import com.green.biz.album.AlbumVO;
import com.green.biz.album.CmtVO;
import com.green.biz.album.GoodVO;
import com.green.biz.album.SingerVO;
import com.green.biz.album.SongVO;
import com.green.biz.member.DelRate;
import com.green.biz.member.DelVO;
import com.green.biz.member.MemberVO;
import com.green.biz.qna.QnaService;
import com.green.biz.qna.QnaVO;
import com.green.biz.utils.Criteria;
import com.green.biz.utils.PageMaker;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private AlbumService albumService;
	@Autowired
	private QnaService qnaService;
	
	//관리자 로그인
	@RequestMapping(value="main_form")
	public String mainForm(HttpSession session) {
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {

			return "admin/main";

		}
	}
	
	//���� ���
	/*
	@RequestMapping(value="singerList")
	public String singerView(SingerVO vo, Model model) {
		
			List<SingerVO> singerList = adminService.singerAll();
			
			model.addAttribute("singerList", singerList);
			
			return "admin/album/singerList";
		
	}
	
	*/
	
	//가수리스트 조회 (관리자)
	@RequestMapping(value="singerList")
	public String singerView(@RequestParam(value="keyword", defaultValue="", required=false) String keyword,
							Criteria cri, Model model, HttpSession session) {
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
		
			List<SingerVO> singerList = adminService.listSingerPaging(keyword, cri);
			
			PageMaker pageMaker = new PageMaker();
			
			pageMaker.setCri(cri);
			
			int singerCnt = adminService.listSingerCnt(keyword);
			pageMaker.setTotalCount(singerCnt);
			
			model.addAttribute("keyword", keyword);
			model.addAttribute("singerCnt", singerCnt);
			model.addAttribute("singerList", singerList);
			model.addAttribute("pageMaker", pageMaker);
			
			return "admin/album/singerList";
		}
		
	}
	
	/*
	 * 가수등록 화면 이동
	 */
	@RequestMapping(value="singerWrite", method=RequestMethod.GET)
	public String singerWriteView(HttpSession session) {
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {

			return "admin/album/singerWrite";

		}
	}
	
	/*
	 *  가수 등록
	 */
	@RequestMapping(value="singerWrite", method=RequestMethod.POST)
	public String singerWriteAction(SingerVO vo, MultipartFile uploadPicture,
									HttpSession session) {
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {

			//가수 이미지 등록
			String fileName = "noprofile.jpg";
			if (!uploadPicture.isEmpty()) {
				
				String root_path = session.getServletContext().getRealPath("WEB-INF/resources/images/singer_images/");
				
				System.out.println("������Ʈ Root ���" + root_path);
				fileName = uploadPicture.getOriginalFilename();
				
				File file = new File(root_path + fileName);
				
				try {
					uploadPicture.transferTo(file); //transferTo �ȿ� ���� ��ΰ� ���� ��
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
				
			}
			
			vo.setSinger_image(fileName);
			
			adminService.singerWrite(vo);
		
		return "redirect:singerList";
		
		}
		
	}
	
	/*
	 * 가수 정보 조회
	 */
	@RequestMapping(value="admin_singer_info")
	public String singerInfo(@RequestParam(value="check", defaultValue="", required=false) String check,
							Criteria cri1, Criteria cri2,
							int pseq, HttpSession session, Model model) {

		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
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
		
		int albumCnt = albumService.albumListBySingerCnt(pseq);
		pageMaker1.setTotalCount(albumCnt);
		
		int songCnt = albumService.songListBySingerCnt(pseq);
		pageMaker2.setTotalCount(songCnt);		
		
		model.addAttribute("pageMaker1", pageMaker1);
		model.addAttribute("pageMaker2", pageMaker2);		
		model.addAttribute("singerDetail", singer);
		model.addAttribute("albumListBySinger", albumList);
		model.addAttribute("songListBySinger", songList);
		
		return "admin/album/admin_singer_info";
		
		}
	}
	
	/*
	 * 가수 수정화면 이동
	 */
	@RequestMapping(value="singerUpdate", method=RequestMethod.GET)
	public String singerUpdateView(int pseq, HttpSession session,
									Model model) {
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
			
			SingerVO singer = albumService.getSinger(pseq);

			model.addAttribute("singerVO", singer);
		
			return "admin/album/singerUpdate";

		}
	}
	
	/*
	 * 가수 수정
	 */
	@RequestMapping(value="singerUpdate", method=RequestMethod.POST)
	public String singerUpdateAction(@RequestParam(value="uploadPicture") MultipartFile uploadFile,
									 int pseq, Criteria cri1, Criteria cri2,
									 SingerVO singerVO,  AlbumVO albumVO, SongVO songVO,
									HttpSession session, Model model) {
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
		String fileName = "";
		
		if (!uploadFile.isEmpty()) {
			String root_path = session.getServletContext().getRealPath("WEB-INF/resources/images/singer_images/");
			
			System.out.println("������Ʈ Root ���" + root_path);
			
			fileName = uploadFile.getOriginalFilename();
					
			File file = new File(root_path + fileName);		
			
			try {
				uploadFile.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			singerVO.setSinger_image(fileName);
			
		} else {
			
			SingerVO singer = albumService.getSinger(pseq);
			
			//가수 이미지 등록
			singerVO.setSinger_image(singer.getSinger_image());
		}
		
			adminService.singerUpdate(singerVO);
		
			SingerVO singer = albumService.getSinger(pseq);
			
			List<AlbumVO> albumList = albumService.albumListBySinger(cri1, pseq);
			
			List<SongVO> songList = albumService.songListBySinger(cri2, pseq);
			
			cri1.setNumPerPage(8);
			cri2.setNumPerPage(10);		
			
			PageMaker pageMaker1 = new PageMaker();
			PageMaker pageMaker2 = new PageMaker();
			
			pageMaker1.setCri(cri1);
			pageMaker2.setCri(cri2);	
			
			int albumCnt = albumService.albumListBySingerCnt(pseq);
			pageMaker1.setTotalCount(albumCnt);
			
			int songCnt = albumService.songListBySingerCnt(pseq);
			pageMaker2.setTotalCount(songCnt);
			
			model.addAttribute("pageMaker1", pageMaker1);
			model.addAttribute("pageMaker2", pageMaker2);			
			model.addAttribute("singerDetail", singer);
			model.addAttribute("albumListBySinger", albumList);
			model.addAttribute("songListBySinger", songList);
			
			return "admin/album/admin_singer_info";
			
		}

	}
	
	/*
	 * 가수 삭제
	 */
	@RequestMapping(value="singerDelete")
	public String singerDeleteAction(int pseq, HttpSession session,
									Model model) {

		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			Integer albumCnt = adminService.findAlbumBySinger(pseq);
	
	
			if (albumCnt == null) {
				albumCnt = 0;
			}
	
			
			if (albumCnt == 0) {
				adminService.singerDelete(pseq);
			} else {
				return "admin/album/action/no_singerDelete";
			}
			
			return "redirect:singerList";

		}
	}

	/*
	 * ���� �˻�
	 */
	/*
	 
	@RequestMapping(value="admin_singer_search")
	public String singerSearch(@RequestParam(value="keyword") String keyword,
								Model model) {
		
		List<SingerVO> singerList = albumService.searchSinger(keyword);
		
		model.addAttribute("singerList", singerList);
		
		return "admin/album/singerList";
		
	}
	*/
	/*
	 * 앨범 상세화면 이동
	 */
	@RequestMapping(value="admin_album_info")
	public String albumInfo(int aseq, AlbumVO vo, SongVO vo2,
							Model model, HttpSession session) {
		
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			AlbumVO album = albumService.albumInfo(vo);
			
			List<SongVO> songList = albumService.songList(vo2);
			
			List<CmtVO> cmtList = albumService.cmtList(aseq);
			
			
			
			model.addAttribute("albumInfo", album);
			
			model.addAttribute("songList", songList);
	
			model.addAttribute("cmtList", cmtList);
			
			return "admin/album/admin_album_info";
			
		}

		
	}
	
	
	
	/*
	 * 앨범 작성 화면 이동
	 */
	@RequestMapping(value="albumWrite", method=RequestMethod.GET)
	public String albumWriteView(int pseq, String singer_name, HttpSession session,
								Model model) {
		
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			model.addAttribute("singerNum", pseq);
			model.addAttribute("singerName", singer_name);
			
			return "admin/album/albumWrite";
	
		}
	}
	
	
	
	/*
	 * 앨범 작성
	 */
	@RequestMapping(value="albumWrite", method=RequestMethod.POST)
	public String albumWriteAction(AlbumVO albumVO, SongVO songVO, int pseq, MultipartFile uploadPicture,
									Criteria cri1, Criteria cri2,
									Model model, HttpSession session) {
		
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			String fileName = "nocover.jpg";
			if (!uploadPicture.isEmpty()) {
				
				String root_path = session.getServletContext().getRealPath("WEB-INF/resources/images/album_images/");
				
				System.out.println("������Ʈ Root ���" + root_path);
				fileName = uploadPicture.getOriginalFilename();
				
				File file = new File(root_path + fileName);
				
				try {
					uploadPicture.transferTo(file); //transferTo �ȿ� ���� ��ΰ� ���� ��
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
				
			}
			
			albumVO.setAlbum_image(fileName);
			
			adminService.albumWrite(albumVO);
			
			SingerVO singer = albumService.getSinger(pseq);
			
			List<AlbumVO> albumList = albumService.albumListBySinger(cri1, pseq);
			
			List<SongVO> songList = albumService.songListBySinger(cri2, pseq);
			
			cri1.setNumPerPage(8);
			cri2.setNumPerPage(10);		
			
			PageMaker pageMaker1 = new PageMaker();
			PageMaker pageMaker2 = new PageMaker();
			
			pageMaker1.setCri(cri1);
			pageMaker2.setCri(cri2);	
			
			int albumCnt = albumService.albumListBySingerCnt(pseq);
			pageMaker1.setTotalCount(albumCnt);
			
			int songCnt = albumService.songListBySingerCnt(pseq);
			pageMaker2.setTotalCount(songCnt);
			
			model.addAttribute("pageMaker1", pageMaker1);
			model.addAttribute("pageMaker2", pageMaker2);
			model.addAttribute("singerDetail", singer);
			model.addAttribute("albumListBySinger", albumList);
			model.addAttribute("songListBySinger", songList);
			
			return "admin/album/admin_singer_info";
			
		}
	}
	
	/*
	 * 앨범 수정화면 이동
	 */
	@RequestMapping(value="albumUpdate", method=RequestMethod.GET)
	public String albumUpdateView(AlbumVO vo, HttpSession session,
									Model model) {
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
			
			AlbumVO album = albumService.albumInfo(vo);

			model.addAttribute("albumVO", album);
		
			return "admin/album/albumUpdate";

		}
	}
	
	/*
	 * 앨범 수정
	 */
	@RequestMapping(value="albumUpdate", method=RequestMethod.POST)
	public String albumUpdateAction(@RequestParam(value="uploadPicture") MultipartFile uploadFile,
									 int aseq,
									 AlbumVO albumVO, SongVO songVO,
									HttpSession session, Model model) {
		
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			String fileName = "";
			
			if (!uploadFile.isEmpty()) {
				String root_path = session.getServletContext().getRealPath("WEB-INF/resources/images/album_images/");
				
				System.out.println("������Ʈ Root ���" + root_path);
				
				fileName = uploadFile.getOriginalFilename();
						
				File file = new File(root_path + fileName);		
				
				try {
					uploadFile.transferTo(file);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				albumVO.setAlbum_image(fileName);
				
			} else {
				
				AlbumVO album = albumService.albumInfo(albumVO);
				
				//앨범 이미지 등록
				albumVO.setAlbum_image(album.getAlbum_image());
			}
			
				adminService.albumUpdate(albumVO);
			
				
				
				AlbumVO album = albumService.albumInfo(albumVO);
				
				List<SongVO> songList = albumService.songList(songVO);
				
				
				
				model.addAttribute("albumInfo", album);
				
				model.addAttribute("songList", songList);
	
	
				return "admin/album/admin_album_info";
				
		}	

	}
	
	
	
	
	/*
	 * 앨범 삭제
	 */
	@RequestMapping(value="albumDelete")
	public String albumDeleteAction(int aseq, int pseq, 
									Criteria cri1, Criteria cri2, HttpSession session,
									Model model) {

		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			Integer seqrchSongCnt = adminService.findSongByAlbum(aseq);
	
	
			if (seqrchSongCnt == null) {
				seqrchSongCnt = 0;
			}
	
			
			if (seqrchSongCnt == 0) {
				adminService.admin_cmtDeleteAll(aseq);
				adminService.albumDelete(aseq);
			} else {
				return "admin/album/action/no_albumDelete";
			}
			
			SingerVO singer = albumService.getSinger(pseq);
			
			List<AlbumVO> albumList = albumService.albumListBySinger(cri1, pseq);
			
			List<SongVO> songList = albumService.songListBySinger(cri2, pseq);
			
			cri1.setNumPerPage(8);
			cri2.setNumPerPage(10);		
			
			PageMaker pageMaker1 = new PageMaker();
			PageMaker pageMaker2 = new PageMaker();
			
			pageMaker1.setCri(cri1);
			pageMaker2.setCri(cri2);	
			
			int albumCnt = albumService.albumListBySingerCnt(pseq);
			pageMaker1.setTotalCount(albumCnt);
			
			int songCnt = albumService.songListBySingerCnt(pseq);
			pageMaker2.setTotalCount(songCnt);
			
			model.addAttribute("pageMaker1", pageMaker1);
			model.addAttribute("pageMaker2", pageMaker2);
			model.addAttribute("singerDetail", singer);
			model.addAttribute("albumListBySinger", albumList);
			model.addAttribute("songListBySinger", songList);
			
			return "admin/album/admin_singer_info";

		}
	}
	
	/*
	 * 노래 등록 화면 이동
	 */
	@RequestMapping(value="songWrite", method=RequestMethod.GET)
	public String songWriteView(int pseq, int aseq, String singer_name, String album_name,
								HttpSession session,
								Model model) {
		
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			model.addAttribute("singerNum", pseq);
			model.addAttribute("albumNum", aseq);
			model.addAttribute("singerName", singer_name);
			model.addAttribute("albumName", album_name);
			
			return "admin/album/songWrite";
			
		}
	}
	
	/*
	 * 노래 등록
	 */
	@RequestMapping(value="songWrite", method=RequestMethod.POST)
	public String songWriteAction(AlbumVO albumVO, SongVO songVO,
									HttpSession session, Model model) {
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			adminService.songWrite(songVO);
			
			AlbumVO album = albumService.albumInfo(albumVO);
			List<SongVO> songList = albumService.songList(songVO);
			
			model.addAttribute("albumInfo", album);
			model.addAttribute("songList", songList);
	
			return "admin/album/admin_album_info";
		
		}
		
	}
	
	/*
	 * 노래 수정 화면 이동
	 */
	@RequestMapping(value="songUpdate", method=RequestMethod.GET)
	public String songUpdateView(int aseq, int sseq, SongVO songVO,
								HttpSession session, Model model) {
		
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			SongVO song = albumService.songInfo(songVO);
			
			model.addAttribute("albumNum", aseq);
			model.addAttribute("songNum", sseq);
			model.addAttribute("songVO", song);
			
			
			return "admin/album/songUpdate";
			
		}
	}
	
	/*
	 * 노래 수정
	 */
	@RequestMapping(value="songUpdate", method=RequestMethod.POST)
	public String songUpdateAction(AlbumVO albumVO, SongVO songVO, 
									HttpSession session, Model model) {
		
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			adminService.songUpdate(songVO);
			
			
			AlbumVO album = albumService.albumInfo(albumVO);
			List<SongVO> songList = albumService.songList(songVO);
			
			model.addAttribute("albumInfo", album);
			model.addAttribute("songList", songList);
	
			return "admin/album/admin_album_info";
			
		}
	}
	
	/*
	 * 노래 삭제
	 */
	@RequestMapping(value="songDelete")
	public String songDeleteAction(AlbumVO albumVO, SongVO songVO, int sseq,
									HttpSession session, Model model) {

		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			adminService.deleteGood(sseq);
			
			adminService.deleteListen(sseq);
			
			adminService.songDelete(sseq);
			
			AlbumVO album = albumService.albumInfo(albumVO);
			List<SongVO> songList = albumService.songList(songVO);
			
			model.addAttribute("albumInfo", album);
			model.addAttribute("songList", songList);
	
			return "admin/album/admin_album_info";
			
		}
	}
	
	
	
	/*
	 * 앨범의 댓글 삭제
	 */
	
	@RequestMapping(value="admin_cmtDeleteToAlbum")
	public String cmtDeleteToAlbum(int cseq, int aseq,
									AlbumVO albumVO, SongVO songVO, 
									HttpSession session, Model model) {
		
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			adminService.admin_cmtDelete(cseq);
			
			
			AlbumVO album = albumService.albumInfo(albumVO);
			
			List<SongVO> songList = albumService.songList(songVO);
			
			List<CmtVO> cmtList = albumService.cmtList(aseq);
			
			
			
			model.addAttribute("albumInfo", album);
			
			model.addAttribute("songList", songList);
	
			model.addAttribute("cmtList", cmtList);
			
			return "admin/album/admin_album_info";
			
		}
	}
	

	
	
	/*
	 * �ٹ� ����Ʈ �迭
	 */
	/*
	@RequestMapping(value="albumList")
	public String albumView(AlbumVO vo,	Model model) {
		

		
			List<AlbumVO> albumList = adminService.albumAll(vo);
			
			model.addAttribute("albumList", albumList);
			
			return "admin/album/albumList";
			
		
	}
	*/
	/*
	 * 앨범 조회 (관리자)
	 */
	
	@RequestMapping(value="albumList")
	public String albumView(@RequestParam(value="keyword", defaultValue="", required=false) String keyword,
							Criteria cri, HttpSession session,
							Model model) {
		
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			List<AlbumVO> albumList = adminService.listAlbumPaging(keyword, cri);
		
			PageMaker pageMaker = new PageMaker();
		
			pageMaker.setCri(cri);
			
			int albumCnt = adminService.listAlbumCnt(keyword);
			pageMaker.setTotalCount(albumCnt);
			
			
			model.addAttribute("keyword", keyword);
			model.addAttribute("albumCnt", albumCnt);
			model.addAttribute("albumList", albumList);
			model.addAttribute("pageMaker", pageMaker);
			
			return "admin/album/albumList";
			
		}
	}
	

	
	
	
	/*
	 * ���� ����Ʈ �迭
	 */
	/*
	@RequestMapping(value="songList")
	public String songView(Model model) {

			List<SongVO> songList = adminService.songAll();
			
			model.addAttribute("songList", songList);
			
			return "admin/album/songList";
			
		
	}
	*/
	
	/*
	 * 노래 조회 (관리자)
	 */
	
	@RequestMapping(value="songList")
	public String songView(@RequestParam(value="keyword", defaultValue="", required=false) String keyword,
							Criteria cri, HttpSession session,
							Model model) {
		
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			List<SongVO> songList = adminService.listSongPaging(keyword, cri);
			
			PageMaker pageMaker = new PageMaker();
			
			
			pageMaker.setCri(cri);
			
			
			//System.out.println(songList.size());
			
			int songCnt = adminService.listSongCnt(keyword);
			pageMaker.setTotalCount(songCnt);
			
			model.addAttribute("keyword", keyword);
			model.addAttribute("songCnt", songCnt);
			model.addAttribute("songList", songList);
			model.addAttribute("pageMaker", pageMaker);
			
			return "admin/album/songList";
			
		}
	}
	
	/*
	 * �뷡 �˻�
	 */
	/*
	@RequestMapping(value="admin_song_search")
	public String songSearch(@RequestParam(value="keyword") String keyword,
								Model model) {
		
		List<SongVO> songList = albumService.searchSongBySong(keyword);
		
		model.addAttribute("songList", songList);
		
		return "admin/album/songList";
		
	}
	*/
	/*
	 * ��ü ��� �迭
	 */
	/*
	@RequestMapping(value="cmtList")
	public String cmtView(Model model) {
		
		List<CmtVO> cmtList = adminService.cmtAll();
		
		model.addAttribute("cmtList", cmtList);
		
		return "admin/album/cmtList";
	}
	*/
	/*
	 * 댓글 조회 (관리자)
	 */
	@RequestMapping(value="cmtList")
	public String cmtView(@RequestParam(value="keyword", defaultValue="", required=false) String keyword,
							Criteria cri, 
							HttpSession session, Model model) {
		
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			List<CmtVO> cmtList = adminService.listCmtPaging(keyword, cri);
			
			PageMaker pageMaker = new PageMaker();
			
			pageMaker.setCri(cri);
			
			int cmtCnt = adminService.listCmtCnt(keyword);
			pageMaker.setTotalCount(cmtCnt);
			
			model.addAttribute("keyword", keyword);
			model.addAttribute("cmtCnt", cmtCnt);
			model.addAttribute("cmtList", cmtList);
			model.addAttribute("pageMaker", pageMaker);
			
			return "admin/album/cmtList";
			
		}
	}
	
	/*
	 * 관리자 댓글 삭제
	 */
	@RequestMapping(value="admin_cmtDelete")
	public String adminCmtDelete (int cseq, HttpSession session) {
		
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			adminService.admin_cmtDelete(cseq);
			
			return "redirect:cmtList";
			
		}
	}
	
	/*
	 * ��� �˻�
	 */
	/*
	@RequestMapping(value="admin_cmt_search")
	public String cmtSearch(@RequestParam(value="keyword") String keyword,
								Model model) {
		
		List<CmtVO> cmtList = adminService.adminSearchCmt(keyword);
		
		model.addAttribute("cmtList", cmtList);
		
		return "admin/album/cmtList";
		
	}
	*/
	
	/*
	 * ȸ�� ����Ʈ �迭
	 */
	/*
	@RequestMapping(value="memberList")
	public String memberView(Model model) {
		
		List<MemberVO> memberList = adminService.memberAll();
		
		model.addAttribute("memberList", memberList);
		
		return "admin/member/memberList";
	}
	*/
	
	/*
	 * 가입된 회원정보 조회
	 */
	@RequestMapping(value="memberList")
	public String memberSearch(@RequestParam(value="keyword", defaultValue="", required=false) String keyword,
								Criteria cri, HttpSession session,
								Model model) {
		
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			List<MemberVO> memberList = adminService.listMemberPaging(keyword, cri);
			
			PageMaker pageMaker = new PageMaker();
			
			pageMaker.setCri(cri);
			
			int memberCnt = adminService.listMemberCnt(keyword);
			pageMaker.setTotalCount(memberCnt);
			
			model.addAttribute("memberCnt", memberCnt);
			model.addAttribute("keyword", keyword);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("memberList", memberList);
			
			return "admin/member/memberList";
		
		}
	}
	
	/*
	 *등록된 qna 조회
	 */
	@RequestMapping(value="admin_qna")
	public String qnaSearch(@RequestParam(value="keyword", defaultValue="", required=false) String keyword,
							Criteria cri, HttpSession session,
							Model model) {
		
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			List<QnaVO> qnaList = adminService.listQnaPaging(keyword, cri);
			
			PageMaker pageMaker = new PageMaker();
			
			pageMaker.setCri(cri);
			
			int qnaCnt = adminService.listQnaCnt(keyword);
			pageMaker.setTotalCount(qnaCnt);
			
			model.addAttribute("qnaCnt", qnaCnt);
			model.addAttribute("keyword", keyword);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("qnaList", qnaList);
			
			return "admin/qna/admin_qna";
		
		}
	}
	
	/*
	 *  QnA ����Ʈ �̵�
	 */
	/*
	@RequestMapping(value="admin_qna")
	public String qnaView(Model model) {
		
		List<QnaVO> qnaList = adminService.qnaAll();
		
		model.addAttribute("qnaList", qnaList);
		
		return "admin/qna/admin_qna";
	}
	*/
	//qna 상세정보
	@RequestMapping(value="admin_qnaDetail")
	public String qnaDetail(int qseq, Model model, HttpSession session) {
		
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
			
			QnaVO qnaVO = qnaService.qnaDetail(qseq);
			
			model.addAttribute("qnaVO", qnaVO);
			
			return "admin/qna/admin_qnaDetail";
			
		}
			
		
	}
	
	//qna 답변 작성
	@RequestMapping(value="answerQna")
	public String answerQna(QnaVO qnaVO, HttpSession session) {
		
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			adminService.qnaUpdate(qnaVO);
			
			return "redirect:admin_qna";
		}
	}
	
	//회원 탈퇴 이유 조회
	@RequestMapping(value="admin_delete_reason")
	public String del_chart_form (HttpSession session, Model model) {
		
		AdminVO loginUser = (AdminVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
		
			List<DelVO> etcList = adminService.getDelReasonEtc();
			
			model.addAttribute("etcList", etcList);
			
			return "admin/delChart";
			
		}
	}
	
	//회원 탈퇴 관련 차트 조회
	@RequestMapping(value = "delete_record_chart",
					produces="application/json; charset=utf-8")
	@ResponseBody
	public List<DelRate> deleteRecordChart() {
		List<DelRate> deleteReasons = adminService.getDelReasons();
		
		System.out.println("<<<<<<Ż�� ����>>>>>>>");
		System.out.println("    ����   Ƚ��");
		System.out.println("----------------");
		for (DelRate item : deleteReasons) {
			System.out.printf("%10s%3d\n", item.getReason(), item.getReason_cnt());
		}
		System.out.println("================");
		
		return deleteReasons;
	}
}
