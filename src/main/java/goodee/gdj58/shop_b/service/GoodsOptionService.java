package goodee.gdj58.shop_b.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public int updateGoodsQuantity(List<GoodsOption> list) {
		int row = 0;
		for(GoodsOption go : list) {
			row += goodsOptionMapper.updateGoodsOptionQuantity(go);
		}
		return row;
	}
	
	public int selectGoodsOptionCount(String companyId, String searchType, String searchWord, String[] stateList
									, int typeNo, String dateType, String startDate, String endDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("companyId", companyId);
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("stateList", stateList);
		map.put("typeNo", typeNo);
		map.put("dateType", dateType);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return goodsOptionMapper.selectGoodsOptionCount(map);
	}
	
	public List<GoodsOption> selectGoodsQuantity(int goodsNo) {
		return goodsOptionMapper.selectGoodsQuantity(goodsNo);
	}
	
	public int insertGoodsOption(GoodsOption goodsOption) {
		return goodsOptionMapper.insertGoodsOption(goodsOption);
	}
	
	public List<Map<String, Object>> selectGoodsOptionList(String companyId, String searchType, String searchWord, String[] stateList
													, int typeNo, String dateType, String startDate, String endDate, int currentPage, int rowPerPage){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("companyId", companyId);
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("stateList", stateList);
		map.put("typeNo", typeNo);
		map.put("dateType", dateType);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		return goodsOptionMapper.selectGoodsOptionList(map);
	}
}
