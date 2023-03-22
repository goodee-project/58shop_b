package goodee.gdj58.shop_b.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_b.mapper.OrderSheetMapper;

@Service
@Transactional
public class OrderSheetService {

	@Autowired
	private OrderSheetMapper orderSheetMapper;
	
	// 주문서 목록
	public ArrayList<HashMap<String, Object>> selectOrderSheetList(String companyId) {
		
		return orderSheetMapper.selectOrderSheetList(companyId);
		
	}
	
}
