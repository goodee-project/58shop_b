package goodee.gdj58.shop_b.mapper;




import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.GoodsOption;



@Mapper
public interface GoodsOptionMapper {
	
	List<GoodsOption> selectGoodsQuantity(int goodsNo);
	int insertGoodsOption(GoodsOption goodsOption);
}
