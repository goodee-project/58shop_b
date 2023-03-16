package goodee.gdj58.shop_b.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_b.mapper.TotalIdMapper;

@Service
@Transactional
public class TotalIdService {

	@Autowired
	private TotalIdMapper totalIdMapper;
	
	// 쇼핑몰 업체 아이디 중복 확인
	// 사용 가능한 ID : YES
	// 사용 불가능한 ID : NO
	public String selectTotalId(String companyId) {
		
		String checkId = totalIdMapper.selectTotalId(companyId);
		
		String resultStr = "NO";
		
		if(checkId == null) {
			
			resultStr = "YES";
			
		}
		
		return resultStr;
		
	}	
	
}
