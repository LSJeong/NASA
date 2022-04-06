package co.Nasa.prj.powerservice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Nasa.prj.comm.VO.PagingDTO;
import co.Nasa.prj.comm.VO.PowerServiceVO;
import co.Nasa.prj.comm.VO.ServiceVO;
import co.Nasa.prj.powerservice.service.PowerServiceService;
import co.Nasa.prj.service.service.ServiceService;

@Controller
public class PowerServiceController {
	@Autowired
	private PowerServiceService powerDao;
	@Autowired
	private ServiceService serviceDao;
	
	@ResponseBody
	@RequestMapping("/endPower.do")
	public String endPower(@RequestParam("sercode") String ser_code) {
		String enddate = powerDao.endPower(ser_code);
		System.out.println(enddate);
		return enddate;
	}
	
	@RequestMapping("/powerserviceInsert.do")
	public String powerserviceInsert(PowerServiceVO vo, HttpSession session) {
		System.out.println(vo.getSer_code());
		System.out.println(vo.getPower_start());
		System.out.println(vo.getPower_price());
		
		vo.setS_email((String)session.getAttribute("id"));
		
		powerDao.powerserviceInsert(vo);
		return "redirect:powerservice.do";
	}
	
	@RequestMapping("/powerservice.do")
	public String powerservice(PowerServiceVO vo, HttpSession session, Model model, PagingDTO pagingdto) {
		ServiceVO vo2 = new ServiceVO();
		vo2.setS_email((String)session.getAttribute("id"));
		vo.setS_email((String)session.getAttribute("id"));
		
		vo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		List<PowerServiceVO> powerList = powerDao.sellerPowerserviceList(vo);
		pagingdto.setTotal(powerDao.countPagingPowerservice(vo));
		
		model.addAttribute("powerList", powerList);
		model.addAttribute("sellerMainServiceList", serviceDao.servicePromotion(vo2));
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));
		
		return "seller/sellerPower";
	}
	
	@ResponseBody
	@RequestMapping("/powerServiceCount.do")
	public String powerServiceCount(@RequestParam("power_start") String power_start, @RequestParam("ser_code") String ser_code) {
		Integer n = powerDao.powerServiceCount(power_start);
		System.out.println(n);
		if(n != null) {	
			if(n >= 8) {
				return "full";
			}else {
				PowerServiceVO vo = new PowerServiceVO();
				vo.setSer_code(ser_code);
				vo.setPower_start(power_start);
				vo = powerDao.powerServiceOverlap(vo);
				if(vo != null) {
					System.out.println("overlap");
					return "overlap";
				}
			}
		}
		return "T";
	}
}
