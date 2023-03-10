package goodee.gdj58.shop_b.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.TotalId;

@Mapper
public interface TotalIdMapper {

	// 임시 확인용 selectTotalIdList
	List<TotalId> selectTotalIdList();
	
	// 업체 회원가입 시 TotalId 추가
	int insertTotalId(TotalId totalId);
	
}
