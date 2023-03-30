package goodee.gdj58.shop_b.service;


import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_b.mapper.GoodsOptionMapper;
import goodee.gdj58.shop_b.mapper.StockHistoryMapper;
import goodee.gdj58.shop_b.vo.GoodsOption;
import goodee.gdj58.shop_b.vo.StockHistory;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class GoodsOptionService {
	@Autowired private GoodsOptionMapper goodsOptionMapper;
	@Autowired private StockHistoryMapper stockHistoryMapper;
	
	public int updateGoodsQuantity(List<GoodsOption> list) {
		int[] row = {0};
		list.stream()
			.forEach(m -> {
				
				// 재고 이력에 업데이트 할 stockHistory 객체 생성
				StockHistory sh = new StockHistory();
				sh.setStockHistoryQuantity(m.getGoodsOptionQuantity());
				if(m.getGoodsOptionQuantity() > 0) {
					sh.setStockHistoryMemo("입고"); 
				}
				else if(m.getGoodsOptionQuantity() < 0) {
					sh.setStockHistoryMemo("출고");
				}
				
				// 재고 수정 
				row[0] += goodsOptionMapper.updateGoodsOptionQuantity(m);
				// 재고 이력에 추가
				row[0] += stockHistoryMapper.insertStockHistory(sh);
				
			});
			
		return row[0];
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
	
	public List<LinkedHashMap<String, Object>> selectGoodsOptionList(String companyId){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("companyId", companyId);
		return goodsOptionMapper.selectGoodsOptionList(map);
	}
	public List<LinkedHashMap<String, Object>> selectGoodsOptionList(String companyId, String searchType, String searchWord, String[] stateList
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
