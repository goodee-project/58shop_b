package goodee.gdj58.shop_b.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.Type;

@Mapper
public interface TypeMapper {
	
	List<Type> selectTypeList(int parentNo);
}
