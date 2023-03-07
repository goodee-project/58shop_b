package goodee.gdj58.shop_b.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_b.mapper.QuestionCustomerCompanyMapper;
import goodee.gdj58.shop_b.vo.Company;
import goodee.gdj58.shop_b.vo.QuestionCustomerCompany;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class QuestionCompanyService {
	@Autowired QuestionCustomerCompanyMapper questionCustomerCompanyMapper;
	
	// 문의사항 상세보기
	public List<Map<String, Object>> getQuestionCustomerOne(int questionCustomerCompanyNo) {
		return questionCustomerCompanyMapper.selectQuestionCustomerOne(questionCustomerCompanyNo);
	}
	
	// 문의사항 삭제
	public int deleteQuestionCustomer(int questionCustomerCompanyNo) {
		return questionCustomerCompanyMapper.deleteQuestionCustomer(questionCustomerCompanyNo);
	}
	
	// 문의사항 등록
	public int insertQeustionCustomer(QuestionCustomerCompany questionCustomerCompany) {
		return questionCustomerCompanyMapper.insertQuestionCustomer(questionCustomerCompany);
	}
	
	// 문의사항 목록
	public List<Map<String, Object>> getQuestionCustomerList(int currentPage, int rowPerPage, Company loginCom) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("loginCom", loginCom);
		return questionCustomerCompanyMapper.selectQuestionCustomer(paramMap);
	}	
	// 페이징count
	public int getQuestionCustomerCount(String companyId) {
		return questionCustomerCompanyMapper.questionCustomerCount(companyId);
	}
}
