
package goodee.gdj58.shop_b.restcontroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.shop_b.service.GoodsService;
import goodee.gdj58.shop_b.util.TeamColor;
import goodee.gdj58.shop_b.vo.Company;
import goodee.gdj58.shop_b.vo.Goods;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class GoodsRestController {
	@Autowired private GoodsService goodsService;
	
	// 상품 카테고리 수정
	@PatchMapping("/goods/goodsType")
	public int updateGoodsType(HttpSession session
							, @RequestParam(value="typeNo", required=true) int typeNo
							, @RequestParam(value="goodsNo") Integer[] goodsNoList) {
		log.debug(TeamColor.BLUE + typeNo + "<- typeNo, updateGoodsType");
		log.debug(TeamColor.BLUE + goodsNoList + "<- goodsNo, updateGoodsType");
		
		// 로그인한 업체 아이디 가져오기 
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
		
		
		int row = goodsService.updateGoodsType(companyId, typeNo, goodsNoList);
		log.debug(TeamColor.BLUE + goodsNoList + "<- goodsNo, updateGoodsType");
		
		return row;
		
	}
	
	// 상품 수정
	@PatchMapping("/goods")
	public int updateGoods(HttpSession session, Goods goods) {
		log.debug(TeamColor.BLUE + goods + "<- goods, updateGoods");
		
		// 로그인한 업체 아이디 가져오기 
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
		
		
		int row = goodsService.updateGoods(companyId, goods);
		log.debug(TeamColor.BLUE + row + "<- row, updateGoods");
		
		return row;
	}
	
	// 상품 삭제
	@DeleteMapping("/goods")
	public int deleteGoods(HttpSession session, @RequestParam(value="goodsNo[]") String[] goodsNo) {
		log.debug(TeamColor.BLUE + goodsNo + "<- goodsNo, deleteGoods");
		
		// 로그인한 업체 아이디 가져오기 
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
		
		
		// 삭제
		int row = goodsService.deleteGoods(companyId, goodsNo);
		log.debug(TeamColor.BLUE + row + "<- row, deleteGoods");
		
		return row;
	}
}
