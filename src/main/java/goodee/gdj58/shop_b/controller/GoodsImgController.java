package goodee.gdj58.shop_b.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import goodee.gdj58.shop_b.service.GoodsImgService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GoodsImgController {
	@Autowired private GoodsImgService goodsImgService;
	
}
