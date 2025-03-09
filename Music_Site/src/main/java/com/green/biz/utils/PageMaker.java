package com.green.biz.utils;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private Criteria cri;	//현재 페이지 정보 (현재 페이지 번호, 페이지당 항목개수 등)
	
	private int totalCount;	//전체 게시글 수
	private int startPage;	//시작 페이지 번호
	private int endPage;	//끝 페이지 번호
	private boolean prev;	//이전 페이지 유무
	private boolean next;	//다음 페이지 유무
	
	private int displayPageNum = 10;	//화면 하단에 쓰이는 페이지의 수
	private int realEndPage;	//전체 항목의 수에 따른 실제 마지막 페이지의 번호
	
	public Criteria getCri() {
		return cri;
	}
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		memberInit();
	}
	
	public void memberInit() {
		//끝 페이지 계산
		//끝 페이지 = 올림(현재 페이지 번호/ 표시할 페이지 갯수) * 표시할 페이지 갯수
		endPage = (int)Math.ceil(cri.getPageNum() / (double) displayPageNum) * displayPageNum;
		
		//시작 페이지
		//시작 페이지 = 끝페이지 번호 - 표시할 페이지 수 + 1
		startPage = endPage - displayPageNum + 1;
		
		//실제 마지막 페이지 =  올림(조회한 전체 항목 수 / 페이지 출력 항목 수))
		realEndPage = (int)(Math.ceil(totalCount / (double) cri.getNumPerPage()));
		
		//실제 마지막 페이지(realEndPage)와 계산한 마지막 페이지(endPage)가 값이 틀릴 경우
		if (endPage > realEndPage) {
			endPage = realEndPage;
		}
		
		//이전 페이지
		prev = (startPage == 1 ? false : true);
		
		//다음 페이지
		//조회한 
		next = totalCount > (endPage * cri.getNumPerPage()) ? true : false;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComp = UriComponentsBuilder.newInstance()
								.queryParam("pageNum", page)
								.queryParam("numPerPage", cri.getNumPerPage())
								.build();
		
		return uriComp.toString();
	}
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public int getRealEndPage() {
		return realEndPage;
	}
	public void setRealEndPage(int realEndPage) {
		this.realEndPage = realEndPage;
	}

	@Override
	public String toString() {
		return "PageMaker [cri=" + cri + ", totalCount=" + totalCount + ", startPage=" + startPage + ", endPage="
				+ endPage + ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum
				+ ", realEndPage=" + realEndPage + "]";
	}
	
}
