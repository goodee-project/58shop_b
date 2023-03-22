package goodee.gdj58.shop_b.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.gdj58.shop_b.service.GoodsOrderService;
import goodee.gdj58.shop_b.service.OrderSheetService;
import goodee.gdj58.shop_b.vo.Company;

@Controller
public class OrderSheetController {
	
	@Autowired
	private OrderSheetService orderSheetService;
	
	@Autowired
	private GoodsOrderService goodsOrderService;
	
	// 주문서 목록 Get
	@GetMapping("/company/orderSheetList")
	public String selectOrderSheetList(HttpSession session, Model model) {
		
		// 세션에서 로그인 한 아이디 가져오기
		String companyId = ((Company) session.getAttribute("loginCompany")).getCompanyId();
		
		// 주문서 목록
		ArrayList<HashMap<String, Object>> orderSheetList = orderSheetService.selectOrderSheetList(companyId);
		
		// 주문 목록
		ArrayList<HashMap<String, Object>> orderList = goodsOrderService.selectOrderList(companyId);
		
		// model에 저장
		model.addAttribute("orderSheetList", orderSheetList);
		model.addAttribute("orderList", orderList);
		
		return "orderSheet/orderSheetList";
	}
	
	
	
	
}
