package goodee.gdj58.shop_b.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.shop_b.service.TypeService;
import goodee.gdj58.shop_b.vo.Type;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class TypeRestController {
	@Autowired TypeService typeService;
	
	@PostMapping("/type")
	public List<Type>selectTypeList(int parentNo) {
		return typeService.selectTypeList(parentNo);
	}
}
