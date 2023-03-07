package goodee.gdj58.shop_b.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.Goods;

@Mapper
public interface GoodsMapper {
	
	List<Map<String, Object>> selectGoodsList(Map<String, Object> map);
	int insertGoods(Goods goods);
}
