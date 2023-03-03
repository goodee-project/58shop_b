package goodee.gdj58.shop_b.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_b.mapper.TestMapper;
import goodee.gdj58.shop_b.vo.Test;

@Service
@Transactional
public class TestService {

	@Autowired
	private TestMapper testMapper;
	
	public Test getTest(int no) {
		
		return testMapper.selectTest(no);
		
	}
	
	
}
