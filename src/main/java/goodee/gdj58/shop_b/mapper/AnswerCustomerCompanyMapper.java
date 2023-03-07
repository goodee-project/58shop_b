package goodee.gdj58.shop_b.mapper;


import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.AnswerCustomerCompany;

@Mapper
public interface AnswerCustomerCompanyMapper {
	// 수정
	int updateAnswerCustomer(int answerCustomerCompanyNo);
	// 삭제
	int deleteAnswerCustomer(int answerCustomerCompanyNo);
	// 등록
	int insertAnswerCustomer(AnswerCustomerCompany answerCustomerCompany);
	
}
