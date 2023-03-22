package goodee.gdj58.shop_b.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GoodsOrderMapper {

	// 주문 목록
	ArrayList<HashMap<String, Object>> selectOrderList(String companyId);
	
}
