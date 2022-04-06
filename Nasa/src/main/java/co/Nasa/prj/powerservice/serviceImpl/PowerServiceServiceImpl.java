package co.Nasa.prj.powerservice.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.comm.VO.PowerServiceVO;
import co.Nasa.prj.powerservice.service.PowerServiceMapper;
import co.Nasa.prj.powerservice.service.PowerServiceService;

@Repository("powerDao")
public class PowerServiceServiceImpl implements PowerServiceService {
	
	@Autowired
	private PowerServiceMapper map;

	@Override
	public List<PowerServiceVO> PowerServiceList() {
		return map.PowerServiceList();
	}

	@Override
	public String endPower(String ser_code) {
		return map.endPower(ser_code);
	}

	@Override
	public int powerserviceInsert(PowerServiceVO vo) {
		return map.powerserviceInsert(vo);
	}

	@Override
	public Integer powerServiceCount(String power_start) {
		return map.powerServiceCount(power_start);
	}

	@Override
	public PowerServiceVO powerServiceOverlap(PowerServiceVO vo) {
		return map.powerServiceOverlap(vo);
	}

	@Override
	public List<PowerServiceVO> sellerPowerserviceList(PowerServiceVO vo) {
		return map.sellerPowerserviceList(vo);
	}

	@Override
	public int countPagingPowerservice(PowerServiceVO vo) {
		return map.countPagingPowerservice(vo);
	}

}
