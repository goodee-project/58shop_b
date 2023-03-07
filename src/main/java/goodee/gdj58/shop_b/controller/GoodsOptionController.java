package goodee.gdj58.shop_b.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.shop_b.service.GoodsOptionService;
import goodee.gdj58.shop_b.util.TeamColor;
import goodee.gdj58.shop_b.vo.GoodsOption;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GoodsOptionController {
	@Autowired GoodsOptionService goodsOptionService;
	
	@GetMapping("/goods/addGoodsOption")
	public String insertGoodsOption(@RequestParam(value="goodsNo", defaultValue="1") int goodsNo) {
		
		return "goods/addGoodsOption";
	}
	@PostMapping("/goods/addGoodsOption")
	public String insertGoodsOption(GoodsOption goodsOption) {
		
		int row = goodsOptionService.insertGoodsOption(goodsOption);
		log.debug(TeamColor.BLUE + row + "<- row, insertGoodsOption");
		return "redirect:/";
	}
}
