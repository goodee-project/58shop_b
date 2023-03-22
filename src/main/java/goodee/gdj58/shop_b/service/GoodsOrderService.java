package goodee.gdj58.shop_b.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_b.mapper.GoodsOrderMapper;

@Service
@Transactional
public class GoodsOrderService {

	@Autowired
	private GoodsOrderMapper goodsOrderMapper;
	
	public ArrayList<HashMap<String, Object>> selectOrderList(String companyId) {
		
		return goodsOrderMapper.selectOrderList(companyId);
		
	}
	
}
