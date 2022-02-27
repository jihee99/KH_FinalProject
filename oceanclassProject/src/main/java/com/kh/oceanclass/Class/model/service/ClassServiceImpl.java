package com.kh.oceanclass.Class.model.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.kh.oceanclass.Class.model.dao.ClassDao;
import com.kh.oceanclass.Class.model.vo.ClassOrder;
import com.kh.oceanclass.Class.model.vo.ClassQna;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.Class.model.vo.KakaoPayApprovalVO;
import com.kh.oceanclass.Class.model.vo.KakaoPayReadyVO;
import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.model.vo.Reply;
import com.kh.oceanclass.event.model.vo.Event;
import com.kh.oceanclass.member.model.vo.MemCoupon;
import com.kh.oceanclass.member.model.vo.Report;

@Service
public class ClassServiceImpl implements ClassService {

	@Autowired
	private ClassDao cDao;
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	
    private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    
	@Override
	public int increaseCount(int clNo) {
		return cDao.increaseCount(sqlSession, clNo);
	}

	@Override
	public ClassVo selectClass(int clNo) {
		return cDao.selectClass(sqlSession, clNo);
	}
	
	@Override
	public int classSearchListCount(HashMap<String, String> map) {
		return cDao.classSearchListCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<ClassVo> classSearchList(HashMap<String, String> map, PageInfo pi) {
		return cDao.classSearchList(sqlSession, map, pi);
	}

	@Override
	public int checkClassLike(LikeVo li) {
		return cDao.checkClassLike(sqlSession, li);
	}
	
	@Override
	public int insertClassLike(LikeVo li) {
		return cDao.insertClassLike(sqlSession, li);
	}

	@Override
	public int deleteClassLike(LikeVo li) {
		return cDao.deleteClassLike(sqlSession, li);
	}

	@Override
	public ArrayList<ClassReview> selectClassReviewList(int clNo) {
		return cDao.selectClassReviewList(sqlSession, clNo);
	}

	@Override
	public ArrayList<ClassReview> selectClassReviewTopList(int clNo) {
		return cDao.selectClassReviewTopList(sqlSession, clNo);
	}

	@Override
	public ArrayList<ClassReview> selectClassReviewMainList(int clNo) {
		return cDao.selectClassReviewMainList(sqlSession, clNo);
	}

	@Override
	public int classReviewListCount(int clNo) {
		return cDao.classReviewListCount(sqlSession, clNo);
	}

	@Override
	public ArrayList<ClassReview> selectClassReviewListPaging(int clNo, PageInfo pi) {
		return cDao.selectClassReviewListPaging(sqlSession, clNo, pi);
	}

	@Override
	public ClassReview selectClassReviewDetail(int crNo) {
		return cDao.selectClassReviewDetail(sqlSession, crNo);
	}

	@Override
	public int selectReplyListCount(int crNo) {
		return cDao.selectReplyListCount(sqlSession, crNo);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int crNo, PageInfo pi) {
		return cDao.selectReplyList(sqlSession, crNo, pi);
	}

	@Override
	public int insertClassReviewReply(Reply r) {
		return cDao.insertClassReviewReply(sqlSession, r);
	}

	@Override
	public int checkRecommend(ClassReview cr) {
		return cDao.checkRecommend(sqlSession, cr);
	}

	@Override
	public int deleteRecommend(ClassReview cr) {
		return cDao.deleteRecommend(sqlSession, cr);
	}

	@Override
	public int insertRecommend(ClassReview cr) {
		return cDao.insertRecommend(sqlSession, cr);
	}

	@Override
	public int deleteReply(int replyNo) {
		return cDao.deleteReply(sqlSession, replyNo);
	}

	@Override
	public int updateReply(Reply r) {
		return cDao.updateReply(sqlSession, r);
	}

	@Override
	public int enrollReviewCheck(ClassOrder co) {
		return cDao.enrollReviewCheck(sqlSession, co);
	}

	@Override
	public int insertClassReview(ClassReview cr) {
		return cDao.insertClassReview(sqlSession, cr);
	}

	@Override
	public int deleteReview(int crNo) {
		return cDao.deleteReview(sqlSession, crNo);
	}

	@Override
	public int updateReview(ClassReview cr) {
		return cDao.updateReview(sqlSession, cr);
	}

	@Override
	public ArrayList<ClassQna> selectClassQnaList(int clNo) {
		return cDao.selectClassQnaList(sqlSession, clNo);
	}

	@Override
	public ArrayList<ClassQna> selectClassQnaMainList(int clNo) {
		return cDao.selectClassQnaMainList(sqlSession, clNo);
	}

	@Override
	public int insertClassQna(ClassQna cq) {
		return cDao.insertClassQna(sqlSession, cq);
	}
	
	@Override
	public int deleteClassQna(ClassQna cq) {
		return cDao.deleteClassQna(sqlSession, cq);
	}
	
	@Override
	public int updateClassQna(ClassQna cq) {
		return cDao.updateClassQna(sqlSession, cq);
	}

	@Override
	public int classQnaPwdCheck(ClassQna cq) {
		return cDao.classQnaPwdCheck(sqlSession, cq);
	}

	@Override
	public int classQnaListCount(int referNo) {
		return cDao.classQnaListCount(sqlSession, referNo);
	}

	@Override
	public ArrayList<ClassQna> selectClassQnaListPaging(int referNo, PageInfo pi) {
		return cDao.selectClassQnaListPaging(sqlSession, referNo, pi);
	}

	@Override
	public ArrayList<ClassVo> classHotList() {
		return cDao.classHotList(sqlSession);
	}
	
	@Override
	public ArrayList<ClassVo> classNewList() {
		return cDao.classNewList(sqlSession);
	}
	
	@Override
	public int classCategoryListCount(String category) {
		return cDao.classCategoryListCount(sqlSession, category);
	}

	@Override
	public ArrayList<ClassVo> classCategoryList(HashMap<String, String> map, PageInfo pi) {
		return cDao.classCategoryList(sqlSession, map, pi);
	}
	
	@Override
	public ArrayList<Event> mainSlideList() {
		return cDao.mainSlideList(sqlSession);
	}

	@Override
	public int classPayCk(ClassOrder co) {
		return cDao.classPayCk(sqlSession, co);
	}
	
	@Override
	public ArrayList<MemCoupon> memberCouponList(int memNo) {
		return cDao.memberCouponList(sqlSession, memNo);
	}

	@Override
	public MemCoupon useCouponData(int useCouponNo) {
		return cDao.useCouponData(sqlSession, useCouponNo);
	}

	@Override
	public int insertClassOrder(ClassOrder co) {
		return cDao.insertClassOrder(sqlSession, co);
	}

	@Override
	public ClassOrder selectClassOrder(ClassOrder co) {
		return cDao.selectClassOrder(sqlSession, co);
	}

	@Override
	public int insertUsePoint(ClassOrder coInfo) {
		return cDao.insertUsePoint(sqlSession, coInfo);
	}

	@Override
	public int deleteCoupon(ClassOrder coInfo) {
		return cDao.deleteCoupon(sqlSession, coInfo);
	}

	@Override
	public int downMemberPoint(ClassOrder coInfo) {
		return cDao.downMemberPoint(sqlSession, coInfo);
	}

	@Override
	public int insertSavingPoint(ClassOrder coInfo) {
		return cDao.insertSavingPoint(sqlSession, coInfo);
	}

	@Override
	public int upMemberPoint(ClassOrder coInfo) {
		return cDao.upMemberPoint(sqlSession, coInfo);
	}

	@Override
	public ClassReview selectReview(String refBNo) {
		return cDao.selectReview(sqlSession, refBNo);
	}

	@Override
	public int reportReview(Report rp) {
		return cDao.reportReview(sqlSession, rp);
	}

	@Override
	public Reply selectReply(String refBNo) {
		return cDao.selectReply(sqlSession, refBNo);
	}

	@Override
	public int reportReviewReply(Report rp) {
		return cDao.reportReviewReply(sqlSession, rp);
	}

	@Override
	public ClassQna selectQna(String refBNo) {
		return cDao.selectQna(sqlSession, refBNo);
	}

	@Override
	public int reportQna(Report rp) {
		return cDao.reportQna(sqlSession, rp);
	}

	@Override
	public String kakaoPayReady(ClassOrder co) {
		
		ClassVo c = cDao.selectClass(sqlSession, co.getClNo());	// 클래스 정보
		
		RestTemplate restTemplate = new RestTemplate();
		 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "def46eafe7d8c2602c7f3ccf9c5cc074");
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "sumin");
        params.add("item_name", c.getClName());
        params.add("quantity", "1");
        params.add("total_amount", co.getAmount() + ""); //co.getAmount() + ""
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:8008/oceanclass/classPayComplete.me?amount=" + co.getAmount() + "&clNo=" + co.getClNo() + "&memNo=" + co.getMemNo());
        params.add("cancel_url", "http://localhost:8008/oceanclass/classPayCancel.me");
        params.add("fail_url", "http://localhost:8008/oceanclass/classPayFail.me");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            //System.out.println(kakaoPayReadyVO.toString());
            
            insertClassOrder(co);						// 주문 내역 insert
            ClassOrder coInfo = selectClassOrder(co);	// 클래스 주문 정보
            if(coInfo.getPointUse() != null) {
    			insertUsePoint(coInfo);					// 포인트 차감 (포인트 테이블에 차감 데이터 insert)
    			downMemberPoint(coInfo);				// 포인트 차감 (멤버 데이터 update)
    		}
            if(coInfo.getPcNo() != null) {
    			deleteCoupon(coInfo);					// 쿠폰 사용처리
    		}
    		if(co.getAmount() > 0) {
    			insertSavingPoint(coInfo);				// 포인트 적립 (포인트 테이블에 적립 데이터 insert)
    			upMemberPoint(coInfo);					// 포인트 적립 (멤버 데이터 update)
    		}
    		
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/classPayIng.me";
	}
	
	 public KakaoPayApprovalVO kakaoPayInfo(String pg_token, int amount) {
	        
	        RestTemplate restTemplate = new RestTemplate();
	        System.out.println(pg_token);
	        
	        // 서버로 요청할 Header
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + "def46eafe7d8c2602c7f3ccf9c5cc074");
	        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	 
	        // 서버로 요청할 Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        params.add("cid", "TC0ONETIME");
	        params.add("tid", kakaoPayReadyVO.getTid());
	        params.add("partner_order_id", "1001");
	        params.add("partner_user_id", "sumin");
	        params.add("pg_token", pg_token);
	        params.add("total_amount", amount + "");
	        
	        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	        
	        try {
	            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
	          
	            return kakaoPayApprovalVO;
	        
	        } catch (RestClientException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        
	        return null;
	    }
}
