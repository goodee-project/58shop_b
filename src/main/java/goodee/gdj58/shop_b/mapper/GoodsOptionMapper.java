package goodee.gdj58.shop_b.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.GoodsOption;



@Mapper
public interface GoodsOptionMapper {
	
	int updateGoodsOptionQuantity(GoodsOption goodsOption);
	int selectGoodsOptionCount(Map<String, Object> map);
	List<Map<String, Object>> selectGoodsOptionList(Map<String, Object> map);
	List<GoodsOption> selectGoodsQuantity(int goodsNo);
	int insertGoodsOption(GoodsOption goodsOption);
}
