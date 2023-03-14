package goodee.gdj58.shop_b.mapper;

import java.util.List;	

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.Company;

@Mapper
public interface CompanyMapper {

	// 쇼핑몰 업체 아이디 중복 확인
	public String selectTotalId(String companyId);
	
	// 쇼핑몰 업체 로그인
	Company loginCompany(Company company);

	// 쇼핑몰 업체 리스트
	List<Company> selectCompany();
	
	// 쇼핑몰 업체 추가
	int insertCompany(Company company);
	
	
	
	
	
	
}