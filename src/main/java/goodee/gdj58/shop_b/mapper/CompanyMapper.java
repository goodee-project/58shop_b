package goodee.gdj58.shop_b.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.shop_b.vo.Company;

@Mapper
public interface CompanyMapper {

	// 쇼핑몰 업체 비밀번호 변경
	int updateCompanyPw(Company company);
	
	// 비밀번호 변경 시 현재 비밀번호 확인
	String selectPwCheck(Company company);
	
	// 쇼핑몰 업체 정보 수정
	int updateCompany(Company company);
	
	// 쇼핑몰 업체 정보 조회
	Map<String, Object> selectCompany(String companyId);
	
	// 쇼핑몰 업체 로그인
	Company loginCompany(Company company);

	// 쇼핑몰 업체 리스트
	List<Company> selectCompanyList();
	
	// 쇼핑몰 업체 추가
	int insertCompany(Company company);
	
	
	
	
	
	
}