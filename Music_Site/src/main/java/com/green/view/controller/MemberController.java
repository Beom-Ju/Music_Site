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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.green.biz.admin.AdminService;
import com.green.biz.admin.AdminVO;
import com.green.biz.album.AlbumService;
import com.green.biz.album.GoodVO;
import com.green.biz.album.SongVO;
import com.green.biz.member.AddressVO;
import com.green.biz.member.DelVO;
import com.green.biz.member.MemberService;
import com.green.biz.member.MemberVO;
import com.green.biz.utils.Criteria;
import com.green.biz.utils.PageMaker;

@Controller
@SessionAttributes("loginUser")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private AlbumService albumService;

	/*
	 * 메인화면 이동
	 */
	@RequestMapping(value="index")
	public String indexView() {
		
		return "index";
	}
	
	/*
	 * 로그인 화면 이동
	 */
	@RequestMapping(value="login_form")
	public String loginView() {
		
		return "member/login";
	}
	
	@RequestMapping(value="no_login")
	public String nologinAction() {
		
		return "member/action/no_login";
	}
	
	/*
	 * 회원가입 화면 이동
	 */
	@RequestMapping(value="join_form")
	public String joinView() {
		
		return "member/join";
	}
	
	/*
	 * 아이디 중복 확인
	 */
	@RequestMapping(value="id_check_form")
	public String idCheckAction(@RequestParam(value="id", defaultValue="", required=false) String id,
							  Model model) {
		
		MemberVO user = memberService.findMember(id);
		
		if (user != null) {
			model.addAttribute("message", 1);
		} else {
			model.addAttribute("message", -1);
		}
		
		model.addAttribute("id", id);
		
		return "member/idCheck";
	}
	
	/*
	 * 주소 검색 팝업 (회원가입)
	 */
	@RequestMapping(value="join_addr_search", method=RequestMethod.GET)
	public String addSearchViewJoin() {
		
		return "member/addPopup1";
	}
	
	/*
	 * 주소 검색 (회원가입)
	 */
	@RequestMapping(value="join_addr_search", method=RequestMethod.POST)
	public String addSearchActionJoin(String dong, Model model) {
		
		List<AddressVO> addressList = memberService.findAddress(dong);
		
		model.addAttribute("addressList", addressList);
		
		return "member/addPopup1";

	}
	
	/*
	 * 회원가입 기능
	 */
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(@RequestParam(value="uploadPicture") MultipartFile uploadFile,
					   @RequestParam(value="address1") String address1,
					   @RequestParam(value="address2") String address2,
						MemberVO vo, HttpSession session) {
		
		//회원 이미지
		String fileName = "default.jpg";
		if (!uploadFile.isEmpty()) {
			
			String root_path = session.getServletContext().getRealPath("WEB-INF/resources/images/member_images/");
			
			System.out.println("������Ʈ Root ���" + root_path);
			fileName = uploadFile.getOriginalFilename();
			
			File file = new File(root_path + fileName);
			
			try {
				uploadFile.transferTo(file); //transferTo �ȿ� ���� ��ΰ� ���� ��
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			
		}
			
		
		vo.setMember_picture(fileName);
		
		/*
		String address = address1 + " " + address2;
		
		if (address.equals(" ")) {
			address = "";
		}
		
		vo.setAddress(address);
		*/
		memberService.insertMember(vo);
		
		return "member/login";
	}
	
	/*
	 * 홈페이지 로그인
	 */
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String loginAction(@RequestParam(value="system") String system,
						MemberVO vo, AdminVO adminVO, Model model) {
		if (system.equals("1")) {
			
			MemberVO loginUser = memberService.getMember(vo);
			
			if (loginUser != null) {
				
				if (loginUser.getUseyn().equals("n")) {
					
					return "member/action/delete_login";
				} else {

					
					model.addAttribute("loginUser", loginUser);
					
					return "redirect:/index";
				}
			} else {
				
				return "member/action/wrong_login";
			}
			
		} else {
			
			AdminVO loginUser = adminService.getAdmin(adminVO);
			
			if (loginUser != null) {
				
				model.addAttribute("loginUser", loginUser);
				
				return "admin/main";
				
			} else {
				
				return "member/action/wrong_login";
				
			}
			
			
		}
		
		
	}
	/*
	 * 아이디 찾기 화면 이동
	 */
	@RequestMapping(value="findId")
	public String findIdView() {
		
		return "member/findId";
	}
	
	/*
	 * 비밀번호 찾기 화면 이동
	 */
	@RequestMapping(value="findPwd")
	public String findPwdAction() {
		
		return "member/findPwd";
	}
	
	/*
	 * 아이디 찾기 (이메일로)
	 */
	@RequestMapping(value="findId_email")
	public String findIdEmail(MemberVO vo, Model model){
		
		MemberVO member = memberService.getId_Email(vo);
		
		if (member != null) {
			model.addAttribute("message", 1);
			model.addAttribute("member", member);
		} else {
			model.addAttribute("message", -1);
		}
				
		return "member/findResult";
	}
	
	/*
	 * 아이디 찾기 (전화번호로)
	 */
	@RequestMapping(value="findId_phone")
	public String findIdPhone(MemberVO vo, Model model){
		
		System.out.println("MemberVO="+vo);
		MemberVO member = memberService.getId_Phone(vo);
		
		if (member != null) {
			model.addAttribute("message", 1);
			model.addAttribute("member", member);
		} else {
			model.addAttribute("message", -1);
		}
				
		return "member/findResult";
	}
	
	/*
	 * 비밀번호 찾기/변경 (이메일로)
	 */
	
	@RequestMapping(value="findPwd_email")
	public String findPwdEmail(MemberVO vo, Model model) {
		
		MemberVO member = memberService.getPwd_Email(vo);
		
		if (member != null) {
			model.addAttribute("message", 2);
			model.addAttribute("id", member.getId());
			
		} else {
			model.addAttribute("message", -2);
		}
		
		return "member/findResult";
	}
	
	/*
	 * 비밀번호 찾기/변경 (전화번호로)
	 */
	
	@RequestMapping(value="findPwd_phone")
	public String findPwdPhone(MemberVO vo, Model model) {
		
		MemberVO member = memberService.getPwd_Phone(vo);
		
		if (member != null) {
			model.addAttribute("message", 2);
			model.addAttribute("id", member.getId());
			
		} else {
			model.addAttribute("message", -2);
		}
		
		return "member/findResult";
	}
	
	/*
	 * 비밀번호 수정
	 */
	@RequestMapping(value="update_pwd")
	public String updatePwd(MemberVO vo) {
		
		memberService.updatePwd(vo);
		
		return "member/action/close";
	}
	
	/*
	 * 비밀번호 체크 화면 이동
	 */
	@RequestMapping(value="login_pwdCheck")
	public String pwdCheckView(MemberVO vo, HttpSession session) {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser != null) {
			return "member/pwdCheck";
		} else {
			return "member/action/no_login";
		}
	}
	
	/*
	 * 마이페이지 이동
	 */
	@RequestMapping(value="mypage")
	public String mypageView(@RequestParam(value="pwd") String pwd,
							 HttpSession session, MemberVO vo, Model model) {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser != null) {
			
			if (loginUser.getPwd().equals(pwd)) {
				/*
				if(loginUser.getGender().equals("����")) {
					loginUser.setGender("1");
				} 
				
				if(loginUser.getGender().equals("����")) {
					loginUser.setGender("2");
				}
				*/
				model.addAttribute("loginUser", loginUser);
				return "member/mypage";
			} else {
				return "member/action/pwd_fail";
			}
		} else {
			
			return "member/action/no_login";
		}
		
		
	}
	
	/*
	 * 탈퇴 사유 작성 이동
	 */
	@RequestMapping(value="delete_reason")
	public String delete_reason() {
		
		return "member/delete_reason";
	}
	
	/*
	 * 탈퇴하기
	 */
	@RequestMapping(value="delete")
	public String deleteAction(	@RequestParam(value="etc_reason") String etc_reason,
								@RequestParam(value="pwd") String pwd, 
								String reason,	DelVO vo,
								HttpSession session, SessionStatus status) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser != null) {
			if (loginUser.getPwd().equals(pwd)) {
				
				//기존 탈퇴이유 있는지 확인하고 있으면 업데이트 / 없으면 등록
				int cnt = memberService.findDelReason(reason);
				
				if (cnt > 0) {
					memberService.updateDelReason(reason);
				} else {
					if (reason.equals("etc")) {
						vo.setReason(etc_reason);
						vo.setEtcyn("y");
						memberService.insertDelReason(vo);
					} else {
						memberService.insertDelReason(vo);
					}
				}
				
				//탈퇴하기 (계정 삭제)
				memberService.deleteMember(loginUser.getId());
				
				status.setComplete();
				
				return "member/action/delete_member";
			} else {
				return "member/action/pwd_fail";
			}
		} else {
			return "member/action/no_login";
		}
	}
	
	/*
	 * 주소찾기 팝업 (마이페이지)
	 */
	@RequestMapping(value="my_addr_search", method=RequestMethod.GET)
	public String addSearchViewMypage() {
		
		return "member/addPopup2";
	}
	
	/*
	 * 주소 조회 (마이페이지)
	 */
	@RequestMapping(value="my_addr_search", method=RequestMethod.POST)
	public String addSearchActionMypage(String dong, Model model) {
		
		List<AddressVO> addressList = memberService.findAddress(dong);
		
		model.addAttribute("addressList", addressList);
		
		return "member/addPopup2";

	}
	
	/*
	 * 마이페이지 수정
	 */
	@RequestMapping(value="update")
	public String updateAction(@RequestParam(value="uploadPicture") MultipartFile uploadFile,
								MemberVO vo, Model model, HttpSession session) {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser != null) {
			
			String fileName = "";
			/*
			//������ ��ϵǾ� �ִ� ���¿��� �ƹ� ���൵ ���� ���
			if (loginUser.getMember_picture() != "default.jpg") {
				vo.setMember_picture(loginUser.getMember_picture());
			} else {
			*/	
				//마이페이지 이미지가 없으면 임시 이미지로 등록
				if (!uploadFile.isEmpty()) {
					String root_path = session.getServletContext().getRealPath("WEB-INF/resources/images/member_images/");
					
					System.out.println("������Ʈ Root ���" + root_path);
					
					fileName = uploadFile.getOriginalFilename();
							
					File file = new File(root_path + fileName);		
					
					try {
						uploadFile.transferTo(file);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					
					vo.setMember_picture(fileName);
					
				} else {
					//등록 사진
					vo.setMember_picture(loginUser.getMember_picture());
				}
				
			/*	
			}
			*/
			memberService.updateMember(vo);
			
			MemberVO updateUser = memberService.findMember(loginUser.getId());
			
			model.addAttribute("loginUser", updateUser);
			
			return "redirect:/index";
		} else {
			return "member/action/no_login";
		}
	}

	/*
	 * 마이뮤직 이동
	 */
	@RequestMapping(value="myMusic")
	public String myMusicView(@RequestParam(value="check", defaultValue="", required=false) String check,
								Criteria cri1, Criteria cri2, Model model, HttpSession session) {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser != null) {
			
			
			List<SongVO> goodSongList = albumService.goodSongListById(loginUser.getId(), cri1);
			List<SongVO> listenSongList = albumService.listenSongListById(loginUser.getId(), cri2);
			
			List<GoodVO> goodList = albumService.findClickId(loginUser.getId());
			
			PageMaker pageMaker1 = new PageMaker();
			PageMaker pageMaker2 = new PageMaker();
			
			if (check.equals("check1")) {
				cri2.setPageNum(1);
				
				listenSongList = albumService.listenSongListById(loginUser.getId(), cri2);
				
				pageMaker1.setCri(cri1);
				pageMaker2.setCri(cri2);
			} else if (check.equals("check2")) {
				cri1.setPageNum(1);
				
				goodSongList = albumService.goodSongListById(loginUser.getId(), cri1);		
				
				pageMaker1.setCri(cri1);
				pageMaker2.setCri(cri2);

			} else {
				pageMaker1.setCri(cri1);
				pageMaker2.setCri(cri2);
			}
			
			int goodSongCnt = albumService.goodSongListByIdCnt(loginUser.getId());
			pageMaker1.setTotalCount(goodSongCnt);
			
			int listenCnt = albumService.listenSongListByIdCnt(loginUser.getId());
			pageMaker2.setTotalCount(listenCnt);
			
			for (int i = 0; i < goodSongList.size() ; i++) {
				int rankSongNum = goodSongList.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum = goodList.get(j).getSseq();
				
					if (rankSongNum == goodSongNum) {
						
						goodSongList.get(i).setGoodClick("y");
	
					}
				}
			}
			
		
			
			
			for (int i = 0; i < listenSongList.size() ; i++) {
				int rankSongNum = listenSongList.get(i).getSseq();
				
				for (int j=0; j < goodList.size() ; j++) {
					int goodSongNum = goodList.get(j).getSseq();
				
					if (rankSongNum == goodSongNum) {
						
						listenSongList.get(i).setGoodClick("y");
	
					}
				}
			}
			
			model.addAttribute("check", check);
			model.addAttribute("goodSongCnt", goodSongCnt);
			model.addAttribute("listenCnt", listenCnt);
			model.addAttribute("pageMaker1", pageMaker1);
			model.addAttribute("pageMaker2", pageMaker2);
			model.addAttribute("goodSongList", goodSongList);
			model.addAttribute("listenSongList", listenSongList);
			model.addAttribute("loginUser", loginUser);
			
			return "member/mymusic";
		} else {
			
			return "member/action/no_login";
		}
		

	}
	
	/*
	 * 소개글 수정하기
	 */
	@RequestMapping(value="intro")
	public String updateIntroAction(MemberVO vo, Model model, HttpSession session) {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser != null) {
			
			vo.setId(loginUser.getId());
			
			memberService.updateIntro(vo);
			
			MemberVO updateUser = memberService.findMember(loginUser.getId());
			
			model.addAttribute("loginUser", updateUser);
			
			return "redirect:myMusic";
		} else {
			
			return "member/action/no_login";
		}
	}
	

	
	/*
	 * 로그아웃
	 */
	@RequestMapping(value="logout")
	public String logoutAction(SessionStatus status) {
		status.setComplete();
		
		return "redirect:/index";
	}
	

}
