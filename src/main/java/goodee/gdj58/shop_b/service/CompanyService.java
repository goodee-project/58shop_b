package goodee.gdj58.shop_b.service;

import java.util.ArrayList;	
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_b.mapper.CompanyMapper;
import goodee.gdj58.shop_b.mapper.PwHistoryMapper;
import goodee.gdj58.shop_b.mapper.TotalIdMapper;
import goodee.gdj58.shop_b.util.TeamColor;
import goodee.gdj58.shop_b.vo.Company;
import goodee.gdj58.shop_b.vo.PwHistory;
import goodee.gdj58.shop_b.vo.TotalId;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class CompanyService {

	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
	private PwHistoryMapper pwHistoryMapper;

	@Autowired
	private TotalIdMapper totalIdMapper;
	
	// 쇼핑몰 업체 로그인
	public Company loginCompany(Company company) {
		
		return companyMapper.loginCompany(company);
		
	}
	
	// 쇼핑몰 업체 리스트
	public List<Company> selectComapnyList() {
		
		return companyMapper.selectCompany();
		
	}
	
	
	// 쇼핑몰 업체 추가(회원가입)
	// 1. shopping_company 테이블에 추가
	// 2. pw_history 테이블에 추가
	// 3. total_id 테이블에 추가
	// 위 3단계를 트랜잭션 처리
	public int insertCompany(Company company) {
		
		int resultRow = 0;		// 총 결과
		int resultRowC = 0;		// addCompany 결과
		int resultRowP = 0;		// addPwHistory 결과
		int resultRowT = 0;		// addTotalId 결과

		resultRowC = companyMapper.insertCompany(company);
		
		log.info(TeamColor.CYAN + resultRowC + " <-- resultRowC");
		
		PwHistory pwHistory = new PwHistory();
		pwHistory.setId(company.getCompanyId());
		pwHistory.setPassword(company.getCompanyPw());
		
		resultRowP = pwHistoryMapper.insertPwHistory(pwHistory);
		
		log.info(TeamColor.CYAN + resultRowP + " <-- resultRowP");
		
		TotalId totalId = new TotalId();
		totalId.setId(company.getCompanyId());
		
		resultRowT = totalIdMapper.insertTotalId(totalId);
		
		log.info(TeamColor.CYAN + resultRowT + " <-- resultRowT");
		
		if(resultRowC == 1 && resultRowP == 1 && resultRowT == 1) {
			
			resultRow = 1;
			
			ArrayList<TotalId> tList = (ArrayList) totalIdMapper.selectTotalIdList();
			
			log.info(TeamColor.CYAN + tList.toString() + " <-- tList");
			
			ArrayList<PwHistory> pList = (ArrayList) pwHistoryMapper.selectPwHistoryList();
			
			log.info(TeamColor.CYAN + tList.toString() + " <-- pList");
			
			
			log.info(TeamColor.CYAN + "업체 회원가입 완료");
			
			
			
		} else {
			// 회원 가입 실패
			
			log.info(TeamColor.CYAN + "업체 회원가입 실패");
			
		}
		
		return resultRow; 
		
	}
	
	
	
}
