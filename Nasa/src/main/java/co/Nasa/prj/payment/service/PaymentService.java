package co.Nasa.prj.payment.service;

import java.util.HashMap;
import java.util.List;

import co.Nasa.prj.comm.VO.PaymentVO;
import co.Nasa.prj.comm.VO.PaymonthVO;

public interface PaymentService {
   // 구매자 개인 구매내역 조회
   public List<PaymentVO> buyerPaymentList(PaymentVO vo);
   public List<PaymentVO> sellerPaymentDList(PaymentVO vo);
   public List<PaymentVO> endPaymentList(PaymentVO vo);
   public int paycomplete(PaymentVO vo);
   
   // 구매자 paging lisg select
   public List<PaymentVO> selectPagingBuyerPaymentList(PaymentVO vo);
   
   // total count
   public int countPagingBuyerPayment(PaymentVO vo);
   
   //1개월, 6개월, 1년, 기간 검색
   public List<PaymentVO> monthSearch(PaymentVO vo);
   public List<PaymentVO> sixmonthSearch(PaymentVO vo);
   public List<PaymentVO> yearSearch(PaymentVO vo);
   public List<PaymentVO> selectdateSearch(PaymentVO vo);
   
   //카운트
   public int countMonthSearch(PaymentVO vo);
   public int countSixmonthSearch(PaymentVO vo);
   public int countYearSearch(PaymentVO vo);
   public int countSelectdateSearch(PaymentVO vo);
   
   //차트 목록
   List<PaymentVO> selectListChart();
   
   //테이블 목록
   List<Integer> selectpaymenttable(int month);
   
   //차트 누적 판매 수량
   List<Integer> countservice(int count);
   
   //연도별 차트 조회
   List<PaymentVO> selectListYearChart();
   
   //연도별 누적 판매금액,  수수료
   List<Integer> selectYearchart(int year);
   //연도별 누적 판매 수량
   List<Integer> countYearChart(int count);
   
   //채팅 결제 등록
   int insertchatpayment(PaymentVO vo);
	
   //판매자 판매금액
   PaymonthVO sellerSalesData(HashMap<String, String> remap);
   //판매자 수수료
   PaymonthVO sellerCommData(HashMap<String, String> remap);
   
   //쿠폰 사용시 BUYER COUPON 0 UPDATE
   int updateChaypayment(PaymentVO vo);
   
   //판매자 결제조회
   List<PaymentVO> sellerPaymentList(PaymentVO vo);
   
   List<PaymentVO> sellerPaymentListN(PaymentVO vo);
   public int countPagingSellerPaymentN(PaymentVO vo);
   
   int sellercountservice(HashMap<String, String> hmap);
   PaymonthVO sellerTotalservice(HashMap<String, String> totalmap);
   PaymonthVO sellerTotalservice2(HashMap<String, String> totalmap);
   
   
   public int countPagingSellerPayment(PaymentVO vo);
   public List<PaymentVO> sellermonthSearch(PaymentVO vo);
   public List<PaymentVO> sellersixmonthSearch(PaymentVO vo);
   public List<PaymentVO> selleryearSearch(PaymentVO vo);
   public List<PaymentVO> sellerselectdateSearch(PaymentVO vo);
   
   public int countsellermonthSearch(PaymentVO vo);
   public int countsellersixmonthSearch(PaymentVO vo);
   public int countselleryearSearch(PaymentVO vo);
   public int countsellerselectdateSearch(PaymentVO vo);
   
   List<PaymentVO> CalendarList(String id);
   List<PaymentVO> CalendarListS(String id);
   
   int purchaseconfirm();

   PaymentVO selectBuyerCalendar(PaymentVO vo);
   PaymentVO selectSellerCalendar(PaymentVO vo);
   
   public int countReviewPayment(PaymentVO vo);
}
