package goodee.gdj58.shop_b.service;


import java.io.File;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import goodee.gdj58.shop_b.mapper.GoodsImgMapper;
import goodee.gdj58.shop_b.util.TeamColor;
import goodee.gdj58.shop_b.vo.GoodsImg;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class GoodsImgService {
	@Autowired private GoodsImgMapper goodsImgMapper;
	
	// 파일 업로드
	public int parseFileInfo(List<MultipartFile> picList, String path, int goodsNo) throws Exception{
		int row = 0;
		
		// 지정된 타입의 파일이 들어왔는지 확인
		Set<String> set = new HashSet<String>();
		String[] fileType =	{"image/png", "image/jpeg", "image/jpg", "image/gif", "image/webp", "image/tiff"}; // 파일 타입 지정
		for(String s : fileType) {
			set.add(s);
		}
		
		int index = 0; // 가중치를 주기 위함
		if(!picList.isEmpty()) { // 하나 이상의 업로드할 파일이 있을 경우 
			for(MultipartFile mf : picList) {
				// 1. 유효성 검사
				if(mf.isEmpty()) { // isEmpty() : 업로드한 파일이 존재하지 않는 경우 true를 리턴
					break; // for문 탈출. 가장 가까운 반복문이나, 조건문 탈출.
				} 
				if(set.add(mf.getContentType())) { // .add() : set에 이미 존재하는 문자열인 경우 false를 반환
					log.debug(TeamColor.BLUE +mf.getContentType()+set.add(mf.getContentType())+ "파일 타입");
					return row; 
				}
				
				log.debug(TeamColor.BLUE+"상품 파일 등록 시작, parseFileInfo");
				
				// 2. MultipartFile 파일 정보를 GoodsImg 로 저장
				String orginName = mf.getOriginalFilename(); // 확장자가 포함된 원본 파일 이름 
				
				log.debug(TeamColor.BLUE+orginName+"<- orginName, parseFileInfo");
				
				String ext = orginName.substring(orginName.lastIndexOf(".")+1); // 확장자,  마지막 . 위치를 구함(lastIndexOf(".") -> . 뒤로 글자 자르기
				UUID uuid = UUID.randomUUID(); // 랜덤 문자열을 생성하는 API
				String newName = uuid.toString().replace("-","")+"."+ext; // 확장자 포함 고유 파일 이름, (-) 제거
				String newFullName = path+newName; // 확장자, 경로 포함 고유 파일 이름
				
				log.debug(TeamColor.BLUE+newFullName+"<- newFullName, parseFileInfo");
				
				
				GoodsImg gi = new GoodsImg();
				gi.setGoodsNo(goodsNo);
				gi.setGoodsImgOriginName(orginName);
				gi.setGoodsImgSaveName(newName);
				gi.setGoodsImgType(mf.getContentType());
				gi.setGoodsImgSize(mf.getSize()); // long타입
				gi.setGoodsImgLevel(index); 
				
				// 3. db에 파일 저장
				row += goodsImgMapper.insertGoodsImg(gi);

				// 4. 파일 업로드
				File f = new File(newFullName); // 매개변수 경로를 갖는 File 객체 생성
				mf.transferTo(f); // 파일(mf)을 File객체의 파일경로(.transferTo(f))에 업로드
					
				index++; 
			}
		}

		return row;
	}
}
