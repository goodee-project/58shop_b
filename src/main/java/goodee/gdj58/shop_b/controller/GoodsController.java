package goodee.gdj58.shop_b.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import goodee.gdj58.shop_b.service.GoodsService;
import goodee.gdj58.shop_b.service.TypeService;
import goodee.gdj58.shop_b.util.TeamColor;
import goodee.gdj58.shop_b.vo.Goods;
import goodee.gdj58.shop_b.vo.Type;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GoodsController {
	@Autowired private GoodsService goodsService;
	@Autowired private TypeService typeService;
	
	@GetMapping("/goods/addGoods")
	public String insertGoods(Model model) {
		List<Type> typeList = typeService.selectTypeList(0);
		log.debug(TeamColor.BLUE + typeList.size() + "<- typeList.size(), insertGoods");
		
		model.addAttribute("typeList", typeList);
		return "goods/addGoods";
	}
	@PostMapping("/goods/addGoods")
	public String insertGoods(HttpSession session, HttpServletRequest request, Goods goods
							, @RequestParam(value="goodsImg") List<MultipartFile> picList) {
	
		/* 로그인한 업체 아이디 가져오기 
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
		goods.setCompanyId(companyId);
		*/
		
		// mock id
		String companyId = "com1";
		goods.setCompanyId(companyId);
		goods.setGoodsActive("N"); // 상품 등록 후 활성화상태 변경 필요
		
		// 프로젝트 내에 업로드 파일 경로 구하기
		String path = request.getServletContext().getRealPath("/upload/goodsImg/");
		log.debug(TeamColor.BLUE + path + "<- path, insertGoods");
		
		int row = goodsService.insertGoods(goods, picList, path);
		log.debug(TeamColor.BLUE + row + "<- row, insertGoods");
		
		return "redirect:/";
	}
}
