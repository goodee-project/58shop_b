package goodee.gdj58.shop_b.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_b.mapper.PwHistoryMapper;
import goodee.gdj58.shop_b.vo.PwHistory;

@Service
@Transactional
public class PwHistoryService {

	@Autowired
	private PwHistoryMapper pwHistoryMapper;
	
	// 쇼핑몰 업체 비밀번호 변경 시 이력 확인
	// 사용 가능한 비밀번호 : YES
	// 사용 불가능한 비밀번호 : NO
	public String selectPwHistory(PwHistory pwHistory) {
		
		//
		String checkPw = pwHistoryMapper.selectPwHistory(pwHistory);
		
		String resultStr = "NO";
		
		if(checkPw == null) {
			
			resultStr = "YES";
			
		}
		
		return resultStr;
		
	}	
	
}
