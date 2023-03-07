package goodee.gdj58.shop_b.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.PwHistory;

@Mapper
public interface PwHistoryMapper {

	// 임시 확인용 pwHistory List
	List<PwHistory> selectPwHistoryList();
	
	// 업체 회원 가입 시 pw 이력 추가
	int insertPwHistory(PwHistory pwHistory);
	
}
