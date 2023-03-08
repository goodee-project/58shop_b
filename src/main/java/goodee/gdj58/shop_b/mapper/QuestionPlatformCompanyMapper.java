package goodee.gdj58.shop_b.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.QuestionPlatformCompany;

@Mapper
public interface QuestionPlatformCompanyMapper {
	//페이징
	int questionPlatformCount();
	// 상세보기
	List<Map<String, Object>> selectQuestionPlatformOne(int questionPlatformCompanyNo);
	// 삭제
	int deleteQuestionPlatform(int questionPlatformCompanyNo);
	// 등록
	int insertQuestionPlatform(QuestionPlatformCompany questionPlatformCompany);
	// 목록
	List<Map<String, Object>> selectQuestionPlatform(Map<String, Object> paramMap);
	
}
