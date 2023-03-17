package goodee.gdj58.shop_b.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


import goodee.gdj58.shop_b.mapper.GoodsMapper;
import goodee.gdj58.shop_b.mapper.GoodsOptionMapper;
import goodee.gdj58.shop_b.mapper.StockHistoryMapper;
import goodee.gdj58.shop_b.util.TeamColor;
import goodee.gdj58.shop_b.vo.Goods;
import goodee.gdj58.shop_b.vo.GoodsOption;
import goodee.gdj58.shop_b.vo.StockHistory;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class GoodsService {
	@Autowired private GoodsMapper goodsMapper;
	@Autowired private GoodsImgService goodsImgService;
	@Autowired private GoodsOptionMapper goodsOptionMapper;
	@Autowired private StockHistoryMapper stockHistoryMapper;
	
	// 상품 개수
	public int selectCount(String companyId, String searchType, String searchWord, String[] stateList
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
		return goodsMapper.selectCount(map);
	}
	
	// 상품 상태별 개수
	public List<Map<String, Object>> selectCountByState(String companyId){
		List<Map<String, Object>> list = goodsMapper.selectCountByState(companyId);
		int cnt = 0;
		String state = "전체";
		for(Map<String, Object> map : list) {
			cnt += (Long)map.get("cnt");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		map.put("cnt", cnt);
		list.add(map);
		
		return list;
	}
	
	
	// 상품 목록
	public List<Map<String, Object>> selectGoodsList(String companyId, String searchType, String searchWord, String[] stateList
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
		return goodsMapper.selectGoodsList(map);
	}
	
	// 상품 등록
	public int insertGoods(Goods goods, List<MultipartFile> picList, String path, String[] cl, Integer[] ql) {
		// 상품 활성화 상태 미체크 시 N
		if(goods.getGoodsActive() == null || goods.getGoodsActive().equals("")) {
			goods.setGoodsActive("N");
		}
		
		int row = 0;
		
		// 1. 상품 등록
		row = goodsMapper.insertGoods(goods); // row == 1 : 등록 성공, key값 반환 
		
		// 2. 파일 등록
		try {
			row += goodsImgService.parseFileInfo(picList, path, goods.getGoodsNo()); // 파일을 폴더에 저장
		} catch (Exception e) {
			log.debug(TeamColor.BLUE + "상품 이미지 등록 예외 발생");
			e.printStackTrace();
			/*
			 *  파일 업로드에 실패하면
			 *  try...catch 절이 필요하지 않은 RuntimeException을 발생시켜서
			 *  @Transactional이 감지하여 rollback 할 수 있도록
			 */
			throw new RuntimeException();
		}
		
		// 3. 상품 옵션 등록
		for(int i=0; i< cl.length; i++) {
			GoodsOption go = new GoodsOption();
			go.setGoodsNo(goods.getGoodsNo());
			go.setGoodsOptionContent(cl[i]);
			
			if(ql[i] == null) {
				ql[i] = 0;
			}
			go.setGoodsOptionQuantity(ql[i]);
			
			row += goodsOptionMapper.insertGoodsOption(go);
			
			// 4. 재고 입력
			if(ql[i] != 0) { // 재고가 입력되었다면 재고이력에 추가
				StockHistory sh = new StockHistory();
				sh.setGoodsOptionNo(go.getGoodsOptionNo());
				sh.setStockHistoryQuantity(ql[i]);
				sh.setStockHistoryState("입고");
				sh.setStockHistoryMemo("");
				
				stockHistoryMapper.insertStockHistory(sh);
			}
			
			
		}
		
		
		return row;
	}
}
