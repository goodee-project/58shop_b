package goodee.gdj58.shop_b.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.GoodsOption;

@Mapper
public interface GoodsOptionMapper {
	
	int insertGoodsOption(GoodsOption goodsOption);
}
