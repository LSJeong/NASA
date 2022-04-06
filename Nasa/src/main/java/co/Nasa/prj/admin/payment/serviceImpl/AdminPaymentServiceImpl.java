package co.Nasa.prj.admin.payment.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.admin.payment.service.AdminPaymentMapper;
import co.Nasa.prj.admin.payment.service.AdminPaymentService;
import co.Nasa.prj.admin.service.AdminAuthorVO;
import co.Nasa.prj.admin.service.Criteria;
import co.Nasa.prj.comm.VO.PaymentVO;

@Repository("adminPaymentDao")
public class AdminPaymentServiceImpl implements AdminPaymentService{
	@Autowired
	AdminPaymentMapper map;

	@Override
	public List<PaymentVO> getBuyerPaymentListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return map.getBuyerPaymentListWithPaging(cri);
	}

	@Override
	public int getBuyerPaymentTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return map.getBuyerPaymentTotal(cri);
	}

	@Override
	public AdminAuthorVO detailBuyerPayment(String code) {
		// TODO Auto-generated method stub
		return map.detailBuyerPayment(code);
	}

	@Override
	public List<AdminAuthorVO> getSellerPaymentListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return map.getSellerPaymentListWithPaging(cri);
	}

	@Override
	public int getSellerPaymentTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return map.getSellerPaymentTotal(cri);
	}

	@Override
	public AdminAuthorVO detailSellerPayment(String code) {
		// TODO Auto-generated method stub
		return map.detailSellerPayment(code);
	}

}
