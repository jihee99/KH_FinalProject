package com.kh.oceanclass.store.model.service;

import java.util.ArrayList;

import com.kh.oceanclass.store.model.vo.InProductOrder;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.StoreQna;
import com.kh.oceanclass.store.model.vo.StoreReview;

public interface AdminStoreService {
	
	ArrayList<InProductOrder> selectInProductOrderList();
	
	ArrayList<StoreReview> selectStoreReviewList();
	
	ArrayList<StoreQna> selectStoreQnaList();
	
	ArrayList<Product> selectProductList();
	
}
