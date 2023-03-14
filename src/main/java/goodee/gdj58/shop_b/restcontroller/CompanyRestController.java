package goodee.gdj58.shop_b.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.shop_b.service.CompanyService;

@RestController
public class CompanyRestController {
	
	@Autowired
	public CompanyService companyService;
	
	@GetMapping("/companyIdCheck")
	public String companyIdCheck(@RequestParam("companyId") String companyId) {
		
		// RestController 의 리턴타입은 JSON 객체
		
		return companyService.selectTotalId(companyId);
		
	}
	

}
