package goodee.gdj58.shop_b.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.GoodsImg;

@Mapper
public interface GoodsImgMapper {
	
	int insertGoodsImg(GoodsImg goodsImg);
}
