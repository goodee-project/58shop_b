package goodee.gdj58.shop_b.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.gdj58.shop_b.service.TestService;
import goodee.gdj58.shop_b.util.TeamColor;
import goodee.gdj58.shop_b.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {

	@Autowired
	private TestService testService;
	
	@GetMapping("/test")
	public String getTest() {
		
		Test test = testService.getTest(1);
		
		log.info(TeamColor.PURPLE + test.toString() + " <-- test.toString()1");
		log.info(TeamColor.PURPLE + "김계현");
		
		return "test";
		
	}

}
