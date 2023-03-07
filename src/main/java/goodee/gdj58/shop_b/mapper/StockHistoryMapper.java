package goodee.gdj58.shop_b.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.StockHistory;

@Mapper
public interface StockHistoryMapper {
	
	int insertStockHistory(StockHistory stockHistory);
}
