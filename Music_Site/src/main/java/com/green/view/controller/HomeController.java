package com.green.view.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.green.biz.album.AlbumService;
import com.green.biz.album.AlbumVO;
import com.green.biz.album.GoodVO;
import com.green.biz.album.SongVO;
import com.green.biz.member.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private AlbumService albumService;
	
	/*
	메인화면
	 */
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {

		//최신 앨범 조회 (8개)
		List<AlbumVO> newAlbumList = albumService.listAlbum();
		model.addAttribute("newAlbumList", newAlbumList);
		
		//최신 앨범 조회 (전체)
		List<SongVO> songList = albumService.songListByCnt();
		model.addAttribute("songListByCnt", songList);
		

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {

			
			return "index";
		
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
		
			
			return "index";
		}
		
		
	}
	
}
