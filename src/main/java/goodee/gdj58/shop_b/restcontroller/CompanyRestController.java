package goodee.gdj58.shop_b.restcontroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.shop_b.service.CompanyService;
import goodee.gdj58.shop_b.service.TotalIdService;
import goodee.gdj58.shop_b.vo.Company;

@RestController
public class CompanyRestController {
	
	@Autowired
	private TotalIdService totalIdService;
	
	@Autowired
	private CompanyService companyService;
	
	// 회원가입 시 ID 중복 확인
	@GetMapping("/companyIdCheck")
	public String companyIdCheck(@RequestParam("companyId") String companyId) {
		
		// RestController 의 리턴타입은 JSON 객체
		
		return totalIdService.selectTotalId(companyId);
		
	}
	
	// 비밀번호 변경 시 현재 비밀번호 일치하는지 확인
	@GetMapping("/company/updatePwCheck")
	public String selectPwCheck(HttpSession session, Company company) {
		
		String companyId = ((Company) session.getAttribute("loginCompany")).getCompanyId();
		
		company.setCompanyId(companyId);
		
		return companyService.selectCompanyPwCheck(company);
		
	}
	

}
