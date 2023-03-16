package goodee.gdj58.shop_b.restcontroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.shop_b.service.PwHistoryService;
import goodee.gdj58.shop_b.vo.Company;
import goodee.gdj58.shop_b.vo.PwHistory;

@RestController
public class PwHistoryRestController {

	@Autowired
	private PwHistoryService pwHistoryService;
	
	@GetMapping("/company/updateNewPwCheck")
	public String updateNewPwCheck(HttpSession session, PwHistory pwHistory) {
		
		// 사용 가능한 비밀번호 : YES
		// 사용 불가능한 비밀번호 : NO 
		
		String id = ((Company) session.getAttribute("loginCompany")).getCompanyId();

		pwHistory.setId(id);
		
		return pwHistoryService.selectPwHistory(pwHistory);
		
	}
	
	
}
