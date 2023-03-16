package goodee.gdj58.shop_b.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.Company;
import goodee.gdj58.shop_b.vo.PwHistory;

@Mapper
public interface PwHistoryMapper {

	// pw 이력 삭제(3개까지 보관)
	int deletePwHistory(String id);
	
	// pwHistory count
	int selectPwHistoryCount(String id);
	
	// pwHistory 이력 중복 확인
	String selectPwHistory(PwHistory pwHistory);
	
	// 임시 확인용 pwHistory List
	List<PwHistory> selectPwHistoryList();
	
	// 업체 회원 가입 시 or 비밀번호 변경시  pw 이력 추가
	int insertPwHistory(PwHistory pwHistory);
	
}
