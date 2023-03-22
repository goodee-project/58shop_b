package goodee.gdj58.shop_b.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.shop_b.service.GoodsOptionService;
import goodee.gdj58.shop_b.util.TeamColor;
import goodee.gdj58.shop_b.vo.GoodsOption;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class GoodsOptionRestController {
	@Autowired private GoodsOptionService goodsOptionService;
	

	// 재고 확인
	@PostMapping("/quantity")
	public List<GoodsOption> selectGoodsQuantity(@RequestParam(value="goodsNo", required=true) int goodsNo) {
		log.debug(TeamColor.BLUE + goodsNo + "<- goodsNo, selectGoodsQuantity");
		return goodsOptionService.selectGoodsQuantity(goodsNo);
	}
	
}
