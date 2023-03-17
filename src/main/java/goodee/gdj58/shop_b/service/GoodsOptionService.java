package goodee.gdj58.shop_b.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_b.mapper.GoodsOptionMapper;
import goodee.gdj58.shop_b.vo.GoodsOption;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class GoodsOptionService {
	@Autowired
	GoodsOptionMapper goodsOptionMapper;

	public int insertGoodsOption(GoodsOption goodsOption) {

		return goodsOptionMapper.insertGoodsOption(goodsOption);
	}

}
