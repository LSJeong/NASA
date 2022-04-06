package co.Nasa.prj.payment.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.comm.VO.PaymentVO;
import co.Nasa.prj.comm.VO.PaymonthVO;
import co.Nasa.prj.payment.service.PaymentMapper;
import co.Nasa.prj.payment.service.PaymentService;

@Repository("paymentDao")

public class PaymentServiceImpl implements PaymentService {
	@Autowired
	PaymentMapper map;

	@Override
	public List<PaymentVO> buyerPaymentList(PaymentVO vo) {
		return map.buyerPaymentList(vo);
	}

	@Override
	public List<PaymentVO> selectListChart() {
		return map.selectListChart();
	}

	@Override
	public List<Integer> selectpaymenttable(int month) {
		return map.selectpaymenttable(month);
	}

	@Override
	public List<Integer> countservice(int count) {
		// TODO Auto-generated method stub
		return map.countservice(count);
	}

	@Override
	public List<PaymentVO> selectListYearChart() {
		return map.selectListYearChart();
	}

	@Override
	public List<Integer> selectYearchart(int year) {
		return map.selectYearchart(year);
	}

	@Override
	public List<Integer> countYearChart(int count) {
		return map.countYearChart(count);
	}

	// 채팅 결제
	@Override
	public int insertchatpayment(PaymentVO vo) {
		return map.insertchatpayment(vo);
	}

	@Override
	public List<PaymentVO> selectPagingBuyerPaymentList(PaymentVO vo) {
		return map.selectPagingBuyerPaymentList(vo);
	}

	@Override
	public int countPagingBuyerPayment(PaymentVO vo) {
		return map.countPagingBuyerPayment(vo);
	}

	@Override
	public List<PaymentVO> monthSearch(PaymentVO vo) {
		return map.monthSearch(vo);
	}

	@Override
	public List<PaymentVO> sixmonthSearch(PaymentVO vo) {
		return map.sixmonthSearch(vo);
	}

	@Override
	public List<PaymentVO> yearSearch(PaymentVO vo) {
		return map.yearSearch(vo);
	}

	@Override
	public List<PaymentVO> selectdateSearch(PaymentVO vo) {
		return map.selectdateSearch(vo);
	}

	@Override
	public PaymonthVO sellerSalesData(HashMap<String, String> remap) {
		return map.sellerSalesData(remap);
	}

	@Override
	public PaymonthVO sellerCommData(HashMap<String, String> remap) {
		return map.sellerCommData(remap);
	}

	public int countMonthSearch(PaymentVO vo) {
		return map.countMonthSearch(vo);
	}

	@Override
	public int countSixmonthSearch(PaymentVO vo) {
		return map.countSixmonthSearch(vo);
	}

	@Override
	public int countYearSearch(PaymentVO vo) {
		return map.countYearSearch(vo);
	}

	@Override
	public int countSelectdateSearch(PaymentVO vo) {
		return map.countSelectdateSearch(vo);
	}

	@Override
	public List<PaymentVO> sellerPaymentList(PaymentVO vo) {
		return map.sellerPaymentList(vo);
	}

	@Override
	public int updateChaypayment(PaymentVO vo) {
		// TODO Auto-generated method stub
		return map.updateChaypayment(vo);
	}

	@Override
	public List<PaymentVO> sellermonthSearch(PaymentVO vo) {
		return map.sellermonthSearch(vo);
	}

	@Override
	public List<PaymentVO> sellersixmonthSearch(PaymentVO vo) {
		return map.sellersixmonthSearch(vo);
	}

	@Override
	public List<PaymentVO> selleryearSearch(PaymentVO vo) {
		return map.selleryearSearch(vo);
	}

	@Override
	public List<PaymentVO> sellerselectdateSearch(PaymentVO vo) {
		return map.sellerselectdateSearch(vo);
	}

	@Override
	public int countPagingSellerPayment(PaymentVO vo) {
		return map.countPagingSellerPayment(vo);
	}

	@Override
	public int sellercountservice(HashMap<String, String> hmap) {
		return map.sellercountservice(hmap);
	}

	@Override
	public PaymonthVO sellerTotalservice(HashMap<String, String> totalmap) {
		return map.sellerTotalservice(totalmap);
	}

	@Override
	public List<PaymentVO> sellerPaymentListN(PaymentVO vo) {
		return map.sellerPaymentListN(vo);
	}

	@Override
	public int countPagingSellerPaymentN(PaymentVO vo) {
		return map.countPagingSellerPaymentN(vo);
	}

	@Override
	public int countsellermonthSearch(PaymentVO vo) {
		return map.countsellermonthSearch(vo);
	}

	@Override
	public int countsellersixmonthSearch(PaymentVO vo) {
		return map.countsellersixmonthSearch(vo);
	}

	@Override
	public int countselleryearSearch(PaymentVO vo) {
		return map.countselleryearSearch(vo);
	}

	@Override
	public int countsellerselectdateSearch(PaymentVO vo) {
		return map.countsellerselectdateSearch(vo);
	}

	@Override
	public List<PaymentVO> CalendarList(String id) {
		return map.CalendarList(id);
	}

	@Override

	public int purchaseconfirm() {
		return map.purchaseconfirm();
  }

  	@Override
	public List<PaymentVO> sellerPaymentDList(PaymentVO vo) {
		return map.sellerPaymentDList(vo);
	}

	@Override
	public List<PaymentVO> endPaymentList(PaymentVO vo) {
		return map.endPaymentList(vo);
	}

	@Override
	public int paycomplete(PaymentVO vo) {
		return map.paycomplete(vo);
  }
  
 	@Override
	public PaymentVO selectBuyerCalendar(PaymentVO vo) {
		return map.selectBuyerCalendar(vo);


	}

	@Override
	public PaymonthVO sellerTotalservice2(HashMap<String, String> totalmap) {
		return map.sellerTotalservice2(totalmap);
	}

	@Override
	public PaymentVO selectSellerCalendar(PaymentVO vo) {
		return map.selectSellerCalendar(vo);
	}

	@Override
	public List<PaymentVO> CalendarListS(String id) {
		return map.CalendarListS(id);
	}

	@Override
	public int countReviewPayment(PaymentVO vo) {
		return map.countReviewPayment(vo);
	}

}
