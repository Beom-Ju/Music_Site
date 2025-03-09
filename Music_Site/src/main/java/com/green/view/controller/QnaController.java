package com.green.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.green.biz.member.MemberVO;
import com.green.biz.qna.QnaService;
import com.green.biz.qna.QnaVO;
import com.green.biz.utils.Criteria;
import com.green.biz.utils.PageMaker;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@RequestMapping(value="qna")
	public String qnaList(Criteria cri, 
							Model model, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
			
			cri.setNumPerPage(5);
			
			List<QnaVO> qnaList = qnaService.getQnaList(loginUser.getId(), cri);
	
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			int qnaCnt = qnaService.getQnaListCnt(loginUser.getId());
			pageMaker.setTotalCount(qnaCnt);
			
			model.addAttribute("qnaCnt", qnaCnt);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("qnaList", qnaList);
			
			return "qna/qnaView";
		}
	}
	
	@RequestMapping(value="qnaDetail")
	public String qnaDetail(int qseq, Model model, HttpSession session) {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if(loginUser == null) {
			
			return "member/action/no_login";
		} else {
			
			QnaVO qnaVO = qnaService.qnaDetail(qseq);
			
			model.addAttribute("qnaVO", qnaVO);
			
			return "qna/qnaDetail";
			
		}
	}
	
	@RequestMapping(value="qna_write", method=RequestMethod.GET)
	public String qnaWriteView(HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
			
			return "qna/qnaWrite";
		}
	}
	
	@RequestMapping(value="qna_write", method=RequestMethod.POST)
	public String qnaWriteAction(@RequestParam(value="uploadPicture") MultipartFile uploadFile,
									QnaVO vo, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			
			return "member/action/no_login";
		} else {
			
			vo.setId(loginUser.getId());
			
			String fileName = "default.jpg";
			
			if (!uploadFile.isEmpty()) {
				String root_path = session.getServletContext().getRealPath("WEB-INF/resources/images/qna_images/");
				
				System.out.println("프로젝트 root 경로" + root_path);
				fileName = uploadFile.getOriginalFilename();
				
				File file = new File(root_path + fileName);
				
				try {
					uploadFile.transferTo(file);
				} catch (IllegalStateException | IOException e) {
					
					e.printStackTrace();
				}
					
				
			}
			
			vo.setPicture(fileName);
			
			
			
			qnaService.qnaWrite(vo);
			
			return "redirect:qna";
		}
	}
}
