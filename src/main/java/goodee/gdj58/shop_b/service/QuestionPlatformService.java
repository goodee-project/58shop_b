package goodee.gdj58.shop_b.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_b.mapper.QuestionPlatformCompanyMapper;
import goodee.gdj58.shop_b.vo.Company;
import goodee.gdj58.shop_b.vo.QuestionCustomerCompany;
import goodee.gdj58.shop_b.vo.QuestionPlatformCompany;

@Service
@Transactional
public class QuestionPlatformService {
	@Autowired QuestionPlatformCompanyMapper questionPlatformCompanyMapper;
	// 문의사항 상세보기
	public List<Map<String, Object>> getQuestionPlatformOne(int questionPlatformCompanyNo) {
		return questionPlatformCompanyMapper.selectQuestionPlatformOne(questionPlatformCompanyNo);
	}
	
	// 문의사항 삭제
	public int deleteQuestionPlatform(int questionPlatformCompanyNo) {
		return questionPlatformCompanyMapper.deleteQuestionPlatform(questionPlatformCompanyNo);
	}
	
	// 문의사항 등록
	public int insertQeustionPlatform(QuestionPlatformCompany questionPlatformCompany) {
		return questionPlatformCompanyMapper.insertQuestionPlatform(questionPlatformCompany);
	}
	
	// 문의사항 목록
	public List<Map<String, Object>> getQuestionPlatformList(int currentPage, int rowPerPage, Company loginCom) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("loginCom", loginCom);
		return questionPlatformCompanyMapper.selectQuestionPlatform(paramMap);
	}	
	// 페이징count
	public int getQuestionPlatformCount() {
		return questionPlatformCompanyMapper.questionPlatformCount();
	}
}
