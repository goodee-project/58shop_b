package goodee.gdj58.shop_b.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.shop_b.mapper.TypeMapper;
import goodee.gdj58.shop_b.vo.Type;

@Service
@Transactional
public class TypeService {
	@Autowired private TypeMapper typeMapper;
	
	public List<Type> selectTypeList(int parentNo){
		return typeMapper.selectTypeList(parentNo);
	}
}
