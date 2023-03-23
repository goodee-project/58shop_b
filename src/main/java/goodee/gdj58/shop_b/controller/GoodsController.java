package goodee.gdj58.shop_b.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

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
import goodee.gdj58.shop_b.vo.Company;
import goodee.gdj58.shop_b.vo.Goods;
import goodee.gdj58.shop_b.vo.Type;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GoodsController {
	@Autowired private GoodsService goodsService;
	@Autowired private TypeService typeService;
	
	
	// 상품 수정
	@GetMapping("/goods/updateGoodsOne")
	public String updateGoodsOne(HttpSession session, Model model
							, @RequestParam(value="goodsNo", required=true) int goodsNo) {
		
		log.debug(TeamColor.BLUE + goodsNo + "<- goodsNo, updateGoods");
		
		// 로그인한 업체 아이디 가져오기 
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
		
		Goods goods = goodsService.goodsOne(companyId, goodsNo);
		
		model.addAttribute("goods", goods);
		
		return "goods/updateGoods";
	}
	// 상품 수정
	@PostMapping("/goods/updateGoodsOne")
	public String updateGoodsOne(HttpSession session, Goods goods
						, @RequestParam(value="goodsOptionContent", required=false) String[] cl
						, @RequestParam(value="goodsOptionQuantity", required=false) Integer[] ql) {
		
		log.debug(TeamColor.BLUE + goods + "<- goods, updateGoods");
		
		// 로그인한 업체 아이디 가져오기 
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
		goods.setCompanyId(companyId);
		
		int row = goodsService.updateGoodsOne(companyId, goods, cl, ql);
		log.debug(TeamColor.BLUE + row + "<- row, updateGoods");
		
		return "redirect:/goods/goodsList";
	}
	
	// 상품 목록
	@GetMapping("/goods/goodsList")
	public String selectGoodsList(HttpSession session, Model model
								, @RequestParam(value="searchType", defaultValue="") String searchType
								, @RequestParam(value="searchWord", defaultValue="") String searchWord
								, @RequestParam(value="state", defaultValue="") String[] stateList
								, @RequestParam(value="typeNo", defaultValue="0") int typeNo
								, @RequestParam(value="dateType", defaultValue="") String dateType
								, @RequestParam(value="startDate", defaultValue="") String startDate
								, @RequestParam(value="endDate", defaultValue="") String endDate
								, @RequestParam(value="currentPage", defaultValue="1") int currentPage
								, @RequestParam(value="rowPerPage", defaultValue="100") int rowPerPage) {
		
		log.debug(TeamColor.BLUE + searchType + "<- searchType, selectGoodsList");
		log.debug(TeamColor.BLUE + searchWord + "<- searchWord, selectGoodsList");
		log.debug(TeamColor.BLUE + currentPage + "<- currentPage, selectGoodsList");
		log.debug(TeamColor.BLUE + rowPerPage + "<- rowPerPage, selectGoodsList");
		log.debug(TeamColor.BLUE + startDate + "<- startDate, selectGoodsList");
		log.debug(TeamColor.BLUE + endDate + "<- endDate, selectGoodsList");
		
		// 로그인한 업체 아이디 가져오기 
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
	
	
		// 상품 상태별 개수 (판매중, 비활성화 ... )
		List<Map<String, Object>> goodsStateList = goodsService.selectCountByState(companyId);
		log.debug(TeamColor.BLUE + goodsStateList + "<-- goodsStateList, selectGoodsList");
		
		// 페이징 
		int goodsCount = goodsService.selectCount(companyId, searchType, searchWord, stateList, typeNo, dateType, startDate, endDate);
		
		int lastPage = goodsCount%rowPerPage==0 ? goodsCount/rowPerPage : goodsCount/rowPerPage + 1;
		
		currentPage = (currentPage > lastPage) ? lastPage : (currentPage < 1) ? 1 : currentPage;
		
		int pageCount = 3;
		
		int startPage = (currentPage-1)/pageCount*pageCount + 1;
		startPage = startPage < 1 ? 1 : startPage;
		
		int endPage = startPage + pageCount - 1;
		endPage = endPage > lastPage ? lastPage : endPage;
		
		log.debug(TeamColor.BLUE + goodsCount + "<- goodsCount, selectGoodsList");
		log.debug(TeamColor.BLUE + currentPage + "<- currentPage, selectGoodsList");
		log.debug(TeamColor.BLUE + rowPerPage + "<- rowPerPage, selectGoodsList");
		log.debug(TeamColor.BLUE + startPage + "<- startPage, selectGoodsList");
		log.debug(TeamColor.BLUE + endPage + "<- endPage, selectGoodsList");
		log.debug(TeamColor.BLUE + pageCount + "<- pageCount, selectGoodsList");
		log.debug(TeamColor.BLUE + lastPage + "<- lastPage, selectGoodsList");
		
		// 상품 목록
		List<Map<String, Object>> goodsList = Collections.emptyList(); 
		
		if(goodsCount != 0) { // 검색된 상품이 없다면 빈 객체 반환
			goodsList = goodsService.selectGoodsList(companyId, searchType, searchWord, stateList, typeNo, dateType, startDate, endDate, currentPage, rowPerPage);
		}
		
		log.debug(TeamColor.BLUE + goodsList + "<- goodsList, selectGoodsList");
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("stateList", stateList);
		model.addAttribute("typeNo", typeNo);
		model.addAttribute("dateType", dateType);
		model.addAttribute("endDate", endDate);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("goodsStateList", goodsStateList);
		return "goods/goodsList"; 
	}
	
	
	// 상품등록
	@GetMapping("/goods/addGoods")
	public String insertGoods(Model model) {
		List<Type> typeList = typeService.selectTypeList(0);
		
		model.addAttribute("typeList", typeList);
		return "goods/addGoods";
	}
	@PostMapping("/goods/addGoods")
	public String insertGoods(HttpSession session, HttpServletRequest request, Goods goods
							, @RequestParam(value="goodsOptionContent") String[] cl
							, @RequestParam(value="goodsOptionQuantity") Integer[] ql
							, @RequestParam(value="goodsImg") List<MultipartFile> picList) {
		

		log.debug(TeamColor.BLUE + goods + "<- goods, insertGoods");
		log.debug(TeamColor.BLUE + cl.length + "<- cl.length, insertGoods");
		log.debug(TeamColor.BLUE + ql.length + "<- ql.length, insertGoods");
		log.debug(TeamColor.BLUE + picList.size() + "<- picList.size(), insertGoods");
		
		
		// 로그인한 업체 아이디 가져오기 
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
		goods.setCompanyId(companyId);
	
		goods.setGoodsLevel(0); // 기본값 0 
		
		// 프로젝트 내에 업로드 파일 경로 구하기
		String path = request.getServletContext().getRealPath("/upload/goodsImg/");
		log.debug(TeamColor.BLUE + path + "<- path, insertGoods");
		
		int row = goodsService.insertGoods(goods, picList, path, cl, ql);
		log.debug(TeamColor.BLUE + row + "<- row, insertGoods");
		
		if(row == 1+cl.length+picList.size()) {
			log.debug(TeamColor.BLUE + "<- 상품, 옵션, 이미지 모두 등록 성공, insertGoods");
		}
		
		return "redirect:/goods/goodsList";
	}
}
