package goodee.gdj58.shop_b.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import goodee.gdj58.shop_b.service.CompanyService;
import goodee.gdj58.shop_b.service.TypeService;
import goodee.gdj58.shop_b.util.TeamColor;
import goodee.gdj58.shop_b.vo.Company;
import goodee.gdj58.shop_b.vo.LoginFail;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CompanyController {

	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private TypeService typeService;
	
	// 쇼핑몰 업체 home
	@GetMapping("/company/home")
	public String test() {
		
		return "home";
		
	}
	
	// 쇼핑몰 업체 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:http://3.34.241.220/58platform/integrationPage";
		
	}
	
	// 쇼핑몰 업체 로그인
	@GetMapping("/login")
	public String loginCompany() {
		
		return "redirect:http://3.34.241.220/58platform/integrationPage";
		
	}
	
	@PostMapping("/login")
	public String loginCompany(HttpSession session, Company paramCompany) {
		
		String targetUrl = "redirect:http://3.34.241.220/58platform/integrationPage";		// 로그인 실패 시 페이지
		
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
	
	// 쇼핑몰 업체 추가(회원 가입)
	@GetMapping("/addCompany")
	public String addCompany(Model model) {
		
		ArrayList typeList = (ArrayList) typeService.selectTypeListForAddCompany();
		
		model.addAttribute("typeList", typeList);
		
		ArrayList<Company> list = (ArrayList) companyService.selectComapnyList();
		
		log.info(TeamColor.CYAN + list.toString() + " <-- list.toString()");
		
		return "company/addCompany";
		
	}
	
	@PostMapping("/addCompany")
	public String addCompany(Company company) {
		
		int resultRow = companyService.insertCompany(company);
		
		log.info(TeamColor.CYAN + resultRow + " <-- resultRow");
		
		return "redirect:/login";
		
	}
	
	
}
