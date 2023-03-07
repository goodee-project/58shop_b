package goodee.gdj58.shop_b.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.QuestionCustomerCompany;


@Mapper
public interface QuestionCustomerCompanyMapper {
	//페이징
	int questionCustomerCount(String companyId);
	// 상세보기
	List<Map<String, Object>> selectQuestionCustomerOne(int questionCustomerCompanyNo);
	// 삭제
	int deleteQuestionCustomer(int questionCustomerCompanyNo);
	// 등록
	int insertQuestionCustomer(QuestionCustomerCompany questionCustomerCompany);
	// 목록
	List<Map<String, Object>> selectQuestionCustomer(Map<String, Object> paramMap);
	
}
