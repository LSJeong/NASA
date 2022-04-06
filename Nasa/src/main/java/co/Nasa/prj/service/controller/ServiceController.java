package co.Nasa.prj.service.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.Nasa.prj.category.service.CategoryService;
import co.Nasa.prj.comm.VO.CategoryVO;
import co.Nasa.prj.comm.VO.PagingDTO;
import co.Nasa.prj.comm.VO.PowerServiceVO;
import co.Nasa.prj.comm.VO.PromotionVO;
import co.Nasa.prj.comm.VO.ReviewVO;
import co.Nasa.prj.comm.VO.ServiceVO;
import co.Nasa.prj.comm.VO.SubCategoryVO;
import co.Nasa.prj.comm.VO.WishlistVO;
import co.Nasa.prj.powerservice.service.PowerServiceService;
import co.Nasa.prj.promotion.service.PromotionService;
import co.Nasa.prj.review.service.ReviewMapper;
import co.Nasa.prj.seller.service.SellerService;
import co.Nasa.prj.service.service.ServiceService;
import co.Nasa.prj.sub_category.service.Sub_CategoryService;
import co.Nasa.prj.wishlist.service.WishlistMapper;

@Controller
public class ServiceController {
	@Autowired
	private ServiceService serviceDao;
	@Autowired
	private SellerService sellerDAO;
	@Autowired
	private CategoryService categoryDao;
	@Autowired
	private Sub_CategoryService subCategoryDao;
	@Autowired
	private ReviewMapper reviewDao;
	@Autowired
	private PromotionService promotionDao;
	@Autowired
	private PowerServiceService powerDao;
	@Autowired
	private WishlistMapper wishlistDao;
	
	@Value("#{upload['fileServ']}")
	private String upload;
	@Value("#{upload['loServupload']}")
	private String loupload;
	
	// 카테고리 별 서비스 목록
	@RequestMapping("/homeCategory.do")
	public String homeCategory(Model model, ServiceVO vo, PagingDTO pagingdto) {
		pagingdto.setAmount(6);
		vo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());	
		pagingdto.setTotal(serviceDao.homeCategorySelectCount(vo));
		model.addAttribute("paging",pagingdto);
		model.addAttribute("homecatelist", serviceDao.homeCategorySelect(vo));
		return "user/homeCategory";
	}	

	@RequestMapping("/sellerService.do")
	public String sellerService(Model model, HttpSession session, PagingDTO pagingdto) {
		String s_email = (String) session.getAttribute("id");
		ServiceVO vo = new ServiceVO();
		vo.setS_email(s_email);
		
		//pagingdto.setAmount(6);
		vo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		List<ServiceVO> sellerMainServiceList = serviceDao.sellerMainServiceList(vo);
		
		pagingdto.setTotal(serviceDao.countPagingSellerService(vo));
		model.addAttribute("sellerMainServiceList", sellerMainServiceList);
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));
		
		
		return "seller/sellerService";
	}
	
	@RequestMapping("/sellerServiceU.do")
	public String sellerServiceU(Model model, HttpSession session, PagingDTO pagingdto) {
		String s_email = (String) session.getAttribute("id");
		ServiceVO vo = new ServiceVO();
		vo.setS_email(s_email);
		
		//pagingdto.setAmount(6);
		vo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		List<ServiceVO> sellerMainServiceList = serviceDao.sellerMainServiceListU(vo);
		
		pagingdto.setTotal(serviceDao.countPagingSellerServiceU(vo));
		model.addAttribute("sellerMainServiceList", sellerMainServiceList);
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));
		
		
		return "seller/sellerServiceU";
	}
	
	@RequestMapping("/sellerServiceY.do")
	public String sellerServiceY(Model model, HttpSession session, PagingDTO pagingdto) {
		String s_email = (String) session.getAttribute("id");
		ServiceVO vo = new ServiceVO();
		vo.setS_email(s_email);
		
		//pagingdto.setAmount(6);
		vo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		List<ServiceVO> sellerMainServiceList = serviceDao.sellerMainServiceListY(vo);
		
		pagingdto.setTotal(serviceDao.countPagingSellerServiceY(vo));
		model.addAttribute("sellerMainServiceList", sellerMainServiceList);
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));
		
		
		return "seller/sellerServiceY";
	}

	@ResponseBody
	@RequestMapping("/serviceInsertForm.do")
	public String fileUpload(ServiceVO vo, @RequestParam("file") MultipartFile file,
			@RequestParam("subfile") MultipartFile subfile, @RequestParam("subfile2") MultipartFile subfile2,
			@RequestParam("subfile3") MultipartFile subfile3, HttpSession session, HttpServletRequest request)
			throws UnsupportedEncodingException {

		vo.setS_email((String) session.getAttribute("id"));
		// vo.setS_email("lsj");
		System.out.println(file.getOriginalFilename());
		System.out.println(subfile.getOriginalFilename());
		System.out.println(subfile2.getOriginalFilename());
		System.out.println(subfile3.getOriginalFilename());

		String fileRoot;
		String strResult = "{ \"result\":\"FAIL\" }";
		
		
		// 메인
		try {
			// 파일이 있을때 탄다.
			if (file.getSize() > 0 && !file.getOriginalFilename().equals("")) {

//				fileRoot = "C:\\NASA\\NASA02\\Nasa\\src\\main\\webapp\\fileupload\\";
//				System.out.println(fileRoot);
//
//				String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
//				String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
//				String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
//
//				File targetFile = new File(fileRoot + savedFileName);
//				try {
//					InputStream fileStream = file.getInputStream();
//					FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
//					vo.setSer_img(savedFileName); // uuid
//					vo.setSer_imgorigin(originalFileName); // 원본
//
//				} catch (Exception e) {
//					// 파일삭제
//					FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
//					e.printStackTrace();
//				}
				
				//외부 업로드
				String saveurl = upload;				
				String originaFileName = file.getOriginalFilename();
				
				//내부업로드
				//String saveurl =loupload;
				
				String extension = originaFileName.substring(originaFileName.lastIndexOf(".")); // 파일 확장자
				String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
				
				String savepath =saveurl + savedFileName;
				System.out.println(savepath);
				
				String r_img = "/upload/service/" + savedFileName;
				//uuid
				vo.setSer_img(r_img);
				
				//원본파일명
				vo.setSer_imgorigin(originaFileName);
				
				
				try {
					file.transferTo(new File(savepath));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				strResult = "{ \"result\":\"OK\" }";
			}
			// 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을 등록하는경우)
			else
				strResult = "{ \"result\":\"OK\" }";
		} catch (Exception e) {
			e.printStackTrace();
			strResult = "{ \"result\":\"FAIL1\" }";
		}

		// 서브1
		try {
			// 파일이 있을때 탄다.
			if (subfile.getSize() > 0 && !subfile.getOriginalFilename().equals("")) {

//				fileRoot = "C:\\NASA\\NASA02\\Nasa\\src\\main\\webapp\\fileupload\\";
//				System.out.println(fileRoot);
//
//				String originalFileName = subfile.getOriginalFilename(); // 오리지날 파일명
//				String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
//				String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
//
//				File targetFile = new File(fileRoot + savedFileName);
//				try {
//					InputStream fileStream = subfile.getInputStream();
//					FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
//					vo.setSer_subimg(savedFileName); // uuid
//					vo.setSer_originsub(originalFileName); // 원본
//
//				} catch (Exception e) {
//					// 파일삭제
//					FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
//					e.printStackTrace();
//				}
				
				//외부 업로드
				String saveurl = upload;
				String originaFileName = subfile.getOriginalFilename();
				//내부업로드
				//String saveurl =loupload;
				
				String extension = originaFileName.substring(originaFileName.lastIndexOf(".")); // 파일 확장자
				String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
				
				String savepath =saveurl + savedFileName;
				System.out.println(savepath);
				
				String r_img = "/upload/service/" + savedFileName;
				//uuid
				vo.setSer_subimg(r_img);
				
				//원본파일명
				vo.setSer_originsub(originaFileName);
				
				
				try {
					subfile.transferTo(new File(savepath));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				
				strResult = "{ \"result\":\"OK\" }";
			}
			// 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을 등록하는경우)
			else
				strResult = "{ \"result\":\"OK\" }";
		} catch (Exception e) {
			e.printStackTrace();
			strResult = "{ \"result\":\"FAIL2\" }";
		}

		// 서브2
		try {
			// 파일이 있을때 탄다.
			if (subfile2.getSize() > 0 && !subfile2.getOriginalFilename().equals("")) {

//				fileRoot = "C:\\NASA\\NASA02\\Nasa\\src\\main\\webapp\\fileupload\\";
//				System.out.println(fileRoot);
//
//				String originalFileName = subfile2.getOriginalFilename(); // 오리지날 파일명
//				String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
//				String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
//
//				File targetFile = new File(fileRoot + savedFileName);
//				try {
//					InputStream fileStream = subfile2.getInputStream();
//					FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
//					vo.setSer_subimg2(savedFileName); // uuid
//					vo.setSer_originsub2(originalFileName); // 원본
//
//				} catch (Exception e) {
//					// 파일삭제
//					FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
//					e.printStackTrace();
//				}
				
				//외부 업로드
				String saveurl = upload;
				String originaFileName = subfile2.getOriginalFilename();
				//내부업로드
				//String saveurl =loupload;
				
				String extension = originaFileName.substring(originaFileName.lastIndexOf(".")); // 파일 확장자
				String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
				
				String savepath =saveurl + savedFileName;
				System.out.println(savepath);
				
				String r_img = "/upload/service/" + savedFileName;
				//uuid
				vo.setSer_subimg2(r_img);
				
				//원본파일명
				vo.setSer_originsub2(originaFileName);
				
				
				try {
					subfile2.transferTo(new File(savepath));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				strResult = "{ \"result\":\"OK\" }";
			}
			// 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을 등록하는경우)
			else
				strResult = "{ \"result\":\"OK\" }";
		} catch (Exception e) {
			e.printStackTrace();
			strResult = "{ \"result\":\"FAIL3\" }";
		}

		// 서브3
		try {
			// 파일이 있을때 탄다.
			if (subfile3.getSize() > 0 && !subfile3.getOriginalFilename().equals("")) {

//				fileRoot = "C:\\NASA\\NASA02\\Nasa\\src\\main\\webapp\\fileupload\\";
//				System.out.println(fileRoot);
//
//				String originalFileName = subfile3.getOriginalFilename(); // 오리지날 파일명
//				String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
//				String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
//
//				File targetFile = new File(fileRoot + savedFileName);
//				try {
//					InputStream fileStream = subfile3.getInputStream();
//					FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
//					vo.setSer_subimg3(savedFileName); // uuid
//					vo.setSer_originsub3(originalFileName); // 원본
//
//				} catch (Exception e) {
//					// 파일삭제
//					FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
//					e.printStackTrace();
//				}
				
				//외부 업로드
				String saveurl = upload;
				String originaFileName = subfile3.getOriginalFilename();
				//내부업로드
				//String saveurl =loupload;
				
				String extension = originaFileName.substring(originaFileName.lastIndexOf(".")); // 파일 확장자
				String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
				
				String savepath =saveurl + savedFileName;
				System.out.println(savepath);
				
				String r_img = "/upload/service/" + savedFileName;
				//uuid
				vo.setSer_subimg3(r_img);
				
				//원본파일명
				vo.setSer_originsub3(originaFileName);
				
				
				try {
					subfile3.transferTo(new File(savepath));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				strResult = "{ \"result\":\"OK\" }";
			}
			// 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을 등록하는경우)
			else
				strResult = "{ \"result\":\"OK\" }";
		} catch (Exception e) {
			e.printStackTrace();
			strResult = "{ \"result\":\"FAIL4\" }";
		}

		int n = serviceDao.serviceInsert(vo);
		if (n != 1) {
			strResult = "{ \"result\":\"FAIL5\" }";
		} else {
			strResult = "{ \"result\":\"OK\" }";
		}

		return strResult;
	}

	@RequestMapping("/serviceUpdateForm.do")
	public String serviceUpdateForm(Model model, @Param("ser_code") String ser_code, HttpSession session) {
		model.addAttribute("service", serviceDao.serviceSelect(ser_code));

		ServiceVO vo = new ServiceVO();
		vo.setSer_code(ser_code);
		vo.setS_email((String) session.getAttribute("id"));
		//model.addAttribute("endDate", serviceDao.serviceSelectMaxEnd(vo));
		System.out.println(serviceDao.serviceSelect(ser_code));
		return "seller/serviceUpdateForm";
	}

	@ResponseBody
	@RequestMapping("/serviceUpdate.do")
	public String serviceUpdate(ServiceVO vo, @RequestParam("file") MultipartFile file,
			@RequestParam("subfile") MultipartFile subfile, @RequestParam("subfile2") MultipartFile subfile2,
			@RequestParam("subfile3") MultipartFile subfile3, HttpSession session, HttpServletRequest request,
			@RequestParam("subfilex") String subfilex, @RequestParam("subfilex2") String subfilex2,
			@RequestParam("subfilex3") String subfilex3) throws UnsupportedEncodingException {

		System.out.println("serviceUpdate()");
		System.out.println(subfilex);
		System.out.println(subfilex2);
		System.out.println(subfilex3);
		System.out.println("vo는 빈값이여야만한다.");
		System.out.println(vo);

		vo.setS_email((String) session.getAttribute("id"));

		System.out.println("==============" + file.getOriginalFilename());
		System.out.println("==============" + vo.getSer_code());
		ServiceVO vo2 = new ServiceVO();
		vo2 = serviceDao.serviceSelect(vo.getSer_code());
		System.out.println("=================" + vo2);
		System.out.println("=================" + vo2.getSer_img());
		String saveurl = upload;
		// 메인이미지 새로 등록했을때
		if (file.getSize() > 0 && !file.getOriginalFilename().equals("")) {

			// fileRoot = "C:\\NASA\\NASA02\\Nasa\\src\\main\\webapp\\fileupload\\";
			//System.out.println(fileRoot);

			String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
			String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
			
			String savepath =saveurl + savedFileName;
			
			String r_img = "/upload/service/" + savedFileName;
			
			File targetFile = new File(r_img);
//			File targetFile2 = new File(vo2.getSer_img());
//			// 이미있는파일 삭제
//			if (targetFile2.exists()) {
//				targetFile2.delete();
//			}

			try {
				file.transferTo(new File(savepath));
				
				vo.setSer_img(r_img); // uuid
				vo.setSer_imgorigin(originalFileName); // 원본

			} catch (Exception e) {
				// 파일삭제
				FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
				e.printStackTrace();
			}
			
		}
		// 메인이미지 null일때
		else {
			// 기존이미지 유지
			vo.setSer_img(vo2.getSer_img());
			vo.setSer_imgorigin(vo2.getSer_imgorigin());
		}

		// 서브1
		if (subfile.getSize() > 0 && !subfile.getOriginalFilename().equals("")) {

			// fileRoot = "C:\\NASA\\NASA02\\Nasa\\src\\main\\webapp\\fileupload\\";
			//System.out.println(fileRoot);

			String originalFileName = subfile.getOriginalFilename(); // 오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
			String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
			
			String savepath =saveurl + savedFileName;
			
			String r_img = "/upload/service/" + savedFileName;
			
			File targetFile = new File(r_img);
			
			try {
				subfile.transferTo(new File(savepath));
				
				vo.setSer_subimg(r_img); // uuid
				vo.setSer_originsub(originalFileName); // 원본

			} catch (Exception e) {
				// 파일삭제
				FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
				e.printStackTrace();
			}
		} else {
			// 기존이미지 유지
			if (!subfilex.equals("")) {
				vo.setSer_subimg(vo2.getSer_subimg());
				vo.setSer_originsub(vo2.getSer_originsub());
			} else {
				vo.setSer_subimg(null);
				vo.setSer_originsub(null);
				
			}
		}

		// 서브2
		if (subfile2.getSize() > 0 && !subfile2.getOriginalFilename().equals("")) {

			String originalFileName = subfile2.getOriginalFilename(); // 오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
			String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
			
			String savepath =saveurl + savedFileName;
			
			String r_img = "/upload/service/" + savedFileName;
			
			File targetFile = new File(r_img);

			try {
				subfile2.transferTo(new File(savepath));
				
				vo.setSer_subimg2(r_img); // uuid
				vo.setSer_originsub2(originalFileName); // 원본

			} catch (Exception e) {
				// 파일삭제
				FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
				e.printStackTrace();
			}
		}

		else {
			// 기존이미지 유지
			if (!subfilex.equals("")) {
				vo.setSer_subimg2(vo2.getSer_subimg2());
				vo.setSer_originsub2(vo2.getSer_originsub2());
			} else {
				vo.setSer_subimg2(null);
				vo.setSer_originsub2(null);
				
			}
		}

		// 서브3
		if (subfile3.getSize() > 0 && !subfile3.getOriginalFilename().equals("")) {

			String originalFileName = subfile3.getOriginalFilename(); // 오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
			String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
			
			String savepath =saveurl + savedFileName;
			System.out.println(savepath);
			
			String r_img = "/upload/service/" + savedFileName;
			
			File targetFile = new File(r_img);
			
			try {
				subfile3.transferTo(new File(savepath));
				
				vo.setSer_subimg3(r_img); // uuid
				vo.setSer_originsub3(originalFileName); // 원본

			} catch (Exception e) {
				// 파일삭제
				FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
				e.printStackTrace();
			}
		}

		else {
			// 기존이미지 유지
			if (!subfilex.equals("")) {
				vo.setSer_subimg3(vo2.getSer_subimg3());
				vo.setSer_originsub3(vo2.getSer_originsub3());
			} else {
				vo.setSer_subimg3(null);
				vo.setSer_originsub3(null);
				
			}
		}

		System.out.println("최종vo값");
		System.out.println(vo);

		int n = serviceDao.serviceUpdate(vo);
		if (n != 1) {
			return "FAIL";
		}
		return "OK";
	}

	@RequestMapping("/serviceDetail.do")
	public String sellerDetail(Model model, @RequestParam("ser_code") String ser_code, HttpSession session,
			HttpServletResponse response, HttpServletRequest request, PagingDTO pagingdto, String pagestatus) {
		ServiceVO vo = new ServiceVO();
		CategoryVO catevo = new CategoryVO();
		vo = serviceDao.serviceSelect(ser_code);
		System.out.println("++++++++++++" + vo);
		model.addAttribute("detailS", serviceDao.serviceSelect(ser_code));

		catevo.setCat_no(vo.getSer_cate());
		model.addAttribute("cate", categoryDao.selectCategory(catevo));

		SubCategoryVO subcatevo = new SubCategoryVO();
		subcatevo.setSub_no(vo.getSer_sub_cate());
		model.addAttribute("subcate", subCategoryDao.selectSub_category(subcatevo));

		model.addAttribute("sellerInfo", sellerDAO.SellerSelect(vo.getS_email()));

		PromotionVO pvo = new PromotionVO();
		pvo.setPro_service(ser_code);
		model.addAttribute("goingPromo",promotionDao.goingSelectPromo(ser_code));
		
		ReviewVO reviewvo = new ReviewVO();
		reviewvo.setScode(ser_code);
		
		List<ReviewVO> reviews = reviewDao.selectReviewandReviewComment(reviewvo);
		int cntReviews = reviews.size();
		model.addAttribute("cntReviews", cntReviews);
		
		reviewvo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		List<ReviewVO> reviewList = reviewDao.pagingReviewandReviewComment(reviewvo);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!" + reviewList);
		model.addAttribute("reviewList", reviewList);
		pagingdto.setTotal(reviewDao.countReviewandReviewComment(reviewvo));
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));
		
		String w = "no";
		if("B".equals((String)session.getAttribute("author"))) {
			WishlistVO wishlistvo = new WishlistVO();
			wishlistvo.setB_id((String)session.getAttribute("id"));
			List<WishlistVO> wishlist = wishlistDao.selectBuyerWishlist(wishlistvo);
			for(int i = 0; i < wishlist.size(); i++) {
				if(wishlist.get(i).getS_id().equals(vo.getS_email())) {
					w = "exist";
				}
			}
		}
		model.addAttribute("wish", w);
		
		// 구매내역 비교
		
		
		if("r".equals(pagestatus)) {
			System.out.println("!!!!!!!!!@#!@#!@#!@#!@#!@#!@#!@#!@# : " + pagestatus);
			model.addAttribute("tabcode", pagestatus);
		}

		return "seller/serviceDetail";
	}

	@ResponseBody
	@RequestMapping("/endService.do")
	public String endService(@RequestParam("ser_code") String ser_code, @RequestParam("ser_reason") String ser_reason,
			@RequestParam("ser_end") String ser_end, HttpSession session) throws ParseException {
		ServiceVO vo = new ServiceVO();
		vo.setSer_code(ser_code);
		vo.setSer_reason(ser_reason);
		vo.setSer_end(ser_end);
		
		int n = serviceDao.endService(vo);
		
		if(n != 0) {
			PromotionVO pvo = new PromotionVO();
			pvo.setPro_service(ser_code);
			pvo.setS_email((String)session.getAttribute("id"));
			pvo.setPro_end(ser_end);
			List<PromotionVO> list = promotionDao.promotionSelectList(pvo);
			if(!list.isEmpty()) {
				for(int i=0;i<list.size();i++) {
					System.out.println(list.get(i));
					PromotionVO vo2 = new PromotionVO();
					if(list.get(i).getPro_status().equals("N")) {
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
						System.out.println("+++" + ser_end);
						Date endtoday = new Date(format.parse(ser_end).getTime());
						Date today = new Date();
						System.out.println("+++" + endtoday);
						System.out.println("+++" + today);
						int compare = endtoday.compareTo(today);
						System.out.println(compare);
						if(compare <= 0) {
							vo2.setPro_code(list.get(i).getPro_code());
							vo2.setPro_service(list.get(i).getPro_service());
							vo2.setPro_end(ser_end);
							System.out.println(ser_end);
							promotionDao.serviceEndPromotion(vo2);
						}else {
							vo2.setPro_code(list.get(i).getPro_code());
							vo2.setPro_service(list.get(i).getPro_service());
							vo2.setPro_end(ser_end);
							promotionDao.serviceEndPromotion2(vo2);
						}
						
						
					}else {
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

						Date date = new Date(format.parse(list.get(i).getPro_start()).getTime()); 
						Date today = new Date(format.parse(ser_end).getTime());
						System.out.println(date);
						System.out.println(today);
						int compare = date.compareTo(today);
						System.out.println(compare);
						if(compare <= 0) {
							vo2.setPro_code(list.get(i).getPro_code());
							vo2.setPro_service(list.get(i).getPro_service());
							vo2.setPro_end(ser_end);
							promotionDao.serviceEndPromotion2(vo2);
						}else {
							vo2.setPro_code(list.get(i).getPro_code());
							vo2.setPro_service(list.get(i).getPro_service());
							promotionDao.promotionCancel(vo2);
						}
						
					}
				}	
			}
			
			return "T";
		}else {
			return "F";
		}
			
	}

	@Scheduled(cron = "0 0 0 * * ?")
	public void EndDateCheck() {
		serviceDao.schEndDateCheck();
		System.out.println("enddate 스케쥴러 체크");
	}
	
	@ResponseBody
	@RequestMapping("/DirectendService.do")
	public String DirectendService(@RequestParam("ser_code") String ser_code, @RequestParam("ser_reason") String ser_reason,
			@RequestParam("ser_end") String ser_end, HttpSession session) throws ParseException {
		ServiceVO vo = new ServiceVO();
		vo.setSer_code(ser_code);
		vo.setSer_reason(ser_reason);
		
		int n = serviceDao.DirectendService(vo);
		
		if(n != 0) {
			PromotionVO pvo = new PromotionVO();
			pvo.setPro_service(ser_code);
			pvo.setS_email((String)session.getAttribute("id"));
			promotionDao.DirectPromCancel(pvo);
			promotionDao.DirectPromEnd(pvo);
			return "TT";
		}else {
			return "FF";
		}
			
	}
}
