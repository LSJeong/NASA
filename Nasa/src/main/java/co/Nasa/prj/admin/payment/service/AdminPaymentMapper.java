package co.Nasa.prj.admin.payment.service;

import java.util.List;

import co.Nasa.prj.admin.service.AdminAuthorVO;
import co.Nasa.prj.admin.service.Criteria;
import co.Nasa.prj.comm.VO.PaymentVO;

public interface AdminPaymentMapper {

	  //구매자 목록
	
		List<PaymentVO> getBuyerPaymentListWithPaging(Criteria cri);
		public int getBuyerPaymentTotal(Criteria cri);
		public AdminAuthorVO detailBuyerPayment(String code);
		
		//판매자 목록
		List<AdminAuthorVO> getSellerPaymentListWithPaging(Criteria cri);
		public int getSellerPaymentTotal(Criteria cri);
		public AdminAuthorVO detailSellerPayment(String code);
}
