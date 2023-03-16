package goodee.gdj58.shop_b.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.Type;

@Mapper
public interface TypeMapper {
	
	// 업종 카테고리 리스트(회원 가입 페이지)
	List<Type> selectTypeListForAddCompany();	
	
	List<Type> selectTypeList(int parentNo);
}
