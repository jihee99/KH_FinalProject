package com.kh.oceanclass.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.member.model.vo.Coupon;
import com.kh.oceanclass.member.model.vo.MemCoupon;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Report;
import com.kh.oceanclass.store.model.vo.StoreBuyList;
import com.kh.oceanclass.store.model.vo.StoreOrder;
import com.kh.oceanclass.store.model.vo.StoreRefund;

@Repository
public class AdminMemDao {

	public Member loginAdmin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("adMemMapper.loginAdmin", m);
	}

	public int selectMemCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adMemMapper.selectMemCount");
	}

	public ArrayList<Member> selectMemList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adMemMapper.selectMemList", null, rowBounds);
	}

	public int selectSMemCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adMemMapper.selectSMemCount");
	}

	public ArrayList<Member> selectSMemList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("adMemMapper.selectSMemList", null, rowBounds);
	}

	public int selectTMemCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adMemMapper.selectTMemCount");
	}

	public ArrayList<Member> selectTMemList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("adMemMapper.selectTMemList", null, rowBounds);
	}

	public int selectCouponCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adMemMapper.selectCouponCount");
	}

	public ArrayList<Coupon> selectCouponList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adMemMapper.selectCouponList", null, rowBounds);
	}

	public int adminEnrollCoupon(SqlSessionTemplate sqlSession, Coupon c) {
		return sqlSession.insert("adMemMapper.enrollCoupon", c);
	}

	public int deleteCoupon(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.delete("adMemMapper.deleteCoupon", cno);
	}

	public Coupon selectCoupon(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.selectOne("adMemMapper.selectCoupon", cno);
	}

	public ArrayList<Member> selectAllMember(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adMemMapper.selectAllMember");
	}
	
	public int insertMemCoupon(SqlSessionTemplate sqlSession, MemCoupon memC) {
		return sqlSession.insert("adMemMapper.insertMemCoupon", memC);
	}

	public int updateCoupon(SqlSessionTemplate sqlSession, Coupon c) {
		return sqlSession.update("adMemMapper.updateCoupon", c);
	}

	/*클래스주문내역 조회 관련 메소드
	public int selectClassOrderCount(SqlSessionTemplate sqlSession) {
		return 0;
	}

	public ArrayList<Store??> selectClassOrderList(sqlSessionTemplate sqlSession, PageInfo pi){
		return "";
	}
	*/
	
	public int selectStoreOrderCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adMemMapper.selectStoreOrderCount");
	}

	public ArrayList<StoreOrder> selectStoreOrderList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adMemMapper.selectStoreOrderList", null, rowBounds);
	}

	public int deleteStoreOrder(SqlSessionTemplate sqlSession, String storeNo) {
		return sqlSession.delete("adMemMapper.deleteStoreOrder", storeNo);
	}

	public StoreOrder selectStoreOrder(SqlSessionTemplate sqlSession, String sOrderNo) {
		return sqlSession.selectOne("adMemMapper.selectStoreOrder", sOrderNo);
	}

	public ArrayList<StoreBuyList> selectBuyList(SqlSessionTemplate sqlSession, String sOrderNo) {
		return (ArrayList)sqlSession.selectList("adMemMapper.selectStoreBuyList", sOrderNo);
	}

	public int insertStoreRefund(SqlSessionTemplate sqlSession, StoreRefund refund) {
		return sqlSession.insert("adMemMapper.insertStoreRefund", refund);
	}

	public int updateStoreOrderCancle(SqlSessionTemplate sqlSession, StoreRefund refund) {
		return sqlSession.update("adMemMapper.updateStoreOrderCancle", refund);
	}

	public int updateorderStatus(SqlSessionTemplate sqlSession, StoreOrder order) {
		return sqlSession.update("adMemMapper.upadteOrderStatus", order);
	}

	public int selectReportCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adMemMapper.selectReportCount");
	}

	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("adMemMapper.selectReportList", null, rowBounds);
	}

	public Report selectReportDetail(SqlSessionTemplate sqlSession, Report rp) {
		if(rp.getRefCategory().equals("SR")) {
			return sqlSession.selectOne("adMemMapper.selectReportStoreReview", rp);
		} else if(rp.getRefCategory().equals("CR")) {
			return sqlSession.selectOne("adMemMapper.selectReportClassReview", rp);
		} else {
			return sqlSession.selectOne("adMemMapper.selectReportReply", rp);
		}
	}

	public int adminReportRollback(SqlSessionTemplate sqlSession, String reportNo) {
		return sqlSession.update("adMemMapper.adminReportRollback", reportNo);
	}

	public int adminReportDelete(SqlSessionTemplate sqlSession, String reportNo) {
		return sqlSession.update("adMemMapper.adminReportDelete", reportNo);
	}

	public int adminBlackListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adMemMapper.selectBlackListCount");
	}

	public ArrayList<Member> adminReportMemList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("adMemMapper.selectReportMemList", null, rowBounds);
	}

	public int blackMemBack(SqlSessionTemplate sqlSession, String mno) {
		return sqlSession.update("adMemMapper.updateBlackMemBack", mno);
	}

	public int blackMemOut(SqlSessionTemplate sqlSession, String mno) {
		return sqlSession.update("adMemMapper.updateBlackMemOut", mno);
	}
	
	
	
	


}
