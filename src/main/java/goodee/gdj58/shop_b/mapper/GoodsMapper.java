package goodee.gdj58.shop_b.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.Goods;

@Mapper
public interface GoodsMapper {
	
	int insertGoods(Goods goods);
}
