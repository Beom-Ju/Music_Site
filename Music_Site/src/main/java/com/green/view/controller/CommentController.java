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
@RestController	//String Ÿ�Ը��� �ٸ� Ÿ�����ε� return�� �ǰ� ��
public class CommentController {

	@Autowired
	AlbumService albumService;
	
	@GetMapping(value="/list") //댓글 리스트 조회
	public Map<String, Object> CommentPagingList(@RequestParam(value="aseq") int aseq,
												Criteria criteria, Model model,
												HttpSession session) {
		System.out.println("Criteria=" + criteria);
		System.out.println("�ٹ���ȣ" + aseq);
		Map<String, Object> commentInfo = new HashMap<String, Object>();
		
		List<CmtVO> commentList = albumService.cmtListPaging(criteria, aseq);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		int totalComment = albumService.countCmtList(aseq);
		
		pageMaker.setTotalCount(totalComment);
		System.out.println("����¡ ����" + pageMaker);
		
		int updateView = 0;
		model.addAttribute("updateView", updateView);
	
		commentInfo.put("total", totalComment);
		commentInfo.put("comments", commentList);
		commentInfo.put("pageinfo", pageMaker);
		
		return commentInfo;
		
	}
	
	@PostMapping(value="/save")
	@ResponseBody	//댓글 작성
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
	@ResponseBody //댓글 삭제
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
