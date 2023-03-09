package goodee.gdj58.shop_b.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.shop_b.service.QuestionCompanyService;
import goodee.gdj58.shop_b.vo.Company;
import goodee.gdj58.shop_b.vo.Customer;
import goodee.gdj58.shop_b.vo.QuestionCustomerCompany;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class QuestionCustomerCompanyController {
	@Autowired QuestionCompanyService questionCompanyService;
		// 문의사항 상세보기
		@GetMapping("question/questionCustomerOne")
		public String getQuestionCustomerOne(Model model
											, @RequestParam(value = "questionCustomerCompanyNo") int questionCustomerCompanyNo) {
			log.debug("\u001B[33m"+questionCustomerCompanyNo+"=questionCustomerCompanyNo");
			List<Map<String, Object>> list = questionCompanyService.getQuestionCustomerOne(questionCustomerCompanyNo);
			model.addAttribute("list", list);
			return "question/questionCustomerOne";
		}
		
		
		// 문의사항 삭제
		@GetMapping("question/deleteQuestionCustomer")
		public String deleteQuestionCustomer(int questionCustomerCompanyNo) {
			int row = questionCompanyService.deleteQuestionCustomer(questionCustomerCompanyNo);
			if(row == 1) {
				log.debug("\u001B[33m"+"삭제성공");
			}
			return "redirect:/question/deleteQuestionCustomer";
		}
		/* 
		 * 플랫폼문의할때 코드 사용예정
		// 문의사항 등록
		@PostMapping("/insertQuestionCustomer")
		public String addQeustion(HttpSession session, Model model, QuestionCustomerCompany questionCustomerCompany) {
			Company loginCom = (Company)session.getAttribute("loginCompany");
			String companyId = loginCom.getCompanyId();
			questionCustomerCompany.setCompanyId(companyId);
			int row = questionCompanyService.insertQeustionCustomer(questionCustomerCompany);
			if(row == 1) {
				log.debug("\u001B[33m"+"등록성공");
			}
			return "redirect:/insertQuestionCustomer";
		}
		*/
		
		// 문의사항 목록
		@GetMapping("question/questionCustomerList")
		public String getQeustionCustomerList(Model model, HttpSession session
									, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
									, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage ) {
		
			Company loginCom = (Company)session.getAttribute("loginCompany");
			model.addAttribute("loginCom", loginCom);
			log.debug(loginCom.getCompanyId()+"<-id");			
			int count = questionCompanyService.getQuestionCustomerCount(loginCom.getCompanyId());
			List<Map<String, Object>> list = questionCompanyService.getQuestionCustomerList(currentPage, rowPerPage, loginCom.getCompanyId());
			int page = 10; // 페이징 목록 개수
			int beginPage = ((currentPage - 1)/page) * page + 1; // 시작 페이지
			int endPage = beginPage + page - 1; // 페이징 목록 끝
			int lastPage = (int)Math.ceil((double)count / (double)rowPerPage); // 마지막 페이지
			if(endPage > lastPage) {
				endPage = lastPage;
			}
			
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("rowPerPage", rowPerPage);
			model.addAttribute("beginPage", beginPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("lastPage", lastPage);
			return "question/questionCustomerList";
		}

}
