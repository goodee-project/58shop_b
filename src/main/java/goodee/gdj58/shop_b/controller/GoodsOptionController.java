package goodee.gdj58.shop_b.controller;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.shop_b.service.GoodsOptionService;
import goodee.gdj58.shop_b.util.TeamColor;
import goodee.gdj58.shop_b.vo.Company;
import goodee.gdj58.shop_b.vo.GoodsOption;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GoodsOptionController {
	@Autowired GoodsOptionService goodsOptionService;
	
	// 상품 옵션 목록
	@GetMapping("/goods/goodsOptionList")
	public String selectGoodsOptionList(HttpSession session, Model model
								, @RequestParam(value="searchType", defaultValue="") String searchType
								, @RequestParam(value="searchWord", defaultValue="") String searchWord
								, @RequestParam(value="state", defaultValue="") String[] stateList
								, @RequestParam(value="typeNo", defaultValue="0") int typeNo
								, @RequestParam(value="dateType", defaultValue="") String dateType
								, @RequestParam(value="startDate", defaultValue="") String startDate
								, @RequestParam(value="endDate", defaultValue="") String endDate
								, @RequestParam(value="currentPage", defaultValue="1") int currentPage
								, @RequestParam(value="rowPerPage", defaultValue="100") int rowPerPage) {
		for(String s : stateList) {
			log.debug(TeamColor.BLUE + s + "<- stateList, selectGoodsList");
		}
		log.debug(TeamColor.BLUE + searchType + "<- searchType, selectGoodsOptionList");
		log.debug(TeamColor.BLUE + searchWord + "<- searchWord, selectGoodsOptionList");
		log.debug(TeamColor.BLUE + currentPage + "<- currentPage, selectGoodsOptionList");
		log.debug(TeamColor.BLUE + rowPerPage + "<- rowPerPage, selectGoodsOptionList");
		log.debug(TeamColor.BLUE + startDate + "<- startDate, selectGoodsOptionList");
		log.debug(TeamColor.BLUE + endDate + "<- endDate, selectGoodsOptionList");
		
		// 로그인한 업체 아이디 가져오기 
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
	
		
		// 페이징 
		int goodsOptionCount = goodsOptionService.selectGoodsOptionCount(companyId, searchType, searchWord, stateList, typeNo, dateType, startDate, endDate);
		
		int lastPage = goodsOptionCount%rowPerPage==0 ? goodsOptionCount/rowPerPage : goodsOptionCount/rowPerPage + 1;
		
		currentPage = (currentPage > lastPage) ? lastPage : (currentPage < 1) ? 1 : currentPage;
		
		int pageCount = 3;
		
		int startPage = (currentPage-1)/pageCount*pageCount + 1;
		startPage = startPage < 1 ? 1 : startPage;
		
		int endPage = startPage + pageCount - 1;
		endPage = endPage > lastPage ? lastPage : endPage;
		
		log.debug(TeamColor.BLUE + goodsOptionCount + "<- goodsOptionCount, selectGoodsOptionList");
		log.debug(TeamColor.BLUE + currentPage + "<- currentPage, selectGoodsOptionList");
		log.debug(TeamColor.BLUE + rowPerPage + "<- rowPerPage, selectGoodsOptionList");
		log.debug(TeamColor.BLUE + startPage + "<- startPage, selectGoodsOptionList");
		log.debug(TeamColor.BLUE + endPage + "<- endPage, selectGoodsOptionList");
		log.debug(TeamColor.BLUE + pageCount + "<- pageCount, selectGoodsOptionList");
		log.debug(TeamColor.BLUE + lastPage + "<- lastPage, selectGoodsOptionList");
		
		// 상품 목록
		List<LinkedHashMap<String, Object>> goodsOptionList = Collections.emptyList(); // 검색된 상품이 없다면 빈 객체 반환
		
		if(goodsOptionCount != 0) { 
			goodsOptionList = goodsOptionService.selectGoodsOptionList(companyId, searchType, searchWord, stateList, typeNo, dateType, startDate, endDate, currentPage, rowPerPage);
		}
		
		log.debug(TeamColor.BLUE + goodsOptionList + "<- goodsOptionList, selectGoodsOptionList");
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("goodsOptionCount", goodsOptionCount);
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
		
		model.addAttribute("goodsOptionList", goodsOptionList);
		return "goods/goodsOptionList"; 
	}
	
	
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
