package goodee.gdj58.shop_b.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import goodee.gdj58.shop_b.service.CompanyService;
import goodee.gdj58.shop_b.util.TeamColor;
import goodee.gdj58.shop_b.vo.Company;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CompanyController {

	@Autowired
	private CompanyService companyService;
	

	
	@GetMapping("/company/addCompany")
	public String addCompany() {
		
		return "company/addCompany";
		
	}
	
	@PostMapping("/company/addCompany")
	public String addCompanY(Company company) {
		
		return "index";
		
	}
	
	
}
