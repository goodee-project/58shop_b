package goodee.gdj58.shop_b.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_b.mapper.CompanyMapper;
import goodee.gdj58.shop_b.vo.Company;
import goodee.gdj58.shop_b.vo.Type;

@Service
@Transactional
public class CompanyService {

	@Autowired
	private CompanyMapper companyMapper;
	

	
	// 쇼핑몰 업체 리스트
	public List<Company> getComapnyList() {
		
		return companyMapper.selectCompany();
		
	}
	
	
	// 쇼핑몰 업체 추가
	public int addCompany(Company company) {
		
		return companyMapper.insertCompany(company);
		
	}
	
	
	
}
