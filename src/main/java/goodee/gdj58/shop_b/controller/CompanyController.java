package goodee.gdj58.shop_b.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.shop_b.service.CompanyService;
import goodee.gdj58.shop_b.service.TypeService;
import goodee.gdj58.shop_b.util.TeamColor;
import goodee.gdj58.shop_b.vo.Company;
import goodee.gdj58.shop_b.vo.LoginFail;
import goodee.gdj58.shop_b.vo.Type;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CompanyController {

	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private TypeService typeService;
	
	// 쇼핑몰 업체 비밀번호 변경 Get
	@GetMapping("/company/updateCompanyPw")
	public String updateCompanyPw() {
		
		return "company/updateCompanyPw";
		
	}
	
	// 쇼핑몰 업체 비밀번호 변경 Post
	@PostMapping("/company/updateCompanyPw")
	public String updateCompanyPw(HttpSession session, 
									@RequestParam("password") String password) {
		
		// 세션에서 아이디 가져오기
		String companyId = ((Company) session.getAttribute("loginCompany")).getCompanyId();
		
		Company company = new Company();
		company.setCompanyId(companyId);
		company.setCompanyPw(password);		// 변경할 비밀번호
		
		companyService.updateCompanyPw(company);
		
		return "redirect:/login";
		
	}
	
	// 쇼핑몰 업체 정보 수정 Get
	@GetMapping("/company/updateCompany")
	public String updateCompany(HttpSession session, Model model) {
		
		// 세션에서 아이디 가져오기
		String companyId = ((Company) session.getAttribute("loginCompany")).getCompanyId();
		
		// 현재 등록된 정보 보여주기 위해서
		HashMap<String, Object> company = (HashMap<String, Object>) companyService.selectCompany(companyId);
		
		model.addAttribute("company", company);
		
		// typeList
		ArrayList<Type> typeList = (ArrayList<Type>) typeService.selectTypeListForAddCompany();
		
		model.addAttribute("typeList", typeList);
		
		return "company/updateCompany";
		
	}
	
	// 쇼핑몰 업체 정보 수정 Post
	@PostMapping("/company/updateCompany")
	public String updateCompany(Company company) {
		
		int resultRow = companyService.updateCompany(company);
		
		log.info(TeamColor.CYAN + resultRow + " <-- resultRow");
		
		return "redirect:/company/companyOne";		
		
	}
	
	
	
	
	// 쇼핑몰 업체 정보 조회 Get
	@GetMapping("/company/companyOne")
	public String companyList(HttpSession session, Model model) {
		
		// 세션에서 아이디 가져오기
		String companyId = ((Company) session.getAttribute("loginCompany")).getCompanyId();
		
		// 현재 등록된 정보 보여주기
		HashMap<String, Object> company = (HashMap<String, Object>) companyService.selectCompany(companyId);
		
		model.addAttribute("company", company);
		
		return "company/companyOne";
		
	}
	
	// 쇼핑몰 업체 home Get
	@GetMapping("/company/home")
	public String home() {
		
		return "home";
		
	}
	
	// 쇼핑몰 업체 로그아웃 Get
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "/login";
		
	}
	
	// 쇼핑몰 업체 로그인 Get
	@GetMapping("/login")
	public String loginCompany() {
		
		return "/login";
		
	}
	
	// 쇼핑몰 업체 로그인 Post
	@PostMapping("/login")
	public String loginCompany(HttpSession session, Company paramCompany) {
		
		String targetUrl = "/login";		// 로그인 실패 시 페이지
		
		Company loginCompany = companyService.loginCompany(paramCompany);
		
		if(loginCompany != null) {
			
			// 로그인 성공 시
			
			// 로그인 성공 시 페이지
			targetUrl = "redirect:/company/home";
			
			// 세션에 로그인 정보 저장
			session.setAttribute("loginCompany", loginCompany);
			
			log.info(TeamColor.CYAN + loginCompany.getCompanyId() + " 로그인 성공");
			
			// 세션에서 로그인 실패 리스트 제거
			session.removeAttribute("loginFailList");
			
		} else {
			
			// 로그인 실패시
			
			// 세션에 로그인 실패 리스트 없다면 생성
			if(session.getAttribute("loginFailList") == null) {
				session.setAttribute("loginFailList", new ArrayList<LoginFail>());
			}
			
			// 세션에서 로그인 실패 리스트 가져오기
			ArrayList<LoginFail> loginFailList = (ArrayList<LoginFail>) session.getAttribute("loginFailList");
			
			if(loginFailList.size() == 0) {
				
				// 로그인 실패 리스트에 아무것도 없으면
				
				// 로그인 실패 정보 리스트에 추가
				LoginFail lf1 = new LoginFail();
				lf1.setId(paramCompany.getCompanyId());
				lf1.setCount(1);
				
				loginFailList.add(lf1);
				
			} else {
				
				// 로그인 실패 리스트에 어떤 아이디가 있다면 
				
				// 이미 로그인 실패 리스트에 등록된 아이디인지 체크위한 boolean
				boolean check = true;
				
				// 리스트의 아이디와 로그인 시도한 아이디 비교
				for(int i=0; i<loginFailList.size(); i+=1) {
					
					if(loginFailList.get(i).getId().equals(paramCompany.getCompanyId())) {
						
						// 같다면 실패 카운트 1 추가
						loginFailList.get(i).setCount(loginFailList.get(i).getCount() + 1);
						
						// 처리했으므로 아래에서 등록 안하기 위해
						check = false;
						
					}
					
				}
				
				// 위에서 같은 아이디가 없다면 로그인 실패 리스트에 추가
				if(check) {
					
					LoginFail lf2 = new LoginFail();
					lf2.setId(paramCompany.getCompanyId());
					lf2.setCount(1);
					
					loginFailList.add(lf2);
					
				}
				
			}
			
					
			// 마지막으로 세션에 저장
			session.setAttribute("loginFailList", loginFailList);
			log.info(TeamColor.CYAN + loginFailList.toString() + " <-- loginFailList");
			
			log.info(TeamColor.CYAN + "로그인 실패");
			
			
		}
		
		return targetUrl;
		
	}
	
	// 쇼핑몰 업체 추가(회원 가입) Get
	@GetMapping("/insertCompany")
	public String addCompany(Model model) {
		
		ArrayList<Type> typeList = (ArrayList<Type>) typeService.selectTypeListForAddCompany();
		
		model.addAttribute("typeList", typeList);
		
		return "company/insertCompany";
		
	}
	
	// 쇼핑몰 업체 추가(회원 가입) Post
	@PostMapping("/insertCompany")
	public String addCompany(Company company) {
		
		int resultRow = companyService.insertCompany(company);
		
		log.info(TeamColor.CYAN + resultRow + " <-- resultRow");
		
		return "redirect:/login";
		
	}
	
	
}
