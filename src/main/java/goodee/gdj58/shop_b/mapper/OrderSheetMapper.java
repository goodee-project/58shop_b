package goodee.gdj58.shop_b.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderSheetMapper {

	// 주문서 목록
	ArrayList<HashMap<String, Object>> selectOrderSheetList(String companyId);
	
}
