package com.kh.oceanclass.Class.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.oceanclass.Class.model.service.ClassServiceImpl;
import com.kh.oceanclass.Class.model.vo.ClassLikeCk;
import com.kh.oceanclass.Class.model.vo.ClassOrder;
import com.kh.oceanclass.Class.model.vo.ClassQna;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.model.vo.Reply;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.member.model.vo.Member;

/*사용자 클래스 관련 기능 처리하는 controller*/

@Controller
public class ClassController {

	@Autowired
	private ClassServiceImpl cService;
	
	@RequestMapping(value="classDetail.me")
	public String classDetail(LikeVo li, Model model, HttpSession session) {
		// 클래스 상세보기
		
		// 조회수 증가
		int result = cService.increaseCount(li.getReferNo());
		
		if(result > 0) {
			if(session.getAttribute("loginUser") != null) {
				// 로그인 한 회원이라면 찜 했는지 안했는지도 확인하기
				int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
				li.setMemNo(memNo);
				int ckResult = cService.checkClassLike(li);
				if(ckResult > 0) {
					model.addAttribute("likeCk", "Y");
				} else {
					model.addAttribute("likeCk", "N");
				}
			} 
			// 클래스 정보
			ClassVo c = cService.selectClass(li.getReferNo());
			// 클래스 리뷰 리스트
			ArrayList<ClassReview> crList = cService.selectClassReviewList(li.getReferNo());
			// 리뷰 메인 4개 리스트 (도움순) + 리뷰 top5 (이미지)
			if(!crList.isEmpty()) {
				ArrayList<ClassReview> crMainList = cService.selectClassReviewMainList(li.getReferNo());
				model.addAttribute("crMainList", crMainList);
				
				ArrayList<ClassReview> crTopList = cService.selectClassReviewTopList(li.getReferNo());
				if(!crTopList.isEmpty()) {
					model.addAttribute("crTopList", crTopList);
				}
			}
			// 클래스 문의 리스트 (최신순)
			ArrayList<ClassQna> cqList = cService.selectClassQnaList(li.getReferNo());
			// 클래스 문의 최신순 3개 (문의 메인페이지용)
			if(!cqList.isEmpty()) {
				ArrayList<ClassQna> cqMainList = cService.selectClassQnaMainList(li.getReferNo());
				model.addAttribute("cqMainList", cqMainList);
			}			
			
			model.addAttribute("c", c);
			model.addAttribute("crList", crList);
			model.addAttribute("cqList", cqList);
			return "class/classDetail";
		} else {
			session.setAttribute("alertMsg", "잘못 된 접근입니다.");
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="classSearchList.me")
	public String classSearchList(int cpage, String keyword, String category, String array, Model model, HttpSession session) {
		// 클래스 검색 리스트
		HashMap<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("category", category);
		map.put("array", array);
		
		int listCount = cService.classSearchListCount(map); // 조회할 리스트 갯수
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, 5, 6);
		ArrayList<ClassVo> list = cService.classSearchList(map, pi); // 조회할 리스트 목록

		/*
		if(session.getAttribute("loginUser") != null) {
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
			model.addAttribute("memNo", memNo);
		}
		*/
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		model.addAttribute("array", array);
		return "class/classSearchList"; 
	}
	
	@ResponseBody
	@RequestMapping(value="classLikeCheck.me", produces="application/json; charset=UTF-8")
	public String classLike(LikeVo li, String grade) {

		ClassLikeCk lck = new ClassLikeCk();
		
		//학생인지 아닌지부터 확인
		if(grade.equals("S")) {
			// 이미 찜한적이 있는지 확인
			int result1 = cService.checkClassLike(li);
			
			if(result1 > 0) {
				// 이미 찜한 적 있음 -> 찜 내역 삭제 후 찜 수 다시 조회
				int result2 = cService.deleteClassLike(li);
				ClassVo c = cService.selectClass(li.getReferNo());
				
				if(result2 > 0 && c != null) {
					// 삭제 완료 및 request에 담기
					lck.setMessage("dd");
					lck.setLikeCount(c.getLike());
					return new Gson().toJson(lck);
				} 
			} else {
				// 찜 한 적 없음 -> 찜 내역 추가 후 찜 수 다시 조회
				int result2 = cService.insertClassLike(li);
				ClassVo c = cService.selectClass(li.getReferNo());

				if(result2 > 0) {
					// 찜 성공 및 request에 담기
					lck.setMessage("ss");
					lck.setLikeCount(c.getLike());
					return new Gson().toJson(lck);
				} 
			}
		} else {
			lck.setMessage("gradeCkNo");
			lck.setLikeCount("0");
			return new Gson().toJson(lck);
		}
		
		lck.setMessage("ff");
		lck.setLikeCount("0");
		System.out.println(new Gson().toJson(lck));
		return new Gson().toJson(lck);
	}
	
	@RequestMapping(value="classReviewList.me")
	public String classReviewList(int cpage, int clNo, Model model) {
		// 클래스 리뷰 리스트 페이지
		
		int listCount = cService.classReviewListCount(clNo); // 조회할 리뷰 갯수
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, 5, 3);
		ArrayList<ClassReview> reviewList = cService.selectClassReviewListPaging(clNo, pi); // 클래스 리뷰 리스트(페이징 처리)
		
		model.addAttribute("pi", pi);
		model.addAttribute("reviewClNo", clNo);
		model.addAttribute("reviewList", reviewList);
		return "class/classReviewList";
	}
	
	@RequestMapping(value="classReviewDetail.me")
	public String classReviewDetail(ClassReview c, int cpage, int rpage, Model model, HttpSession session) {
		// 클래스 리뷰 디테일 
		
		ClassReview cr = cService.selectClassReviewDetail(c.getCrNo()); // 리뷰 디테일 정보
		
		int listCount = cService.selectReplyListCount(c.getCrNo()); // 조회할 댓글 갯수
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, 5, 4);
		ArrayList<Reply> replyList = cService.selectReplyList(c.getCrNo(), pi); // 조회할 댓글 리스트
		
		if(session.getAttribute("loginUser") != null) {
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
			c.setMemNo(memNo + "");
			int ckResult = cService.checkRecommend(c);
			if(ckResult > 0) {
				model.addAttribute("recoCk", "Y");
			} else {
				model.addAttribute("recoCk", "N");
			}
		}
				
		model.addAttribute("cr", cr);
		model.addAttribute("pi", pi);
		model.addAttribute("reviewClNo", c.getClNo());
		model.addAttribute("returnPage", rpage);
		model.addAttribute("replyList", replyList);
		return "class/classReviewDetail";
	}
	
	@RequestMapping(value="enrollClassReviewReply.me")
	public String insertClassReviewReply(Reply r, int clNo, int returnPage, HttpSession session) {
		
		int result = cService.insertClassReviewReply(r);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "댓글이 등록되었습니다!");
		} else {
			session.setAttribute("alertMsg", "댓글 등록에 실패하였습니다.");
		}
		
		return "redirect:classReviewDetail.me?crNo=" + r.getContentNo() + "&cpage=1&clNo=" + clNo + "&rpage=" + returnPage;
	}
	
	@RequestMapping(value="recommendClass.me")
	public String recommendClass(String grade, ClassReview cr, int returnPage, HttpSession session) {
		
		if(grade.equals("S")) {
			
			int result1 = cService.checkRecommend(cr);
			if(result1 > 0) {
				// 추천 한 적 있음
				int result2 = cService.deleteRecommend(cr);
				if(result2 > 0) {
					session.setAttribute("alertMsg", "해당 리뷰 추천을 제거하였습니다.");
				} else {
					session.setAttribute("alertMsg", "리뷰 추천 제거에 실패하였습니다.");
				}
			} else {
				// 추천 한 적 없음
				int result2 = cService.insertRecommend(cr);
				if(result2 > 0) {
					session.setAttribute("alertMsg", "해당 리뷰를 추천하였습니다!");
				} else {
					session.setAttribute("alertMsg", "리뷰 추천에 실패하였습니다.");
				}
			}
		} else {
			session.setAttribute("alertMsg", "학생 회원만 가능한 서비스입니다.");
		}
		
		return "redirect:classReviewDetail.me?crNo=" + cr.getCrNo() + "&cpage=1&clNo=" + cr.getClNo() + "&rpage=" + returnPage; 
	}
	
	@RequestMapping(value="deleteReply.me")
	public String deleteReply(int replyNo, int crNo, int clNo, int returnPage, HttpSession session) {
		int result = cService.deleteReply(replyNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "댓글을 삭제하였습니다.");
		} else {
			session.setAttribute("alertMsg", "댓글 삭제에 실패하였습니다.");
		}
		return "redirect:classReviewDetail.me?crNo=" + crNo + "&cpage=1&clNo=" + clNo + "&rpage=" + returnPage;
	}
	
	@RequestMapping(value="updateClassReviewReply")
	public String updateReply(Reply r, int clNo, int returnPage, HttpSession session) {
		int result = cService.updateReply(r);
		if(result > 0) {
			session.setAttribute("alertMsg", "댓글을 수정하였습니다.");
		} else {
			session.setAttribute("alertMsg", "댓글 수정에 실패하였습니다.");
		}
		return "redirect:classReviewDetail.me?crNo=" + r.getContentNo() + "&cpage=1&clNo=" + clNo + "&rpage=" + returnPage;
	}
	
	@ResponseBody
	@RequestMapping(value="enrollClassReviewCheck.me")
	public String ajaxEnrollReviewCheck(ClassOrder co) {
		int result = cService.enrollReviewCheck(co);
		if(result > 0) {
			return "yyyyy";
		} else {
			return "nnnnn";
		}
	}
	
	@RequestMapping(value="enrollClassReview.me")
	public String enrollClassReview(MultipartFile upfile, ClassReview cr, HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			String originName = upfile.getOriginalFilename();
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/creview/");
			try {
				upfile.transferTo(new File(savePath + originName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			cr.setFilePath("resources/uploadFiles/creview/" + originName);
		}
		
		int result = cService.insertClassReview(cr);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 후기가 등록되었습니다!");
		} else {
			session.setAttribute("alertMsg", "후기 등록에 실패하였습니다.");
		}
		
		return "redirect:classDetail.me?referNo=" + cr.getClNo();
	}
	
	@RequestMapping(value="deleteClassReview.me")
	public String deleteReview(int crNo, int clNo, int rpage, HttpSession session) {
		int result = cService.deleteReview(crNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "후기가 삭제되었습니다.");
			return "redirect:classReviewList.me?cpage=1&clNo=" + clNo;
		} else {
			session.setAttribute("alertMsg", "후기 삭제에 실패하였습니다.");
			return "redirect:classReviewDetail.me?crNo=" + crNo + "&cpage=1&clNo=" + clNo + "&rpage=" + rpage;
		}
	}
	
	@RequestMapping("updateClassReview.me")
	public String updateReview(MultipartFile upfile, ClassReview cr, int rpage, String changeCk, HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			// 변경or추가
			String originName = upfile.getOriginalFilename();
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/creview/");
			try {
				upfile.transferTo(new File(savePath + originName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			cr.setFilePath("resources/uploadFiles/creview/" + originName);
			cr.setFilePathMessage("uuuuu");
		} else {
			// 첨부파일 삭제된건지, 원래 그대로 저장 된건지 확인
			if(changeCk.equals("change")) {
				// 삭제
				cr.setFilePathMessage("ddddd");
			}
		}
		// 내용이랑 별점은 무조건 변경, 파일은 동적 sql로 처리
		int result = cService.updateReview(cr);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 후기를 수정하였습니다!");
		} else {
			session.setAttribute("alertMsg", "후기 수정에 실패하였습니다.");
		}
		
		return "redirect:classReviewDetail.me?crNo=" + cr.getCrNo() + "&cpage=1&clNo=" + cr.getClNo() + "&rpage=" + rpage;
	}
	
	@RequestMapping(value="enrollClassQna.me")
	public String enrollClassQna(MultipartFile upfile, ClassQna cq, HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			String originName = upfile.getOriginalFilename();
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/cqna/");
			try {
				upfile.transferTo(new File(savePath + originName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			cq.setFilePath("resources/uploadFiles/cqna/" + originName);
		}
		
		int result = cService.insertClassQna(cq);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 문의가 등록되었습니다!");
		} else {
			session.setAttribute("alertMsg", "문의 등록에 실패하였습니다.");
		}
		
		return "redirect:classDetail.me?referNo=" + cq.getReferNo();
	}

	@RequestMapping(value="deleteClassQna.me")
	public String deleteClassQna(ClassQna cq, HttpSession session) {
		int result = cService.deleteClassQna(cq);
		if(result > 0) {
			session.setAttribute("alertMsg", "문의가 삭제되었습니다.");
		} else {
			session.setAttribute("alertMsg", "문의 삭제에 실패하였습니다.");
		}
		return "redirect:classDetail.me?referNo=" + cq.getReferNo();
	}
	
	@RequestMapping(value="updateClassQna.me")
	public String updateClassQna(MultipartFile upfile, ClassQna cq, String changeCk, HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			// 변경or추가
			String originName = upfile.getOriginalFilename();
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/cqna/");
			try {
				upfile.transferTo(new File(savePath + originName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			cq.setFilePath("resources/uploadFiles/cqna/" + originName);
			cq.setFilePathMessage("uuuuu");
		} else {
			// 첨부파일 삭제된건지, 원래 그대로 저장 된건지 확인
			if(changeCk.equals("change")) {
				// 삭제
				cq.setFilePathMessage("ddddd");
			}
		}
		// 제목이랑 내용은 무조건 변경, 파일과 비밀번호는 동적 sql로 처리
		int result = cService.updateClassQna(cq);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 문의를 수정하였습니다!");
		} else {
			session.setAttribute("alertMsg", "문의 수정에 실패하였습니다.");
		}
		
		return "redirect:classDetail.me?referNo=" + cq.getReferNo();
	}
	
	@ResponseBody
	@RequestMapping(value="classQnaPwdCheck.me")
	public String classQnaPwdCheck(ClassQna cq) {
		int result = cService.classQnaPwdCheck(cq);
		if(result > 0) {
			// 비밀번호 일치
			return "yyyyy";
		} else {
			// 비밀번호 불일치
			return "nnnnn";
		}
	}
	
	@RequestMapping(value="classQnaList.me")
	public String classQnaList(int cpage, int referNo, Model model) {
		
		int listCount = cService.classQnaListCount(referNo); // 조회할 문의 갯수
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, 5, 3);
		ArrayList<ClassQna> cqList = cService.selectClassQnaListPaging(referNo, pi); // 클래스 문의 리스트 (페이징 처리)
		
		model.addAttribute("cqList", cqList);
		model.addAttribute("pi", pi);
		model.addAttribute("referNo", referNo);
		
		return "class/classQnaList";
	}
	
	@RequestMapping(value="deleteClassQnaList.me")
	public String deleteClassQnaList(ClassQna cq, int cpage, HttpSession session) {
		int result = cService.deleteClassQna(cq);
		if(result > 0) {
			session.setAttribute("alertMsg", "문의가 삭제되었습니다.");
		} else {
			session.setAttribute("alertMsg", "문의 삭제에 실패하였습니다.");
		}
		return "redirect:classQnaList.me?cpage=" + cpage + "&referNo=" + cq.getReferNo();
	}
	
	@RequestMapping(value="updateClassQnaList.me")
	public String updateClassQnaList(MultipartFile upfile, ClassQna cq, String changeCk, int cpage, HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			// 변경or추가
			String originName = upfile.getOriginalFilename();
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/cqna/");
			try {
				upfile.transferTo(new File(savePath + originName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			cq.setFilePath("resources/uploadFiles/cqna/" + originName);
			cq.setFilePathMessage("uuuuu");
		} else {
			// 첨부파일 삭제된건지, 원래 그대로 저장 된건지 확인
			if(changeCk.equals("change")) {
				// 삭제
				cq.setFilePathMessage("ddddd");
			}
		}
		// 제목이랑 내용은 무조건 변경, 파일과 비밀번호는 동적 sql로 처리
		int result = cService.updateClassQna(cq);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 문의를 수정하였습니다!");
		} else {
			session.setAttribute("alertMsg", "문의 수정에 실패하였습니다.");
		}
		
		return "redirect:classQnaList.me?cpage=" + cpage + "&referNo=" + cq.getReferNo();
	}
	
	@RequestMapping(value="classPay.me")
	public String classPay() {
		// 클래스 결제 페이지 이동용(뷰 확인용) 메소드
		return "class/classPay";
	}
	
	@RequestMapping(value="classPayComplate.me")
	public String classPayComplate() {
		// 클래스 결제 완료 페이지 이동용(뷰 확인용) 메소드
		return "class/classPayComplate";
	}
	
	@ResponseBody
	@RequestMapping(value="classHotList.me", produces="application/json; charset=UTF-8")
	public String ajaxClassHotList() {
		ArrayList<Class> cHotList = cService.classHotList();
		return new Gson().toJson(cHotList);
	}
	
	@ResponseBody
	@RequestMapping(value="classNewList.me", produces="application/json; charset=UTF-8")
	public String ajaxClassNewList() {
		ArrayList<Class> cNewList = cService.classNewList();
		return new Gson().toJson(cNewList);
	}
}
