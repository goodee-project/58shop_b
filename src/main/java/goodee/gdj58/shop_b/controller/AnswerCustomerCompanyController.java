package goodee.gdj58.shop_b.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import goodee.gdj58.shop_b.service.AnswerCompanyService;
import goodee.gdj58.shop_b.vo.AnswerCustomerCompany;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AnswerCustomerCompanyController {
	@Autowired AnswerCompanyService answerCompanyService;
	// 답변 삭제
	@GetMapping("answer/deleteAnswerCustomer")
	public String deleteAnswerCustomer(int answerCustomerCompanyNo) {
		int row = answerCompanyService.deleteAnswerCustomer(answerCustomerCompanyNo);
		if(row == 1) {
			log.debug("\u001B[33m"+"삭제성공");
		}
		return "redirect:/answer/deleteAnswerCustomer";
	}
	
	// 답변 등록
	@GetMapping("answer/insertAnswerCustomer")
	public String insertAnswerCustomer(Model model, int questionCustomerCompanyNo) {
		model.addAttribute("questionCustomerCompanyNo", questionCustomerCompanyNo);
		return "answer/insertAnswerCustomer";
	}
	
	@PostMapping("answer/insertAnswerCustomer")
	public String insertAnswerCustomer(AnswerCustomerCompany answerCustomerCompany) {		
		int row = answerCompanyService.insertAnswerCustomer(answerCustomerCompany);
		if(row == 1) {
			log.debug("\u001B[33m"+"등록성공");
		}
		return "redirect:/question/questionCustomerList";
	}
	
}
