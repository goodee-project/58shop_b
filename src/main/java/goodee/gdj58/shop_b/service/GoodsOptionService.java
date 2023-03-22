package goodee.gdj58.shop_b.service;


import java.util.List;

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
	@Autowired private GoodsOptionMapper goodsOptionMapper;

	public List<GoodsOption> selectGoodsQuantity(int goodsNo) {
		return goodsOptionMapper.selectGoodsQuantity(goodsNo);
	}
	
	public int insertGoodsOption(GoodsOption goodsOption) {
		return goodsOptionMapper.insertGoodsOption(goodsOption);
	}

}
