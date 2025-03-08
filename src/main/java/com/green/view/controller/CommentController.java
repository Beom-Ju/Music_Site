package com.green.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.green.biz.album.AlbumService;
import com.green.biz.album.CmtVO;
import com.green.biz.member.MemberVO;
import com.green.biz.utils.Criteria;
import com.green.biz.utils.PageMaker;

@RequestMapping("/comments/")
@RestController	//String 타입말고도 다른 타입으로도 return이 되게 함
public class CommentController {

	@Autowired
	AlbumService albumService;
	
	@GetMapping(value="/list") //list타입을 get방식으로서 불러들임
	public Map<String, Object> CommentPagingList(@RequestParam(value="aseq") int aseq,
												Criteria criteria, Model model,
												HttpSession session) {
		System.out.println("Criteria=" + criteria);
		System.out.println("앨범번호" + aseq);
		Map<String, Object> commentInfo = new HashMap<String, Object>();
		
		List<CmtVO> commentList = albumService.cmtListPaging(criteria, aseq);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		int totalComment = albumService.countCmtList(aseq);
		
		pageMaker.setTotalCount(totalComment);
		System.out.println("페이징 정보" + pageMaker);
		
		int updateView = 0;
		model.addAttribute("updateView", updateView);
	
		commentInfo.put("total", totalComment);	//해당 앨범에 대한 댓글 개수
		commentInfo.put("comments", commentList);
		commentInfo.put("pageinfo", pageMaker);
		
		return commentInfo;
		
	}
	
	@PostMapping(value="/save")
	@ResponseBody	//화면에 결과가 출력되지 않아서 쓰임
	public String saveComment(CmtVO vo, HttpSession session) {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return ("not_logein");
		} else {
			
			String writer = loginUser.getId();
		
			vo.setId(writer);
			
			if (albumService.writeCmt(vo) == 1)
				return "success";
			else
				return "fail";
		}
	}
	
	@PostMapping(value="/delete")
	@ResponseBody
	public String deleteComment(int cseq, CmtVO vo, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return ("not_login");
		} else {
				vo.setCseq(cseq);
				vo.setId(loginUser.getId());
				
			
				if (albumService.deleteCmt(vo) == 1)
					return "success";
				else
					return "fail";
		}		
	}

}
