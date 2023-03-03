package goodee.gdj58.shop_b.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.Test;

@Mapper
public interface TestMapper {

	Test selectTest(int no);
	
}
