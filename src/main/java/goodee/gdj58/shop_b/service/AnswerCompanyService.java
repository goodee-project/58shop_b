package goodee.gdj58.shop_b.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_b.mapper.AnswerCustomerCompanyMapper;
import goodee.gdj58.shop_b.vo.AnswerCustomerCompany;
import goodee.gdj58.shop_b.vo.Company;
import goodee.gdj58.shop_b.vo.QuestionCustomerCompany;

@Service
@Transactional
public class AnswerCompanyService {
	@Autowired AnswerCustomerCompanyMapper answerCustomerCompanyMapper;
	

	
	// 답변 삭제
	public int deleteAnswerCustomer(int answerCustomerCompanyNo) {
		return answerCustomerCompanyMapper.deleteAnswerCustomer(answerCustomerCompanyNo);
	}
	
	// 답변 등록
	public int insertAnswerCustomer(AnswerCustomerCompany answerCustomerCompany) {
		return answerCustomerCompanyMapper.insertAnswerCustomer(answerCustomerCompany);
	}
		

}
